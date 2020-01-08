package com.company.asiayoga.product.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.product.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	
	
	@RequestMapping(value = "productList")
	public String productList(Model model) throws Exception {
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreCode(10);
		List<ProductVO> list = productService.productList(productVO);
		
		model.addAttribute("productList", list);
		
		return "/product/productList";
	}
}
