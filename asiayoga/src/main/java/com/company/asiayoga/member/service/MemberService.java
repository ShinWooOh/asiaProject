package com.company.asiayoga.member.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface MemberService {
	
	// ȸ�� ���
	List<MemberVO> memberList(MemberVO memberVO) throws Exception;
	
	// ȸ�� ��� ����
	int memberTotalCount(MemberVO memberVO) throws Exception;
	
	// ȸ�� ��
	MemberVO memberDetail(MemberVO memberVO) throws Exception;
	
	// ȸ�� ���
	int memberInsert(MemberVO memberVO);
	
	// ȸ�� ����
	int memberDel(MemberVO memberVO) throws Exception;

	// ȸ�� ���� ������Ʈ
	int memberEdit(MemberVO memberVO) throws Exception;
	
	// ȸ�� ã�� �˻� â���� �˻� �� ȸ�� ���
	List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception;
	
	// ��ǰ ã�� �˾������� ��ǰ ���
	List<ProductVO> searchProductList(ProductVO productVO) throws Exception;
	
	// ȸ�� ��� ���� �ٿ�ε�
	SXSSFWorkbook memberExcelDownload(MemberVO memberVO) throws Exception;
	
	// �˾������� ���� ���
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// ȸ�� ��ȸ ���� ����
	public int updateAdjournmentState(MemberVO memberVO) throws Exception;

	// ��ȿ ȸ�� ��� 
	public List<MemberVO> validMemberList(MemberVO memberVO) throws Exception;

	// ��ȿ ȸ�� ��
	public int validMemberCount(MemberVO memberVO) throws Exception;
	
	// ���� ȸ�� ��� 
	public List<MemberVO> maturityMemberList(MemberVO memberVO) throws Exception;
	
	// ���� ȸ�� ��
	public int maturityMemberCount(MemberVO memberVO) throws Exception;
	
	// ���� ���� ȸ�� ��� 
	public List<MemberVO> expiredMemberList(MemberVO memberVO) throws Exception;
	
	// ���� ���� ȸ�� ��
	public int expiredMemberCount(MemberVO memberVO) throws Exception;

	// ��ȿ ȸ�� ���� �ٿ�ε�
	SXSSFWorkbook vaildMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// ���� ȸ�� ���� �ٿ�ε�
	SXSSFWorkbook maturityMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// ���⿹�� ȸ�� ���� �ٿ�ε�
	SXSSFWorkbook expiredMemberExcelDownload(MemberVO memberVO) throws Exception;
	
	// �ߺ� ȸ����ȣ üũ
	public int myMembershipDupCheck(MemberVO memberVO) throws Exception;
}
