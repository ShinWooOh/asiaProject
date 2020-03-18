package com.company.asiayoga.manage.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import com.company.asiayoga.manage.dao.ManageDAO;
import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
public class ManageServiceImpl implements ManageService {

	@Inject
	private ManageDAO manageDAO;

	@Override
	public ManageVO manageInfo(String id) throws Exception {
		return manageDAO.manageInfo(id);
	}

	@Override
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception {
		return manageDAO.manageList(manageVO);
	}

	@Override
	public int manageTotalCount(ManageVO manageVO) throws Exception {
		return manageDAO.manageTotalCount(manageVO);
	}
	
	@Override
	public int updateEnableState(ManageVO manageVO) throws Exception {
		return manageDAO.updateEnableState(manageVO);
	}

	@Override
	public int insertManage(ManageVO manageVO) throws Exception {
		return manageDAO.insertManage(manageVO);
	}
	
	@Override
	public ManageVO manageInfo(ManageVO manageVO) throws Exception {
		
		ManageVO vo = new ManageVO();
		vo = manageDAO.manageInfo(manageVO);
		
		String arrPhone[] = vo.getPhone().split("-");
	    String phone1 = arrPhone[0];
	    String phone2 = arrPhone[1];
	    String phone3 = arrPhone[2];
	    
	    vo.setPhone1(phone1);
	    vo.setPhone2(phone2);
	    vo.setPhone3(phone3);
		
		return vo;
	}
	
	@Override
	public int manageDupIdCheck(ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		
		List<ManageVO> list = manageDAO.manageDupIdCheck(manageVO); 
		
		if(list.size() > 0) {
			resultParam = 1;
		}
		
		return resultParam;
	}
	
	@Override
	public SXSSFWorkbook manageExcelDownload(ManageVO manageVO) throws Exception {
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("직원 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<ManageVO> list = new  ArrayList<ManageVO>();
		list = manageDAO.manageExcelDownload(manageVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","관리자명","권한","직급","최종접속일자","매장명"};
		
		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			ManageVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getAuthorityName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getGroupName());
			
			cell = row.createCell(4);
			Date date = vo.getAccessDate();
			if(date == null ) {
				cell.setCellValue("");
			} else {
				Timestamp ts = new Timestamp(date.getTime());
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				cell.setCellValue(formatter.format(ts));
			}
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getStoreName());
			
		}
		
		return sxssfWorkbook;
	}

	@Override
	public int updateManage(ManageVO manageVO) throws Exception {
		return manageDAO.updateManage(manageVO);
	}
	
	@Override
	public List<ManageGroupVO> searchGroupList(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.searchGroupList(manageGroupVO);
	}
	
	
	// 직원 그룹
	
	@Override
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupList(manageGroupVO);
	}
	
	@Override
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupTotalCount(manageGroupVO);
	}

	@Override
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.updateGroupUseYnState(manageGroupVO);
	}

	@Override
	public int manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		
		List<ManageGroupVO> list = manageDAO.manageGroupDupCheck(manageGroupVO); 
		
		if(list.size() > 0) {
			resultParam = 1;
		}
		
		return resultParam;
	}

	@Override
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.insertManageGroup(manageGroupVO);
	}

	@Override
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupDetail(manageGroupVO);
	}

	@Override
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.updateManageGroup(manageGroupVO);
	}

	@Override
	public SXSSFWorkbook manageGroupExcelDownload(ManageGroupVO manageGroupVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("직원 직급 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<ManageGroupVO> list = new  ArrayList<ManageGroupVO>();
		list = manageDAO.manageGroupExcelDownload(manageGroupVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","직급명","권한","매장"};
		
		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			ManageVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getGroupName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getAuthorityName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getStoreName());
			
		}
		
		return sxssfWorkbook;
	}

	@Override
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception {
		return manageDAO.storeSearchList(storeVO);
	}


	@Override
	public List<ManageGroupVO> manageGroupListAll(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupListAll(manageGroupVO);
	}




	
	
}

