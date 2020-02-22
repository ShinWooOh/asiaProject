package com.company.asiayoga.manage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;

@Repository
public class ManageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String MANAGE_NAMESPACE = "com.company.asiayoga.mapper.manageMapper";
	private static final String MANAGE_GROUP_NAMESPACE = "com.company.asiayoga.mapper.manageGroupMapper";
	
	// 로그인 성공 시 접속자 정보
	public ManageVO manageInfo(String id) throws Exception {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageDetail", id);
	}
	
	// 직원 목록
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception {
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageList", manageVO);
	}
	
	// 직원 목록 갯수
	public int manageTotalCount(ManageVO manageVO) throws Exception {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageTotalCount", manageVO);
	}
	
	// 직원 계정 활성화 여부 변경 
	public int updateEnableState(ManageVO manageVO) throws Exception{
		return sqlSession.update(MANAGE_NAMESPACE+".updateEnableState",manageVO);
	}
	
	// 계정 중복 여부 확인
	public List<ManageVO> manageDupIdCheck(ManageVO manageVO) throws Exception{
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageDupIdCheck",manageVO);
	}
	
	// 직원 등록
	public int insertManage(ManageVO manageVO) throws Exception{
		return sqlSession.insert(MANAGE_NAMESPACE+".insertManage", manageVO);
	}
	
	// 직원 정보
	public ManageVO manageInfo(ManageVO manageVO) throws Exception{
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageInfo", manageVO);
	}
	
	// 직원 정보 업데이트
	public int updateManage(ManageVO manageVO) throws Exception{
		return sqlSession.update(MANAGE_NAMESPACE+".updateManage", manageVO);
	}
	
	//직원 리스트 엑셀 다운로드
	public List<ManageVO> manageExcelDownload(ManageVO manageVO) throws Exception{
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageExcelDownload", manageVO);
	}
	
	
	
	/*직원 그룹 관련*/

	
	// 직원 그룹 목록
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception {
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupList", manageGroupVO);
	}
	
	// 직원 그룹 목록 갯수
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception {
		return sqlSession.selectOne(MANAGE_GROUP_NAMESPACE+".manageGroupTotalCount", manageGroupVO);
	}
	
	// 직원 그룹  사용 여부 변경 
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.update(MANAGE_GROUP_NAMESPACE+".updateGroupUseYnState",manageGroupVO);
	}
	
	// 직원 그룹 중복 여부 확인
	public List<ManageGroupVO> manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupDupCheck",manageGroupVO);
	}
	
	// 직원 그룹 등록
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.insert(MANAGE_GROUP_NAMESPACE+".insertManageGroup",manageGroupVO);
	}
	
	// 직원 그룹 상세
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectOne(MANAGE_GROUP_NAMESPACE+".manageGroupDetail",manageGroupVO);
	}
	
	// 직원 그룹 업데이트
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.update(MANAGE_GROUP_NAMESPACE+".updateManageGroup",manageGroupVO);
	}
	
	//직원 그룹 리스트 엑셀 다운로드
	public List<ManageGroupVO> manageGroupExcelDownload(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupExcelDownload", manageGroupVO);
	}
}
