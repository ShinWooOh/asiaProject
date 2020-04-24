package com.company.asiayoga.mobile.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.mobile.domain.MobileVO;
import com.company.asiayoga.mobile.service.MobileService;

@Controller
public class MobileController {

	private static final Logger logger = LoggerFactory.getLogger(MobileController.class);
	
	@Inject
	private MobileService mobileService;
	
	// 모바일 화면이동 
	// Android App 에서 storeSeq 와 mobileAppFlag 를 전달해 준다.
	// 값이 없는 경우 접근제한 페이지로 이동시킴
	// mobileAppFlag 구분자 : mobileApp_tablet (그외에는 Flag -> false 처리)
	@RequestMapping(value = "/mobileMain")
	public String mobileMain(HttpServletRequest request,Model model) throws Exception {
		
		// 원래 공통적으로 쓰는 데이터 형은 int 이나 데이터의 유호값 확인을 위하여 String 으로 변경
		// 여기서만 해당
		String storeSeq = "";
		storeSeq = request.getParameter("storeSeq");
		if((storeSeq == null) == true) {
			storeSeq = "";
		}
		String mobileAppFlag = "N";
		mobileAppFlag = request.getParameter("mobileApp");
		if((mobileAppFlag == null) == true ) {
			mobileAppFlag = "N";
		}
		
		MobileVO mobileVO = new MobileVO();
		// storeSeq 가 없거나 mobileAppFlag 가 N 또는 없는 경우 접근제한 페이지로 이동 시킴
		if(storeSeq.equals("")) {
			return "/error/accessDeniedPage";
		} else {
			if(mobileAppFlag.equals("") || !mobileAppFlag.equals("mobileApp_tablet")) {
				return "/error/accessDeniedPage";
			} else {
				mobileVO.setStoreSeq(Integer.parseInt(storeSeq));
				mobileVO = mobileService.mobileStoreInfo(mobileVO);
				
				if( (mobileVO == null) == true) {
					return "/error/accessDeniedPage";
				}
				
				if(mobileVO.getStoreName().equals("")) {
					return "/error/accessDeniedPage";
				}
				
				mobileVO.setMobileAppFlag(mobileAppFlag);
				model.addAttribute("mobileVO", mobileVO);
			}
		}
		
		return "mobileMain";
	}
	
	
	// 출석 등록
	@RequestMapping(value = "/mobile/mobileAttendance")
	@ResponseBody
	public HashMap<String, Object> mobileAttendance(HttpServletRequest request,Model model,MobileVO mobileVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		int result = 0;

		// 정보가 없는 경우 바로 리턴
		if(mobileVO == null || mobileVO.getMobileAppFlag() == null || !mobileVO.getMobileAppFlag().equals("mobileApp_tablet")){
			hashMap.put("result", "errorRoot");
			return hashMap;
		}
		
		mobileVO = mobileService.mobileMeberInfo(mobileVO);
		
		if(mobileVO == null){
			hashMap.put("result", "noMember");
		} else {
			
			if(mobileVO.getAdjournmentState().equals("Y")) {
				hashMap.put("result", "adjournmentMember");
			} else {
				mobileVO.setRegisterId(mobileVO.getMobileAppFlag());
				mobileVO.setModifyId(mobileVO.getMobileAppFlag());
				mobileVO.setProductSeq(5);
				result = mobileService.mobileInsertAttendance(mobileVO);
				
				if(result > 0) {
					hashMap.put("result", "success");
					hashMap.put("mobileVO", mobileVO);
				} else {
					hashMap.put("result", "errorRoot");
				}
			}
		}
		
		return hashMap;
	}
	
	// test
	@RequestMapping(value = "/mobile/mobileTest", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public HashMap<String, Object> mobileTest(HttpServletRequest request,Model model,MobileVO mobileVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		logger.info("이곳은 테스트 페이지입니다. 진입 성공하였습니다.");
		
		return hashMap;
	}

}
