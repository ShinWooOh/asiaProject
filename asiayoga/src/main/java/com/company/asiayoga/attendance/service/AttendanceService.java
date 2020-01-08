package com.company.asiayoga.attendance.service;

import java.util.List;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.member.domain.MemberVO;

public interface AttendanceService {

	// �⼮ ���
	List<AttendanceVO> attendanceList(AttendanceVO attendanceVO) throws Exception;

	// �⼮ ��
	List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) throws Exception;
	
	// �⼮ ���
	int insertAttendance (AttendanceVO attendanceVO) throws Exception;
	
	// ȸ�� ���� �˻�(List �� ����)
	List<MemberVO> memberSearch(MemberVO memberVO)throws Exception;
}
