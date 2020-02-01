package com.company.asiayoga.adjournment.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;

@Repository
public class AdjournmentDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String ADJOURNMENT_NAMESPACE = "com.company.asiayoga.mapper.adjournmentMapper";
	private static final String MEMBER_NAMESPACE = "com.company.asiayoga.mapper.memberMapper";
	
	// 휴회 회원 목록
	public List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO){
		return sqlSession.selectList(ADJOURNMENT_NAMESPACE+".adjournmentList", adjournmentVO);
	}
	
	// 휴회 회원 등록
	public int insertAdjournment(AdjournmentVO adjournmentVO) {
		return sqlSession.insert(ADJOURNMENT_NAMESPACE+".insertAdjournment",adjournmentVO);
	}
	
	// 휴회 상태 업데이트
	public int updateAdjournmentState(AdjournmentVO adjournmentVO) {
		return sqlSession.update(ADJOURNMENT_NAMESPACE+".updateAdjournmentState",adjournmentVO);
	}
	
	// 휴회 상세 내용
	public AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) {
		return sqlSession.selectOne(ADJOURNMENT_NAMESPACE+".adjournmentDetail", adjournmentVO);
	}

	// 휴회 정보 업데이트
	public int updateAdjournment(AdjournmentVO adjournmentVO) {
		return sqlSession.update(ADJOURNMENT_NAMESPACE+".updateAdjournment",adjournmentVO);
	}
	
	// 회원 정보 검색(List 로 리턴)
	public List<MemberVO> memberSearch(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberSearchList", memberVO);
	}
}
