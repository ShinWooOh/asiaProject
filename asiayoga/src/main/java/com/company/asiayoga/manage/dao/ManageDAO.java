package com.company.asiayoga.manage.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.manage.domain.ManageVO;

@Repository
public class ManageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MANAGE_NAMESPACE = "com.company.asiayoga.mapper.manageMapper";
	
	public ManageVO manageInfo(String id) throws Exception {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageDetail", id);
	}

}
