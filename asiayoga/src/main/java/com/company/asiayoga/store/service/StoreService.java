package com.company.asiayoga.store.service;

import java.util.List;

import com.company.asiayoga.store.domain.StoreVO;

public interface StoreService {

	// 매장 목록
	List<StoreVO> storeList(StoreVO storeVO) throws Exception;
	
	// 매장 목록 갯수
	int storeTotalCount(StoreVO storeVO) throws Exception;
	
	// 매장 상세
	StoreVO storeDetail(StoreVO storeVO) throws Exception;
	
	// 매장 등록
	int insertStore(StoreVO storeVO) throws Exception;
	
	// 매장 삭제
	int storeDelete(StoreVO storeVO) throws Exception;
	
	// 매장 업데이트
	int updateStore(StoreVO storeVO) throws Exception;
}
