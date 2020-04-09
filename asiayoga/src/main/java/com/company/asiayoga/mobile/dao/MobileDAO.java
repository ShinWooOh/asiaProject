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
	
	// 매장 정보
	public MobileVO mobileStoreInfo(MobileVO mobileVO) throws Exception{
		return sqlSession.selectOne(MOBILE_NAMESPACE+".mobileStoreInfo", mobileVO);
	}
	
	// 모바일에서 회원정보
	public MobileVO mobileMeberInfo(MobileVO mobileVO) throws Exception{
		return sqlSession.selectOne(MOBILE_NAMESPACE+".mobileMeberInfo", mobileVO);
	}

	// 모바일에서의 출석 등록
	public int mobileInsertAttendance(MobileVO mobileVO) throws Exception{
		return sqlSession.insert(MOBILE_NAMESPACE+".mobileInsertAttendance",mobileVO);
	}
}
