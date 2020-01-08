package com.company.asiayoga.member.service;

import java.util.List;

import com.company.asiayoga.member.domain.MemberVO;

public interface MemberService {
	
	// ȸ�� ���
	List<MemberVO> memberList(int storeSeq) throws Exception;
	
	// ȸ�� ��
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// ȸ�� ���
	int memberInsert(MemberVO memberVO) throws Exception;
	
	// ȸ�� ����
	int memberDel(MemberVO memberVO) throws Exception;

	// ȸ�� ���� ������Ʈ
	int memberEdit(MemberVO memberVO) throws Exception;
	

}
