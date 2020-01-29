package com.company.asiayoga.user.service;

import com.company.asiayoga.user.domain.CustomUserDetail;

public interface UserService {
	
	// �α��� ���� Ƚ�� ���� ������Ʈ
	public int updateFailureCount(String userName);
	
	// �α��� ���� Ƚ�� ���� 
	public int checkFailureCount(String userName);
	
	// �α��� 3ȸ ���� �� ���� ��Ȱ��ȭ ó��
	public int updateEnabled(String userName);
	
	// �α��� ���� Ƚ�� �ʱ�ȭ
	public int updateFailureCountReset(String userName);
	
	// �α��� ���� �� ���� ���� ������Ʈ
	public int updateAccessDate(String userName);
	
	// �α��� ���� �� �α��� �� ������� ���� ���� �˾ƿ���
	public CustomUserDetail userDetailInfo(String userName);

}
