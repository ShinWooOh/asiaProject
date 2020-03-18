package com.company.asiayoga.mobile.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.mobile.member.domain.MobileMemberVO;

@Repository
public class MobileMemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MOBILE_MEMBER_LOGIN_NAMESPACE = "com.company.asiayoga.mapper.mobileMemberMapper";
	
	// 모바일에서 회원 로그인
	public MobileMemberVO mobileMeberInfo(MobileMemberVO mobileMeberVO) throws Exception{
		return sqlSession.selectOne(MOBILE_MEMBER_LOGIN_NAMESPACE+".mobileMeberInfo", mobileMeberVO);
	}

}
