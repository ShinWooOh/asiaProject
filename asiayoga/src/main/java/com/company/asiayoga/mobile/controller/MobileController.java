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
	
	// ����� ȭ���̵� 
	// Android App ���� storeSeq �� mobileAppFlag �� ������ �ش�.
	// ���� ���� ��� �������� �������� �̵���Ŵ
	// mobileAppFlag ������ : mobileApp_tablet (�׿ܿ��� Flag -> false ó��)
	@RequestMapping(value = "/mobileMain")
	public String mobileMain(HttpServletRequest request,Model model) throws Exception {
		
		// ���� ���������� ���� ������ ���� int �̳� �������� ��ȣ�� Ȯ���� ���Ͽ� String ���� ����
		// ���⼭�� �ش�
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
		// storeSeq �� ���ų� mobileAppFlag �� N �Ǵ� ���� ��� �������� �������� �̵� ��Ŵ
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
	
	
	// �⼮ ���
	@RequestMapping(value = "/mobile/mobileAttendance")
	@ResponseBody
	public HashMap<String, Object> mobileAttendance(HttpServletRequest request,Model model,MobileVO mobileVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		int result = 0;

		// ������ ���� ��� �ٷ� ����
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
		
		logger.info("�̰��� �׽�Ʈ �������Դϴ�. ���� �����Ͽ����ϴ�.");
		
		return hashMap;
	}

}
