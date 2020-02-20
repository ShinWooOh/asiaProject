package com.company.asiayoga.product.controller;

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

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.item.service.ItemService;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.product.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	private String menuFirstRoot = "product";
	
	// ��ǰ ���
	@RequestMapping(value = "productList")
	public String productList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(manageVO.getStoreSeq());
		List<ProductVO> list = productService.productList(productVO);
		
		model.addAttribute("productList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = productService.productTotalCount(productVO);
		productVO.setTotalCount(paramTotalCount);
		productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
		productVO.setEndPage(this.endPage(productVO));
		
		model.addAttribute("productVO", productVO);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productList";
	}
	
	// ��ǰ ��� ȭ�鿡���� �˻�
	@RequestMapping(value = "searchProductList")
	@ResponseBody
	public HashMap<String, Object> searchProductList(HttpServletRequest request,Model model,ProductVO productVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		productVO.setParamPage((productVO.getTotalRow()*productVO.getPageNum())-productVO.getTotalRow());
		productVO.setStoreSeq(manageVO.getStoreSeq());
		List<ProductVO> list = productService.productList(productVO);

		int paramTotalCount = 0;
		paramTotalCount = productService.productTotalCount(productVO);
		
		if(list.size() == 0) {
			productVO.setParamPage(0);
			productVO.setPageNum(1);
			productVO.setPageRow(0);

			if(paramTotalCount != 0) {
				productVO.setStartPage(1);
				productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
				productVO.setEndPage(this.endPage(productVO));
				list = productService.productList(productVO);
				hashMap.put("result", "success");
				hashMap.put("productList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (productVO.getPageRow()*5)+1;
			
			productVO.setTotalCount(paramTotalCount);
			productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
			paramEndPage = this.endPage(productVO);
			productVO.setStartPage(paramStartPage);
			productVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("productList", list);
		} else {
			productVO.setParamPage(0);
			productVO.setPageNum(1);
			productVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("productVO", productVO);
		
		return hashMap;
	}
	
	// ��ǰ ��� ȭ������ �̵�
	@RequestMapping(value = "productRegister")
	public String productRegister(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(manageVO.getStoreSeq());
		productVO.setStoreName(manageVO.getStoreName());
		model.addAttribute("productVO", productVO);
		
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(manageVO.getStoreSeq());
		List<ItemVO> itemList =  itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productRegister";
	}
	
	// ��ǰ ��� �� ǰ�� üũ(
	@RequestMapping(value = "checkItem")
	@ResponseBody
	public HashMap<String, Object> checkItem(Model model,@ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String paramResult = "fail";
		
		ItemVO vo = new ItemVO();
		vo = itemService.itemDetail(itemVO);
		if(vo != null) {
			paramResult = "success";
			hashMap.put("resultItem", vo);
		}
		hashMap.put("result", paramResult);
		
		return hashMap;
	}
	
	// ��ǰ ���� 
	@RequestMapping(value = "insertProduct")
	@ResponseBody
	public String insertProduct(Model model,@ModelAttribute("productVO") ProductVO productVO) throws Exception {
		
		String result = "fail";
		
		int paramResult = 0;
		
		paramResult = productService.insertProduct(productVO);
		 
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// ��ǰ ����
	@RequestMapping(value = "productDelete")
	@ResponseBody
	public String productDel(Model model,ProductVO productVO) throws Exception {
		String result = "fail";
		
		int paramResult = 0;
		
		paramResult = productService.productDelete(productVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// ��ǰ �� ȭ������ �̵�
	@RequestMapping(value = "productDetail")
	public String productDetail(HttpServletRequest request,Model model,ProductVO productVO) throws Exception {
	
		// ��ǰ ��
		productVO = productService.productDetail(productVO);
		model.addAttribute("productDetail", productVO);
		
		// ǰ��� ����Ʈ
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(productVO.getStoreSeq());
		List<ItemVO> itemList = itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productDetail";
	}
	
	// ��ǰ ������Ʈ
	@RequestMapping(value = "updateProduct")
	@ResponseBody
	public String updateProduct(Model model,ProductVO productVO) throws Exception {
		
		String result = "fail";
		
		int paramResult = 0;
		
		paramResult = productService.updateProduct(productVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// ������ ������ ���� 
	public int endPage(ProductVO productVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = productVO.getPageRow()*5+5;
		paramTotalPage = productVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// ��ü ������ ����
	public int totalPage(int totalCount,ProductVO productVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%productVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/productVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/productVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
}
