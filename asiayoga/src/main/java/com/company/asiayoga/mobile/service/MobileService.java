package com.company.asiayoga.mobile.service;

import com.company.asiayoga.mobile.domain.MobileVO;

public interface MobileService {
	
	// ���� ����
	public MobileVO mobileStoreInfo(MobileVO mobileVO) throws Exception;
	
	// �׽�Ʈ ,���߿� return ���� MobileMeberVO �� �����ؾ���
	// ����Ͽ��� ȸ�� �α���
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception;
	
	// ����Ͽ����� �⼮ ���
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception;

}
