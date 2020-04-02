<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

  	<title>ASIA MANAGE LOGIN</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css">
	
	<!-- <link rel="stylesheet" href="/resources/common/css/common.css"> -->
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition login-page">

<div class="login-box">
	<div class="login-logo">
		<h1 class="form-signin-heading">ASIA MANAGE LOGIN</h1>
	</div>
	<div class="login-box-body">
		<form class="form-signin" action="/" method="post">
			<div class="form-group has-feedback">
				<input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요." required autofocus value="${id}" style=" height: 34px; font-size: 14px;">
			</div>
			<div class="form-group has-feedback">
				<input type="password" id="passwd" name="passwd" class="form-control" placeholder="Password" required value="${passwd}" style=" height: 34px; font-size: 14px;">
			</div>
			<div class="form-group has-feedback">
				<c:if test="${not empty ERRORMSG}">
					<font color="red">
					 		<p>${ERRORMSG}</p>
					</font>
				</c:if>
			</div>
			<div class="form-group has-feedback">
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				<button type="submit" class="btn btn-lg btn-primary btn-block btn-flat" style=" height: 34px; font-size: 14px;">로그인</button>
			</div>
		</form>
	</div>
</div> <!-- /container -->


<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
}); 
</script>
</body>
</html>
