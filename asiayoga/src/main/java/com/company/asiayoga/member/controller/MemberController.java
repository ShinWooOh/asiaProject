package com.company.asiayoga.member.controller;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;
import com.company.asiayoga.store.service.StoreService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private StoreService storeService;
	
	private String menuFirstRoot = "member";
	
	// 회원 목록 화면
	@RequestMapping(value = "memberList")
	public String memberList(HttpServletRequest request,Model model,MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setStoreSeq(manageVO.getStoreSeq());
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<MemberVO> list = memberService.memberList(memberVO);
		model.addAttribute("memberList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = memberService.memberTotalCount(memberVO);
		memberVO.setTotalCount(paramTotalCount);
		memberVO.setTotalPage(this.totalPage(paramTotalCount, memberVO));
		memberVO.setEndPage(this.endPage(memberVO));
		
		model.addAttribute("memberVO", memberVO);
		
		MemberVO memberStat = new MemberVO();
		
		// 유효 회원 수
		int  memberVaildCount = 0;
		MemberVO vaildMemberVO = new MemberVO();
		vaildMemberVO.setStoreSeq(memberVO.getStoreSeq());
		vaildMemberVO.setAuthority(memberVO.getAuthority());
		memberVaildCount = memberService.validMemberCount(vaildMemberVO);
		vaildMemberVO.setTotalCount(memberVaildCount);
		vaildMemberVO.setTotalPage(this.totalPage(memberVaildCount, vaildMemberVO));
		vaildMemberVO.setEndPage(this.endPage(vaildMemberVO));
		
		// 유효 회원 목록
		List<MemberVO> vaildMemberList = new ArrayList<MemberVO>();
		vaildMemberList = memberService.validMemberList(memberVO);
		model.addAttribute("vaildMemberList", vaildMemberList);
		
		// 만기자 회원 수
		int maturityMemberCount = 0;
		MemberVO maturityMemberVO = new MemberVO();
		maturityMemberVO.setStoreSeq(memberVO.getStoreSeq());
		maturityMemberVO.setAuthority(memberVO.getAuthority());
		maturityMemberCount = memberService.maturityMemberCount(maturityMemberVO);
		maturityMemberVO.setTotalCount(maturityMemberCount);
		maturityMemberVO.setTotalPage(this.totalPage(maturityMemberCount, maturityMemberVO));
		maturityMemberVO.setEndPage(this.endPage(maturityMemberVO));
		
		// 만기 회원 목록
		List<MemberVO> maturityMemberList = new ArrayList<MemberVO>();
		maturityMemberList = memberService.maturityMemberList(memberVO);
		model.addAttribute("maturityMemberList", maturityMemberList);
		
		// 만기예정자 수
		int expiredMemberCount = 0;
		MemberVO expiredMemberVO = new MemberVO();
		expiredMemberVO.setStoreSeq(memberVO.getStoreSeq());
		expiredMemberVO.setAuthority(memberVO.getAuthority());
		expiredMemberCount = memberService.expiredMemberCount(memberVO);
		expiredMemberVO.setTotalCount(expiredMemberCount);
		expiredMemberVO.setTotalPage(this.totalPage(expiredMemberCount, expiredMemberVO));
		expiredMemberVO.setEndPage(this.endPage(expiredMemberVO));

		// 만기예정 회원 목록
		List<MemberVO> expiredMemberList = new ArrayList<MemberVO>();
		expiredMemberList = memberService.expiredMemberList(memberVO);
		model.addAttribute("expiredMemberList", expiredMemberList);
		

		memberStat.setMemberVaildCount(memberVaildCount);
		memberStat.setMaturityMemberCount(maturityMemberCount);
		memberStat.setExpiredMemberCount(expiredMemberCount);
		model.addAttribute("memberStat", memberStat);
		model.addAttribute("vaildMemberVO", vaildMemberVO);
		model.addAttribute("maturityMemberVO", maturityMemberVO);
		model.addAttribute("expiredMemberVO", expiredMemberVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/member/memberList";
	}
	
	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchMemberList")
	@ResponseBody
	public HashMap<String, Object> searchMemberList(HttpServletRequest request,Model model,MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		memberVO.setParamPage((memberVO.getTotalRow()*memberVO.getPageNum())-memberVO.getTotalRow());
		memberVO.setStoreSeq(manageVO.getStoreSeq());
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<MemberVO> list = memberService.memberList(memberVO);

		int paramTotalCount = 0;
		paramTotalCount = memberService.memberTotalCount(memberVO);
		
		if(list.size() == 0) {
			memberVO.setParamPage(0);
			memberVO.setPageNum(1);
			memberVO.setPageRow(0);

			if(paramTotalCount != 0) {
				memberVO.setStartPage(1);
				memberVO.setTotalPage(this.totalPage(paramTotalCount, memberVO));
				memberVO.setEndPage(this.endPage(memberVO));
				list = memberService.memberList(memberVO);
				hashMap.put("result", "success");
				hashMap.put("memberList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (memberVO.getPageRow()*5)+1;
			
			memberVO.setTotalCount(paramTotalCount);
			memberVO.setTotalPage(this.totalPage(paramTotalCount, memberVO));
			paramEndPage = this.endPage(memberVO);
			memberVO.setStartPage(paramStartPage);
			memberVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("memberList", list);
		} else {
			memberVO.setParamPage(0);
			memberVO.setPageNum(1);
			memberVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("memberVO", memberVO);
		
		return hashMap;
	}
	
	// 회원정보 상세 화면
	@RequestMapping(value = "memberDetail")
	public String memberDetail(HttpServletRequest request,Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		MemberVO vo = new MemberVO();
		vo = memberService.memberDetail(memberVO);
		
		model.addAttribute("memberDetail", vo);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/member/memberDetail";
	}
	
	// 회원 정보 등록 화면
	@RequestMapping(value = "memberJoin")
	public String memberJoin(HttpServletRequest request,Model model) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setStoreSeq(manageVO.getStoreSeq());
		memberVO.setStoreName(manageVO.getStoreName());
		memberVO.setJoinDate(new Date());
		memberVO.setStartDay(new Date());
		
		model.addAttribute("memberInfo", memberVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/member/memberJoin";
	}
	
	// 회원 정보 저장
	@RequestMapping(value = "memberInsert")
	@ResponseBody
	public String memberInsert(HttpServletRequest request,Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		int resultParam = 0;
		memberVO.setRegisterId(manageVO.getId());
		if(!manageVO.getAuthority().equals("ROLE_ADMIN")) {
			memberVO.setStoreSeq(manageVO.getStoreSeq());
		}
		resultParam = memberService.memberInsert(memberVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 회원 정보 삭제
	@RequestMapping(value = "memberDel", method = RequestMethod.POST)
	@ResponseBody
	public String memberDel(HttpServletRequest request,Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{

		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		memberVO.setModifyId(manageVO.getId());
		
		int resultParam = 0;
		resultParam = memberService.memberDel(memberVO);
		
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 회원 정보 수정 화면으로 이동
	@RequestMapping(value = "memberUpdate")
	public String memberUpdate(HttpServletRequest request,Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		String[] arr = memberVO.getPhone().split("-");
		String phone1 = arr[0];
		String phone2 = arr[1];
		String phone3 = arr[2];
		
		memberVO.setPhone1(phone1);
		memberVO.setPhone2(phone2);
		memberVO.setPhone3(phone3);
		
		String[] arr1 = memberVO.getBirth().split("-");
	    String year = arr1[0];
	    String month = arr1[1];
	    String day = arr1[2];
	    
	    memberVO.setYear(year);
	    memberVO.setMonth(month);
	    memberVO.setDay(day);
		
		model.addAttribute("memberInfo", memberVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/member/memberUpdate";
	}
	
	
	// 회원 정보 수정 
	@RequestMapping(value = "memberEdit")
	@ResponseBody
	public String memberEdit(HttpServletRequest request,Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		memberVO.setModifyId(manageVO.getId());
		
		int resultParam = 0;
		if(!manageVO.getAuthority().equals("ROLE_ADMIN")) {
			memberVO.setStoreSeq(manageVO.getStoreSeq());
		}
		resultParam = memberService.memberEdit(memberVO);
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	
	// 회원 찾기
	@RequestMapping(value = "memberSearch")
	@ResponseBody
	public String memberSearch(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
		resultParam = memberService.memberEdit(memberVO);
		String result = "fail";
		
		if(resultParam >= 1) {
			result = "success"; 
		}
		
		return result;
	}
	
	// 회원 리스트 엑셀 다운로드
	@RequestMapping(value = "memberExcelDownload")
	public void memberExcelDownload(HttpServletRequest request, HttpServletResponse reponse, MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = memberService.memberExcelDownload(memberVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=memberList.xlsx");
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
	
	// 팝업에서 매장 목록(HashMap 구조)
	@RequestMapping(value = "searchStore", method = RequestMethod.GET)
	@ResponseBody
	public  HashMap<String, Object> searchStore(Model model,StoreVO storeVO) throws Exception{
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		storeVO.setSearchWord(storeVO.getStoreName());
		List<StoreVO> storeList = memberService.storeSearchList(storeVO);
		
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
	
	// 팝업에서 상품 목록(HashMap 구조)
	@RequestMapping(value = "searchProduct", method = RequestMethod.GET)
	@ResponseBody
	public  HashMap<String, Object> searchProduct(HttpServletRequest request,Model model,ProductVO productVO) throws Exception{
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		productVO.setSearchWord(productVO.getProductName());
		productVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<ProductVO> productList = memberService.searchProductList(productVO);
		if(productList.size() >= 1){
			hashMap.put("result", "success");
			hashMap.put("popProductList", productList);
		} else if(productList.size() == 0) {
			hashMap.put("result", "noCount");
			hashMap.put("popProductList", "");
		} else{
		} 
		
		return hashMap;
	}
	
	// 회원정보 수정 화면에서의 회원번호 중복체크
	@RequestMapping(value = "myMembershipDupCheck", method = RequestMethod.GET)
	@ResponseBody
	public String myMembershipDupCheck(HttpServletRequest request,Model model,MemberVO memberVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		int storeSeqParam = memberVO.getStoreSeq();
		memberVO.setStoreSeq(storeSeqParam);
		
		resultParam = memberService.myMembershipDupCheck(memberVO);
		if(resultParam > 0) {
			result = "dupName";
		}else if(resultParam == 0) {
			result = "success";
		}
		return result;
	}

	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchVaildMemberList")
	@ResponseBody
	public HashMap<String, Object> searchVaildMemberList(HttpServletRequest request,Model model,MemberVO vaildMemberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		vaildMemberVO.setParamPage((vaildMemberVO.getTotalRow()*vaildMemberVO.getPageNum())-vaildMemberVO.getTotalRow());
		vaildMemberVO.setStoreSeq(manageVO.getStoreSeq());
		vaildMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<MemberVO> vaildMemberList = memberService.validMemberList(vaildMemberVO);

		int paramTotalCount = 0;
		paramTotalCount = memberService.validMemberCount(vaildMemberVO);
		
		if(vaildMemberList.size() == 0) {
			vaildMemberVO.setParamPage(0);
			vaildMemberVO.setPageNum(1);
			vaildMemberVO.setPageRow(0);

			if(paramTotalCount != 0) {
				vaildMemberVO.setStartPage(1);
				vaildMemberVO.setTotalPage(this.totalPage(paramTotalCount, vaildMemberVO));
				vaildMemberVO.setEndPage(this.endPage(vaildMemberVO));
				vaildMemberList = memberService.memberList(vaildMemberVO);
				hashMap.put("result", "success");
				hashMap.put("vaildMemberList", vaildMemberList);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(vaildMemberList.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (vaildMemberVO.getPageRow()*5)+1;
			
			vaildMemberVO.setTotalCount(paramTotalCount);
			vaildMemberVO.setTotalPage(this.totalPage(paramTotalCount, vaildMemberVO));
			paramEndPage = this.endPage(vaildMemberVO);
			vaildMemberVO.setStartPage(paramStartPage);
			vaildMemberVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("vaildMemberList", vaildMemberList);
		} else {
			vaildMemberVO.setParamPage(0);
			vaildMemberVO.setPageNum(1);
			vaildMemberVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("vaildMemberVO", vaildMemberVO);
		
		return hashMap;
	}
	
	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchMaturityMemberList")
	@ResponseBody
	public HashMap<String, Object> searchMaturityMemberList(HttpServletRequest request,Model model,MemberVO maturityMemberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		maturityMemberVO.setParamPage((maturityMemberVO.getTotalRow()*maturityMemberVO.getPageNum())-maturityMemberVO.getTotalRow());
		maturityMemberVO.setStoreSeq(manageVO.getStoreSeq());
		maturityMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<MemberVO> maturityMemberList = memberService.maturityMemberList(maturityMemberVO);
		
		int paramTotalCount = 0;
		paramTotalCount = memberService.maturityMemberCount(maturityMemberVO);
		
		if(maturityMemberList.size() == 0) {
			maturityMemberVO.setParamPage(0);
			maturityMemberVO.setPageNum(1);
			maturityMemberVO.setPageRow(0);
			
			if(paramTotalCount != 0) {
				maturityMemberVO.setStartPage(1);
				maturityMemberVO.setTotalPage(this.totalPage(paramTotalCount, maturityMemberVO));
				maturityMemberVO.setEndPage(this.endPage(maturityMemberVO));
				maturityMemberList = memberService.memberList(maturityMemberVO);
				hashMap.put("result", "success");
				hashMap.put("maturityMemberList", maturityMemberList);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(maturityMemberList.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (maturityMemberVO.getPageRow()*5)+1;
			
			maturityMemberVO.setTotalCount(paramTotalCount);
			maturityMemberVO.setTotalPage(this.totalPage(paramTotalCount, maturityMemberVO));
			paramEndPage = this.endPage(maturityMemberVO);
			maturityMemberVO.setStartPage(paramStartPage);
			maturityMemberVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("maturityMemberList", maturityMemberList);
		} else {
			maturityMemberVO.setParamPage(0);
			maturityMemberVO.setPageNum(1);
			maturityMemberVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("maturityMemberVO", maturityMemberVO);
		
		return hashMap;
	}
	
	// 회원 목록 화면에서의 검색
	@RequestMapping(value = "searchExpiredMemberList")
	@ResponseBody
	public HashMap<String, Object> searchExpiredMemberList(HttpServletRequest request,Model model,MemberVO expiredMemberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		expiredMemberVO.setParamPage((expiredMemberVO.getTotalRow()*expiredMemberVO.getPageNum())-expiredMemberVO.getTotalRow());
		expiredMemberVO.setStoreSeq(manageVO.getStoreSeq());
		expiredMemberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		List<MemberVO> expiredMemberList = memberService.expiredMemberList(expiredMemberVO);
		
		int paramTotalCount = 0;
		paramTotalCount = memberService.expiredMemberCount(expiredMemberVO);
		
		if(expiredMemberList.size() == 0) {
			expiredMemberVO.setParamPage(0);
			expiredMemberVO.setPageNum(1);
			expiredMemberVO.setPageRow(0);
			
			if(paramTotalCount != 0) {
				expiredMemberVO.setStartPage(1);
				expiredMemberVO.setTotalPage(this.totalPage(paramTotalCount, expiredMemberVO));
				expiredMemberVO.setEndPage(this.endPage(expiredMemberVO));
				expiredMemberList = memberService.memberList(expiredMemberVO);
				hashMap.put("result", "success");
				hashMap.put("expiredMemberList", expiredMemberList);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(expiredMemberList.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (expiredMemberVO.getPageRow()*5)+1;
			
			expiredMemberVO.setTotalCount(paramTotalCount);
			expiredMemberVO.setTotalPage(this.totalPage(paramTotalCount, expiredMemberVO));
			paramEndPage = this.endPage(expiredMemberVO);
			expiredMemberVO.setStartPage(paramStartPage);
			expiredMemberVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("expiredMemberList", expiredMemberList);
		} else {
			expiredMemberVO.setParamPage(0);
			expiredMemberVO.setPageNum(1);
			expiredMemberVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("expiredMemberVO", expiredMemberVO);
		
		return hashMap;
	}
	
	// 유효 회원 엑셀 다운로드
	@RequestMapping(value = "vaildMemberExcelDownload")
	public void vaildMemberExcelDownload(HttpServletRequest request, HttpServletResponse reponse, MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = memberService.vaildMemberExcelDownload(memberVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=vaildMemberList.xlsx");
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
	// 만기 회원 엑셀 다운로드
	@RequestMapping(value = "maturityMemberExcelDownload")
	public void maturityMemberExcelDownload(HttpServletRequest request, HttpServletResponse reponse, MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = memberService.maturityMemberExcelDownload(memberVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=maturityMemberList.xlsx");
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
	// 만기예정 회원 엑셀 다운로드
	@RequestMapping(value = "expiredMemberExcelDownload")
	public void expiredMemberExcelDownload(HttpServletRequest request, HttpServletResponse reponse, MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setAuthority(this.checkAuthority(manageVO.getAuthority()));
		
		OutputStream out = null;
		try {
			SXSSFWorkbook sxssfWorkbook = memberService.expiredMemberExcelDownload(memberVO);
			
			reponse.reset();
			reponse.setHeader("Content-Disposition", "attachment;filename=expiredMemberList.xlsx");
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
	
	
	
	
	
// 공통 영역	
	// 마지막 페이지 점검 
	public int endPage(MemberVO memberVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = memberVO.getPageRow()*5+5;
		paramTotalPage = memberVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정
	public int totalPage(int totalCount,MemberVO memberVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%memberVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/memberVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/memberVO.getTotalRow())+1;
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
