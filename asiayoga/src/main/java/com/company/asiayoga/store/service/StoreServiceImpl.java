package com.company.asiayoga.store.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.store.dao.StoreDAO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Inject
	private StoreDAO storeDAO;
	
	@Override
	public List<StoreVO> storeList() throws Exception {
		
		return storeDAO.storeList();
	}
	
	

}
