<%@page import="java.util.HashMap"%>
<%@ page import="com.company.asiayoga.mobile.member.domain.MobileMemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ page import="com.company.asiayoga.mobile.member.MobileController" %>

<%
	// 이곳에서 request.getParameter로 안드로이드에서 보낸 값들을 받음
	// 안드로이드에서 보낸 sendMsg = "phone="+string[0]; 여기서 
	// 키 값과 request.getParameter 안의 값이 같아야 한다. 당연히 데이터 타입두 같아야 한다.
	String phone = request.getParameter("phone");
	int storeSeq = Integer.parseInt(request.getParameter("storeSeq"));
	
	MobileMemberVO mobileMeberVO = new MobileMemberVO();
	mobileMeberVO.setPhone(phone);
	mobileMeberVO.setStoreSeq(storeSeq);
	
	MobileController mobileMemberLogin = new MobileController();
	String result = "";
	HashMap<String,String> hashMap = new HashMap<String,String>();
	/* hashMap = mobileMemberLogin.MemberLogin(request); */
	result = hashMap.get("result");
	
	System.out.println("요청 결과 : "+result);
%>
