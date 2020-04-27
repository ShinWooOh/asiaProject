package com.company.asiayoga.product.controller;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.item.service.ItemService;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.product.service.ProductService;
import com.company.asiayoga.store.domain.StoreVO;

@Controller
@RequestMapping("product")
public class ProductController {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	private String menuFirstRoot = "product";
	
	// 상품 목록
	@RequestMapping(value = "productList")
	public String productList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ProductVO productVO = new ProductVO();
		productVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		productVO.setStoreSeq(manageVO.getStoreSeq());
		List<ProductVO> list = productService.productList(productVO);
		
		model.addAttribute("productList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = productService.productTotalCount(productVO);
		productVO.setTotalCount(paramTotalCount);
		productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
		productVO.setEndPage(this.endPage(productVO));
		
		model.addAttribute("productVO", productVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productList";
	}
	
	// 상품 목록 화면에서의 검색
	@RequestMapping(value = "searchProductList")
	@ResponseBody
	public HashMap<String, Object> searchProductList(HttpServletRequest request,Model model,ProductVO productVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		productVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		productVO.setParamPage((productVO.getTotalRow()*productVO.getPageNum())-productVO.getTotalRow());
		productVO.setStoreSeq(manageVO.getStoreSeq());
		List<ProductVO> list = productService.productList(productVO);

		int paramTotalCount = 0;
		paramTotalCount = productService.productTotalCount(productVO);
		
		if(list.size() == 0) {
			productVO.setParamPage(0);
			productVO.setPageNum(1);
			productVO.setPageRow(0);

			if(paramTotalCount != 0) {
				productVO.setStartPage(1);
				productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
				productVO.setEndPage(this.endPage(productVO));
				list = productService.productList(productVO);
				hashMap.put("result", "success");
				hashMap.put("productList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (productVO.getPageRow()*5)+1;
			
			productVO.setTotalCount(paramTotalCount);
			productVO.setTotalPage(this.totalPage(paramTotalCount, productVO));
			paramEndPage = this.endPage(productVO);
			productVO.setStartPage(paramStartPage);
			productVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("productList", list);
		} else {
			productVO.setParamPage(0);
			productVO.setPageNum(1);
			productVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("productVO", productVO);
		
		return hashMap;
	}
	
	// 상품 등록 화면으로 이동
	@RequestMapping(value = "productRegister")
	public String productRegister(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ProductVO productVO = new ProductVO();
		productVO.setStoreSeq(manageVO.getStoreSeq());
		productVO.setStoreName(manageVO.getStoreName());
		model.addAttribute("productVO", productVO);
		
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(manageVO.getStoreSeq());
		List<ItemVO> itemList =  itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productRegister";
	}
	
	// 상품 저장 
	@RequestMapping(value = "insertProduct")
	@ResponseBody
	public String insertProduct(HttpServletRequest request,Model model,@ModelAttribute("productVO") ProductVO productVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		String result = "fail";
		
		int paramResult = 0;
		
		productVO.setRegisterId(manageVO.getId());
		productVO.setModifyId(manageVO.getId());
		
		paramResult = productService.insertProduct(productVO);
		 
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// 상품 삭제
	@RequestMapping(value = "productDelete")
	@ResponseBody
	public String productDel(HttpServletRequest request,Model model,ProductVO productVO) throws Exception {

		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		String result = "fail";
		
		int paramResult = 0;
		productVO.setModifyId(manageVO.getId());
		paramResult = productService.productDelete(productVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// 상품 상세 화면으로 이동
	@RequestMapping(value = "productDetail")
	public String productDetail(HttpServletRequest request,Model model,ProductVO productVO) throws Exception {
	
		// 상품 상세
		productVO = productService.productDetail(productVO);
		model.addAttribute("productDetail", productVO);
		
		// 품목명 리스트
		ItemVO itemVO = new ItemVO();
		itemVO.setStoreSeq(productVO.getStoreSeq());
		List<ItemVO> itemList = itemService.itemList(itemVO);
		model.addAttribute("itemList", itemList);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/product/productDetail";
	}
	
	// 상품 업데이트
	@RequestMapping(value = "updateProduct")
	@ResponseBody
	public String updateProduct(HttpServletRequest request,Model model,ProductVO productVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		String result = "fail";
		
		int paramResult = 0;
		productVO.setModifyId(manageVO.getId());
		paramResult = productService.updateProduct(productVO);
		
		if(paramResult > 0) {
			result = "success";
		}
		
		return result;
	}
	
	// 매장 찾기(관리자 전용)
	@RequestMapping(value = "searchStore")
	@ResponseBody
	public HashMap<String, Object> searchStore(Model model,StoreVO storeVO) throws Exception {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		storeVO.setSearchWord(storeVO.getStoreName());
		List<StoreVO> storeList  = productService.storeSearchList(storeVO);
		
		if(storeList.size() >= 1){
			hashMap.put("result", "success");
			hashMap.put("popStoreList", storeList);
		} else if(storeList.size() == 0) {
			hashMap.put("result", "noCount");
			hashMap.put("popStoreList", "");
		} else {
			
		}
		
		return hashMap;
	}
	
	// 상품 목록 엑셀 다운로드
	@RequestMapping(value = "productExcelDownload")
	public void productExcelDownload(HttpServletRequest request, HttpServletResponse reponse, ProductVO productVO) throws Exception{
		
		OutputStream out = null;
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		productVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		try {
			SXSSFWorkbook sxssfWorkbook = productService.productExcelDownload(productVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=productList.xlsx");
			reponse.setContentType("application/vnd.ms-excel");
			out = new BufferedOutputStream(reponse.getOutputStream());
			
			sxssfWorkbook.write(out);
			out.flush();
			
		} catch (Exception e) {
			logger.error("exception during downloading excel file : {}", e);
		} finally {
			if(out != null) { out.close(); }
		}
	}
	
	// 마지막 페이지 점검 
	public int endPage(ProductVO productVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = productVO.getPageRow()*5+5;
		paramTotalPage = productVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,ProductVO productVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%productVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/productVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/productVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
	
	// 권한 체크
	public String checkAuthority(String myAuthority) {
		String resultParam = "";
	
		if(myAuthority.equals("ROLE_ADMIN")) {
			resultParam = myAuthority;
		}
		
		return resultParam;
	}
}
