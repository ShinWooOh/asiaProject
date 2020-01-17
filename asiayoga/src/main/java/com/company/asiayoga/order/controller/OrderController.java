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
	
	// ���� ���� ȭ������ �̵�
	@RequestMapping(value = "orderList")
	public String orderList(Model model) throws Exception{
		
		OrderVO orderVO = new OrderVO();
		orderVO.setStoreSeq(10); 						// ���ǿ��� �޾ƿ� �� , ����� �ӽ÷� ��ȣ ����
		
		
		List<OrderVO> list = orderService.orderList(orderVO);
		model.addAttribute("orderList", list);
		
		return "/order/orderList";
	}
	
	// ���� ���� ����
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
	
	// ���� ���� ��
	@RequestMapping(value = "orderDetail")
	public String orderDetail(Model model,@ModelAttribute("orderVo") OrderVO orderVO) throws Exception{

		// �� ����
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberSeq(orderVO.getMemberSeq());
		memberVO.setStoreSeq(orderVO.getStoreSeq());
		memberVO = memberService.memberDetail(memberVO);
		model.addAttribute("memberDetail", memberVO);
		
		// �� 1���� �ֹ� ����
		List<OrderVO> list = orderService.customerOrderList(orderVO);
		model.addAttribute("customerOrderList", list);
		
		return "/order/orderDetail";
	}

}
