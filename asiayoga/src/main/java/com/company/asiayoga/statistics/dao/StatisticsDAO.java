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
	
	
	// 회원 통계
	public StatisticsVO memberStatistics(StatisticsVO statisticsVO)throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".memberStatistics", statisticsVO);
	}
	
	// 당일 출석 인원 수
	public int attendanceYesCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceYesCount", statisticsVO);
	}
	
	// 당일 미출석 인원 수
	public int attendanceNoCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".attendanceNoCount", statisticsVO);
	}
	
	// 당일 출석 인원(List)
	public List<StatisticsVO> attendanceYesList(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceYesList", statisticsVO);
	}
	
	// 당일 미출석 인원(List)
	public List<StatisticsVO> attendanceNoList(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceNoList", statisticsVO);
	}
	
	// 엑셀 다운로드를 위한 당일 출석 인원(List)
	public List<StatisticsVO> attendanceYesExcel(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceYesExcel", statisticsVO);
	}
	
	// 엑셀 다운로드를 위한 당일 미출석 인원(List)
	public List<StatisticsVO> attendanceNoExcel(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectList(STATISTICS_NAMESPACE+".attendanceNoExcel", statisticsVO);
	}
	
	// 금주 출석 인원
	public int newWeekAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newWeekAttendanceCount", statisticsVO);
	}
	
	// 이번달 출석 인원
	public int newMonthAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newMonthAttendanceCount", statisticsVO);
	}
	
	// 올해 출석 인원
	public int newYearAttendanceCount(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".newYearAttendanceCount", statisticsVO);
	}
	
	// 매출 정보
	public StatisticsVO salesInfo(StatisticsVO statisticsVO) throws Exception{
		return sqlSession.selectOne(STATISTICS_NAMESPACE+".salesInfo",statisticsVO);
	}
	
}
