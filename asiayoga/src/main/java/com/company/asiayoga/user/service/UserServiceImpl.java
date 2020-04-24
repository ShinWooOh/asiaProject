package com.company.asiayoga.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.user.dao.UserAuthDAO;
import com.company.asiayoga.user.domain.CustomUserDetail;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserAuthDAO userAuthDAO;

	@Transactional
	@Override
	public int updateFailureCount(String userName) {
		return userAuthDAO.updateFailureCount(userName);
	}

	@Transactional
	@Override
	public int checkFailureCount(String userName) {
		return userAuthDAO.checkFailureCount(userName);
	}

	@Transactional
	@Override
	public int updateEnabled(String userName) {
		return userAuthDAO.updateEnabled(userName);
	}

	@Transactional
	@Override
	public int updateFailureCountReset(String userName) {
		return userAuthDAO.updateFailureCountReset(userName);
	}

	@Transactional
	@Override
	public int updateAccessDate(String userName) {
		return userAuthDAO.updateAccessDate(userName);
	}

	@Override
	public CustomUserDetail userDetailInfo(String userName) {
		return userAuthDAO.userDetailInfo(userName);
	}

	
	
}
