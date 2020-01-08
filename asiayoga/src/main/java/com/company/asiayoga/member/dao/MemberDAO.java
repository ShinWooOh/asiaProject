package com.company.asiayoga.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.member.domain.MemberVO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MEMBER_NAMESPACE = "com.company.asiayoga.mapper.memberMapper";
	
	public List<MemberVO> memberList(int storeSeq){
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberList", storeSeq);
	}
	
	// ȸ�� ���� ��
	public MemberVO memberDetail(MemberVO memberVO){
		return sqlSession.selectOne(MEMBER_NAMESPACE+".memberDetail", memberVO);
	}
	
	// ȸ�� ���� ���
	public int memberInsert(MemberVO memberVO) {
		return sqlSession.insert(MEMBER_NAMESPACE+".memberInsert", memberVO);
	}
	
	// ȸ�� ���� ����
	public int memberDel(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".memberDel", memberVO);
	}
	
	// ȸ�� ���� ������Ʈ
	public int memberEdit(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".memberEdit", memberVO);
	}
}
