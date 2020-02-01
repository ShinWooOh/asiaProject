package com.company.asiayoga.adjournment.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.stereotype.Service;

import com.company.asiayoga.adjournment.dao.AdjournmentDAO;
import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;

@Service
public class AdjournmentServiceImpl implements AdjournmentService{

	@Inject
	private AdjournmentDAO adjournmentDAO;
	
	@Override
	public List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentList(adjournmentVO);
	}
	
	@Override
	public int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.insertAdjournment(adjournmentVO);
	}
	
	@Override
	public int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception {
		
		if(adjournmentVO.getAdjournmentState().equals("Y")) {
			adjournmentVO.setAdjournmentState("N");
		}else if(adjournmentVO.getAdjournmentState().equals("N")) {
			adjournmentVO.setAdjournmentState("Y");
		}
		
		return adjournmentDAO.updateAdjournmentState(adjournmentVO);
	}
	
	@Override
	public AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentDetail(adjournmentVO);
	}
	
	@Override
	public int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.updateAdjournment(adjournmentVO);
	}
	
	@Override
	public List<MemberVO> memberSearch(MemberVO memberVO) throws Exception {
		return adjournmentDAO.memberSearch(memberVO);
	}




}
