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
	
	
	// 구매 목록
	public List<OrderVO> orderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".orderList", orderVO);
	}
	
	// 고객 1명에 대한 구매 목록
	public List<OrderVO> customerOrderList(OrderVO orderVO){
		return sqlSession.selectList(ORDER_NAMESPACE+".customerOrderList", orderVO);
	}
	
	// 고객 1명에 대한 구매 1개에 구매 정보
	public OrderVO customerOrder(OrderVO orderVO){
		return sqlSession.selectOne(ORDER_NAMESPACE+".customerOrder", orderVO);
	}
	
	// 횟수제 상품의 경우 -1 차감
	public int updateOrderCount(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".updateOrderCount", orderVO);
	}
	
	// 구매 내역 삭제
	public int orderDelete(OrderVO orderVO){
		return sqlSession.update(ORDER_NAMESPACE+".orderDelete", orderVO);
	}
	
	// 구매 내역 등록
	public int insertOrder(OrderVO orderVO){
		return sqlSession.insert(ORDER_NAMESPACE+".insertOrder", orderVO);
	}
	
	// 구매 내역 업데이트
	public int updateOrder(OrderVO orderVO) {
		return sqlSession.update(ORDER_NAMESPACE+".updateOrder",orderVO);
	}
	
	// 휴회 상태 업데이트
	public int updateAdjournmentState(OrderVO orderVO) {
		return sqlSession.update(ORDER_NAMESPACE+".updateAdjournmentState",orderVO);
	}
	
	
}
