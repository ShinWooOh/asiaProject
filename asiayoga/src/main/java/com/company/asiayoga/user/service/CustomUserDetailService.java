package com.company.asiayoga.user.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.company.asiayoga.user.dao.UserAuthDAO;
import com.company.asiayoga.user.domain.CustomUserDetail;

public class CustomUserDetailService implements UserDetailsService  {

	@Inject
	private UserAuthDAO userAuthDAO;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		CustomUserDetail user = userAuthDAO.getUserById(userName);
		
		if(user == null) {
			throw new UsernameNotFoundException(userName);
		}
		
		return user;
	}

	
}
