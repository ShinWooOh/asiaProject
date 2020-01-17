package com.company.asiayoga.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		return orderDAO.orderList(orderVO);
	}
	
	@Override
	public List<OrderVO> customerOrderList(OrderVO orderVO) throws Exception {
		return orderDAO.customerOrderList(orderVO);
	}

	@Override
	public OrderVO customerOrder(OrderVO orderVO) throws Exception {
		return orderDAO.customerOrder(orderVO);
	}

	@Override
	public int orderDel(OrderVO orderVO) throws Exception {
		return orderDAO.orderDel(orderVO);
	}
	
	
}
