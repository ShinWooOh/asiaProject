package com.company.asiayoga.mobile.member.service;

import com.company.asiayoga.mobile.member.domain.MobileMemberVO;

public interface MobileMemberService {
	
	// 테스트 ,나중에 return 형을 MobileMeberVO 로 변경해야함
	// 모바일에서 회원 로그인
	String mobileMeberInfo(MobileMemberVO mobileMeberVO) throws Exception;

}
