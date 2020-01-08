package com.company.asiayoga.order.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.asiayoga.order.domain.OrderVO;

@Repository
public class OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String ORDER_NAMESPACE = "com.company.asiayoga.mapper.orderMapper";
	
	
	// 고객 1명에 대한 주문 목록
	public List<OrderVO> customerOrderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".customerOrderList", orderVO);
	}
	
	// 고객 1명에 대한 주문 1개에 대한 정보
	public OrderVO customerOrder(OrderVO orderVO){
		return sqlSession.selectOne(ORDER_NAMESPACE+".customerOrder", orderVO);
	}
	
	// 횟수제 상품의 경우 -1 차감
	public int updateOrderCount(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".updateOrderCount", orderVO);
	}
}
