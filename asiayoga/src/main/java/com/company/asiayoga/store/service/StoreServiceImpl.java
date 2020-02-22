package com.company.asiayoga.store.service;

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

import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.store.dao.StoreDAO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Inject
	private StoreDAO storeDAO;
	
	@Override
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception {
		return storeDAO.storeList(storeVO);
	}
	
	@Override
	public int storeTotalCount(StoreVO storeVO) throws Exception {
		return storeDAO.storeTotalCount(storeVO);
	}
	
	@Override
	public StoreVO storeDetail(StoreVO storeVO) throws Exception {
		
	    
	    storeVO = storeDAO.storeDetail(storeVO); 
	    
	    String[] arrTel = storeVO.getStoreTel().split("-");
	    String tel1 = arrTel[0];
	    String tel2 = arrTel[1];
	    String tel3 = arrTel[2];
	    
	    storeVO.setStoreTel1(tel1);
	    storeVO.setStoreTel2(tel2);
	    storeVO.setStoreTel3(tel3);
	    
	    String[] arrPhone = storeVO.getStorePhone().split("-");
	    String phone1 = arrPhone[0];
	    String phone2 = arrPhone[1];
	    String phone3 = arrPhone[2];
	    
	    storeVO.setStorePhone1(phone1);
	    storeVO.setStorePhone2(phone2);
	    storeVO.setStorePhone3(phone3);
		
		return storeVO;
	}
	
	@Override
	public int insertStore(StoreVO storeVO) throws Exception {
		return storeDAO.insertStore(storeVO);
	}
	
	@Override
	public int storeDelete(StoreVO storeVO) throws Exception {
		return storeDAO.storeDelete(storeVO);
	}

	@Override
	public int updateStore(StoreVO storeVO) throws Exception {
		return storeDAO.updateStore(storeVO);
	}

	@Override
	public SXSSFWorkbook storeExcelDownload(StoreVO storeVO) throws Exception {
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("매장 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<StoreVO> list = new  ArrayList<StoreVO>();
		list = storeDAO.storeExcelDownload(storeVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","매장번호","매장명","매장 전화번호","매장 전화번호(휴대폰)","매장주소"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			StoreVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreSeq());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getStoreTel());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getStorePhone());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getStoreAddress());
		}
		
		return sxssfWorkbook;
	}




	

}
