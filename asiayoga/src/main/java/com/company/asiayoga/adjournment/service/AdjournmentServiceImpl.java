package com.company.asiayoga.adjournment.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.company.asiayoga.adjournment.dao.AdjournmentDAO;
import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;

@Service
public class AdjournmentServiceImpl implements AdjournmentService{

	@Inject
	private AdjournmentDAO adjournmentDAO;
	
	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentList(adjournmentVO);
	}
	
	@Override
	public int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.insertAdjournment(adjournmentVO);
	}
	
	@Transactional(rollbackFor =Exception.class)
	@Override
	public int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception {
		
		if(adjournmentVO.getAdjournmentState().equals("Y")) {
			adjournmentVO.setAdjournmentState("N");
		}else if(adjournmentVO.getAdjournmentState().equals("N")) {
			adjournmentVO.setAdjournmentState("Y");
		}
		
		// 상태 업데이트
		int paramResult = 0;
		paramResult = adjournmentDAO.updateAdjournmentState(adjournmentVO);
		
		if(paramResult > 0){
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(adjournmentVO.getOrderSeq());
			orderVO.setAdjournmentState(adjournmentVO.getAdjournmentState());
			orderVO.setModifyId(adjournmentVO.getModifyId());
			paramResult = orderDAO.updateAdjournmentState(orderVO);
		} else {
			paramResult = 0;
		}
		
		return paramResult;
	}
	
	@Override
	public AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentDetail(adjournmentVO);
	}
	
	@Transactional(rollbackFor =Exception.class)
	@Override
	public int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		
		int paramResult = 0;
		
		paramResult = adjournmentDAO.updateAdjournment(adjournmentVO);
		
		if(paramResult > 0){
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(adjournmentVO.getOrderSeq());
			orderVO.setAdjournmentState(adjournmentVO.getAdjournmentState());
			orderVO.setModifyId(adjournmentVO.getModifyId());
			paramResult = orderDAO.updateAdjournmentState(orderVO);
		} else {
			paramResult = 0;
		}
		return paramResult;
	}
	
	@Override
	public List<MemberVO> memberSearch(MemberVO memberVO) throws Exception {
		return adjournmentDAO.memberSearch(memberVO);
	}




}
