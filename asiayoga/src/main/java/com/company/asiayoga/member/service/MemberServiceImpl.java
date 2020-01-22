package com.company.asiayoga.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.member.dao.MemberDAO;
import com.company.asiayoga.member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public List<MemberVO> memberList(int storeSeq) throws Exception {
		return memberDAO.memberList(storeSeq);
	}

	@Override
	public MemberVO memberDetail(MemberVO memberVO) throws Exception {
		return memberDAO.memberDetail(memberVO);
	}

	@Override
	public int memberInsert(MemberVO memberVO) throws Exception {
		return memberDAO.memberInsert(memberVO);
	}

	@Override
	public int memberDel(MemberVO memberVO) throws Exception {
		return memberDAO.memberDel(memberVO);
	}

	@Override
	public int memberEdit(MemberVO memberVO) throws Exception {
		return memberDAO.memberEdit(memberVO);
	}

	@Override
	public List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception {
		return memberDAO.searchMemberList(memberVO);
	}
	

}
