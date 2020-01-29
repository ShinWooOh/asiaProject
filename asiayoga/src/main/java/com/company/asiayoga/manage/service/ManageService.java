package com.company.asiayoga.manage.service;

import com.company.asiayoga.manage.domain.ManageVO;

public interface ManageService {
	
	// 로그인 성공 시 세션 정보에 관리자 정보를 담기위한 로직
	public ManageVO manageInfo(String id) throws Exception;

}
