package com.company.asiayoga.attendance.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.attendance.service.AttendanceService;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.order.service.OrderService;

@Controller
@RequestMapping("attendance")
public class AttendanceController {

    private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

    @Inject
    private AttendanceService attendanceService;
    
    @Inject
    private MemberService memberService;
    
    @Inject
    private OrderService orderService;
    
    private String menuFirstRoot = "attendance";

    // 출석 목록
    @RequestMapping(value = "info")
    public String attendanceInfo(HttpServletRequest request,Model model) throws Exception {

    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
        AttendanceVO attendanceVO = new AttendanceVO();
        attendanceVO.setStoreSeq(manageVO.getStoreSeq());
        attendanceVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
        
        List<AttendanceVO> list = attendanceService.attendanceList(attendanceVO);
        model.addAttribute("attendanceList",list);
        
		// 출석 목록 갯수
		int paramTotalCount = 0;
		paramTotalCount = attendanceService.attendanceTotalCount(attendanceVO);
		attendanceVO.setTotalCount(paramTotalCount);
		attendanceVO.setTotalPage(this.totalPage(paramTotalCount, attendanceVO));
		attendanceVO.setEndPage(this.endPage(attendanceVO));
		
		model.addAttribute("attendanceVO", attendanceVO);
        
        // 경로 체크
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }

