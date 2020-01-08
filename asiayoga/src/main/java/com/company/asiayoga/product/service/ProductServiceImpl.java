package com.company.asiayoga.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.product.dao.ProductDAO;
import com.company.asiayoga.product.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productList(ProductVO productVO) throws Exception {
		
		return productDAO.productList(productVO);
	}
	
	

}
