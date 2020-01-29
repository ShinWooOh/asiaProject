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
		
		// 로그인 성공 시 실패횟수 초기화
		userService.updateFailureCountReset(userName);
		
		//에러 세션 지우기
		clearAuthenticationAttributes(request);
		
		//Redirect URL 작업
		resultRedirectStrategy(request, response, authentication);
		
		// 로그인 성공 시 해당 사용자 이름 및 매장 정보 가져오기
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
		
		// 세션에 경로 정보 담기
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
	
	//Redirect URL 작업
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
		
	}
	
	//에러 세션 지우기
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) {return;}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	

}
