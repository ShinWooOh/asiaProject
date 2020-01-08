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

	// 출석 정보
	public List<AttendanceVO> attendanceList(AttendanceVO attendanceVO){
        return sqlSession.selectList(ATTENDANCE_NAMESPACE+".attendanceList",attendanceVO);
    }
	
	// 출석 정보 상세
	public List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) {
		return sqlSession.selectList(ATTENDANCE_NAMESPACE+".attendanceDetail",attendanceVO);
	}
	
	// 출석 정보 등록
	public int insertAttendance(AttendanceVO attendanceVO) {
		return sqlSession.insert(ATTENDANCE_NAMESPACE+".insertAttendance",attendanceVO);
	}
	
	// 회원 정보 검색(List 로 리턴)
	public List<MemberVO> memberSearch(MemberVO memberVO) {
		return sqlSession.selectList(MEMBER_NAMESPACE+".memberSearchList", memberVO);
	}
}
