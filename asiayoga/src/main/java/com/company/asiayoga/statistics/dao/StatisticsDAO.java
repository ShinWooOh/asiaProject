package com.company.asiayoga.statistics.dao;

import java.util.List;

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
	
	// ���� �⼮ �ο� ��
	public int attendanceYesCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceYesCount", statisticsVO);
	}
	
	// ���� ���⼮ �ο� ��
	public int attendanceNoCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceNoCount", statisticsVO);
	}
	
	// ���� �⼮ �ο�(List)
	public List<StatisticsVO> attendanceYesList(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceYesList", statisticsVO);
	}
	
	// ���� ���⼮ �ο�(List)
	public List<StatisticsVO> attendanceNoList(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceNoList", statisticsVO);
	}
	
	// ���� �ٿ�ε带 ���� ���� �⼮ �ο�(List)
	public List<StatisticsVO> attendanceYesExcel(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceYesExcel", statisticsVO);
	}
	
	// ���� �ٿ�ε带 ���� ���� ���⼮ �ο�(List)
	public List<StatisticsVO> attendanceNoExcel(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceNoExcel", statisticsVO);
	}
	
	// ���� �⼮ �ο�
	public int newWeekAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newWeekAttendanceCount", statisticsVO);
	}
	
	// �̹��� �⼮ �ο�
	public int newMonthAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newMonthAttendanceCount", statisticsVO);
	}
	
	// ���� �⼮ �ο�
	public int newYearAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newYearAttendanceCount", statisticsVO);
	}
	
	// ���� ����
	public StatisticsVO salesInfo(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".salesInfo",statisticsVO);
	}
	
}
