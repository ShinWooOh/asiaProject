package com.company.asiayoga.store.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.store.domain.StoreVO;
import com.company.asiayoga.store.service.StoreService;


@Controller
@RequestMapping("store")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	StoreService storeService;
	
	private String menuFirstRoot = "store";
	
	
	// ���� ���
	@RequestMapping(value = "storeList")
	public String storeList(HttpServletRequest request,Model model) throws Exception {
		
		List<StoreVO> list = storeService.storeList();
		
		model.addAttribute("storeList", list);
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeList";
	}
	
	// ���� ����
	@RequestMapping(value = "storeDelete")
	@ResponseBody
	public String storeDelete(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.storeDelete(storeVO);
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// ���� ��
	@RequestMapping(value = "storeDetail")
	public String storeDetail(HttpServletRequest request,Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		model.addAttribute("storeDetail", storeService.storeDetail(storeVO));
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeDetail";
	}
	
	// ���� ��� ȭ������ �̵�
	@RequestMapping(value = "storeRegister")
	public String storeRegister(HttpServletRequest request,Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/store/storeRegister";
	}
	
	// ���� ���
	@RequestMapping(value = "insertStore")
	@ResponseBody
	public String insertStore(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.insertStore(storeVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}
	
	// ���� ���� ������Ʈ
	@RequestMapping(value = "updateStore")
	@ResponseBody
	public String updateStore(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = storeService.updateStore(storeVO);
		
		if(resultParam > 0) {
			result = "success"; 
		}
		
		return result;
	}

}
