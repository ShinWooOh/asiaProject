package com.company.asiayoga.attendance.service;

import java.util.List;

import com.company.asiayoga.attendance.domain.AttendanceVO;

public interface AttendanceService {

	// 출석 목록
	List<AttendanceVO> attendanceList(AttendanceVO attendanceVO) throws Exception;

	// 출석 상세
	List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) throws Exception;
	
	// 출석 등록
	int insertAttendance (AttendanceVO attendanceVO) throws Exception;
}
