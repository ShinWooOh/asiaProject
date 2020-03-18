package com.company.asiayoga.order.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface OrderService {
	
	// 구매 목록
	List<OrderVO> orderList(OrderVO orderVO) throws Exception;
	
	// 구매 목록 갯수
	int orderTotalCount(OrderVO orderVO) throws Exception;
	
	// 고객 1명에 대한 구매 목록
	List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception;
	
	// 고객 1명에 대한 구매1개의 내용
	OrderVO customerOrder(OrderVO orderVO) throws Exception;
	
	// 구매 내역 삭제
	int orderDelete(OrderVO orderVO) throws Exception;
	
	// 구매 내역 등록
	int insertOrder(OrderVO orderVO) throws Exception;
	
	// 구매 내역 업데이트
	int updateOrder(OrderVO orderVO) throws Exception;

	// 주문 목록 엑셀 다운로드
	SXSSFWorkbook orderExcelDown(OrderVO orderVO) throws Exception;
	
	// 구매 등록 화면 > 매장 검색 팝업에서 검색(관리자 전용)
	List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// 매장 검색 팝업에서 선택 후 상품 목록(관리자 전용)
	List<ProductVO> searchProductList(ProductVO productVO) throws Exception;
}
