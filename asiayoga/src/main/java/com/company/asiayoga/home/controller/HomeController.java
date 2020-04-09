package com.company.asiayoga.home.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.xmlbeans.impl.jam.internal.parser.ParamStructPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home(HttpServletRequest request,Locale locale, Model model) {
		
		/*
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */		
		
		Device device = DeviceUtils.getCurrentDevice(request);
		
		String deviceType = "unknown";
		
		String paramUrl ="home";
		if(device == null) {
			deviceType = "null";
		}
		
		if(device.isNormal()) {
			deviceType = "nomal";
		} else if(device.isMobile()) {
			deviceType = "mobile";
		} else if (device.isTablet()) {
			deviceType = "tablet";
		} 
		
		return paramUrl;
	}
	
	
	
	@RequestMapping(value = "/accessDeniedPage")
	public String accessDeniedPage(Locale locale, Model model) {
		
		return "/error/accessDeniedPage";
	}
	
	
}
