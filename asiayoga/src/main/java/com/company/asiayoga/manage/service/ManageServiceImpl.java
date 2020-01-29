package com.company.asiayoga.manage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.manage.dao.ManageDAO;
import com.company.asiayoga.manage.domain.ManageVO;

@Service
public class ManageServiceImpl implements ManageService {

	@Inject
	private ManageDAO manageDAO;

	@Override
	public ManageVO manageInfo(String id) throws Exception {
		return manageDAO.manageInfo(id);
	}
}
