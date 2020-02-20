package com.company.asiayoga.manage.service;

import java.util.List;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;

public interface ManageService {
	
	// 로그인 성공 시 세션 정보에 관리자 정보를 담기위한 로직
	public ManageVO manageInfo(String id) throws Exception;
	
	// 직원 목록
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception;
	
	// 직원 목록 갯수
	public int manageTotalCount(ManageVO manageVO) throws Exception;
	
	// 직원 계정 활성화 여부 변경 
	public int updateEnableState(ManageVO manageVO) throws Exception;
	
	// 직원 등록
	public int insertManage(ManageVO manageVO) throws Exception;
	
	// 직원 정보
	public ManageVO manageInfo(ManageVO manageVO) throws Exception;
	
	// 직원 정보 업데이트
	public int updateManage(ManageVO manageVO) throws Exception;
	
	// 계정 중복 여부 확인
	public int manageDupIdCheck(ManageVO manageVO) throws Exception;
	
	// 직급 목록
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급 목록 갯수
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급 사용 여부 변경
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급명 중복 여부 확인
	public int manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급 등록
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급 상세
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직급 정보 업데이트
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception;
}
