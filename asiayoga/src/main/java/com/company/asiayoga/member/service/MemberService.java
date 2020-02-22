package com.company.asiayoga.member.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.member.domain.MemberVO;

public interface MemberService {
	
	// ȸ�� ���
	List<MemberVO> memberList(MemberVO memberVO) throws Exception;
	
	// ȸ�� ��� ����
	int memberTotalCount(MemberVO memberVO) throws Exception;
	
	// ȸ�� ��
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// ȸ�� ���
	int memberInsert(MemberVO memberVO) throws Exception;
	
	// ȸ�� ����
	int memberDel(MemberVO memberVO) throws Exception;

	// ȸ�� ���� ������Ʈ
	int memberEdit(MemberVO memberVO) throws Exception;
	
	// ȸ�� ã�� �˻� â���� �˻� �� ȸ�� ���
	List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception;
	
	// ȸ�� ��� ���� �ٿ�ε�
	SXSSFWorkbook memberExcelDownload(MemberVO memberVO) throws Exception;

}
