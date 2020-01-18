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
	
	// 매장 목록
	public List<StoreVO> storeList() throws Exception{
		return sqlSession.selectList(STORE_NAMESPACE+".storeList");
	}
	
	// 매장 상세
	public StoreVO storeDetail(StoreVO storeVO) throws Exception{
		return sqlSession.selectOne(STORE_NAMESPACE+".storeDetail",storeVO);
	}
	
	// 매장 등록
	public int insertStore(StoreVO storeVO) throws Exception{
		return sqlSession.insert(STORE_NAMESPACE+".insertStore",storeVO);
	}
	
	// 매장 삭제
	public int storeDelete(StoreVO storeVO) throws Exception{
		return sqlSession.update(STORE_NAMESPACE+".storeDelete", storeVO);
	}
	
	// 매장 정보 업데이트
	public int updateStore(StoreVO storeVO) throws Exception{
		return sqlSession.update(STORE_NAMESPACE+".updateStore", storeVO);
	}
}
