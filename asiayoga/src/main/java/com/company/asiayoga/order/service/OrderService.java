package com.company.asiayoga.order.service;

import java.util.List;

import com.company.asiayoga.order.domain.OrderVO;

public interface OrderService {
	
	// 고객 1명에 대한 주문 목록
	List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception;
	
	// 고객 1명에 대한 주문1개의 내용
	OrderVO customerOrder(OrderVO orderVO) throws Exception;

}
