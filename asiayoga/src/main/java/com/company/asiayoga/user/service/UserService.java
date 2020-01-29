package com.company.asiayoga.user.service;

import com.company.asiayoga.user.domain.CustomUserDetail;

public interface UserService {
	
	// 로그인 실패 횟수 정보 업데이트
	public int updateFailureCount(String userName);
	
	// 로그인 실패 횟수 정보 
	public int checkFailureCount(String userName);
	
	// 로그인 3회 실패 시 계정 비활성화 처리
	public int updateEnabled(String userName);
	
	// 로그인 실패 횟수 초기화
	public int updateFailureCountReset(String userName);
	
	// 로그인 성공 시 접속 일자 업데이트
	public int updateAccessDate(String userName);
	
	// 로그인 성공 시 로그인 한 사용자의 매장 정보 알아오기
	public CustomUserDetail userDetailInfo(String userName);

}
