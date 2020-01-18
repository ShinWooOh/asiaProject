package com.company.asiayoga.store.controller;

import java.util.List;

import javax.inject.Inject;

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
	
	
	// ���� ���
	@RequestMapping(value = "storeList")
	public String storeList(Model model) throws Exception {
		
		List<StoreVO> list = storeService.storeList();
		
		model.addAttribute("storeList", list);
		
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
	public String storeDetail(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
		model.addAttribute("storeDetail", storeService.storeDetail(storeVO));
		
		return "/store/storeDetail";
	}
	
	// ���� ��� ȭ������ �̵�
	@RequestMapping(value = "storeRegister")
	public String storeRegister(Model model,@ModelAttribute("storeVO") StoreVO storeVO) throws Exception {
		
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
