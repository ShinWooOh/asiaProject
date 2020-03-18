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
	
	// ��ǰ ���
	public List<ProductVO> productList(ProductVO productVO) throws Exception{
		return sqlSession.selectList(PRODUCT_NAMESPACE+".productList", productVO);
	}
	
	// ��ǰ ��� ����
	public int productTotalCount(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(PRODUCT_NAMESPACE+".productTotalCount", productVO);
	}
	
	// ��ǰ ���
	public int insertProduct(ProductVO productVO) throws Exception{
		return sqlSession.insert(PRODUCT_NAMESPACE+".insertProduct", productVO);
	}
	
	// ��ǰ ����
	public int productDelete(ProductVO productVO) throws Exception{
		return sqlSession.update(PRODUCT_NAMESPACE+".productDelete",productVO);
	}
	
	// ��ǰ ��
	public ProductVO productDetail(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(PRODUCT_NAMESPACE+".productDetail", productVO);
	}
	
	// ��ǰ ������Ʈ
	public int updateProduct(ProductVO productVO) throws Exception{
		return sqlSession.update(PRODUCT_NAMESPACE+".updateProduct", productVO);
	}

	// ��ǰ ��� ���� �ٿ�ε�
	public List<ProductVO> productExcelDown(ProductVO productVO) throws Exception{
		return sqlSession.selectList(PRODUCT_NAMESPACE+".productExcelDown", productVO);
	}
	
	// ���� ã��(������ ����)
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception{
		return sqlSession.selectList(STORE_NAMESPACE+".storeSearchList", storeVO);
	}
	
	// ǰ�� ã��(������ ����, ���� ���� �� ����)
	public List<ItemVO> searchItemList(ItemVO itemVO) throws Exception{
		return sqlSession.selectList(ITEM_NAMESPACE+".searchItemList", itemVO);
	}
}
