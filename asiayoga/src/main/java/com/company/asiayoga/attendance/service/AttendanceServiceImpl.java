package com.company.asiayoga.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.attendance.dao.AttendanceDAO;
import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Inject
	private AttendanceDAO attendanceDAO;
	
	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public List<AttendanceVO> attendanceList(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.attendanceList(attendanceVO);
	}

	@Override
	public int attendanceTotalCount(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.attendanceTotalCount(attendanceVO);
	}
	
	@Override
	public List<AttendanceVO> attendanceDetail(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.attendanceDetail(attendanceVO);
	}

	@Override
	public int insertAttendance(AttendanceVO attendanceVO) throws Exception {
		
		int resultParam = 0;
		
		// 출석 내역 insert
		resultParam = attendanceDAO.insertAttendance(attendanceVO);
		
		// 남은 횟수가 0 이 아닌 경우 남은횟수 에서 1 차감 
		if(attendanceVO.getRemainingCount() != 0) {
			int orderParam = 0;
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(attendanceVO.getOrderSeq());
			orderVO.setRemainingCount(attendanceVO.getRemainingCount()-1);
			orderParam = orderDAO.updateOrderCount(orderVO);
			if(orderParam == 0) {
				resultParam = 0;
			}
		}
		
		return resultParam;
	}

	@Override
	public List<MemberVO> memberSearch(MemberVO memberVO) throws Exception {
		return attendanceDAO.memberSearch(memberVO);
	}

	@Override
	public int attendanceDelete(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.attendanceDelete(attendanceVO);
	}

	
	
}
