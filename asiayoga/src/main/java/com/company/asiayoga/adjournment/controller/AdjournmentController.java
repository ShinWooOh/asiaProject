package com.company.asiayoga.adjournment.controller;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.adjournment.service.AdjournmentService;
import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.order.service.OrderService;

@Controller
@RequestMapping("adjournment")
public class AdjournmentController {

	private static final Logger logger = LoggerFactory.getLogger(AdjournmentController.class);
	
	@Inject
	private AdjournmentService adjournmentService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private OrderService orderService;
	
	private String menuFirstRoot = "adjournment";
	
	// 휴회 목록
    @RequestMapping(value = "adjournmentList")
	public String adjournmentList(HttpServletRequest request,Model model) throws Exception {
		
    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	AdjournmentVO adjournmentVO = new AdjournmentVO();
    	adjournmentVO.setStoreSeq(manageVO.getStoreSeq());
    	
    	List<AdjournmentVO> list = new ArrayList<AdjournmentVO>();
    	list = adjournmentService.adjournmentList(adjournmentVO);
    	model.addAttribute("adjournmentList", list);
    	
    	int paramTotalCount = 0;
    	paramTotalCount = adjournmentService.adjournmentTotalCount(adjournmentVO);
    	adjournmentVO.setTotalCount(paramTotalCount);
    	adjournmentVO.setTotalPage(this.totalPage(paramTotalCount, adjournmentVO));
    	adjournmentVO.setEndPage(this.endPage(adjournmentVO));
    	
    	model.addAttribute("adjournmentVO", adjournmentVO);
    	
        // 경로 체크
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
    	
    	return "/adjournment/adjournmentList";
	}
    
    // 회원 목록 화면에서의 검색
 	@RequestMapping(value = "searchAdjournmentList")
 	@ResponseBody
 	public HashMap<String, Object> searchAdjournmentList(HttpServletRequest request,Model model,AdjournmentVO adjournmentVO) throws Exception{
 		
 		ManageVO manageVO = new ManageVO();
 		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
 		
 		HashMap<String, Object> hashMap = new HashMap<String, Object>();

 		adjournmentVO.setParamPage((adjournmentVO.getTotalRow()*adjournmentVO.getPageNum())-adjournmentVO.getTotalRow());
 		adjournmentVO.setStoreSeq(manageVO.getStoreSeq());
 		List<AdjournmentVO> list = adjournmentService.adjournmentList(adjournmentVO);

 		int paramTotalCount = 0;
 		paramTotalCount = adjournmentService.adjournmentTotalCount(adjournmentVO);
 		
 		if(list.size() == 0) {
 			adjournmentVO.setParamPage(0);
 			adjournmentVO.setPageNum(1);
 			adjournmentVO.setPageRow(0);

 			if(paramTotalCount != 0) {
 				adjournmentVO.setStartPage(1);
 				adjournmentVO.setTotalPage(this.totalPage(paramTotalCount, adjournmentVO));
 				adjournmentVO.setEndPage(this.endPage(adjournmentVO));
 				list = adjournmentService.adjournmentList(adjournmentVO);
 				hashMap.put("result", "success");
 				hashMap.put("adjournmentList", list);
 			}else {
 				hashMap.put("result", "noCount");
 			}
 			
 		} else if(list.size() > 0) {
 			int paramStartPage = 0;
 			int paramEndPage = 0;
 			paramStartPage = (adjournmentVO.getPageRow()*5)+1;
 			
 			adjournmentVO.setTotalCount(paramTotalCount);
 			adjournmentVO.setTotalPage(this.totalPage(paramTotalCount, adjournmentVO));
 			paramEndPage = this.endPage(adjournmentVO);
 			adjournmentVO.setStartPage(paramStartPage);
 			adjournmentVO.setEndPage(paramEndPage);
 			hashMap.put("result", "success");
 			hashMap.put("adjournmentList", list);
 		} else {
 			adjournmentVO.setParamPage(0);
 			adjournmentVO.setPageNum(1);
 			adjournmentVO.setPageRow(0);
 			hashMap.put("result", "fail");
 		}
 		hashMap.put("adjournmentVO", adjournmentVO);
 		
 		return hashMap;
 	}
    