        return "/attendance/attendanceInfo";
    }
    
    // 출석 정보 화면에서의 검색
 	@RequestMapping(value = "searchAttendanceInfo")
 	@ResponseBody
 	public HashMap<String, Object> searchAttendanceInfo(HttpServletRequest request,Model model,AttendanceVO attendanceVO) throws Exception{
 		
 		ManageVO manageVO = new ManageVO();
 		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
 		
 		attendanceVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
 		
 		HashMap<String, Object> hashMap = new HashMap<String, Object>();

 		attendanceVO.setParamPage((attendanceVO.getTotalRow()*attendanceVO.getPageNum())-attendanceVO.getTotalRow());
 		attendanceVO.setStoreSeq(manageVO.getStoreSeq());
 		List<AttendanceVO> list = attendanceService.attendanceList(attendanceVO);

 		int paramTotalCount = 0;
 		paramTotalCount = attendanceService.attendanceTotalCount(attendanceVO);
 		
 		if(list.size() == 0) {
 			attendanceVO.setParamPage(0);
 			attendanceVO.setPageNum(1);
 			attendanceVO.setPageRow(0);

 			if(paramTotalCount != 0) {
 				attendanceVO.setStartPage(1);
 				attendanceVO.setTotalPage(this.totalPage(paramTotalCount, attendanceVO));
 				attendanceVO.setEndPage(this.endPage(attendanceVO));
 				list = attendanceService.attendanceList(attendanceVO);
 				hashMap.put("result", "success");
 				hashMap.put("attendanceList", list);
 			}else {
 				hashMap.put("result", "noCount");
 			}
 			
 		} else if(list.size() > 0) {
 			int paramStartPage = 0;
 			int paramEndPage = 0;
 			paramStartPage = (attendanceVO.getPageRow()*5)+1;
 			
 			attendanceVO.setTotalCount(paramTotalCount);
 			attendanceVO.setTotalPage(this.totalPage(paramTotalCount, attendanceVO));
 			paramEndPage = this.endPage(attendanceVO);
 			attendanceVO.setStartPage(paramStartPage);
 			attendanceVO.setEndPage(paramEndPage);
 			hashMap.put("result", "success");
 			hashMap.put("attendanceList", list);
 		} else {
 			attendanceVO.setParamPage(0);
 			attendanceVO.setPageNum(1);
 			attendanceVO.setPageRow(0);
 			hashMap.put("result", "fail");
 		}
 		hashMap.put("attendanceVO", attendanceVO);
 		
 		return hashMap;
 	}
    
	// 출석 상세 정보
	@RequestMapping(value = "attendanceDetail", method = RequestMethod.POST)
	public String attdanceDetail(HttpServletRequest request,Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		// 회원 정보
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberSeq(attendanceVO.getMemberSeq());
		memberVO.setStoreSeq(attendanceVO.getStoreSeq());
		memberVO = memberService.memberDetail(memberVO);
		model.addAttribute("memberDetail", memberVO);
		
		// 출석 목록
		List<AttendanceVO> list = attendanceService.attendanceDetail(attendanceVO);
		model.addAttribute("attendanceDetailList", list);
		
		// 고객이 가진 상품 정보
		OrderVO orderVO = new OrderVO();
		orderVO.setMemberSeq(attendanceVO.getMemberSeq());
		orderVO.setStoreSeq(attendanceVO.getStoreSeq());
		List<OrderVO> orderList= orderService.customerOrderList(orderVO);
		model.addAttribute("orderList", orderList);
		
	    // 경로 체크
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
		
		return "/attendance/attendanceDetail";
	}
	
	// 출석 등록 화면으로 이동
	@RequestMapping(value = "attendanceRegister", method = {RequestMethod.POST,RequestMethod.GET})
	public String attendanceRegister(HttpServletRequest request,Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{

		// 회원 정보
		MemberVO memberVO = new MemberVO();
		
		if(attendanceVO.getMemberSeq() == 0 || attendanceVO.getStoreSeq() == 0) {
			
		} else {
			memberVO.setMemberSeq(attendanceVO.getMemberSeq());
			memberVO.setStoreSeq(attendanceVO.getStoreSeq());
			memberVO = memberService.memberDetail(memberVO);
		}
		model.addAttribute("memberDetail", memberVO);
		
		// 고객이 가진 상품 정보(주문번호에 의한, 단품)
		OrderVO orderVO = new OrderVO();
		if(attendanceVO.getOrderSeq() == 0) {
			
		} else {
			orderVO.setOrderSeq(attendanceVO.getOrderSeq());
			orderVO = orderService.customerOrder(orderVO);
		}
		model.addAttribute("orderDetail", orderVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}

		return "/attendance/attendanceRegister";
	}
	
	// 출석 등록
	@RequestMapping(value = "insertAttendance")
	@ResponseBody
	public String insertAttendance(Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = attendanceService.insertAttendance(attendanceVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 출석 삭제
	@RequestMapping(value = "attendanceDelete")
	@ResponseBody
	public String attendanceDelete(HttpServletRequest request,Model model,AttendanceVO attendanceVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		int resultParam = 0;
		String result = "fail";
		
		attendanceVO.setModifyId(manageVO.getId());
		
		
		resultParam = attendanceService.attendanceDelete(attendanceVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 팝업에서의 회원 찾기(List 리턴 , 상품정보 포함)
	@RequestMapping(value = "searchMember", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> searchMember(HttpServletRequest request,Model model,AttendanceVO attendanceVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		MemberVO vo = new MemberVO();
		vo.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		vo.setStoreSeq(attendanceVO.getStoreSeq());
		vo.setSearchWord(attendanceVO.getName());
		
		List<MemberVO> memberList = attendanceService.memberSearch(vo);
		
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
	
	// 출석 정보 리스트 엑셀 다운로드
	@RequestMapping(value = "attendanceExcelDownload")
	public void attendanceExcelDownload(HttpServletRequest request, HttpServletResponse reponse,AttendanceVO attendanceVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		attendanceVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = attendanceService.attendanceExcelDownload(attendanceVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=attendaceList.xlsx");
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
	public int endPage(AttendanceVO attendanceVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = attendanceVO.getPageRow()*5+5;
		paramTotalPage = attendanceVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
		
	// 전체 페이지 설정
	public int totalPage(int totalCount,AttendanceVO attendanceVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%attendanceVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/attendanceVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/attendanceVO.getTotalRow())+1;
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
