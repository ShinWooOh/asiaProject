package com.company.asiayoga.attendance.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.attendance.service.AttendanceService;
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

    // 출석 목록
    @RequestMapping(value = "info")
    public String attendanceInfo(Model model) throws Exception {

        int storeSeq = 10;      							// 매장 번호, 현재는 임시적으로 부여
        AttendanceVO attendanceVO = new AttendanceVO();
        attendanceVO.setStoreSeq(storeSeq);
        
        List<AttendanceVO> list = attendanceService.attendanceList(attendanceVO);

        model.addAttribute("attendanceList",list);

        return "/attendance/attendanceInfo";
    }
    
	// 출석 상세 정보
	@RequestMapping(value = "attendanceDetail", method = RequestMethod.POST)
	public String attdanceDetail(Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
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
		
		return "/attendance/attendanceDetail";
	}
	
	// 출석 등록 화면으로 이동
	@RequestMapping(value = "attendanceRegister", method = {RequestMethod.POST,RequestMethod.GET})
	public String attendanceRegister(Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		// 회원 정보
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberSeq(attendanceVO.getMemberSeq());
		memberVO.setStoreSeq(attendanceVO.getStoreSeq());
		memberVO = memberService.memberDetail(memberVO);
		model.addAttribute("memberDetail", memberVO);
		
		// 고객이 가진 상품 정보(주문번호에 의한, 단품)
		OrderVO orderVO = new OrderVO();
		orderVO.setOrderSeq(attendanceVO.getOrderSeq());
		orderVO= orderService.customerOrder(orderVO);
		model.addAttribute("orderDetail", orderVO);
		
		return "/attendance/attendanceRegister";
	}
	
	// 출석 등록
	@RequestMapping(value = "insertAttendance", method = RequestMethod.POST)
	@ResponseBody
	public String insertAttendance(Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = attendanceService.insertAttendance(attendanceVO);
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 팝업에서의 회원 찾기(List 리턴 , 상품정보 포함)
	@RequestMapping(value = "searchMember", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchMember(Model model,AttendanceVO attendanceVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		int resultParam = 0;
		String result = "fail";
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(10);
		memberVO.setName(attendanceVO.getName());
		
		List<MemberVO> memberList = attendanceService.memberSearch(memberVO);
		
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
    

}