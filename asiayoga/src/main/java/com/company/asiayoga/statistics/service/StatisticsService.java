package com.company.asiayoga.statistics.service;

import com.company.asiayoga.statistics.domain.StatisticsVO;

public interface StatisticsService {
	
	// 회원 통계
	StatisticsVO memberStatistics(StatisticsVO statisticsVO) throws Exception;

}
