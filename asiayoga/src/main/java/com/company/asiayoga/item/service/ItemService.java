package com.company.asiayoga.item.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface ItemService {
	
	// 前格 包府
	List<ItemVO> itemList(ItemVO itemVO) throws Exception;
	
	// 前格 包府 肮荐
	int itemTotalCount(ItemVO itemVO) throws Exception;

	// 前格 历厘
	int insertItem(ItemVO itemVO) throws Exception;
	
	// 前格 昏力
	int itemDelete(ItemVO itemVO) throws Exception;
	
	// 前格 惑技
	ItemVO itemDetail(ItemVO itemVO) throws Exception;
	
	// 前格 荐沥
	int updateItem(ItemVO itemVO) throws Exception;
	
	// 前格 府胶飘 竣伎 促款肺靛
	SXSSFWorkbook itemExcelDownload(ItemVO itemVO) throws Exception;
	
	// 扑诀俊辑狼 概厘 格废
	List<StoreVO> storeSearchList(StoreVO storeVO);
	
}
