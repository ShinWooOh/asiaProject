package com.company.asiayoga.handler;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.company.asiayoga.user.service.UserService;
import com.company.asiayoga.util.MessageUtils;;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	@Inject
	private UserService userService;
	
	private String loginIdName;
	private String loginPasswdName;
	private String errorMsgName;
	private String defaultFailureUrl;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String userName = request.getParameter(loginIdName);
		String passwd = request.getParameter(loginPasswdName);
		String errormsg = null;
		
		if(exception instanceof BadCredentialsException) {
			loginFailureCount(userName);
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		} else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		} else if(exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("error.Disabled");
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("error.CredentialsExpired");
		} 
		
		request.setAttribute(loginIdName, userName);
		request.setAttribute(loginPasswdName, passwd);
		request.setAttribute(errorMsgName, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	protected void loginFailureCount(String userName) {
		userService.updateFailureCount(userName);
		int paramCnt = userService.checkFailureCount(userName);
		if(paramCnt == 3) {
			userService.updateEnabled(userName);
		}
	}
	
	public String getLoginIdName() {
		return loginIdName;
	}

	public void setLoginIdName(String loginIdName) {
		this.loginIdName = loginIdName;
	}

	public String getLoginPasswdName() {
		return loginPasswdName;
	}

	public void setLoginPasswdName(String loginPasswdName) {
		this.loginPasswdName = loginPasswdName;
	}

	public String getErrorMsgName() {
		return errorMsgName;
	}

	public void setErrorMsgName(String errorMsgName) {
		this.errorMsgName = errorMsgName;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
