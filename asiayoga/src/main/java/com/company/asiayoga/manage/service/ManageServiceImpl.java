package com.company.asiayoga.manage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.manage.dao.ManageDAO;
import com.company.asiayoga.manage.domain.ManageGroupVO;
import com.company.asiayoga.manage.domain.ManageVO;

@Service
public class ManageServiceImpl implements ManageService {

	@Inject
	private ManageDAO manageDAO;

	@Override
	public ManageVO manageInfo(String id) throws Exception {
		return manageDAO.manageInfo(id);
	}

	@Override
	public List<ManageVO> manageList(ManageVO manageVO) throws Exception {
		return manageDAO.manageList(manageVO);
	}

	@Override
	public int manageTotalCount(ManageVO manageVO) throws Exception {
		return manageDAO.manageTotalCount(manageVO);
	}
	
	@Override
	public int updateEnableState(ManageVO manageVO) throws Exception {
		return manageDAO.updateEnableState(manageVO);
	}

	@Override
	public int insertManage(ManageVO manageVO) throws Exception {
		return manageDAO.insertManage(manageVO);
	}
	
	@Override
	public ManageVO manageInfo(ManageVO manageVO) throws Exception {
		
		ManageVO vo = new ManageVO();
		vo = manageDAO.manageInfo(manageVO);
		
		String arrPhone[] = vo.getPhone().split("-");
	    String phone1 = arrPhone[0];
	    String phone2 = arrPhone[1];
	    String phone3 = arrPhone[2];
	    
	    vo.setPhone1(phone1);
	    vo.setPhone2(phone2);
	    vo.setPhone3(phone3);
		
		return vo;
	}
	
	@Override
	public int manageDupIdCheck(ManageVO manageVO) throws Exception {
		
		int resultParam = 0;
		
		List<ManageVO> list = manageDAO.manageDupIdCheck(manageVO); 
		
		if(list.size() > 0) {
			resultParam = 1;
		}
		
		return resultParam;
	}

	@Override
	public int updateManage(ManageVO manageVO) throws Exception {
		return manageDAO.updateManage(manageVO);
	}
	
	@Override
	public List<ManageGroupVO> manageGroupList(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupList(manageGroupVO);
	}
	
	@Override
	public int manageGroupTotalCount(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupTotalCount(manageGroupVO);
	}

	@Override
	public int updateGroupUseYnState(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.updateGroupUseYnState(manageGroupVO);
	}

	@Override
	public int manageGroupDupCheck(ManageGroupVO manageGroupVO) throws Exception {
		
		int resultParam = 0;
		
		List<ManageGroupVO> list = manageDAO.manageGroupDupCheck(manageGroupVO); 
		
		if(list.size() > 0) {
			resultParam = 1;
		}
		
		return resultParam;
	}

	@Override
	public int insertManageGroup(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.insertManageGroup(manageGroupVO);
	}

	@Override
	public ManageGroupVO manageGroupDetail(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.manageGroupDetail(manageGroupVO);
	}

	@Override
	public int updateManageGroup(ManageGroupVO manageGroupVO) throws Exception {
		return manageDAO.updateManageGroup(manageGroupVO);
	}




	
	
}

