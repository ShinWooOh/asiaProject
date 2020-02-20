package com.company.asiayoga.manage.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.manage.service.ManageService;
import com.company.asiayoga.member.domain.MemberVO;

@Controller
@RequestMapping("manage")
public class ManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Inject
	private ManageService manageService;
	
	private String menuFirstRoot = "manage";
	
	
	// 직원 목록
	@RequestMapping(value = "manageList")
	public String manageList(HttpServletRequest request,Model model) throws Exception {
		
    	ManageVO manageVO = new ManageVO();
    	manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
    	
    	List<ManageVO> manageList = manageService.manageList(manageVO);
    	model.addAttribute("manageList", manageList);
    	
		int paramTotalCount = 0;
		paramTotalCount = manageService.manageTotalCount(manageVO);
		manageVO.setTotalCount(paramTotalCount);
		manageVO.setTotalPage(this.totalPage(paramTotalCount, manageVO));
		manageVO.setEndPage(this.endPage(manageVO));
		
		model.addAttribute("manageVO", manageVO);
		
		// 경로 체크
        String currentPath = (String)request.getSession().getAttribute("nowPath");
        if(!currentPath.equals(menuFirstRoot)) {
        	request.getSession().removeAttribute("nowPath");
        	request.getSession().setAttribute("nowPath", menuFirstRoot);
        }
		
		return "/manage/manageList";
		
	}
	
	// 직원 목록 화면에서의 검색
	@RequestMapping(value = "searchManageList")
	@ResponseBody
	public HashMap<String, Object> searchManageList(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception{
		
		ManageVO vo = new ManageVO();
		vo = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		manageVO.setParamPage((manageVO.getTotalRow()*manageVO.getPageNum())-manageVO.getTotalRow());
		manageVO.setStoreSeq(vo.getStoreSeq());
		List<ManageVO> list = manageService.manageList(manageVO);

		int paramTotalCount = 0;
		paramTotalCount = manageService.manageTotalCount(manageVO);
		
		if(list.size() == 0) {
			manageVO.setParamPage(0);
			manageVO.setPageNum(1);
			manageVO.setPageRow(0);

			if(paramTotalCount != 0) {
				manageVO.setStartPage(1);
				manageVO.setTotalPage(this.totalPage(paramTotalCount, manageVO));
				manageVO.setEndPage(this.endPage(manageVO));
				list = manageService.manageList(manageVO);
				hashMap.put("result", "success");
				hashMap.put("manageList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (manageVO.getPageRow()*5)+1;
			
			manageVO.setTotalCount(paramTotalCount);
			manageVO.setTotalPage(this.totalPage(paramTotalCount, manageVO));
			paramEndPage = this.endPage(manageVO);
			manageVO.setStartPage(paramStartPage);
			manageVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("manageList", list);
		} else {
			manageVO.setParamPage(0);
			manageVO.setPageNum(1);
			manageVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("manageVO", manageVO);
		
		return hashMap;
	}
	
	// 직원 계정 활성화 여부 변경 
	@RequestMapping(value = "updateEnableState")
	@ResponseBody
	public String updateEnableState(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = manageService.updateEnableState(manageVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// 직원 등록 화면 이동
	@RequestMapping(value = "manageRegister")
	public String manageRegister(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		// 직원 그룹 리스트
		ManageGroupVO manageGroupVO = new ManageGroupVO();
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		List<ManageGroupVO> list = manageService.manageGroupList(manageGroupVO);
		model.addAttribute("manageGroupList", list);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageRegister";
		
	}

	// 직원 등록
	@RequestMapping(value = "insertManage")
	@ResponseBody
	public String insertManage(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO vo = new ManageVO();
		vo = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageVO.setRegisterId(vo.getId());
		manageVO.setModifyId(vo.getId());
		manageVO.setStoreSeq(vo.getStoreSeq());
		
		resultParam = manageService.insertManage(manageVO);
		if(resultParam > 0) {
			result = "success";
		}
		return result;
	}
	
	// 직원 정보
	@RequestMapping(value = "manageInfo")
	public String manageInfo(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		ManageVO paramManageVO = new ManageVO();
		paramManageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		// 직원 그룹 리스트
		ManageGroupVO manageGroupVO = new ManageGroupVO();
		manageGroupVO.setStoreSeq(paramManageVO.getStoreSeq());
		List<ManageGroupVO> list = manageService.manageGroupList(manageGroupVO);
		model.addAttribute("manageGroupList", list);
		
		ManageVO vo = new ManageVO();
		vo = manageService.manageInfo(manageVO);
		model.addAttribute("manageInfo", vo);
		
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		return "/manage/manageDetail";
	}
	
	// 직원 정보 업데이트
	@RequestMapping(value = "updateManage")
	@ResponseBody
	public String updateManage(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO vo = new ManageVO();
		vo = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageVO.setModifyId(vo.getId());
		
		resultParam = manageService.updateManage(manageVO);
		if(resultParam > 0) {
			result = "success";
		}
		return result;
		
	}
	
	// 계정 중복 여부 확인
	@RequestMapping(value = "manageDupIdCheck")
	@ResponseBody
	public String manageDupIdCheck(HttpServletRequest request,Model model,ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		resultParam = manageService.manageDupIdCheck(manageVO);
		if(resultParam > 0) {
			result = "dupId";
		}else if(resultParam == 0) {
			result = "success";
		}
		return result;
	}
	
	// 직원 그룹 목록
	@RequestMapping(value = "manageGroupList")
	public String manageGroupList(HttpServletRequest request,Model model) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		ManageGroupVO manageGroupVO = new ManageGroupVO();
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		manageGroupVO.setAuthority(manageVO.getAuthority());
		
		List<ManageGroupVO> manageGroupList = manageService.manageGroupList(manageGroupVO);
		model.addAttribute("manageGroupList", manageGroupList);
		
		int paramTotalCount = 0;
		paramTotalCount = manageService.manageGroupTotalCount(manageGroupVO);
		manageGroupVO.setTotalCount(paramTotalCount);
		manageGroupVO.setTotalPage(this.totalPage(paramTotalCount, manageGroupVO));
		manageGroupVO.setEndPage(this.endPage(manageGroupVO));
		
		model.addAttribute("manageGroupVO", manageGroupVO);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupList";
		
	}
	
	// 직원 목록 화면에서의 검색
	@RequestMapping(value = "searchManageGroupList")
	@ResponseBody
	public HashMap<String, Object> searchManageGroupList(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception{
		
		ManageVO vo = new ManageVO();
		vo = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		manageGroupVO.setParamPage((manageGroupVO.getTotalRow()*manageGroupVO.getPageNum())-manageGroupVO.getTotalRow());
		manageGroupVO.setStoreSeq(vo.getStoreSeq());
		List<ManageGroupVO> list = manageService.manageGroupList(manageGroupVO);

		int paramTotalCount = 0;
		paramTotalCount = manageService.manageGroupTotalCount(manageGroupVO);
		
		if(list.size() == 0) {
			manageGroupVO.setParamPage(0);
			manageGroupVO.setPageNum(1);
			manageGroupVO.setPageRow(0);

			if(paramTotalCount != 0) {
				manageGroupVO.setStartPage(1);
				manageGroupVO.setTotalPage(this.totalPage(paramTotalCount, manageGroupVO));
				manageGroupVO.setEndPage(this.endPage(manageGroupVO));
				list = manageService.manageGroupList(manageGroupVO);
				hashMap.put("result", "success");
				hashMap.put("manageGroupList", list);
			}else {
				hashMap.put("result", "noCount");
			}
			
		} else if(list.size() > 0) {
			int paramStartPage = 0;
			int paramEndPage = 0;
			paramStartPage = (manageGroupVO.getPageRow()*5)+1;
			
			manageGroupVO.setTotalCount(paramTotalCount);
			manageGroupVO.setTotalPage(this.totalPage(paramTotalCount, manageGroupVO));
			paramEndPage = this.endPage(manageGroupVO);
			manageGroupVO.setStartPage(paramStartPage);
			manageGroupVO.setEndPage(paramEndPage);
			hashMap.put("result", "success");
			hashMap.put("manageGroupList", list);
		} else {
			manageGroupVO.setParamPage(0);
			manageGroupVO.setPageNum(1);
			manageGroupVO.setPageRow(0);
			hashMap.put("result", "fail");
		}
		hashMap.put("manageGroupVO", manageGroupVO);
		
		return hashMap;
	}
	
	// 직원 그룹  사용 여부 변경 
	@RequestMapping(value = "updateGroupUseYnState")
	@ResponseBody
	public String updateGroupUseYnState(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setModifyId(manageVO.getId());
		
		resultParam = manageService.updateGroupUseYnState(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return result;
		
	}
	
	// 직원 그룹 등록 화면 이동
	@RequestMapping(value = "manageGroupRegister")
	public String manageGroupRegister(HttpServletRequest request,Model model) throws Exception {
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupRegister";
		
	}
	
	// 직원 그룹 등록
	@RequestMapping(value = "insertManageGroup")
	@ResponseBody
	public String insertManageGroup(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		manageGroupVO.setRegisterId(manageVO.getId());
		manageGroupVO.setModifyId(manageVO.getId());
		resultParam = manageService.insertManageGroup(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		return result;
		
	}
	
	// 직원 그룹 상세
	@RequestMapping(value = "manageGroupDetail")
	public String manageGroupDetail(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		ManageGroupVO vo = new ManageGroupVO();
		vo = manageService.manageGroupDetail(manageGroupVO);
		
		model.addAttribute("manageGroupDetail", vo);
		
		// 경로 체크
		String currentPath = (String)request.getSession().getAttribute("nowPath");
		if(!currentPath.equals(menuFirstRoot)) {
			request.getSession().removeAttribute("nowPath");
			request.getSession().setAttribute("nowPath", menuFirstRoot);
		}
		
		return "/manage/manageGroupDetail";
		
	}
	
	// 직원 그룹 업데이트
	@RequestMapping(value = "updateManageGroup")
	@ResponseBody
	public String updateManageGroup(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setModifyId(manageVO.getId());
		resultParam = manageService.updateManageGroup(manageGroupVO);
		if(resultParam > 0) {
			result = "success";
		}
		
		return result;
		
	}
	
	
	// 직원 그룹명 중복 여부 확인
	@RequestMapping(value = "manageGroupDupCheck")
	@ResponseBody
	public String manageGroupDupCheck(HttpServletRequest request,Model model,ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		String result = "fail";
		
		ManageVO manageVO = new ManageVO();
		manageVO = (ManageVO)request.getSession().getAttribute("manageInfo");
		
		manageGroupVO.setStoreSeq(manageVO.getStoreSeq());
		resultParam = manageService.manageGroupDupCheck(manageGroupVO);
		if(resultParam > 0) {
			result = "dupName";
		}else if(resultParam == 0) {
			result = "success";
		}
		return result;
	}
	
	// 마지막 페이지 점검1
	public int endPage(ManageVO manageVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = manageVO.getPageRow()*5+5;
		paramTotalPage = manageVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	// 마지막 페이지 점검2 
	public int endPage(ManageGroupVO manageGroupVO) {
		
		int paramEndPage = 0;
		int paramTotalPage = 0;
		
		paramEndPage = manageGroupVO.getPageRow()*5+5;
		paramTotalPage = manageGroupVO.getTotalPage();
		
		if(paramEndPage >= paramTotalPage) {
			paramEndPage = paramTotalPage;
		}
		
		return paramEndPage;
	}
	
	// 전체 페이지 설정1
	public int totalPage(int totalCount,ManageVO manageVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%manageVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/manageVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/manageVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
	// 전체 페이지 설정2
	public int totalPage(int totalCount,ManageGroupVO manageGroupVO) {
		
		int paramTotalPage = 0;
		
		if(totalCount%manageGroupVO.getTotalRow() == 0) {
			paramTotalPage = totalCount/manageGroupVO.getTotalRow();
		} else {
			paramTotalPage = (totalCount/manageGroupVO.getTotalRow())+1;
		}
		
		return paramTotalPage;
	}
}
