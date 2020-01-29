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
	 
	 // ǰ�� ����
	 @RequestMapping(value = "itemList")
	 public String itemList(HttpServletRequest request,Model model) throws Exception {
		 
		 ManageVO manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(manageVO.getStoreSeq()); 								// ����� �ӽ������� �ο�
		 
		 List<ItemVO> list = itemService.itemList(itemVO);
		 
		 model.addAttribute("itemList", list);
		 
		// ��� üũ
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		 
		 return "/item/itemList";
	 }
	 
	 // ǰ�� ��� ȭ������ �̵�
	 @RequestMapping(value = "itemRegister")
	 public String itemRegister(HttpServletRequest request,Model model) throws Exception {
		 
		 ManageVO manageVO = new ManageVO();
		 manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		 
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(manageVO.getStoreSeq()); 								
		 itemVO.setStoreName(manageVO.getStoreName());  						
		 
		 
		 model.addAttribute("itemVO", itemVO);
		 
		 // ��� üũ
		 String currentPath = (String)request.getSession().getAttribute("nowPath");
		 if(!currentPath.equals(menuFirstRoot)) {
			 request.getSession().removeAttribute("nowPath");
			 request.getSession().setAttribute("nowPath", menuFirstRoot);
		 }
		 
		 return "/item/itemRegister";
	 }
	 
	 // ǰ�� ����
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
	 
	 // ǰ�� ����
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
	 
	 // ǰ�� ��
	 @RequestMapping(value = "itemDetail")
	 public String itemDetail(HttpServletRequest request,Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 itemVO = itemService.itemDetail(itemVO);
		 model.addAttribute("itemDetail", itemVO);
		 
		 // ��� üũ
		 String currentPath = (String)request.getSession().getAttribute("nowPath");
		 if(!currentPath.equals(menuFirstRoot)) {
			 request.getSession().removeAttribute("nowPath");
			 request.getSession().setAttribute("nowPath", menuFirstRoot);
		 }
		 
		 return "/item/itemDetail";
	 }
	 
	 // ǰ�� ����
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
