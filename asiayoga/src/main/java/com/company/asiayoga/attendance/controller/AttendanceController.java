package com.company.asiayoga.attendance.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
    

    // �⼮ ���
    @RequestMapping(value = "info")
    public String attendanceInfo(HttpServletRequest request,Model model) throws Exception {

    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
        AttendanceVO attendanceVO = new AttendanceVO();
        attendanceVO.setStoreSeq(manageVO.getStoreSeq());
        
        List<AttendanceVO> list = attendanceService.attendanceList(attendanceVO);
        model.addAttribute("attendanceList",list);
        
        // ��� üũ
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }

        return "/attendance/attendanceInfo";
    }
    
	// �⼮ �� ����
	@RequestMapping(value = "attendanceDetail", method = RequestMethod.POST)
	public String attdanceDetail(HttpServletRequest request,Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		// ȸ�� ����
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberSeq(attendanceVO.getMemberSeq());
		memberVO.setStoreSeq(attendanceVO.getStoreSeq());
		memberVO = memberService.memberDetail(memberVO);
		model.addAttribute("memberDetail", memberVO);
		
		// �⼮ ���
		List<AttendanceVO> list = attendanceService.attendanceDetail(attendanceVO);
		model.addAttribute("attendanceDetailList", list);
		
		// ���� ���� ��ǰ ����
		OrderVO orderVO = new OrderVO();
		orderVO.setMemberSeq(attendanceVO.getMemberSeq());
		orderVO.setStoreSeq(attendanceVO.getStoreSeq());
		List<OrderVO> orderList= orderService.customerOrderList(orderVO);
		model.addAttribute("orderList", orderList);
		
	    // ��� üũ
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
		
		return "/attendance/attendanceDetail";
	}
	
	// �⼮ ��� ȭ������ �̵�
	@RequestMapping(value = "attendanceRegister", method = {RequestMethod.POST,RequestMethod.GET})
	public String attendanceRegister(HttpServletRequest request,Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{

		// ȸ�� ����
		MemberVO memberVO = new MemberVO();
		
		if(attendanceVO.getMemberSeq() == 0 || attendanceVO.getStoreSeq() == 0) {
			
		} else {
			memberVO.setMemberSeq(attendanceVO.getMemberSeq());
			memberVO.setStoreSeq(attendanceVO.getStoreSeq());
			memberVO = memberService.memberDetail(memberVO);
		}
		model.addAttribute("memberDetail", memberVO);
		
		// ���� ���� ��ǰ ����(�ֹ���ȣ�� ����, ��ǰ)
		OrderVO orderVO = new OrderVO();
		if(attendanceVO.getOrderSeq() == 0) {
			
		} else {
			orderVO.setOrderSeq(attendanceVO.getOrderSeq());
			orderVO = orderService.customerOrder(orderVO);
		}
		model.addAttribute("orderDetail", orderVO);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}

		return "/attendance/attendanceRegister";
	}
	
	// �⼮ ���
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
	
	// �⼮ ����
	@RequestMapping(value = "attendanceDelete", method = RequestMethod.POST)
	@ResponseBody
	public String attendanceDelete(Model model,@ModelAttribute("attendanceVO") AttendanceVO attendanceVO) throws Exception{
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = attendanceService.attendanceDelete(attendanceVO);
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// �˾������� ȸ�� ã��(List ���� , ��ǰ���� ����)
	@RequestMapping(value = "searchMember", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchMember(Model model,AttendanceVO attendanceVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(attendanceVO.getStoreSeq());
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
