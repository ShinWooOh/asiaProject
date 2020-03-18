package com.company.asiayoga.item.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface ItemService {
	
	// ǰ�� ����
	List<ItemVO> itemList(ItemVO itemVO) throws Exception;
	
	// ǰ�� ���� ����
	int itemTotalCount(ItemVO itemVO) throws Exception;

	// ǰ�� ����
	int insertItem(ItemVO itemVO) throws Exception;
	
	// ǰ�� ����
	int itemDelete(ItemVO itemVO) throws Exception;
	
	// ǰ�� ��
	ItemVO itemDetail(ItemVO itemVO) throws Exception;
	
	// ǰ�� ����
	int updateItem(ItemVO itemVO) throws Exception;
	
	// ǰ�� ����Ʈ ���� �ٿ�ε�
	SXSSFWorkbook itemExcelDownload(ItemVO itemVO) throws Exception;
	
	// �˾������� ���� ���
	List<StoreVO> storeSearchList(StoreVO storeVO);
	
}
