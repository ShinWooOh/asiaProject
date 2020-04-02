package com.company.asiayoga.mobile.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.home.controller.HomeController;
import com.company.asiayoga.mobile.member.domain.MobileMemberVO;
import com.company.asiayoga.mobile.member.service.MobileMemberService;

@Controller
public class MobileController {

	private static final Logger logger = LoggerFactory.getLogger(MobileController.class);
	
	private MobileMemberService  memberService;
	
	
	@RequestMapping(value = "/mobileMain")
	public String mobileMain(HttpServletRequest request) {
		logger.info("여기옵니다 mbData.");
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("result", "success");
		
		return "mobileMain";
	}
	

}
