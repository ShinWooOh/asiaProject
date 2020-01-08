package com.company.asiayoga.attendance.service;

import java.util.List;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.member.domain.MemberVO;

public interface AttendanceService {

	// 출석 목록
	List<AttendanceVO> attendanceList(AttendanceVO attendanceVO) throws Exception;

	// 출석 상세
	List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) throws Exception;
	
	// 출석 등록
	int insertAttendance (AttendanceVO attendanceVO) throws Exception;
	
	// 회원 정보 검색(List 로 리턴)
	List<MemberVO> memberSearch(MemberVO memberVO)throws Exception;
}
