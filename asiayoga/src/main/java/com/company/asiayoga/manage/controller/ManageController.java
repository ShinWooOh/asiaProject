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
	
	
	// ���� ���� ���
	@RequestMapping(value = "manageList")
	public String manageList(HttpServletRequest request,Model model) throws Exception {
		
    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	List<ManageVO> manageList = manageService.manageList(manageVO);
    	model.addAttribute("manageList", manageList);
		
		// ��� üũ
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
		
		return "/manage/manageList";
		
	}
	
	// ���� ���� Ȱ��ȭ ���� ���� 
	@RequestMapping(value = "updateEnableState")
	@ResponseBody
	public String updateEnableState(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = manageService.updateEnableState(manageVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// ���� ���� ��� ȭ�� �̵�
	@RequestMapping(value = "manageRegister")
	public String manageRegister(HttpServletRequest request,Model model) throws Exception {
		
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageRegister";
		
	}

	// ���� �ߺ� ���� Ȯ��
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
	
	// ���� �׷� ���
	@RequestMapping(value = "manageGroupList")
	public String manageGroupList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ManageGroupVO manageGroupVO = new ManageGroupVO();
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		manageGroupVO.setAuthority(manageVO.getAuthority());
		
		List<ManageGroupVO> manageGroupList = manageService.manageGroupList(manageGroupVO);
		model.addAttribute("manageGroupList", manageGroupList);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupList";
		
	}
	
	// ���� �׷�  ��� ���� ���� 
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
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// ���� �׷� ��� ȭ�� �̵�
	@RequestMapping(value = "manageGroupRegister")
	public String manageGroupRegister(HttpServletRequest request,Model model) throws Exception {
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupRegister";
		
	}
	
	// ���� �׷� ���
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
	
	// ���� �׷� ��
	@RequestMapping(value = "manageGroupDetail")
	public String manageGroupDetail(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		ManageGroupVO vo = new ManageGroupVO();
		vo = manageService.manageGroupDetail(manageGroupVO);
		
		model.addAttribute("manageGroupDetail", vo);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupDetail";
		
	}
	
	// ���� �׷� ������Ʈ
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
	
	
	// ���� �׷�� �ߺ� ���� Ȯ��
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
