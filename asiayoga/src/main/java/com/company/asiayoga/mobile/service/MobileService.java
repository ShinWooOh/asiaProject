package com.company.asiayoga.mobile.service;

import com.company.asiayoga.mobile.domain.MobileVO;

public interface MobileService {
	
	// 매장 정보
	public MobileVO mobileStoreInfo(MobileVO mobileVO) throws Exception;
	
	// 테스트 ,나중에 return 형을 MobileMeberVO 로 변경해야함
	// 모바일에서 회원 로그인
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception;
	
	// 모바일에서의 출석 등록
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception;

}
