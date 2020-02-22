package com.company.asiayoga.member.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.member.domain.MemberVO;

public interface MemberService {
	
	// 회원 목록
	List<MemberVO> memberList(MemberVO memberVO) throws Exception;
	
	// 회원 목록 갯수
	int memberTotalCount(MemberVO memberVO) throws Exception;
	
	// 회원 상세
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// 회원 등록
	int memberInsert(MemberVO memberVO) throws Exception;
	
	// 회원 삭제
	int memberDel(MemberVO memberVO) throws Exception;

	// 회원 정보 업데이트
	int memberEdit(MemberVO memberVO) throws Exception;
	
	// 회원 찾기 검색 창에서 검색 시 회원 목록
	List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception;
	
	// 회원 목록 엑셀 다운로드
	SXSSFWorkbook memberExcelDownload(MemberVO memberVO) throws Exception;

}
