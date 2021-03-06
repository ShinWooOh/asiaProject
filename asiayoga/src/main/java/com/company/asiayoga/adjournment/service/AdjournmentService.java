package com.company.asiayoga.adjournment.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;

public interface AdjournmentService {

	// ��ȸ ȸ�� ���
	List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ȸ�� ��� ����
	int adjournmentTotalCount(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ȸ�� ���
	int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ���� ������Ʈ
	int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ �� ����
	AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception;
	
	// ��ȸ ���� ������Ʈ
	@Transactional(rollbackFor =Exception.class)
	int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// ȸ�� ���� �˻�(List �� ����)
	List<MemberVO> memberSearch(MemberVO memberVO)throws Exception;
	
	// ��ȸ ����Ʈ ���� �ٿ�ε�
	SXSSFWorkbook adjournmentExcelDownload(AdjournmentVO adjournmentVO) throws Exception;
	
}
