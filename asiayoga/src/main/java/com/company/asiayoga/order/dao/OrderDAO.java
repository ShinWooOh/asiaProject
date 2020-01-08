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
	
	
	// �� 1�� ���� �ֹ� ���
	public List<OrderVO> customerOrderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".customerOrderList", orderVO);
	}
	
	// �� 1�� ���� �ֹ� 1���� ���� ����
	public OrderVO customerOrder(OrderVO orderVO){
		return sqlSession.selectOne(ORDER_NAMESPACE+".customerOrder", orderVO);
	}
	
	// Ƚ���� ��ǰ�� ��� -1 ����
	public int updateOrderCount(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".updateOrderCount", orderVO);
	}
}
