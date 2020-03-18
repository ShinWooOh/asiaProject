package com.company.asiayoga.product.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface ProductService {
	
	// 상품 목록
	List<ProductVO> productList(ProductVO productVO)throws Exception;
	
	// 상품 목록 갯수
	int productTotalCount(ProductVO productVO) throws Exception;
	
	// 상품 등록
	int insertProduct(ProductVO productVO) throws Exception;
	
	// 상품 삭제
	int productDelete(ProductVO productVO) throws Exception;
	
	// 상품 상세
	ProductVO productDetail(ProductVO productVO)throws Exception;
	
	// 상품 업데이트
	int updateProduct(ProductVO productVO) throws Exception;
	
	// 상품 목록 엑셀 다운로드
	SXSSFWorkbook productExcelDownload(ProductVO productVO) throws Exception;
	
	// 매장 목록(관리자 전용)
	List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// 품목 찾기(관리자 전용, 매장 선택 후 로직)
	List<ItemVO> searchItemList(ItemVO itemVO) throws Exception;
}
