package com.company.asiayoga.manage.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.domain.StoreVO;

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
	
	//직원 리스트 엑셀 다운로드
	SXSSFWorkbook manageExcelDownload(ManageVO manageVO) throws Exception;
	
	// 직원 등록 화면에서 매장 선택에 따른 직급 리스트(관리자 전용)
	public List<ManageGroupVO> searchGroupList(ManageGroupVO manageGroupVO) throws Exception;
	
	/*직원 그룹 관련*/
	
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
	
	//직원 그룹 리스트 엑셀 다운로드
	SXSSFWorkbook manageGroupExcelDownload(ManageGroupVO manageGroupVO) throws Exception;
	
	// 팝업 창에서의 매장 검색
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// 검색 조건 없는 직급 목록
	public List<ManageGroupVO> manageGroupListAll(ManageGroupVO manageGroupVO) throws Exception;
	
}
