package com.company.asiayoga.order.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.attendance.service.AttendanceService;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.order.service.OrderService;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.product.service.ProductService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private AttendanceService attendanceService;
	
	private String menuFirstRoot = "order";
	
	// ���� ���� ȭ������ �̵�
	@RequestMapping(value = "orderList")
	public String orderList(HttpServletRequest request,Model model) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		OrderVO orderVO = new OrderVO();
		orderVO.setStoreSeq(manageVO.getStoreSeq());
		
		
		List<OrderVO> list = orderService.orderList(orderVO);
		model.addAttribute("orderList", list);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderList";
	}
	
	// ���� ���� ����
	@RequestMapping(value = "orderDelete")
	@ResponseBody
	public String orderDelete(Model model,@ModelAttribute("orderVO") OrderVO orderVO) throws Exception{
		
		int resultParam = 0;
		resultParam = orderService.orderDelete(orderVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// ���� ���� ��
	@RequestMapping(value = "orderDetail")
	public String orderDetail(HttpServletRequest request,Model model,@ModelAttribute("orderVO") OrderVO orderVO) throws Exception{

		// �� 1���� ������ ��ǰ�� ����
		orderVO = orderService.customerOrder(orderVO);
		model.addAttribute("customerOrderDetail", orderVO);
		
		// ��ǰ ����Ʈ
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(orderVO.getStoreSeq());
		model.addAttribute("productList", productService.productList(productVO));
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderDetail";
	}
	
	// ���� ��� ȭ������ �̵�
	@RequestMapping(value = "orderRegister")
	public String orderRegister(HttpServletRequest request,Model model) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		OrderVO orderVO = new OrderVO();
		orderVO.setStoreSeq(manageVO.getStoreSeq());
		orderVO.setStoreName(manageVO.getStoreName());
		model.addAttribute("orderVO", orderVO);

		// ��ǰ ����Ʈ
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(manageVO.getStoreSeq());
		model.addAttribute("productList", productService.productList(productVO));
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderRegister";
	}
	
	// ���� ��� ȭ�鿡�� ��ǰ ���ÿ� ���� ǰ�� ����
	@RequestMapping(value = "searchProduct")
	@ResponseBody
	public HashMap<String, Object> searchProduct(Model model,@ModelAttribute("orderVO") OrderVO orderVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String result = "fail";
		
		ProductVO productVO = new ProductVO();
		productVO.setProductSeq(orderVO.getProductSeq());
		productVO.setStoreSeq(orderVO.getStoreSeq());
		productVO = productService.productDetail(productVO);
		
		if(productVO != null) {
			result = "success";
			hashMap.put("productVO", productVO);
		}
		hashMap.put("result", result);
		
		return hashMap;
	}
	
	// ���� �������� ȸ�� �˻�
	@RequestMapping(value = "searchMember")
	@ResponseBody
	public HashMap<String, Object> searchMember(HttpServletRequest request,Model model,OrderVO orderVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(manageVO.getStoreSeq());
		memberVO.setName(orderVO.getName());
		
		List<MemberVO> memberList = memberService.searchMemberList(memberVO);
		
		if(memberList.size() >= 1) {
			hashMap.put("result", "success");
			hashMap.put("popMemberList", memberList);
		} else if(memberList.size() == 0){
			hashMap.put("result", "noCount");
			hashMap.put("popMemberList", "");
		} else {
			hashMap.put("result", "fail");
		}
		
		return hashMap;
	}
	
	// ���� ���
	@RequestMapping(value = "insertOrder")
	@ResponseBody
	public String insertOrder(Model model,OrderVO orderVO) throws Exception{
		
		int paramResult = 0;
		String result = "fail";
		
		paramResult = orderService.insertOrder(orderVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// ���� ���� ������Ʈ
	@RequestMapping(value = "updateOrder")
	@ResponseBody
	public String updateOrder(Model model,OrderVO orderVO) throws Exception{
		
		int paramResult = 0;
		String result = "fail";
		
		paramResult = orderService.updateOrder(orderVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}

}
