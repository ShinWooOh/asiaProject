package com.company.asiayoga.manage.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface ManageService {
	
	// �α��� ���� �� ���� ������ ������ ������ ������� ����
	public ManageVO manageInfo(String id) throws Exception;
	
	// ���� ���
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception;
	
	// ���� ��� ����
	public int manageTotalCount(ManageVO manageVO) throws Exception;
	
	// ���� ���� Ȱ��ȭ ���� ���� 
	public int updateEnableState(ManageVO manageVO) throws Exception;
	
	// ���� ���
	public int insertManage(ManageVO manageVO) throws Exception;
	
	// ���� ����
	public ManageVO manageInfo(ManageVO manageVO) throws Exception;
	
	// ���� ���� ������Ʈ
	public int updateManage(ManageVO manageVO) throws Exception;
	
	// ���� �ߺ� ���� Ȯ��
	public int manageDupIdCheck(ManageVO manageVO) throws Exception;
	
	//���� ����Ʈ ���� �ٿ�ε�
	SXSSFWorkbook manageExcelDownload(ManageVO manageVO) throws Exception;
	
	// ���� ��� ȭ�鿡�� ���� ���ÿ� ���� ���� ����Ʈ(������ ����)
	public List<ManageGroupVO> searchGroupList(ManageGroupVO manageGroupVO) throws Exception;
	
	/*���� �׷� ����*/
	
	// ���� ���
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���� ��� ����
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���� ��� ���� ����
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���޸� �ߺ� ���� Ȯ��
	public int manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���� ���
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���� ��
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception;
	
	// ���� ���� ������Ʈ
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception;
	
	//���� �׷� ����Ʈ ���� �ٿ�ε�
	SXSSFWorkbook manageGroupExcelDownload(ManageGroupVO manageGroupVO) throws Exception;
	
	// �˾� â������ ���� �˻�
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// �˻� ���� ���� ���� ���
	public List<ManageGroupVO> manageGroupListAll(ManageGroupVO manageGroupVO) throws Exception;
	
}
