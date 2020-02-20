package com.company.asiayoga.item.controller;

import java.util.HashMap;
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
import com.company.asiayoga.member.domain.MemberVO;

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
		 
		 int paramTotalCount = 0;
		paramTotalCount = itemService.itemTotalCount(itemVO);
		itemVO.setTotalCount(paramTotalCount);
		itemVO.setTotalPage(this.totalPage(paramTotalCount, itemVO));
		itemVO.setEndPage(this.endPage(itemVO));
		
		model.addAttribute("itemVO", itemVO);
		 
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		 
		 return "/item/itemList";
	 }
	 
	// 품목 관리 화면에서의 검색
	@RequestMapping(value = "searchItemList")
	@ResponseBody
	public HashMap<String, Object> searchItemList(HttpServletRequest request,Model model,ItemVO itemVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		itemVO.setParamPage((itemVO.getTotalRow()*itemVO.getPageNum())-itemVO.getTotalRow());
		itemVO.setStoreSeq(manageVO.getStoreSeq());
		List<ItemVO> list = itemService.itemList(itemVO);

		int paramTotalCount = 0;
		paramTotalCount = itemService.itemTotalCount(itemVO);
		
		if(list.size() == 0) {
			itemVO.setParamPage(0);
			itemVO.setPageNum(1);
			itemVO.setPageRow(0);

			if(paramTotalCount != 0) {
				itemVO.setStartPage(1);
				itemVO.setTotalPage(this.totalPage(paramTotalCount, itemVO));
				itemVO.setEndPage(this.endPage(itemVO));
				list = itemService.itemList(itemVO);
				hashMap.put("result", "success");
				hashMap.put("itemList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (itemVO.getPageRow()*5)+1;
			
			itemVO.setTotalCount(paramTotalCount);
			itemVO.setTotalPage(this.totalPage(paramTotalCount, itemVO));
			paramEndPage = this.endPage(itemVO);
			itemVO.setStartPage(paramStartPage);
			itemVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("itemList", list);
		} else {
			itemVO.setParamPage(0);
			itemVO.setPageNum(1);
			itemVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("itemVO", itemVO);
		
		return hashMap;
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
	 
	// 마지막 페이지 점검 
	public int endPage(ItemVO itemVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = itemVO.getPageRow()*5+5;
		paramTotalPage = itemVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,ItemVO itemVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%itemVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/itemVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/itemVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}

}
