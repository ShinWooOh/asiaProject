package com.company.asiayoga.item.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.item.service.ItemService;

@Controller
@RequestMapping("item")
public class ItemController {
	
	 private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	 
	 @Inject
	 private ItemService itemService;
	 
	 // ǰ�� ����
	 @RequestMapping(value = "itemList")
	 public String itemList(Model model) throws Exception {
		 
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(10); 								// ����� �ӽ������� �ο�
		 
		 List<ItemVO> list = itemService.itemList(itemVO);
		 
		 model.addAttribute("itemList", list);
		 
		 return "/item/itemList";
	 }
	 
	 // ǰ�� ��� ȭ������ �̵�
	 @RequestMapping(value = "itemRegister")
	 public String itemRegister(Model model) throws Exception {
		 
		 ItemVO itemVO = new ItemVO();
		 itemVO.setStoreSeq(10); 								// ����� �ӽ������� �ο�, ������ ���Ͽ� ������ �����;� �ȴ�.
		 itemVO.setStoreName("���̵�䰡");  						// ����� �ӽ������� �ο�, ������ ���Ͽ� ������ �����;� �ȴ�.
		 
		 
		 model.addAttribute("itemVO", itemVO);
		 
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
	 public String itemDetail(Model model, @ModelAttribute("itemVO") ItemVO itemVO) throws Exception {
		 
		 itemVO = itemService.itemDetail(itemVO);
		 model.addAttribute("itemDetail", itemVO);
		 
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
