package com.company.asiayoga.product.service;

import java.util.List;

import com.company.asiayoga.product.domain.ProductVO;

public interface ProductService {
	
	// 상품 목록
	List<ProductVO> productList(ProductVO productVO)throws Exception;
	
	// 상품 등록
	int insertProduct(ProductVO productVO) throws Exception;
	
	// 상품 삭제
	int productDelete(ProductVO productVO) throws Exception;
	
	// 상품 상세
	ProductVO productDetail(ProductVO productVO)throws Exception;
	
	// 상품 업데이트
	int updateProduct(ProductVO productVO) throws Exception;
}
