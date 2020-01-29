package com.company.asiayoga.handler;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.ui.Model;

import com.company.asiayoga.manage.domain.ManageVO;
import com.company.asiayoga.manage.service.ManageService;
import com.company.asiayoga.user.service.UserService;
import com.mysql.cj.Session;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	Logger log = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	private String loginIdName;
	private String defaultUrl;
	
	@Inject
	private UserService userService;
	
	@Inject
	private ManageService manageService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String userName = request.getParameter(loginIdName);
		
		// �α��� ���� �� ����Ƚ�� �ʱ�ȭ
		userService.updateFailureCountReset(userName);
		
		//���� ���� �����
		clearAuthenticationAttributes(request);
		
		//Redirect URL �۾�
		resultRedirectStrategy(request, response, authentication);
		
		// �α��� ���� �� �ش� ����� �̸� �� ���� ���� ��������
		ManageVO manageVO = new ManageVO();
		manageVO.setId(userName);
		try {
			manageVO = manageService.manageInfo(userName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("manageInfo",manageVO);
		
		// ���ǿ� ��� ���� ���
		String nowPath = "attendance";
		session.setAttribute("nowPath", nowPath);
	}

	
	public String getLoginIdName() {
		return loginIdName;
	}

	public void setLoginIdName(String loginIdName) {
		this.loginIdName = loginIdName;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
	
	//Redirect URL �۾�
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
		
	}
	
	//���� ���� �����
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) {return;}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	

}
