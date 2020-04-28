package com.company.asiayoga.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.product.domain.ProductVO;
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
	
	// 팝업에서의 상품 목록
	public List<ProductVO> searchProductList(ProductVO productVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".searchProductList", productVO);
	}
	
	// 회원 휴회 상태 변경
	public int updateAdjournmentState(MemberVO memberVO) {
		return sqlSession.update(MEMBER_NAMESPACE+".updateAdjournmentState", memberVO);
	}
	
	// 유효 회원 목록 
	public List<MemberVO> validMemberList(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".validMemberList", memberVO);
	}
	
	// 유효 회원 수 
	public int validMemberCount(MemberVO memberVO) {
		return sqlSession.selectOne(MEMBER_NAMESPACE+".validMemberCount", memberVO);
	}
	
	// 만기 회원 목록 
	public List<MemberVO> maturityMemberList(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".maturityMemberList", memberVO);
	}
	
	// 만기 회원 수 
	public int maturityMemberCount(MemberVO memberVO) {
		return sqlSession.selectOne(MEMBER_NAMESPACE+".maturityMemberCount", memberVO);
	}
	
	// 만기 예정 회원 목록 
	public List<MemberVO> expiredMemberList(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".expiredMemberList", memberVO);
	}
	
	// 만기 예정 회원 수 
	public int expiredMemberCount(MemberVO memberVO) {
		return sqlSession.selectOne(MEMBER_NAMESPACE+".expiredMemberCount", memberVO);
	}
	
	// 유효 회원 엑셀 다운로드
	public List<MemberVO> vaildMemberExcelDownload(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".vaildMemberExcelDownload", memberVO);
	}
	
	// 만기 회원 엑셀 다운로드
	public List<MemberVO> maturityMemberExcelDownload(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".maturityMemberExcelDownload", memberVO);
	}
	
	// 만기예정 회원 엑셀 다운로드
	public List<MemberVO> expiredMemberExcelDownload(MemberVO memberVO){
		return sqlSession.selectList(MEMBER_NAMESPACE+".expiredMemberExcelDownload", memberVO);
	}
	
	// 회원번호 중복 체크
	public int myMembershipDupCheck(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(MEMBER_NAMESPACE+".myMembershipDupCheck", memberVO);
	}
}
