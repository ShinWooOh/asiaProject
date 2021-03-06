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
	
	
	// 前格 格废
	public List<ItemVO> itemList(ItemVO itemVO){
		return sqlSession.selectList(ITEM_NAMESPACE+".itemList", itemVO);
	}
	
	// 前格 格废 肮荐
	public int itemTotalCount(ItemVO itemVO){
		return sqlSession.selectOne(ITEM_NAMESPACE+".itemTotalCount", itemVO);
	}
	
	// 前格 历厘
	public int insertItem(ItemVO itemVO){
		return sqlSession.insert(ITEM_NAMESPACE+".insertItem", itemVO);
	}
	
	// 前格 昏力
	public int itemDelete(ItemVO itemVO) {
		return sqlSession.update(ITEM_NAMESPACE+".itemDelete",itemVO);
	}
	
	// 前格 惑技
	public ItemVO itemDetail(ItemVO itemVO) {
		return sqlSession.selectOne(ITEM_NAMESPACE+".itemDetail",itemVO);
	}
	
	// 前格 诀单捞飘
	public int updateItem(ItemVO itemVO) {
		return sqlSession.update(ITEM_NAMESPACE+".updateItem",itemVO);
	}
	
	// 前格 府胶飘 竣伎 促款肺靛
	public List<ItemVO> itemExcelDownload(ItemVO itemVO){
		return sqlSession.selectList(ITEM_NAMESPACE+".itemExcelDownload", itemVO);
	}
	
	// 扑诀俊辑狼 概厘 格废
	public List<StoreVO> storeSearchList(StoreVO storeVO){
		return sqlSession.selectList(STORE_NAMESPACE+".storeSearchList", storeVO);
	}
}
