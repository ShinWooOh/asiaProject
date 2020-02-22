package com.company.asiayoga.order.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.order.domain.OrderVO;

public interface OrderService {
	
	// ���� ���
	List<OrderVO> orderList(OrderVO orderVO) throws Exception;
	
	// ���� ��� ����
	int orderTotalCount(OrderVO orderVO) throws Exception;
	
	// �� 1�� ���� ���� ���
	List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception;
	
	// �� 1�� ���� ����1���� ����
	OrderVO customerOrder(OrderVO orderVO) throws Exception;
	
	// ���� ���� ����
	int orderDelete(OrderVO orderVO) throws Exception;
	
	// ���� ���� ���
	int insertOrder(OrderVO orderVO) throws Exception;
	
	// ���� ���� ������Ʈ
	int updateOrder(OrderVO orderVO) throws Exception;

	// �ֹ� ��� ���� �ٿ�ε�
	SXSSFWorkbook orderExcelDown(OrderVO orderVO) throws Exception;
}
