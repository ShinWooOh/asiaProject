package com.company.asiayoga.order.service;

import java.util.List;

import com.company.asiayoga.order.domain.OrderVO;

public interface OrderService {
	
	// �� 1�� ���� �ֹ� ���
	List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception;
	
	// �� 1�� ���� �ֹ�1���� ����
	OrderVO customerOrder(OrderVO orderVO) throws Exception;

}
