package com.company.asiayoga.store.controller;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.domain.StoreVO;
import com.company.asiayoga.store.service.StoreService;


@Controller
@RequestMapping("store")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	StoreService storeService;
	
	private String menuFirstRoot = "store";
	
	
	// 매장 목록
	@RequestMapping(value = "storeList")
	public String storeList(HttpServletRequest request,Model model) throws Exception {
		
		StoreVO storeVO = new StoreVO();
		
		List<StoreVO> list = storeService.storeList(storeVO);
		model.addAttribute("storeList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = storeService.storeTotalCount(storeVO);
		storeVO.setTotalCount(paramTotalCount);
		storeVO.setTotalPage(this.totalPage(paramTotalCount, storeVO));
		storeVO.setEndPage(this.endPage(storeVO));
		
		model.addAttribute("storeVO", storeVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeList";
	}

	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchStoreList")
	@ResponseBody
	public HashMap<String, Object> searchStoreList(HttpServletRequest request,Model model,StoreVO storeVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		storeVO.setParamPage((storeVO.getTotalRow()*storeVO.getPageNum())-storeVO.getTotalRow());
		List<StoreVO> list = storeService.storeList(storeVO);

		int paramTotalCount = 0;
		paramTotalCount = storeService.storeTotalCount(storeVO);
		
		if(list.size() == 0) {
			storeVO.setParamPage(0);
			storeVO.setPageNum(1);
			storeVO.setPageRow(0);

			if(paramTotalCount != 0) {
				storeVO.setStartPage(1);
				storeVO.setTotalPage(this.totalPage(paramTotalCount, storeVO));
				storeVO.setEndPage(this.endPage(storeVO));
				list = storeService.storeList(storeVO);
				hashMap.put("result", "success");
				hashMap.put("storeList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (storeVO.getPageRow()*5)+1;
			
			storeVO.setTotalCount(paramTotalCount);
			storeVO.setTotalPage(this.totalPage(paramTotalCount, storeVO));
			paramEndPage = this.endPage(storeVO);
			storeVO.setStartPage(paramStartPage);
			storeVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("storeList", list);
		} else {
			storeVO.setParamPage(0);
			storeVO.setPageNum(1);
			storeVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("storeVO", storeVO);
		
		return hashMap;
	}
	
	// 매장 삭제
	@RequestMapping(value = "storeDelete")
	@ResponseBody
	public String storeDelete(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.storeDelete(storeVO);
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 매장 상세
	@RequestMapping(value = "storeDetail")
	public String storeDetail(HttpServletRequest request,Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		model.addAttribute("storeDetail", storeService.storeDetail(storeVO));
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeDetail";
	}
	
	// 매장 등록 화면으로 이동
	@RequestMapping(value = "storeRegister")
	public String storeRegister(HttpServletRequest request,Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeRegister";
	}
	
	// 매장 등록
	@RequestMapping(value = "insertStore")
	@ResponseBody
	public String insertStore(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.insertStore(storeVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 매장 정보 업데이트
	@RequestMapping(value = "updateStore")
	@ResponseBody
	public String updateStore(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.updateStore(storeVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 매장 리스트 엑셀 다운로드
	@RequestMapping(value = "storeExcelDownload")
	public void storeExcelDownload(HttpServletRequest request, HttpServletResponse reponse, StoreVO storeVO) throws Exception{
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = storeService.storeExcelDownload(storeVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=storeList.xlsx");
			reponse.setContentType("application/vnd.ms-excel");
			out = new BufferedOutputStream(reponse.getOutputStream());
			
			sxssfWorkbook.write(out);
			out.flush();
			
		} catch (Exception e) {
			logger.error("exception during downloading excel file : {}", e);
		} finally {
			if(out != null) { out.close(); }
		}
	}
	
	// 마지막 페이지 점검 
	public int endPage(StoreVO storeVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = storeVO.getPageRow()*5+5;
		paramTotalPage = storeVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,StoreVO storeVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%storeVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/storeVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/storeVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
		

}
