package com.company.asiayoga.statistics.service;

import java.util.HashMap;
import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.statistics.domain.StatisticsVO;

public interface StatisticsService {
	
	// ȸ�� ���
	HashMap<String, Object> memberStatistics(StatisticsVO statisticsVO) throws Exception;
	
	// ���� �⼮ �ο�
	int attendanceYesCount(StatisticsVO statisticsVO) throws Exception;
	
	// ���� �⼮ ���
	List<StatisticsVO> attendanceYesList(StatisticsVO statisticsVO) throws Exception; 

	// ����  ���⼮ �ο�
	int attendanceNoCount(StatisticsVO statisticsVO) throws Exception;
	
	// ���� �⼮ ���
	List<StatisticsVO> attendanceNoList(StatisticsVO statisticsVO) throws Exception; 
	
	
	// �⼮ �⼮ ���� �ٿ�ε�
	SXSSFWorkbook statisticsYesExcelDown(StatisticsVO statisticsVO) throws Exception;
	
	// �⼮ ���⼮ ���� �ٿ�ε�
	SXSSFWorkbook statisticsNoExcelDown(StatisticsVO statisticsVO) throws Exception;

}
