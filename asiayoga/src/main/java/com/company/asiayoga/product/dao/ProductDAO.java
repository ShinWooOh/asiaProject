package com.company.asiayoga.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.product.domain.ProductVO;

@Repository
public class ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String PRODUCT_NAMESPACE = "com.company.asiayoga.mapper.productMapper";
	
	public List<ProductVO> productList(ProductVO productVO) throws Exception{
		
		return sqlSession.selectList(PRODUCT_NAMESPACE+".productList", productVO);
		
	}

}
