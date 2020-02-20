package com.company.asiayoga.store.service;

import java.util.List;

import com.company.asiayoga.store.domain.StoreVO;

public interface StoreService {

	// ���� ���
	List<StoreVO> storeList(StoreVO storeVO) throws Exception;
	
	// ���� ��� ����
	int storeTotalCount(StoreVO storeVO) throws Exception;
	
	// ���� ��
	StoreVO storeDetail(StoreVO storeVO) throws Exception;
	
	// ���� ���
	int insertStore(StoreVO storeVO) throws Exception;
	
	// ���� ����
	int storeDelete(StoreVO storeVO) throws Exception;
	
	// ���� ������Ʈ
	int updateStore(StoreVO storeVO) throws Exception;
}
