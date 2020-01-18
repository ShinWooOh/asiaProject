package com.company.asiayoga.store.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.store.domain.StoreVO;

@Repository
public class StoreDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String STORE_NAMESPACE = "com.company.asiayoga.mapper.storeMapper";
	
	// ���� ���
	public List<StoreVO> storeList() throws Exception{
		return sqlSession.selectList(STORE_NAMESPACE+".storeList");
	}
	
	// ���� ��
	public StoreVO storeDetail(StoreVO storeVO) throws Exception{
		return sqlSession.selectOne(STORE_NAMESPACE+".storeDetail",storeVO);
	}
	
	// ���� ���
	public int insertStore(StoreVO storeVO) throws Exception{
		return sqlSession.insert(STORE_NAMESPACE+".insertStore",storeVO);
	}
	
	// ���� ����
	public int storeDelete(StoreVO storeVO) throws Exception{
		return sqlSession.update(STORE_NAMESPACE+".storeDelete", storeVO);
	}
	
	// ���� ���� ������Ʈ
	public int updateStore(StoreVO storeVO) throws Exception{
		return sqlSession.update(STORE_NAMESPACE+".updateStore", storeVO);
	}
}
