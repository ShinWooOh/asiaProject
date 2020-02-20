package com.company.asiayoga.member.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	private String menuFirstRoot = "member";
	
	// 회원 목록 화면
	@RequestMapping(value = "memberList")
	public String memberList(HttpServletRequest request,Model model,MemberVO memberVO) throws Exception{
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		memberVO.setStoreSeq(manageVO.getStoreSeq());
		List<MemberVO> list = memberService.memberList(memberVO);
		model.addAttribute("memberList", list);
		
		int paramTotalCount = 0;
		paramTotalCount = memberService.memberTotalCount(memberVO);
		memberVO.setTotalCount(paramTotalCount);
		memberVO.setTotalPage(this.totalPage(paramTotalCount, memberVO));
		memberVO.setEndPage(this.endPage(memberVO));
		
		model.addAttribute("memberVO", memberVO);
		
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
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	@ResponseBody
	public String memberInsert(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
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
	public String memberDel(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
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
	public String memberEdit(Model model,@ModelAttribute("memberVO") MemberVO memberVO) throws Exception{
		
		int resultParam = 0;
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
		
}
