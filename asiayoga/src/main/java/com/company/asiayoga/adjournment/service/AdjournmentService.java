package com.company.asiayoga.adjournment.service;

import java.util.List;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;

public interface AdjournmentService {

	// ��ȸ ȸ�� ���
	List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception; 
	
	// ��ȸ ȸ�� ���
	int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ���� ������Ʈ
	int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ �� ����
	AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ���� ������Ʈ
	int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// ȸ�� ���� �˻�(List �� ����)
	List<MemberVO> memberSearch(MemberVO memberVO)throws Exception;
	
}
