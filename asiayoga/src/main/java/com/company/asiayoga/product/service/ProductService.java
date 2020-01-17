package com.company.asiayoga.product.service;

import java.util.List;

import com.company.asiayoga.product.domain.ProductVO;

public interface ProductService {
	
	// ��ǰ ���
	List<ProductVO> productList(ProductVO productVO)throws Exception;
	
	// ��ǰ ���
	int insertProduct(ProductVO productVO) throws Exception;
	
	// ��ǰ ����
	int productDelete(ProductVO productVO) throws Exception;
	
	// ��ǰ ��
	ProductVO productDetail(ProductVO productVO)throws Exception;
	
	// ��ǰ ������Ʈ
	int updateProduct(ProductVO productVO) throws Exception;
}
