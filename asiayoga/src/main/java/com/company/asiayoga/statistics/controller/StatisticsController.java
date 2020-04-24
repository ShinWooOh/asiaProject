package com.company.asiayoga.statistics.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.statistics.domain.StatisticsVO;
import com.company.asiayoga.statistics.service.StatisticsService;

@Controller
@RequestMapping("statistics")
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Inject
	private StatisticsService statisticsService;
	
	private String menuFirstRoot = "statistics";
	
	
	// 대시보드
	@RequestMapping(value = "statisticsList")
	public String statisticsList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		// 회원 통계
		StatisticsVO statisticsMemberVO = new StatisticsVO();
		statisticsMemberVO.setStoreSeq(manageVO.getStoreSeq());
		statisticsMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		statisticsMemberVO = statisticsService.memberStatistics(statisticsMemberVO);
		
		model.addAttribute("statisticsMemberVO", statisticsMemberVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/statistics/statisticsList";
		
	}
	
	
	// 마지막 페이지 점검 
	public int endPage(ProductVO productVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = productVO.getPageRow()*5+5;
		paramTotalPage = productVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,ProductVO productVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%productVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/productVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/productVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
	
	// 권한 체크
	public String checkAuthority(String myAuthority) {
		String resultParam = "";
		
		if(myAuthority.equals("ROLE_ADMIN")) {
			resultParam = myAuthority;
		}

		return resultParam;
	}
}
