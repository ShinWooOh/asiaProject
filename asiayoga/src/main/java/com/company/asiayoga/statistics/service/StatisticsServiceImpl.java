package com.company.asiayoga.statistics.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.statistics.dao.StatisticsDAO;
import com.company.asiayoga.statistics.domain.StatisticsVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	
	@Inject
	private StatisticsDAO statisticsDAO;

	@Override
	public StatisticsVO memberStatistics(StatisticsVO statisticsVO) throws Exception {
		
		// 회원 통계
		statisticsVO = statisticsDAO.memberStatistics(statisticsVO);
		
		
		// 금일 출석 체크 현황
		int attendanceYesCount = 0;
		attendanceYesCount = statisticsDAO.attendanceYesCount(statisticsVO);
		
		// 금일 미출석 체크 현황
		int attendanceNoCount = 0;
		attendanceNoCount = statisticsDAO.attendanceNoCount(statisticsVO);
		
		statisticsVO.setAttendanceYesCount(attendanceYesCount);
		statisticsVO.setAttendanceNoCount(attendanceNoCount);
		
		return statisticsVO;
	}

	
	
	
	
}
