package com.company.asiayoga.mobile.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.mobile.member.dao.MobileMemberDAO;
import com.company.asiayoga.mobile.member.domain.MobileMemberVO;

@Service
public class MobileMemberServiceImpl implements MobileMemberService {
	

	@Inject
	private MobileMemberDAO mobileMemberDAO;

	// �׽�Ʈ  ���߿� return ���� MobileMeberVO �� �����ؾ���
	@Override
	public String mobileMeberInfo(MobileMemberVO mobileMeberVO) throws Exception {
		
		MobileMemberVO vo;
		vo = mobileMemberDAO.mobileMeberInfo(mobileMeberVO);
		
		String result = "fall";
		if(vo != null) {
			result = "Success, Success!";
		}
		return result;
	}
	
	
}
