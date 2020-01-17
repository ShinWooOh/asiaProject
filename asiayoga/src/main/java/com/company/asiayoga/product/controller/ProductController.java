package com.company.asiayoga.product.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.item.service.ItemService;
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
	
	// ��ǰ ���
	@RequestMapping(value = "productList")
	public String productList(Model model) throws Exception {
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(10);
		List<ProductVO> list = productService.productList(productVO);
		
		model.addAttribute("productList", list);
		
		return "/product/productList";
	}
	
	// ��ǰ ��� ȭ������ �̵�
	@RequestMapping(value = "productRegister")
	public String productRegister(Model model) throws Exception {
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(10);
		productVO.setStoreName("���̵�䰡 ��������");
		model.addAttribute("productVO", productVO);
		
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(10);
		List<ItemVO> itemList =  itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
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
	public String productDetail(Model model,ProductVO productVO) throws Exception {
	
		// ��ǰ ��
		productVO = productService.productDetail(productVO);
		model.addAttribute("productDetail", productVO);
		
		// ǰ��� ����Ʈ
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(productVO.getStoreSeq());
		List<ItemVO> itemList = itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
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
}
