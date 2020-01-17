package com.company.asiayoga.item.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.item.domain.ItemVO;

@Repository
public class ItemDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String ITEM_NAMESPACE = "com.company.asiayoga.mapper.itemMapper";
	
	
	// ǰ�� ���
	public List<ItemVO> itemList(ItemVO itemVO){
		return sqlSession.selectList(ITEM_NAMESPACE+".itemList", itemVO);
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
}
