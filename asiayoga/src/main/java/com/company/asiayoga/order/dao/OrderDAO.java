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
	
	
	// ���� ���
	public List<OrderVO> orderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".orderList", orderVO);
	}
	
	// �� 1�� ���� ���� ���
	public List<OrderVO> customerOrderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".customerOrderList", orderVO);
	}
	
	// �� 1�� ���� ���� 1���� ���� ����
	public OrderVO customerOrder(OrderVO orderVO){
		return sqlSession.selectOne(ORDER_NAMESPACE+".customerOrder", orderVO);
	}
	
	// Ƚ���� ��ǰ�� ��� -1 ����
	public int updateOrderCount(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".updateOrderCount", orderVO);
	}
	
	// ���� ���� ����
	public int orderDelete(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".orderDelete", orderVO);
	}
	
	// ���� ���� ���
	public int insertOrder(OrderVO orderVO){
		return sqlSession.insert(ORDER_NAMESPACE+".insertOrder", orderVO);
	}
	
	// ���� ���� ������Ʈ
	public int updateOrder(OrderVO orderVO) {
		return sqlSession.update(ORDER_NAMESPACE+".updateOrder",orderVO);
	}
	
	// ��ȸ ���� ������Ʈ
	public int updateAdjournmentState(OrderVO orderVO) {
		return sqlSession.update(ORDER_NAMESPACE+".updateAdjournmentState",orderVO);
	}
	
	
}
