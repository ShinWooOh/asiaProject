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
	
	// 상품 목록
	public List<ProductVO> productList(ProductVO productVO) throws Exception{
		return sqlSession.selectList(PRODUCT_NAMESPACE+".productList", productVO);
	}
	
	// 상품 목록 갯수
	public int productTotalCount(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(PRODUCT_NAMESPACE+".productTotalCount", productVO);
	}
	
	// 상품 등록
	public int insertProduct(ProductVO productVO) throws Exception{
		return sqlSession.insert(PRODUCT_NAMESPACE+".insertProduct", productVO);
	}
	
	// 상품 삭제
	public int productDelete(ProductVO productVO) throws Exception{
		return sqlSession.update(PRODUCT_NAMESPACE+".productDelete",productVO);
	}
	
	// 상품 상세
	public ProductVO productDetail(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(PRODUCT_NAMESPACE+".productDetail", productVO);
	}
	
	// 상품 업데이트
	public int updateProduct(ProductVO productVO) throws Exception{
		return sqlSession.update(PRODUCT_NAMESPACE+".updateProduct", productVO);
	}

	// 상품 목록 엑셀 다운로드
	public List<ProductVO> productExcelDown(ProductVO productVO) throws Exception{
		return sqlSession.selectList(PRODUCT_NAMESPACE+".productExcelDown", productVO);
	}
}
