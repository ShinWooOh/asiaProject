package com.company.asiayoga.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	// ȸ�� ��� ȭ��
	@RequestMapping(value = "memberList")
	public String memberList(Model model) throws Exception{
		
		int storeSeq =10;												// �ӽ� �ο� �α��� �� ������� ���� ������ ���� �ڵ带 �޾ƿ;� �Ѵ�.
		List<MemberVO> list = memberService.memberList(storeSeq);
		
		model.addAttribute("memberList", list);
		
		return "/member/memberList";
	}
	
	// ȸ������ �� ȭ��
	@RequestMapping(value = "memberDetail")
	public String memberDetail(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		MemberVO vo = new MemberVO();
		vo = memberService.memberDetail(memberVO);
		
		model.addAttribute("memberDetail", vo);
		
		return "/member/memberDetail";
	}
	
	// ȸ�� ���� ��� ȭ��
	@RequestMapping(value = "memberJoin")
	public String memberJoin(Model model) throws Exception{
		
		int storeSeq =10;												// �ӽ� �ο� �α��� �� ������� ���� ������ ���� �ڵ带 �޾ƿ;� �Ѵ�.
		String storeName ="���̵�䰡 ��������";								// �ӽ� �ο� �α��� �� ������� ���� ������ ���� �̸��� �޾ƿ;� �Ѵ�.
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(storeSeq);
		memberVO.setStoreName(storeName);
		
		model.addAttribute("memberInfo", memberVO);
		return "/member/memberJoin";
	}
	
	// ȸ�� ���� ����
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	@ResponseBody
	public String memberInsert(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
		resultParam = memberService.memberInsert(memberVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// ȸ�� ���� ����
	@RequestMapping(value = "memberDel", method = RequestMethod.POST)
	@ResponseBody
	public String memberDel(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
		resultParam = memberService.memberDel(memberVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// ȸ�� ���� ���� ȭ������ �̵�
	@RequestMapping(value = "memberUpdate")
	public String memberUpdate(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		String[] arr = memberVO.getPhone().split("-");
		String phone1 = arr[0];
		String phone2 = arr[1];
		String phone3 = arr[2];
		
		memberVO.setPhone1(phone1);
		memberVO.setPhone2(phone2);
		memberVO.setPhone3(phone3);
		
		String[] arr1 = memberVO.getBirth().split("-");
	    String year = arr1[0];
	    String month = arr1[1];
	    String day = arr1[2];
	    
	    memberVO.setYear(year);
	    memberVO.setMonth(month);
	    memberVO.setDay(day);
		
		model.addAttribute("memberInfo", memberVO);
		
		return "/member/memberUpdate";
	}
	
	
	// ȸ�� ���� ���� 
	@RequestMapping(value = "memberEdit")
	@ResponseBody
	public String memberEdit(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
		resultParam = memberService.memberEdit(memberVO);
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	
	// ȸ�� ã��
	@RequestMapping(value = "memberSearch")
	@ResponseBody
	public String memberSearch(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
		resultParam = memberService.memberEdit(memberVO);
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}

}
