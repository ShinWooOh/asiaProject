package com.company.asiayoga.adjournment.service;

import java.util.List;

import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.domain.MemberVO;

public interface AdjournmentService {

	// 휴회 회원 목록
	List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception; 
	
	// 휴회 회원 등록
	int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// 휴회 상태 업데이트
	int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception;
	
	// 휴회 상세 내용
	AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception;
	
	// 휴회 정보 업데이트
	int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception;
	
	// 회원 정보 검색(List 로 리턴)
	List<MemberVO> memberSearch(MemberVO memberVO)throws Exception;
	
}
