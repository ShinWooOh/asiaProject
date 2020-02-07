package com.company.asiayoga.manage.service;

import java.util.List;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;

public interface ManageService {
	
	// 로그인 성공 시 세션 정보에 관리자 정보를 담기위한 로직
	public ManageVO manageInfo(String id) throws Exception;
	
	// 매장 직원 목록
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception;
	
	// 직원 계정 활성화 여부 변경 
	public int updateEnableState(ManageVO manageVO) throws Exception;
	
	// 계정 중복 여부 확인
	public int manageDupIdCheck(ManageVO manageVO) throws Exception;
	
	// 직원 그룹 목록
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직원 그룹  사용 여부 변경
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직원 그룹명 중복 여부 확인
	public int manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직원 그룹 등록
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직원 그룹 상세
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception;
	
	// 직원 그룹 업데이트
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception;
}
