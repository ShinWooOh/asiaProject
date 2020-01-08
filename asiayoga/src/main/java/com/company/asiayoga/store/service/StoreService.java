package com.company.asiayoga.store.service;

import java.util.List;

import com.company.asiayoga.store.domain.StoreVO;

public interface StoreService {

	List<StoreVO> storeList() throws Exception;
}
