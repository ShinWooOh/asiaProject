package com.company.asiayoga.adjournment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
	
	// ��ȸ ���
    @RequestMapping(value = "adjournmentList")
	public String adjournmentList(HttpServletRequest request,Model model) throws Exception {
		
    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	AdjournmentVO adjournmentVO = new AdjournmentVO();
    	adjournmentVO.setStoreSeq(manageVO.getStoreSeq());
    	
    	List<AdjournmentVO> list = new ArrayList<AdjournmentVO>();
    	list = adjournmentService.adjournmentList(adjournmentVO);
    	
    	model.addAttribute("adjournmentList", list);
    	
    	
        // ��� üũ
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
    	
    	return "/adjournment/adjournmentList";
	}
    
    // ��ȸ ��� ȭ������ �̵�
 	@RequestMapping(value = "adjournmentRegister", method = {RequestMethod.POST,RequestMethod.GET})
 	public String attendanceRegister(HttpServletRequest request,Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{

 		// ȸ�� ����
		/*
		 * MemberVO memberVO = new MemberVO();
		 * 
		 * if(adjournmentVO.getMemberSeq() == 0 || adjournmentVO.getStoreSeq() == 0) {
		 * 
		 * } else { memberVO.setMemberSeq(adjournmentVO.getMemberSeq());
		 * memberVO.setStoreSeq(adjournmentVO.getStoreSeq()); memberVO =
		 * memberService.memberDetail(memberVO); } model.addAttribute("memberDetail",
		 * memberVO);
		 * 
		 * // ���� ���� ��ǰ ����(�ֹ���ȣ�� ����, ��ǰ) OrderVO orderVO = new OrderVO();
		 * if(adjournmentVO.getOrderSeq() == 0) {
		 * 
		 * } else { orderVO.setOrderSeq(adjournmentVO.getOrderSeq()); orderVO =
		 * orderService.customerOrder(orderVO); } model.addAttribute("orderDetail",
		 * orderVO);
		 */
 		
 		// ��� üũ
 		String currentPath = (String)request.getSession().getAttribute("nowPath");
 		if(!currentPath.equals(menuFirstRoot)) {
 			request.getSession().removeAttribute("nowPath");
 			request.getSession().setAttribute("nowPath", menuFirstRoot);
 		}

 		return "/adjournment/adjournmentRegister";
 	}
 	
	// ��ȸ ȸ�� ���
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
	
	// ��ȸ ��� ȭ������ �̵�
	@RequestMapping(value = "adjournmentDetail", method = {RequestMethod.POST,RequestMethod.GET})
	public String adjournmentDetail(HttpServletRequest request,Model model,@ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception{
		
		// ��ȸ ����
		adjournmentVO = adjournmentService.adjournmentDetail(adjournmentVO);
		model.addAttribute("adjournmentDetail",adjournmentVO);
		  
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
		request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/adjournment/adjournmentDetail";
	}
	
	 // ��ȸ ���� ����
	 @RequestMapping(value = "updateAdjournmentState")
	 @ResponseBody
	 public String updateAdjournmentState(Model model, @ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception {
		 
		 String result = "fail";
		 
		 int paramResult = 0;
		 paramResult = adjournmentService.updateAdjournmentState(adjournmentVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
	 
	 // ��ȸ ���� ����
	 @RequestMapping(value = "updateAdjournment")
	 @ResponseBody
	 public String updateAdjournment(Model model, @ModelAttribute("adjournmentVO") AdjournmentVO adjournmentVO) throws Exception {
		 
		 logger.info("Ȯ�� seq : "+adjournmentVO.getAdjournmentSeq());
		 
		 String result = "fail";
		 
		 int paramResult = 0;
		 paramResult = adjournmentService.updateAdjournment(adjournmentVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
 	
 	// �˾������� ȸ�� ã��(List ���� , ��ǰ���� ����)
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
}
