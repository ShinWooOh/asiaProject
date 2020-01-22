package com.company.asiayoga.order.service;

import java.util.List;

import com.company.asiayoga.order.domain.OrderVO;

public interface OrderService {
	
	// 구매 목록
	List<OrderVO> orderList(OrderVO orderVO) throws Exception;
	
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

}
