package com.company.asiayoga.statistics.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.statistics.dao.StatisticsDAO;
import com.company.asiayoga.statistics.domain.StatisticsVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	
	@Inject
	private StatisticsDAO statisticsDAO;

	@Override
	public HashMap<String, Object> memberStatistics(StatisticsVO statisticsVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		int paramStoreSeq = 0;
		String paramAuthority = "";
		paramStoreSeq = statisticsVO.getStoreSeq();
		paramAuthority = statisticsVO.getAuthority();
		
		
		// 회원 통계
		statisticsVO = statisticsDAO.memberStatistics(statisticsVO);
		
		// 금일 출석자 수
		int attendanceYesCount = 0;
		attendanceYesCount = statisticsDAO.attendanceYesCount(statisticsVO);
		
		// 금일 미출석자 수
		int attendanceNoCount = 0;
		attendanceNoCount = statisticsDAO.attendanceNoCount(statisticsVO);
		
		statisticsVO.setAttendanceYesCount(attendanceYesCount);
		statisticsVO.setAttendanceNoCount(attendanceNoCount);
		
		// 금일 출석자 목록
		List<StatisticsVO> attendanceYesList = new ArrayList<StatisticsVO>();
		attendanceYesList = statisticsDAO.attendanceYesList(statisticsVO);
		
		// 금일 미출석자 목록
		List<StatisticsVO> attendanceNoList = new ArrayList<StatisticsVO>();
		attendanceNoList = statisticsDAO.attendanceNoList(statisticsVO); 
		
		
		// 매출정보
		StatisticsVO saleInfoVO = new StatisticsVO();
		saleInfoVO.setStoreSeq(paramStoreSeq);
		saleInfoVO.setAuthority(paramAuthority);
		saleInfoVO = statisticsDAO.salesInfo(saleInfoVO);
		
		hashMap.put("saleInfoVO", saleInfoVO);
		hashMap.put("statisticsVO", statisticsVO);
		hashMap.put("attendanceYesList", attendanceYesList);
		hashMap.put("attendanceNoList", attendanceNoList);
		
		return hashMap;
	}

	@Override
	public int attendanceYesCount(StatisticsVO statisticsVO) throws Exception {
		return statisticsDAO.attendanceYesCount(statisticsVO);
	}

	@Override
	public List<StatisticsVO> attendanceYesList(StatisticsVO statisticsVO) throws Exception {
		return statisticsDAO.attendanceYesList(statisticsVO);
	}
	
	@Override
	public int attendanceNoCount(StatisticsVO statisticsVO) throws Exception {
		return statisticsDAO.attendanceNoCount(statisticsVO);
	}

	@Override
	public List<StatisticsVO> attendanceNoList(StatisticsVO statisticsVO) throws Exception {
		return statisticsDAO.attendanceNoList(statisticsVO);
	}

	@Override
	public SXSSFWorkbook statisticsYesExcelDown(StatisticsVO statisticsVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("금일 출석 인원");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<StatisticsVO> list = new  ArrayList<StatisticsVO>();
		list = statisticsDAO.attendanceYesExcel(statisticsVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","매장","회원번호","이름","성별","연락처","출석 시간"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			StatisticsVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getMyMembership());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(4);
			if(vo.getSex().equals("M")){
				cell.setCellValue("남");
			} else if(vo.getSex().equals("W")) {
				cell.setCellValue("여");
			} else {
				cell.setCellValue("");
			}
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(6);
			Date attendanceDate = vo.getAttendanceDate();
			Timestamp attendanceTs = new Timestamp(attendanceDate.getTime());
			SimpleDateFormat attendanceFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			cell.setCellValue(attendanceFormatter.format(attendanceTs));

		}
		
		return sxssfWorkbook;
	}
	
	@Override
	public SXSSFWorkbook statisticsNoExcelDown(StatisticsVO statisticsVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("금일 미출석 인원");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<StatisticsVO> list = new  ArrayList<StatisticsVO>();
		list = statisticsDAO.attendanceNoExcel(statisticsVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","매장","회원번호","이름","성별","연락처"};
		
		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			StatisticsVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getMyMembership());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(4);
			if(vo.getSex().equals("M")){
				cell.setCellValue("남");
			} else if(vo.getSex().equals("W")) {
				cell.setCellValue("여");
			} else {
				cell.setCellValue("");
			}
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPhone());
			
		}
		
		return sxssfWorkbook;
	}

	
	
	
	
}
