package com.company.asiayoga.statistics.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.statistics.domain.StatisticsVO;

@Repository
public class StatisticsDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String STATISTICS_NAMESPACE = "com.company.asiayoga.mapper.statisticsMapper";
	
	
	// 회원 통계
	public StatisticsVO memberStatistics(StatisticsVO statisticsVO)throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".memberStatistics", statisticsVO);
	}
	
	// 당일 출석 인원
	public int attendanceYesCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceYesCount", statisticsVO);
	}
	
	// 당일 미출석 인원
	public int attendanceNoCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceNoCount", statisticsVO);
	}
	
}
