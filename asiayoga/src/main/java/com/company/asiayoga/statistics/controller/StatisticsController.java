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
	
	
	// ��ú���
	@RequestMapping(value = "statisticsList")
	public String statisticsList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		// ȸ�� ���
		StatisticsVO statisticsMemberVO = new StatisticsVO();
		statisticsMemberVO.setStoreSeq(manageVO.getStoreSeq());
		statisticsMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		statisticsMemberVO = statisticsService.memberStatistics(statisticsMemberVO);
		
		model.addAttribute("statisticsMemberVO", statisticsMemberVO);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/statistics/statisticsList";
		
	}
	
	
	// ������ ������ ���� 
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
	
	// ��ü ������ ����
	public int totalPage(int totalCount,ProductVO productVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%productVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/productVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/productVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
	
	// ���� üũ
	public String checkAuthority(String myAuthority) {
		String resultParam = "";
		
		if(myAuthority.equals("ROLE_ADMIN")) {
			resultParam = myAuthority;
		}

		return resultParam;
	}
}
