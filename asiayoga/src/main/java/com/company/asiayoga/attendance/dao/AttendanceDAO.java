package com.company.asiayoga.attendance.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.member.domain.MemberVO;

@Repository
public class AttendanceDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String ATTENDANCE_NAMESPACE = "com.company.asiayoga.mapper.attendanceMapper";
	private static final String MEMBER_NAMESPACE = "com.company.asiayoga.mapper.memberMapper";

	// �⼮ ����
	public List<AttendanceVO> attendanceList(AttendanceVO attendanceVO){
        return sqlSession.selectList(ATTENDANCE_NAMESPACE+".attendanceList",attendanceVO);
    }
	
	// �⼮ ���� ����
	public int attendanceTotalCount(AttendanceVO attendanceVO){
		return sqlSession.selectOne(ATTENDANCE_NAMESPACE+".attendanceTotalCount",attendanceVO);
	}
	
	// �⼮ ���� ��
	public List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) {
		return sqlSession.selectList(ATTENDANCE_NAMESPACE+".attendanceDetail",attendanceVO);
	}
	
	// �⼮ ���� ���
	public int insertAttendance(AttendanceVO attendanceVO) {
		return sqlSession.insert(ATTENDANCE_NAMESPACE+".insertAttendance",attendanceVO);
	}
	
	// �⼮ ���� ����
	public int attendanceDelete(AttendanceVO attendanceVO) {
		return sqlSession.update(ATTENDANCE_NAMESPACE+".attendanceDelete",attendanceVO);
	}
	
	// ȸ�� ���� �˻�(List �� ����)
	public List<MemberVO> memberSearch(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberSearchList", memberVO);
	}
	
	// �⼮ ���� ����Ʈ ���� �ٿ�ε�
	public List<AttendanceVO> attendanceExcelDownload(AttendanceVO attendanceVO){
		return sqlSession.selectList(ATTENDANCE_NAMESPACE+".attendanceExcelDownload", attendanceVO);
	}
}