    // 휴회 등록 화면으로 이동
 	@RequestMapping(value = "adjournmentRegister", method = {RequestMethod.POST,RequestMethod.GET})
 	public String attendanceRegister(HttpServletRequest request,Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{

 		// 경로 체크
 		String currentPath = (String)request.getSession().getAttribute("nowPath");
 		if(!currentPath.equals(menuFirstRoot)) {
 			request.getSession().removeAttribute("nowPath");
 			request.getSession().setAttribute("nowPath", menuFirstRoot);
 		}

 		return "/adjournment/adjournmentRegister";
 	}
 	
	// 휴회 회원 등록
	@RequestMapping(value = "insertAdjournment", method = RequestMethod.POST)
	@ResponseBody
	public String insertAdjournment(HttpServletRequest request,Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	adjournmentVO.setRegisterId(manageVO.getId());
    	adjournmentVO.setModifyId(manageVO.getId());
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = adjournmentService.insertAdjournment(adjournmentVO);
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 휴회 상세 화면으로 이동
	@RequestMapping(value = "adjournmentDetail", method = {RequestMethod.POST,RequestMethod.GET})
	public String adjournmentDetail(HttpServletRequest request,Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{
		
		// 휴회 정보
		adjournmentVO = adjournmentService.adjournmentDetail(adjournmentVO);
		model.addAttribute("adjournmentDetail",adjournmentVO);
		  
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
		request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/adjournment/adjournmentDetail";
	}
	
	 // 휴회 상태 수정
	 @RequestMapping(value = "updateAdjournmentState")
	 @ResponseBody
	 public String updateAdjournmentState(HttpServletRequest request,Model model, @ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception {
		 
		 String result = "fail";
		 
		 ManageVO  manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		 
		 adjournmentVO.setModifyId(manageVO.getId());
		 
		 int paramResult = 0;
		 paramResult = adjournmentService.updateAdjournmentState(adjournmentVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
	 
	 // 휴회 정보 수정
	 @RequestMapping(value = "updateAdjournment", method = RequestMethod.GET)
	 @ResponseBody
	 public String updateAdjournment(HttpServletRequest request,Model model, @ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception {
		 
		 ManageVO  manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		 
		 adjournmentVO.setModifyId(manageVO.getId());
		 
		 String result = "fail";
		 
		 // 휴회 정보 저장
		 int paramResult = 0;
		 paramResult = adjournmentService.updateAdjournment(adjournmentVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
 	
 	// 팝업에서의 회원 찾기(List 리턴 , 상품정보 포함)
 	@RequestMapping(value = "searchMember", method = RequestMethod.GET)
 	@ResponseBody
 	public HashMap<String, Object> searchMember(Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{
 		
 		HashMap<String, Object> hashMap = new HashMap<String, Object>();
 		
 		MemberVO memberVO = new MemberVO();
 		memberVO.setStoreSeq(adjournmentVO.getStoreSeq());
 		memberVO.setName(adjournmentVO.getName());
 		
 		List<MemberVO> memberList = adjournmentService.memberSearch(memberVO);
 		
 		if(memberList.size() >= 1) {
 			hashMap.put("result", "success");
 			hashMap.put("popMemberList", memberList);
 		} else if(memberList.size() == 0){
 			hashMap.put("result", "noCount");
 			hashMap.put("popMemberList", "");
 		} else {
 			
 		}
 		return hashMap;
 	}
 	
 	// 휴회 리스트 엑셀 다운로드
 	@RequestMapping(value = "adjournmentExcelDownload")
 	public void adjournmentExcelDownload(HttpServletRequest request, HttpServletResponse reponse,AdjournmentVO adjournmentVO) throws Exception{
 		
 		OutputStream out = null;
 		try {
 			SXSSFWorkbook sxssfWorkbook = adjournmentService.adjournmentExcelDownload(adjournmentVO);
 			
 			reponse.reset();
 			reponse.setHeader("Content-Disposition", "attachment;filename=restMemberList.xlsx");
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
 	public int endPage(AdjournmentVO adjournmentVO) {
 		
 		int paramEndPage = 0;
 		int paramTotalPage = 0;
 		
 		paramEndPage = adjournmentVO.getPageRow()*5+5;
 		paramTotalPage = adjournmentVO.getTotalPage();
 		
 		if(paramEndPage >= paramTotalPage) {
 			paramEndPage = paramTotalPage;
 		}
 		
 		return paramEndPage;
 	}
 	
 	// 전체 페이지 설정
 	public int totalPage(int totalCount,AdjournmentVO adjournmentVO) {
 		
 		int paramTotalPage = 0;
 		
 		if(totalCount%adjournmentVO.getTotalRow() == 0) {
 			paramTotalPage = totalCount/adjournmentVO.getTotalRow();
 		} else {
 			paramTotalPage = (totalCount/adjournmentVO.getTotalRow())+1;
 		}
 		
 		return paramTotalPage;
 	}
}
