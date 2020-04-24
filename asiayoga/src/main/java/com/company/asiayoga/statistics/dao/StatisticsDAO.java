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
	
	
	// ȸ�� ���
	public StatisticsVO memberStatistics(StatisticsVO statisticsVO)throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".memberStatistics", statisticsVO);
	}
	
	// ���� �⼮ �ο�
	public int attendanceYesCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceYesCount", statisticsVO);
	}
	
	// ���� ���⼮ �ο�
	public int attendanceNoCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceNoCount", statisticsVO);
	}
	
}
