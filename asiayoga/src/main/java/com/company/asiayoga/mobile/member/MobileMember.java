package com.company.asiayoga.mobile.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.asiayoga.mobile.member.domain.MobileMemberVO;
import com.company.asiayoga.mobile.member.service.MobileMemberService;

@Controller
@RequestMapping("mobile")
public class MobileMember {

	private MobileMemberService  memberService;
	
	
	@RequestMapping(value = "/member")
	public String MemberLogin(MobileMemberVO mobileMeberVO) throws Exception {
		
		String result ="fall";
		
		result = memberService.mobileMeberInfo(mobileMeberVO);
		
		return result;
	}
}
