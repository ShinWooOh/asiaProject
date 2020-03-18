package com.company.asiayoga.item.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.store.domain.StoreVO;

@Repository
public class ItemDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String ITEM_NAMESPACE = "com.company.asiayoga.mapper.itemMapper";
	private static final String STORE_NAMESPACE = "com.company.asiayoga.mapper.storeMapper";
	
	
	// ǰ�� ���
	public List<ItemVO> itemList(ItemVO itemVO){
		return sqlSession.selectList(ITEM_NAMESPACE+".itemList", itemVO);
	}
	
	// ǰ�� ��� ����
	public int itemTotalCount(ItemVO itemVO){
		return sqlSession.selectOne(ITEM_NAMESPACE+".itemTotalCount", itemVO);
	}
	
	// ǰ�� ����
	public int insertItem(ItemVO itemVO){
		return sqlSession.insert(ITEM_NAMESPACE+".insertItem", itemVO);
	}
	
	// ǰ�� ����
	public int itemDelete(ItemVO itemVO) {
		return sqlSession.update(ITEM_NAMESPACE+".itemDelete",itemVO);
	}
	
	// ǰ�� ��
	public ItemVO itemDetail(ItemVO itemVO) {
		return sqlSession.selectOne(ITEM_NAMESPACE+".itemDetail",itemVO);
	}
	
	// ǰ�� ������Ʈ
	public int updateItem(ItemVO itemVO) {
		return sqlSession.update(ITEM_NAMESPACE+".updateItem",itemVO);
	}
	
	// ǰ�� ����Ʈ ���� �ٿ�ε�
	public List<ItemVO> itemExcelDownload(ItemVO itemVO){
		return sqlSession.selectList(ITEM_NAMESPACE+".itemExcelDownload", itemVO);
	}
	
	// �˾������� ���� ���
	public List<StoreVO> storeSearchList(StoreVO storeVO){
		return sqlSession.selectList(STORE_NAMESPACE+".storeSearchList", storeVO);
	}
}
