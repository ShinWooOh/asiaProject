<%@page import="java.util.HashMap"%>
<%@ page import="com.company.asiayoga.mobile.member.domain.MobileMemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ page import="com.company.asiayoga.mobile.member.MobileController" %>

<%
	// �̰����� request.getParameter�� �ȵ���̵忡�� ���� ������ ����
	// �ȵ���̵忡�� ���� sendMsg = "phone="+string[0]; ���⼭ 
	// Ű ���� request.getParameter ���� ���� ���ƾ� �Ѵ�. �翬�� ������ Ÿ�Ե� ���ƾ� �Ѵ�.
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
	
	System.out.println("��û ��� : "+result);
%>
