package com.company.asiayoga.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.user.domain.CustomUserDetail;

@Repository("userAuthDAO")
public class UserAuthDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MANAGE_NAMESPACE = "com.company.asiayoga.mapper.manageMapper";
	
	public CustomUserDetail getUserById(String userName) {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".selectUserById", userName);
	}
	
	// 로그인 실패 횟수 정보 업데이트
	public int updateFailureCount(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateFailureCount", userName);
	}
	
	// 로그인 실패 횟수 정보 
	public int checkFailureCount(String userName) {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".checkFailureCount", userName);
	}
	
	// 로그인 3회 실패 시 계정 비활성화 처리
	public int updateEnabled(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateEnabled", userName);
	}
	
	// 로그인 실패 횟수 초기화
	public int updateFailureCountReset(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateFailureCountReset", userName);
	}
	
	// 로그인 성공 시 접속 일자 업데이트
	public int updateAccessDate(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateAccessDate", userName);
	}
	
	// 로그인 성공 시 로그인 한 사용자의 매장 정보 알아오기
	public CustomUserDetail userDetailInfo(String userName) {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".selectUserById", userName);
	}
}
