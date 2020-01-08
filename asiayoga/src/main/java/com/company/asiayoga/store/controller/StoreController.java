package com.company.asiayoga.store.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.asiayoga.store.domain.StoreVO;
import com.company.asiayoga.store.service.StoreService;


@Controller
@RequestMapping("store")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Inject
	StoreService storeService;
	
	
	// 매장 목록
	@RequestMapping(value = "storeList")
	public String storeList(Model model) throws Exception {
		
		List<StoreVO> list = storeService.storeList();
		
		model.addAttribute("storeList", list);
		
		return "/store/storeList";
	}

}
