package com.company.asiayoga.item.service;

import java.util.List;

import com.company.asiayoga.item.domain.ItemVO;

public interface ItemService {
	
	// 前格 包府
	List<ItemVO> itemList(ItemVO itemVO) throws Exception;

	// 前格 历厘
	int insertItem(ItemVO itemVO) throws Exception;
	
	// 前格 昏力
	int itemDelete(ItemVO itemVO) throws Exception;
	
	// 前格 惑技
	ItemVO itemDetail(ItemVO itemVO) throws Exception;
	
	// 前格 荐沥
	int updateItem(ItemVO itemVO) throws Exception;
	
}
