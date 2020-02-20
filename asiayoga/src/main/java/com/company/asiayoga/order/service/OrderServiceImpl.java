package com.company.asiayoga.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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

	
	
	
	
}
