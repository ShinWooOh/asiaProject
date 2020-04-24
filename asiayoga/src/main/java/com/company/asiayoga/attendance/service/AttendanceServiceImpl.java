package com.company.asiayoga.attendance.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
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

	@Transactional
	@Override
	public int attendanceDelete(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.attendanceDelete(attendanceVO);
	}

	@Override
	public SXSSFWorkbook attendanceExcelDownload(AttendanceVO attendanceVO) throws Exception {
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("출석 정보");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<AttendanceVO> list = new  ArrayList<AttendanceVO>();
		list = attendanceDAO.attendanceExcelDownload(attendanceVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","회원번호","회원명","상품명","출석일","연락처","성별"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			AttendanceVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getMyMembership());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getProductName());
			
			cell = row.createCell(4);
			Date date = vo.getAttendanceDate();
			Timestamp ts = new Timestamp(date.getTime());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			cell.setCellValue(formatter.format(ts));
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(6);
			if(vo.getSex().equals("M")) {
				cell.setCellValue("남");
			} else if(vo.getSex().equals("W")) {
				cell.setCellValue("여");
			} else {
				cell.setCellValue("");
			}
		}
		
		return sxssfWorkbook;
	}

	
	
	
}
