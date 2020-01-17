package com.company.asiayoga.item.service;

import java.util.List;

import com.company.asiayoga.item.domain.ItemVO;

public interface ItemService {
	
	// ǰ�� ����
	List<ItemVO> itemList(ItemVO itemVO) throws Exception;

	// ǰ�� ����
	int insertItem(ItemVO itemVO) throws Exception;
	
	// ǰ�� ����
	int itemDelete(ItemVO itemVO) throws Exception;
	
	// ǰ�� ��
	ItemVO itemDetail(ItemVO itemVO) throws Exception;
	
	// ǰ�� ����
	int updateItem(ItemVO itemVO) throws Exception;
	
}
