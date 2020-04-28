package com.company.asiayoga.member.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface MemberService {
	
	// 회원 목록
	List<MemberVO> memberList(MemberVO memberVO) throws Exception;
	
	// 회원 목록 갯수
	int memberTotalCount(MemberVO memberVO) throws Exception;
	
	// 회원 상세
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// 회원 등록
	int memberInsert(MemberVO memberVO);
	
	// 회원 삭제
	int memberDel(MemberVO memberVO) throws Exception;

	// 회원 정보 업데이트
	int memberEdit(MemberVO memberVO) throws Exception;
	
	// 회원 찾기 검색 창에서 검색 시 회원 목록
	List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception;
	
	// 상품 찾기 팝업에서의 상품 목록
	List<ProductVO> searchProductList(ProductVO productVO) throws Exception;
	
	// 회원 목록 엑셀 다운로드
	SXSSFWorkbook memberExcelDownload(MemberVO memberVO) throws Exception;
	
	// 팝업에서의 매장 목록
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// 회원 휴회 상태 변경
	public int updateAdjournmentState(MemberVO memberVO) throws Exception;

	// 유효 회원 목록 
	public List<MemberVO> validMemberList(MemberVO memberVO) throws Exception;

	// 유효 회원 수
	public int validMemberCount(MemberVO memberVO) throws Exception;
	
	// 만기 회원 목록 
	public List<MemberVO> maturityMemberList(MemberVO memberVO) throws Exception;
	
	// 만기 회원 수
	public int maturityMemberCount(MemberVO memberVO) throws Exception;
	
	// 만기 예정 회원 목록 
	public List<MemberVO> expiredMemberList(MemberVO memberVO) throws Exception;
	
	// 만기 예정 회원 수
	public int expiredMemberCount(MemberVO memberVO) throws Exception;

	// 유효 회원 엑셀 다운로드
	SXSSFWorkbook vaildMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// 만기 회원 엑셀 다운로드
	SXSSFWorkbook maturityMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// 만기예정 회원 엑셀 다운로드
	SXSSFWorkbook expiredMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// 중복 회원번호 체크
	public int myMembershipDupCheck(MemberVO memberVO) throws Exception;
}
