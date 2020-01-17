package com.company.asiayoga.order.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.order.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private MemberService memberService;
	
	// 구매 내역 화면으로 이동
	@RequestMapping(value = "orderList")
	public String orderList(Model model) throws Exception{
		
		OrderVO orderVO = new OrderVO();
		orderVO.setStoreSeq(10); 						// 세션에서 받아올 것 , 현재는 임시로 번호 대입
		
		
		List<OrderVO> list = orderService.orderList(orderVO);
		model.addAttribute("orderList", list);
		
		return "/order/orderList";
	}
	
	// 구매 내역 삭제
	@RequestMapping(value = "orderDel")
	@ResponseBody
	public String orderDel(Model model,@ModelAttribute("orderVo") OrderVO orderVO) throws Exception{
		
		int resultParam = 0;
		resultParam = orderService.orderDel(orderVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 구매 내역 상세
	@RequestMapping(value = "orderDetail")
	public String orderDetail(Model model,@ModelAttribute("orderVo") OrderVO orderVO) throws Exception{

		// 고객 정보
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberSeq(orderVO.getMemberSeq());
		memberVO.setStoreSeq(orderVO.getStoreSeq());
		memberVO = memberService.memberDetail(memberVO);
		model.addAttribute("memberDetail", memberVO);
		
		// 고객 1명의 주문 정보
		List<OrderVO> list = orderService.customerOrderList(orderVO);
		model.addAttribute("customerOrderList", list);
		
		return "/order/orderDetail";
	}

}
