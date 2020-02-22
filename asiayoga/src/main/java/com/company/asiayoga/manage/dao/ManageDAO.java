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
	
	// �α��� ���� �� ������ ����
	public ManageVO manageInfo(String id) throws Exception {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageDetail", id);
	}
	
	// ���� ���
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception {
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageList", manageVO);
	}
	
	// ���� ��� ����
	public int manageTotalCount(ManageVO manageVO) throws Exception {
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageTotalCount", manageVO);
	}
	
	// ���� ���� Ȱ��ȭ ���� ���� 
	public int updateEnableState(ManageVO manageVO) throws Exception{
		return sqlSession.update(MANAGE_NAMESPACE+".updateEnableState",manageVO);
	}
	
	// ���� �ߺ� ���� Ȯ��
	public List<ManageVO> manageDupIdCheck(ManageVO manageVO) throws Exception{
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageDupIdCheck",manageVO);
	}
	
	// ���� ���
	public int insertManage(ManageVO manageVO) throws Exception{
		return sqlSession.insert(MANAGE_NAMESPACE+".insertManage", manageVO);
	}
	
	// ���� ����
	public ManageVO manageInfo(ManageVO manageVO) throws Exception{
		return sqlSession.selectOne(MANAGE_NAMESPACE+".manageInfo", manageVO);
	}
	
	// ���� ���� ������Ʈ
	public int updateManage(ManageVO manageVO) throws Exception{
		return sqlSession.update(MANAGE_NAMESPACE+".updateManage", manageVO);
	}
	
	//���� ����Ʈ ���� �ٿ�ε�
	public List<ManageVO> manageExcelDownload(ManageVO manageVO) throws Exception{
		return sqlSession.selectList(MANAGE_NAMESPACE+".manageExcelDownload", manageVO);
	}
	
	
	
	/*���� �׷� ����*/

	
	// ���� �׷� ���
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception {
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupList", manageGroupVO);
	}
	
	// ���� �׷� ��� ����
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception {
		return sqlSession.selectOne(MANAGE_GROUP_NAMESPACE+".manageGroupTotalCount", manageGroupVO);
	}
	
	// ���� �׷�  ��� ���� ���� 
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.update(MANAGE_GROUP_NAMESPACE+".updateGroupUseYnState",manageGroupVO);
	}
	
	// ���� �׷� �ߺ� ���� Ȯ��
	public List<ManageGroupVO> manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupDupCheck",manageGroupVO);
	}
	
	// ���� �׷� ���
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.insert(MANAGE_GROUP_NAMESPACE+".insertManageGroup",manageGroupVO);
	}
	
	// ���� �׷� ��
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectOne(MANAGE_GROUP_NAMESPACE+".manageGroupDetail",manageGroupVO);
	}
	
	// ���� �׷� ������Ʈ
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.update(MANAGE_GROUP_NAMESPACE+".updateManageGroup",manageGroupVO);
	}
	
	//���� �׷� ����Ʈ ���� �ٿ�ε�
	public List<ManageGroupVO> manageGroupExcelDownload(ManageGroupVO manageGroupVO) throws Exception{
		return sqlSession.selectList(MANAGE_GROUP_NAMESPACE+".manageGroupExcelDownload", manageGroupVO);
	}
}
