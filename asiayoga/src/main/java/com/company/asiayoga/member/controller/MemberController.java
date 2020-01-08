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
	
	// 회원 목록 화면
	@RequestMapping(value = "memberList")
	public String memberList(Model model) throws Exception{
		
		int storeSeq =10;												// 임시 부여 로그인 한 사용자의 세션 정보의 매장 코드를 받아와야 한다.
		List<MemberVO> list = memberService.memberList(storeSeq);
		
		model.addAttribute("memberList", list);
		
		return "/member/memberList";
	}
	
	// 회원정보 상세 화면
	@RequestMapping(value = "memberDetail")
	public String memberDetail(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		MemberVO vo = new MemberVO();
		vo = memberService.memberDetail(memberVO);
		
		model.addAttribute("memberDetail", vo);
		
		return "/member/memberDetail";
	}
	
	// 회원 정보 등록 화면
	@RequestMapping(value = "memberJoin")
	public String memberJoin(Model model) throws Exception{
		
		int storeSeq =10;												// 임시 부여 로그인 한 사용자의 세션 정보의 매장 코드를 받아와야 한다.
		String storeName ="레이디요가 의정부점";								// 임시 부여 로그인 한 사용자의 세션 정보의 매장 이름을 받아와야 한다.
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(storeSeq);
		memberVO.setStoreName(storeName);
		
		model.addAttribute("memberInfo", memberVO);
		return "/member/memberJoin";
	}
	
	// 회원 정보 저장
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
	
	// 회원 정보 삭제
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
	
	// 회원 정보 수정 화면으로 이동
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
	
	
	// 회원 정보 수정 
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
	
	
	// 회원 찾기
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
