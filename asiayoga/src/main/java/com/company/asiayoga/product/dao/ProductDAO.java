package com.company.asiayoga.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

@Repository
public class ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String PRODUCT_NAMESPACE = "com.company.asiayoga.mapper.productMapper";
	private static final String STORE_NAMESPACE = "com.company.asiayoga.mapper.storeMapper";
	private static final String ITEM_NAMESPACE = "com.company.asiayoga.mapper.itemMapper";
	
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
	
	// 매장 찾기(관리자 전용)
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception{
		return sqlSession.selectList(STORE_NAMESPACE+".storeSearchList", storeVO);
	}
	
	// 품목 찾기(관리자 전용, 매장 선택 후 로직)
	public List<ItemVO> searchItemList(ItemVO itemVO) throws Exception{
		return sqlSession.selectList(ITEM_NAMESPACE+".searchItemList", itemVO);
	}
}
