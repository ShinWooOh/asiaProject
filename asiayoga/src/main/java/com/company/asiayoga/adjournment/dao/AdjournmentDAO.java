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
	
	// ��ȸ ȸ�� ���
	public List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO){
		return sqlSession.selectList(ADJOURNMENT_NAMESPACE+".adjournmentList", adjournmentVO);
	}
	
	// ��ȸ ȸ�� ���
	public int insertAdjournment(AdjournmentVO adjournmentVO) {
		return sqlSession.insert(ADJOURNMENT_NAMESPACE+".insertAdjournment",adjournmentVO);
	}
	
	// ��ȸ ���� ������Ʈ
	public int updateAdjournmentState(AdjournmentVO adjournmentVO) {
		return sqlSession.update(ADJOURNMENT_NAMESPACE+".updateAdjournmentState",adjournmentVO);
	}
	
	// ��ȸ �� ����
	public AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) {
		return sqlSession.selectOne(ADJOURNMENT_NAMESPACE+".adjournmentDetail", adjournmentVO);
	}

	// ��ȸ ���� ������Ʈ
	public int updateAdjournment(AdjournmentVO adjournmentVO) {
		return sqlSession.update(ADJOURNMENT_NAMESPACE+".updateAdjournment",adjournmentVO);
	}
	
	// ȸ�� ���� �˻�(List �� ����)
	public List<MemberVO> memberSearch(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberSearchList", memberVO);
	}
}
