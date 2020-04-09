package com.company.asiayoga.mobile.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.mobile.dao.MobileDAO;
import com.company.asiayoga.mobile.domain.MobileVO;

@Service
public class MobileServiceImpl implements MobileService {

	@Inject
	private MobileDAO mobileDAO;

	@Override
	public MobileVO mobileStoreInfo(MobileVO mobileVO) throws Exception {
		
		return mobileDAO.mobileStoreInfo(mobileVO);
	}
	
	
	// �׽�Ʈ  ���߿� return ���� MobileMeberVO �� �����ؾ���
	@Override
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception {
		return mobileDAO.mobileMeberInfo(mobileVO);
	}


	// ����Ͽ����� �⼮ ���
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception {
		return mobileDAO.mobileInsertAttendance(mobileVO);
	}
	
	

	
}
