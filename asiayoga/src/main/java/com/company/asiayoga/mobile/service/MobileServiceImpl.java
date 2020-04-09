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
	
	
	// 테스트  나중에 return 형을 MobileMeberVO 로 변경해야함
	@Override
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception {
		return mobileDAO.mobileMeberInfo(mobileVO);
	}


	// 모바일에서의 출석 등록
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception {
		return mobileDAO.mobileInsertAttendance(mobileVO);
	}
	
	

	
}
