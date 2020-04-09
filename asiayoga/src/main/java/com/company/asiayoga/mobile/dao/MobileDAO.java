package com.company.asiayoga.mobile.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.mobile.domain.MobileVO;

@Repository
public class MobileDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MOBILE_NAMESPACE = "com.company.asiayoga.mapper.mobileMapper";
	
	// ���� ����
	public MobileVO mobileStoreInfo(MobileVO mobileVO) throws Exception{
		return sqlSession.selectOne(MOBILE_NAMESPACE+".mobileStoreInfo", mobileVO);
	}
	
	// ����Ͽ��� ȸ������
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception{
		return sqlSession.selectOne(MOBILE_NAMESPACE+".mobileMeberInfo", mobileVO);
	}

	// ����Ͽ����� �⼮ ���
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception{
		return sqlSession.insert(MOBILE_NAMESPACE+".mobileInsertAttendance",mobileVO);
	}
}
