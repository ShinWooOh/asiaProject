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
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception {
		return storeDAO.storeList(storeVO);
	}
	
	@Override
	public int storeTotalCount(StoreVO storeVO) throws Exception {
		return storeDAO.storeTotalCount(storeVO);
	}
	
	@Override
	public StoreVO storeDetail(StoreVO storeVO) throws Exception {
		
	    
	    storeVO = storeDAO.storeDetail(storeVO); 
	    
	    String[] arrTel = storeVO.getStoreTel().split("-");
	    String tel1 = arrTel[0];
	    String tel2 = arrTel[1];
	    String tel3 = arrTel[2];
	    
	    storeVO.setStoreTel1(tel1);
	    storeVO.setStoreTel2(tel2);
	    storeVO.setStoreTel3(tel3);
	    
	    String[] arrPhone = storeVO.getStorePhone().split("-");
	    String phone1 = arrPhone[0];
	    String phone2 = arrPhone[1];
	    String phone3 = arrPhone[2];
	    
	    storeVO.setStorePhone1(phone1);
	    storeVO.setStorePhone2(phone2);
	    storeVO.setStorePhone3(phone3);
		
		return storeVO;
	}
	
	@Override
	public int insertStore(StoreVO storeVO) throws Exception {
		return storeDAO.insertStore(storeVO);
	}
	
	@Override
	public int storeDelete(StoreVO storeVO) throws Exception {
		return storeDAO.storeDelete(storeVO);
	}

	@Override
	public int updateStore(StoreVO storeVO) throws Exception {
		return storeDAO.updateStore(storeVO);
	}




	

}
