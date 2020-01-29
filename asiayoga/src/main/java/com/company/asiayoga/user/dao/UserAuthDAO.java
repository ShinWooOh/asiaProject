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
	
	// �α��� ���� Ƚ�� ���� ������Ʈ
	public int updateFailureCount(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateFailureCount", userName);
	}
	
	// �α��� ���� Ƚ�� ���� 
	public int checkFailureCount(String userName) {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".checkFailureCount", userName);
	}
	
	// �α��� 3ȸ ���� �� ���� ��Ȱ��ȭ ó��
	public int updateEnabled(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateEnabled", userName);
	}
	
	// �α��� ���� Ƚ�� �ʱ�ȭ
	public int updateFailureCountReset(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateFailureCountReset", userName);
	}
	
	// �α��� ���� �� ���� ���� ������Ʈ
	public int updateAccessDate(String userName) {
		return sqlSession.update(MANAGE_NAMESPACE+".updateAccessDate", userName);
	}
	
	// �α��� ���� �� �α��� �� ������� ���� ���� �˾ƿ���
	public CustomUserDetail userDetailInfo(String userName) {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".selectUserById", userName);
	}
}
