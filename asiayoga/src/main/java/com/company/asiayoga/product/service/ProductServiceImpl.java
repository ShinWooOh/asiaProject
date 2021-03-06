package com.company.asiayoga.product.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.product.dao.ProductDAO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productList(ProductVO productVO) throws Exception {
		return productDAO.productList(productVO);
	}

	@Override
	public int productTotalCount(ProductVO productVO) throws Exception {
		return productDAO.productTotalCount(productVO);
	}
	
	@Transactional
	@Override
	public int insertProduct(ProductVO productVO) throws Exception {
		return productDAO.insertProduct(productVO);
	}

	@Transactional
	@Override
	public int productDelete(ProductVO productVO) throws Exception {
		return productDAO.productDelete(productVO);
	}

	@Override
	public ProductVO productDetail(ProductVO productVO) throws Exception {
		return productDAO.productDetail(productVO);
	}

	@Transactional
	@Override
	public int updateProduct(ProductVO productVO) throws Exception {
		return productDAO.updateProduct(productVO);
	}

	@Override
	public SXSSFWorkbook productExcelDownload(ProductVO productVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("상품 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<ProductVO> list = new  ArrayList<ProductVO>();
		list = productDAO.productExcelDown(productVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","매장명","상품명","상품가격","상품기간"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			ProductVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getProductName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getProductPrice());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getProductPeriod()+"일");
			
		}
		
		return sxssfWorkbook;
	}

	@Override
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception {
		return productDAO.storeSearchList(storeVO);
	}

	@Override
	public List<ItemVO> searchItemList(ItemVO itemVO) throws Exception {
		return productDAO.searchItemList(itemVO);
	}
	
	

}
