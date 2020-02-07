package com.company.asiayoga.manage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.manage.service.ManageService;

@Controller
@RequestMapping("manage")
public class ManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Inject
	private ManageService manageService;
	
	private String menuFirstRoot = "manage";
	
	
	// 매장 직원 목록
	@RequestMapping(value = "manageList")
	public String manageList(HttpServletRequest request,Model model) throws Exception {
		
    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	List<ManageVO> manageList = manageService.manageList(manageVO);
    	model.addAttribute("manageList", manageList);
		
		// 경로 체크
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
		
		return "/manage/manageList";
		
	}
	
	// 직원 계정 활성화 여부 변경 
	@RequestMapping(value = "updateEnableState")
	@ResponseBody
	public String updateEnableState(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = manageService.updateEnableState(manageVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// 매장 직원 등록 화면 이동
	@RequestMapping(value = "manageRegister")
	public String manageRegister(HttpServletRequest request,Model model) throws Exception {
		
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageRegister";
		
	}

	// 계정 중복 여부 확인
	@RequestMapping(value = "manageDupIdCheck")
	@ResponseBody
	public String manageDupIdCheck(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = manageService.manageDupIdCheck(manageVO);
		if(resultParam > 0) {
			result = "dupId";
		}else if(resultParam == 0) {
			result = "success";
		}
		
		return result;
		
	}
	
	// 직원 그룹 목록
	@RequestMapping(value = "manageGroupList")
	public String manageGroupList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ManageGroupVO manageGroupVO = new ManageGroupVO();
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		manageGroupVO.setAuthority(manageVO.getAuthority());
		
		List<ManageGroupVO> manageGroupList = manageService.manageGroupList(manageGroupVO);
		model.addAttribute("manageGroupList", manageGroupList);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupList";
		
	}
	
	// 직원 그룹  사용 여부 변경 
	@RequestMapping(value = "updateGroupUseYnState")
	@ResponseBody
	public String updateGroupUseYnState(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setModifyId(manageVO.getId());
		
		resultParam = manageService.updateGroupUseYnState(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// 직원 그룹 등록 화면 이동
	@RequestMapping(value = "manageGroupRegister")
	public String manageGroupRegister(HttpServletRequest request,Model model) throws Exception {
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupRegister";
		
	}
	
	// 직원 그룹 등록
	@RequestMapping(value = "insertManageGroup")
	@ResponseBody
	public String insertManageGroup(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		manageGroupVO.setRegisterId(manageVO.getId());
		manageGroupVO.setModifyId(manageVO.getId());
		resultParam = manageService.insertManageGroup(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		return result;
		
	}
	
	// 직원 그룹 상세
	@RequestMapping(value = "manageGroupDetail")
	public String manageGroupDetail(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		ManageGroupVO vo = new ManageGroupVO();
		vo = manageService.manageGroupDetail(manageGroupVO);
		
		model.addAttribute("manageGroupDetail", vo);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupDetail";
		
	}
	
	// 직원 그룹 업데이트
	@RequestMapping(value = "updateManageGroup")
	@ResponseBody
	public String updateManageGroup(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setModifyId(manageVO.getId());
		resultParam = manageService.updateManageGroup(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		return result;
		
	}
	
	
	// 직원 그룹명 중복 여부 확인
	@RequestMapping(value = "manageGroupDupCheck")
	@ResponseBody
	public String manageGroupDupCheck(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		resultParam = manageService.manageGroupDupCheck(manageGroupVO);
		if(resultParam > 0) {
			result = "dupName";
		}else if(resultParam == 0) {
			result = "success";
		}
		
		return result;
		
	}
}
