package com.company.asiayoga.product.service;

import java.util.List;

import com.company.asiayoga.product.domain.ProductVO;

public interface ProductService {
	
	// 상품 목록
	List<ProductVO> productList(ProductVO productVO)throws Exception;

}
