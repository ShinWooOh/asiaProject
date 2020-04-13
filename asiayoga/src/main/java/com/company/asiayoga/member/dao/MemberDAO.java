package com.company.asiayoga.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.domain.StoreVO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MEMBER_NAMESPACE = "com.company.asiayoga.mapper.memberMapper";
	private static final String STORE_NAMESPACE = "com.company.asiayoga.mapper.storeMapper";
	
	// 회원 정보 목록
	public List<MemberVO> memberList(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberList", memberVO);
	}
	
	// 회원 정보 목록 갯수
	public int memberTotalCount(MemberVO memberVO){
		return sqlSession.selectOne(MEMBER_NAMESPACE+".memberTotalCount", memberVO);
	}
	
	// 회원 정보 상세
	public MemberVO memberDetail(MemberVO memberVO){
		return sqlSession.selectOne(MEMBER_NAMESPACE+".memberDetail", memberVO);
	}
	
	// 회원 정보 등록
	public int memberInsert(MemberVO memberVO) {
		return sqlSession.insert(MEMBER_NAMESPACE+".memberInsert", memberVO);
	}
	
	// 회원 정보 삭제
	public int memberDel(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".memberDel", memberVO);
	}
	
	// 회원 정보 업데이트
	public int memberEdit(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".memberEdit", memberVO);
	}
	
	// 회원 찾기 팝업에서의 검색
	public List<MemberVO> searchMemberList(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".searchMemberList", memberVO);
	}
	
	// 회원 목록 엑셀 다운로드
	public List<MemberVO> memberExcelDown(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberExcelDown", memberVO);
	}
	
	// 팝업에서의 매장 목록
	public List<StoreVO> storeSearchList(StoreVO storeVO){
		return sqlSession.selectList(STORE_NAMESPACE+".storeSearchList", storeVO);
	}
	
	// 회원 휴회 상태 변경
	public int updateAdjournmentState(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".updateAdjournmentState", memberVO);
	}
	
	// 회원 통계 
	public MemberVO memberStatistics(MemberVO memberVO) {
		return sqlSession.selectOne(MEMBER_NAMESPACE+".memberStatistics", memberVO);
	}
}
