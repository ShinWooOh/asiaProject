package com.company.asiayoga.order.service;

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
import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		return orderDAO.orderList(orderVO);
	}
	
	@Override
	public int orderTotalCount(OrderVO orderVO) throws Exception {
		return orderDAO.orderTotalCount(orderVO);
	}
	
	@Override
	public List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception {
		return orderDAO.customerOrderList(orderVO);
	}

	@Override
	public OrderVO customerOrder(OrderVO orderVO) throws Exception {
		
		OrderVO vo = new OrderVO();
		vo = orderDAO.customerOrder(orderVO);
	    
	    String[] arrPhone = vo.getPhone().split("-");
	    String phone1 = arrPhone[0];
	    String phone2 = arrPhone[1];
	    String phone3 = arrPhone[2];
	    
	    vo.setPhone1(phone1);
	    vo.setPhone2(phone2);
	    vo.setPhone3(phone3);
	    
		return vo;
	}

	@Override
	public int orderDelete(OrderVO orderVO) throws Exception {
		return orderDAO.orderDelete(orderVO);
	}

	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		return orderDAO.insertOrder(orderVO);
	}

	@Override
	public int updateOrder(OrderVO orderVO) throws Exception {
		return orderDAO.updateOrder(orderVO);
	}

	
	@Override
	public SXSSFWorkbook orderExcelDown(OrderVO orderVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("구매 내역");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<OrderVO> list = new  ArrayList<OrderVO>();
		list = orderDAO.orderExcelDown(orderVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","매장","품목구분","상품","이름","연락처","시작일","만료일","만료여부"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			OrderVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getItemName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getProductName());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(6);
			Date startDate = vo.getStartDay();
			Timestamp startTs = new Timestamp(startDate.getTime());
			SimpleDateFormat startFormatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(startFormatter.format(startTs));
			
			cell = row.createCell(7);
			Date expirationDate = vo.getExpirationDay();
			Timestamp expirationTs = new Timestamp(expirationDate.getTime());
			SimpleDateFormat expirationDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(expirationDateFormatter.format(expirationTs));
			
			cell = row.createCell(8);
			cell.setCellValue(vo.getExpirationYn());

		}
		
		return sxssfWorkbook;
	}

	@Override
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception {
		return orderDAO.storeSearchList(storeVO);
	}

	@Override
	public List<ProductVO> searchProductList(ProductVO productVO) throws Exception {
		return orderDAO.searchProductList(productVO);
	}

	
	
	
	
}
