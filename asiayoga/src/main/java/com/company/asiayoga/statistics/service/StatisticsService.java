package com.company.asiayoga.statistics.service;

import java.util.HashMap;
import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.statistics.domain.StatisticsVO;

public interface StatisticsService {
	
	// 회원 통계
	HashMap<String, Object> memberStatistics(StatisticsVO statisticsVO) throws Exception;
	
	// 금일 출석 인원
	int attendanceYesCount(StatisticsVO statisticsVO) throws Exception;
	
	// 금일 출석 목록
	List<StatisticsVO> attendanceYesList(StatisticsVO statisticsVO) throws Exception; 

	// 금일  미출석 인원
	int attendanceNoCount(StatisticsVO statisticsVO) throws Exception;
	
	// 금일 출석 목록
	List<StatisticsVO> attendanceNoList(StatisticsVO statisticsVO) throws Exception; 
	
	
	// 출석 출석 엑셀 다운로드
	SXSSFWorkbook statisticsYesExcelDown(StatisticsVO statisticsVO) throws Exception;
	
	// 출석 미출석 엑셀 다운로드
	SXSSFWorkbook statisticsNoExcelDown(StatisticsVO statisticsVO) throws Exception;

}
