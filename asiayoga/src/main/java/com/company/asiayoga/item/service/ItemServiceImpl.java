package com.company.asiayoga.item.service;

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

import com.company.asiayoga.item.dao.ItemDAO;
import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.member.domain.MemberVO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ItemDAO itemDAO;
	
	@Override
	public List<ItemVO> itemList(ItemVO itemVO) throws Exception {
		return itemDAO.itemList(itemVO);
	}

	@Override
	public int itemTotalCount(ItemVO itemVO) throws Exception {
		return itemDAO.itemTotalCount(itemVO);
	}
	
	@Override
	public int insertItem(ItemVO itemVO) throws Exception {
		return itemDAO.insertItem(itemVO);
	}

	@Override
	public int itemDelete(ItemVO itemVO) throws Exception {
		return itemDAO.itemDelete(itemVO);
	}

	@Override
	public ItemVO itemDetail(ItemVO itemVO) throws Exception {
		return itemDAO.itemDetail(itemVO);
	}

	@Override
	public int updateItem(ItemVO itemVO) throws Exception {
		return itemDAO.updateItem(itemVO);
	}

	@Override
	public SXSSFWorkbook itemExcelDownload(ItemVO itemVO) throws Exception {
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("품목 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<ItemVO> list = new  ArrayList<ItemVO>();
		list = itemDAO.itemExcelDownload(itemVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","등록매장","품목번호","품목구분","품목명"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			ItemVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getItemSeq());
			
			cell = row.createCell(3);
			if(vo.getLargeCategory().equals("001")) {
				cell.setCellValue("일반상품");
			} else if(vo.getLargeCategory().equals("002")) {
				cell.setCellValue("락카");
			} else if(vo.getLargeCategory().equals("003")) {
				cell.setCellValue("운동복");
			} else {
				cell.setCellValue("");
			}
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getItemName());
		}
		
		return sxssfWorkbook;
	}

	
	

}
