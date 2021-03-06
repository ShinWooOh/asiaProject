package com.company.asiayoga.order.controller;

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

import com.company.asiayoga.attendance.service.AttendanceService;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.order.service.OrderService;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.product.service.ProductService;
import com.company.asiayoga.store.domain.StoreVO;

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
	
	private String menuFirstRoot = "order";
	
	// 구매 내역 화면으로 이동
	@RequestMapping(value = "orderList")
	public String orderList(HttpServletRequest request,Model model) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		OrderVO orderVO = new OrderVO();
		orderVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		orderVO.setStoreSeq(manageVO.getStoreSeq());
		
		List<OrderVO> list = orderService.orderList(orderVO);
		model.addAttribute("orderList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = orderService.orderTotalCount(orderVO);
		orderVO.setTotalCount(paramTotalCount);
		orderVO.setTotalPage(this.totalPage(paramTotalCount, orderVO));
		orderVO.setEndPage(this.endPage(orderVO));
		
		model.addAttribute("orderVO", orderVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderList";
	}
	
	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchOrderList")
	@ResponseBody
	public HashMap<String, Object> searchOrderList(HttpServletRequest request,Model model,OrderVO orderVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		orderVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
	
		orderVO.setParamPage((orderVO.getTotalRow()*orderVO.getPageNum())-orderVO.getTotalRow());
		orderVO.setStoreSeq(manageVO.getStoreSeq());
		List<OrderVO> list = orderService.orderList(orderVO);
	
		int paramTotalCount = 0;
		paramTotalCount = orderService.orderTotalCount(orderVO);
		
		if(list.size() == 0) {
			orderVO.setParamPage(0);
			orderVO.setPageNum(1);
			orderVO.setPageRow(0);
	
			if(paramTotalCount != 0) {
				orderVO.setStartPage(1);
				orderVO.setTotalPage(this.totalPage(paramTotalCount, orderVO));
				orderVO.setEndPage(this.endPage(orderVO));
				list = orderService.orderList(orderVO);
				hashMap.put("result", "success");
				hashMap.put("orderList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (orderVO.getPageRow()*5)+1;
			
			orderVO.setTotalCount(paramTotalCount);
			orderVO.setTotalPage(this.totalPage(paramTotalCount, orderVO));
			paramEndPage = this.endPage(orderVO);
			orderVO.setStartPage(paramStartPage);
			orderVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("orderList", list);
		} else {
			orderVO.setParamPage(0);
			orderVO.setPageNum(1);
			orderVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("orderVO", orderVO);
		
		return hashMap;
	}
	
	// 구매 내역 삭제
	@RequestMapping(value = "orderDelete")
	@ResponseBody
	public String orderDelete(HttpServletRequest request,Model model,@ModelAttribute("orderVO") OrderVO orderVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		int resultParam = 0;
		orderVO.setModifyId(manageVO.getId());
		resultParam = orderService.orderDelete(orderVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 구매 내역 상세
	@RequestMapping(value = "orderDetail")
	public String orderDetail(HttpServletRequest request,Model model,@ModelAttribute("orderVO") OrderVO orderVO) throws Exception{

		// 고객 1명의 구매한 상품의 정보
		orderVO = orderService.customerOrder(orderVO);
		model.addAttribute("customerOrderDetail", orderVO);
		
		// 상품 리스트
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(orderVO.getStoreSeq());
		model.addAttribute("productList", productService.productList(productVO));
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderDetail";
	}
	
	// 구매 등록 화면으로 이동
	@RequestMapping(value = "orderRegister")
	public String orderRegister(HttpServletRequest request,Model model) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		OrderVO orderVO = new OrderVO();
		orderVO.setStoreSeq(manageVO.getStoreSeq());
		orderVO.setStoreName(manageVO.getStoreName());
		model.addAttribute("orderVO", orderVO);

		// 상품 리스트
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(manageVO.getStoreSeq());
		model.addAttribute("productList", productService.productList(productVO));
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/order/orderRegister";
	}
	
	// 구매 등록 화면에서 상품 선택에 따른 품목 정보
	@RequestMapping(value = "searchProduct")
	@ResponseBody
	public HashMap<String, Object> searchProduct(Model model,ProductVO productVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String result = "fail";
		
		productVO = productService.productDetail(productVO);
		
		if(productVO != null) {
			result = "success";
			hashMap.put("productVO", productVO);
		}
		hashMap.put("result", result);
		
		return hashMap;
	}
	
	// 구매 관리에서 회원 검색
	@RequestMapping(value = "searchMember")
	@ResponseBody
	public HashMap<String, Object> searchMember(HttpServletRequest request,Model model,MemberVO memberVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		memberVO.setSearchWord(memberVO.getName());
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
	
	// 구매 관리에서 매장 검색
	@RequestMapping(value = "searchStore")
	@ResponseBody
	public HashMap<String, Object> searchStore(HttpServletRequest request,Model model,StoreVO storeVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		storeVO.setSearchWord(storeVO.getStoreName());
		List<StoreVO> storeList = orderService.storeSearchList(storeVO);
		
		if(storeList.size() >= 1){
			hashMap.put("result", "success");
			hashMap.put("popStoreList", storeList);
		} else if(storeList.size() == 0) {
			hashMap.put("result", "noCount");
			hashMap.put("popStoreList", "");
		} else {
			
		}
		
		return hashMap;
	}
	
	// 구매 관리에서 회원 검색
	@RequestMapping(value = "searchProductList")
	@ResponseBody
	public HashMap<String, Object> searchProductList(HttpServletRequest request,Model model,ProductVO productVO) throws Exception{
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		List<ProductVO> productList = orderService.searchProductList(productVO);
		
		if(productList.size() >= 1){
			hashMap.put("result", "success");
			hashMap.put("productList", productList);
		} else if(productList.size() == 0) {
			hashMap.put("result", "noCount");
		} else {
			
		}
		
		return hashMap;
	}
	
	// 구매 등록
	@RequestMapping(value = "insertOrder")
	@ResponseBody
	public String insertOrder(HttpServletRequest request,Model model,OrderVO orderVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		int paramResult = 0;
		String result = "fail";
		
		orderVO.setRegisterId(manageVO.getId());
		paramResult = orderService.insertOrder(orderVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// 구매 내역 업데이트
	@RequestMapping(value = "updateOrder")
	@ResponseBody
	public String updateOrder(HttpServletRequest request,Model model,OrderVO orderVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		int paramResult = 0;
		String result = "fail";
		
		orderVO.setModifyId(manageVO.getId());
		paramResult = orderService.updateOrder(orderVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// 주문 목록 엑셀 다운로드
	@RequestMapping(value = "orderExcelDownload")
	public void orderExcelDownload(HttpServletRequest request, HttpServletResponse reponse, OrderVO orderVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		orderVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = orderService.orderExcelDown(orderVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=orderList.xlsx");
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
	public int endPage(OrderVO orderVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = orderVO.getPageRow()*5+5;
		paramTotalPage = orderVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
		
		// 전체 페이지 설정
	public int totalPage(int totalCount,OrderVO orderVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%orderVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/orderVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/orderVO.getTotalRow())+1;
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
