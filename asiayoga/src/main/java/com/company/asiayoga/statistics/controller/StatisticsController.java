package com.company.asiayoga.statistics.controller;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.statistics.domain.StatisticsVO;
import com.company.asiayoga.statistics.service.StatisticsService;

@Controller
@RequestMapping("statistics")
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Inject
	private StatisticsService statisticsService;
	
	private String menuFirstRoot = "statistics";
	
	
	// 대시보드
	@RequestMapping(value = "statisticsList")
	public String statisticsList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		// 회원 통계
		StatisticsVO statisticsMemberVO = new StatisticsVO();
		statisticsMemberVO.setStoreSeq(manageVO.getStoreSeq());
		statisticsMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		hashMap = statisticsService.memberStatistics(statisticsMemberVO);
		statisticsMemberVO = (StatisticsVO) hashMap.get("statisticsVO");
		model.addAttribute("statisticsMemberVO",statisticsMemberVO );
		
		// 매출 통계
		StatisticsVO saleInfoVO = new StatisticsVO();
		saleInfoVO = (StatisticsVO) hashMap.get("saleInfoVO");
		model.addAttribute("saleInfoVO",saleInfoVO );
        
		// 출석 목록 갯수
		int paramTotalYesCount = 0;
		paramTotalYesCount = statisticsMemberVO.getAttendanceYesCount();
		StatisticsVO attendanceYesVO = new StatisticsVO();
		attendanceYesVO.setStoreSeq(statisticsMemberVO.getStoreSeq());
		attendanceYesVO.setTotalCount(paramTotalYesCount);
		attendanceYesVO.setTotalPage(this.totalPage(paramTotalYesCount, attendanceYesVO));
		attendanceYesVO.setEndPage(this.endPage(attendanceYesVO));
		
		// 미출석 목록 갯수
		int paramTotalNoCount = 0;
		paramTotalNoCount = statisticsMemberVO.getAttendanceNoCount();
		StatisticsVO attendanceNoVO = new StatisticsVO();
		attendanceNoVO.setStoreSeq(statisticsMemberVO.getStoreSeq());
		attendanceNoVO.setTotalCount(paramTotalNoCount);
		attendanceNoVO.setTotalPage(this.totalPage(paramTotalNoCount, attendanceNoVO));
		attendanceNoVO.setEndPage(this.endPage(attendanceNoVO));
		
		model.addAttribute("attendanceYesVO", attendanceYesVO);
		model.addAttribute("attendanceNoVO", attendanceNoVO);
		
		model.addAttribute("attendanceYesList", hashMap.get("attendanceYesList"));
		model.addAttribute("attendanceNoList", hashMap.get("attendanceNoList"));
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/statistics/statisticsList";
		
	}
	
	// 출석 팝업에서의 검색 조건
	@RequestMapping(value = "searchAttendanceYesList")
	@ResponseBody
	public HashMap<String, Object> searchAttendanceYesList(HttpServletRequest request,Model model,StatisticsVO attendanceYesVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		attendanceYesVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		attendanceYesVO.setParamPage((attendanceYesVO.getTotalRow()*attendanceYesVO.getPageNum())-attendanceYesVO.getTotalRow());
		attendanceYesVO.setStoreSeq(manageVO.getStoreSeq());
		List<StatisticsVO> attendanceYesList = statisticsService.attendanceYesList(attendanceYesVO);
		
		// 출석 목록 갯수
		int paramTotalYesCount = 0;
		paramTotalYesCount = statisticsService.attendanceYesCount(attendanceYesVO);
		
		if(attendanceYesList.size() == 0) {
			attendanceYesVO.setParamPage(0);
			attendanceYesVO.setPageNum(1);
			attendanceYesVO.setPageRow(0);
	
			if(paramTotalYesCount != 0) {
				attendanceYesVO.setStartPage(1);
				attendanceYesVO.setTotalPage(this.totalPage(paramTotalYesCount, attendanceYesVO));
				attendanceYesVO.setEndPage(this.endPage(attendanceYesVO));
				attendanceYesList = statisticsService.attendanceYesList(attendanceYesVO);
				hashMap.put("result", "success");
				hashMap.put("attendanceYesList", attendanceYesList);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(attendanceYesList.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (attendanceYesVO.getPageRow()*5)+1;
			
			attendanceYesVO.setTotalCount(paramTotalYesCount);
			attendanceYesVO.setTotalPage(this.totalPage(paramTotalYesCount, attendanceYesVO));
			paramEndPage = this.endPage(attendanceYesVO);
			attendanceYesVO.setStartPage(paramStartPage);
			attendanceYesVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("attendanceYesList", attendanceYesList);
		} else {
			attendanceYesVO.setParamPage(0);
			attendanceYesVO.setPageNum(1);
			attendanceYesVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("attendanceYesVO", attendanceYesVO);
		
		return hashMap;
		
	}
	
	// 미출석 팝업에서의 검색 조건
	@RequestMapping(value = "searchAttendanceNoList")
	@ResponseBody
	public HashMap<String, Object> searchAttendanceNoList(HttpServletRequest request,Model model,StatisticsVO attendanceNoVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		attendanceNoVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		attendanceNoVO.setParamPage((attendanceNoVO.getTotalRow()*attendanceNoVO.getPageNum())-attendanceNoVO.getTotalRow());
		attendanceNoVO.setStoreSeq(manageVO.getStoreSeq());
		List<StatisticsVO> attendanceNoList = statisticsService.attendanceNoList(attendanceNoVO);
		
		// 출석 목록 갯수
		int paramTotalNoCount = 0;
		paramTotalNoCount = statisticsService.attendanceNoCount(attendanceNoVO);
		
		if(attendanceNoList.size() == 0) {
			attendanceNoVO.setParamPage(0);
			attendanceNoVO.setPageNum(1);
			attendanceNoVO.setPageRow(0);
			
			if(paramTotalNoCount != 0) {
				attendanceNoVO.setStartPage(1);
				attendanceNoVO.setTotalPage(this.totalPage(paramTotalNoCount, attendanceNoVO));
				attendanceNoVO.setEndPage(this.endPage(attendanceNoVO));
				attendanceNoList = statisticsService.attendanceNoList(attendanceNoVO);
				hashMap.put("result", "success");
				hashMap.put("attendanceNoList", attendanceNoList);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(attendanceNoList.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (attendanceNoVO.getPageRow()*5)+1;
			
			attendanceNoVO.setTotalCount(paramTotalNoCount);
			attendanceNoVO.setTotalPage(this.totalPage(paramTotalNoCount, attendanceNoVO));
			paramEndPage = this.endPage(attendanceNoVO);
			attendanceNoVO.setStartPage(paramStartPage);
			attendanceNoVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("attendanceNoList", attendanceNoList);
		} else {
			attendanceNoVO.setParamPage(0);
			attendanceNoVO.setPageNum(1);
			attendanceNoVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("attendanceNoVO", attendanceNoVO);
		
		return hashMap;
		
	}
	
	
	// 금일 출석자 엑셀 다운로드
	@RequestMapping(value = "todayAttendanceYesExcelDown")
	public void todayAttendanceYesExcelDown(HttpServletRequest request, HttpServletResponse reponse, StatisticsVO statisticsVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		statisticsVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			
			SXSSFWorkbook sxssfWorkbook = statisticsService.statisticsYesExcelDown(statisticsVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=attendance_member.xlsx");
			reponse.setContentType("application/vnd.ms-excel");
			out = new BufferedOutputStream(reponse.getOutputStream());
			
			sxssfWorkbook.write(out);
			out.flush();
			
		} catch (Exception e) {
			logger.error("exception during downloading excel file : {}", e);
		} finally {
			if(out != null) { out.close(); }
		}
	}
	
	// 금일 미출석자 엑셀 다운로드
	@RequestMapping(value = "todayAttendanceNoExcelDown")
	public void todayAttendanceNoExcelDown(HttpServletRequest request, HttpServletResponse reponse, StatisticsVO statisticsVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		statisticsVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			
			SXSSFWorkbook sxssfWorkbook = statisticsService.statisticsNoExcelDown(statisticsVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=no_attendance_member.xlsx");
			reponse.setContentType("application/vnd.ms-excel");
			out = new BufferedOutputStream(reponse.getOutputStream());
			
			sxssfWorkbook.write(out);
			out.flush();
			
		} catch (Exception e) {
			logger.error("exception during downloading excel file : {}", e);
		} finally {
			if(out != null) { out.close(); }
		}
	}
	
	
	// 마지막 페이지 점검 
	public int endPage(StatisticsVO statisticsVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = statisticsVO.getPageRow()*5+5;
		paramTotalPage = statisticsVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,StatisticsVO statisticsVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%statisticsVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/statisticsVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/statisticsVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
	
	// 권한 체크
	public String checkAuthority(String myAuthority) {
		String resultParam = "";
		
		if(myAuthority.equals("ROLE_ADMIN")) {
			resultParam = myAuthority;
		}

		return resultParam;
	}
}
