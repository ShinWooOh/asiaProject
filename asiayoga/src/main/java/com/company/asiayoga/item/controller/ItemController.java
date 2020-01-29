package com.company.asiayoga.item.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.attendance.domain.AttendanceVO;
import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.item.service.ItemService;
import com.company.asiayoga.manage.domain.ManageVO;

@Controller
@RequestMapping("item")
public class ItemController {
	
	 private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	 
	 @Inject
	 private ItemService itemService;
	 
	 private String menuFirstRoot = "item";
	 
	 // 품목 관리
	 @RequestMapping(value = "itemList")
	 public String itemList(HttpServletRequest request,Model model) throws Exception {
		 
		 ManageVO manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(manageVO.getStoreSeq()); 								// 현재는 임시적으로 부여
		 
		 List<ItemVO> list = itemService.itemList(itemVO);
		 
		 model.addAttribute("itemList", list);
		 
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		 
		 return "/item/itemList";
	 }
	 
	 // 품목 등록 화면으로 이동
	 @RequestMapping(value = "itemRegister")
	 public String itemRegister(HttpServletRequest request,Model model) throws Exception {
		 
		 ManageVO manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		 
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(manageVO.getStoreSeq()); 								
		 itemVO.setStoreName(manageVO.getStoreName());  						
		 
		 
		 model.addAttribute("itemVO", itemVO);
		 
		 // 경로 체크
		 String currentPath = (String)request.getSession().getAttribute("nowPath");
		 if(!currentPath.equals(menuFirstRoot)) {
			 request.getSession().removeAttribute("nowPath");
			 request.getSession().setAttribute("nowPath", menuFirstRoot);
		 }
		 
		 return "/item/itemRegister";
	 }
	 
	 // 품목 저장
	 @RequestMapping(value = "insertItem")
	 @ResponseBody
	 public String insertItem(Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 String result = "fail";
		 
		 int paramResult = 0;
		 paramResult = itemService.insertItem(itemVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
	 
	 // 품목 삭제
	 @RequestMapping(value = "itemDelete")
	 @ResponseBody
	 public String itemDelete(Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 String result = "fail";
		 
		 int paramResult = 0;
		 paramResult = itemService.itemDelete(itemVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }
	 
	 // 품목 상세
	 @RequestMapping(value = "itemDetail")
	 public String itemDetail(HttpServletRequest request,Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 itemVO = itemService.itemDetail(itemVO);
		 model.addAttribute("itemDetail", itemVO);
		 
		 // 경로 체크
		 String currentPath = (String)request.getSession().getAttribute("nowPath");
		 if(!currentPath.equals(menuFirstRoot)) {
			 request.getSession().removeAttribute("nowPath");
			 request.getSession().setAttribute("nowPath", menuFirstRoot);
		 }
		 
		 return "/item/itemDetail";
	 }
	 
	 // 품목 수정
	 @RequestMapping(value = "updateItem")
	 @ResponseBody
	 public String updateItem(Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 String result = "fail";
		 
		 int paramResult = 0;
		 paramResult = itemService.updateItem(itemVO);
		 
		 if(paramResult > 0) {
			 result = "success";
		 }
		 return result;
	 }

}
