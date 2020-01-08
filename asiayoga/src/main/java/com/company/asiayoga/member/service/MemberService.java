package com.company.asiayoga.member.service;

import java.util.List;

import com.company.asiayoga.member.domain.MemberVO;

public interface MemberService {
	
	// 회원 목록
	List<MemberVO> memberList(int storeSeq) throws Exception;
	
	// 회원 상세
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// 회원 등록
	int memberInsert(MemberVO memberVO) throws Exception;
	
	// 회원 삭제
	int memberDel(MemberVO memberVO) throws Exception;

	// 회원 정보 업데이트
	int memberEdit(MemberVO memberVO) throws Exception;
	

}
