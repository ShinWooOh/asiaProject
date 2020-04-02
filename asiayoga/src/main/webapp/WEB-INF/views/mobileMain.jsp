<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html style="height: 100px !important;">
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

<body id="mainBody">

<div class="row">
	<div class="col-md-6 leftBody">
		<div style="height: 20%;">
			<div id="btnBoxHeader">
				<input type="button" id="leftButtonSet1" value="레이디요가" readonly="readonly">
			</div>
		</div>
		<div style="height: 50%; width: 100%;">
			<div id="btnBoxBody">
				<img alt="mainImg" src="${pageContext.request.contextPath}/resources/image/health_logo.jpg" id="mainImg">
			</div>
		</div>
		<div style="height: 20%;">
			<div id="btnBoxFooter">
				<input type="button" id="leftButtonSet2" value="직원호출" readonly="readonly" style="cursor: auto;">
			</div>
		</div>
	</div>
	<div class="col-md-6 rightBody">
		<div class="col-md-12" id="rightRow1">
			<input type="button" id="rightbtn1" value="회원정보를 입력해 주세요" readonly="readonly">
		</div>
		<div class="col-md-12" id="rightRow2">
			<input type="button" id="rightbtn2" value="" readonly="readonly">
		</div>
		<div class="col-md-12" id="rightRow3">
			<input type="button" id="rightbtn3_1" value="1">
			<input type="button" id="rightbtn3_2" value="2">
			<input type="button" id="rightbtn3_3" value="3">
		</div>
		<div class="col-md-12" id="rightRow4">
			<input type="button" id="rightbtn4_1" value="4">
			<input type="button" id="rightbtn4_2" value="5">
			<input type="button" id="rightbtn4_3" value="6">
		</div>
		<div class="col-md-12" id="rightRow5">
			<input type="button" id="rightbtn5_1" value="7">
			<input type="button" id="rightbtn5_2" value="8">
			<input type="button" id="rightbtn5_3" value="9">
		</div>
		<div class="col-md-12" id="rightRow6">
			<input type="button" id="rightbtn6_1" value="확인">
			<input type="button" id="rightbtn6_2" value="0">
			<input type="button" id="rightbtn6_3" value="취소">
			<!-- <button type="submit" class="btn btn-lg btn-primary btn-block btn-flat" style=" height: 34px; font-size: 14px;">로그인</button> -->
		</div>
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
	
	defaultCss();
	
});


function defaultCss() {
	
	$("#mainBody").css({
		"background-color"		: "#d2d6de"
	});
	
	$(".leftBody").css({
		"height"				: "800px",
		"margin-top"			: "20px"
	});
	
	$(".rightBody").css({
		"height"				: "800px",
		"margin-top"			: "20px"
	});
	
	$("#btnBoxHeader").css({
		"background-color"	: "#d2d6de"
	});
	
	
	$("#btnBoxBody").css({
		
	});
	
	$("#btnBoxFooter").css({
		"background-color"	: "#d2d6de"
	});
	
	$("#mainImg").css({
		"width"				: "100%",
		"margin-top"		: "20px",
		"margin-left"		: "40px",
		"padding-right"		: "66px"
	});
	
	$("#leftButtonSet1").css({
		"margin-top"		: "40px",
		"margin-left"		: "40px",
		"height"			: "100px",
		"background-color"	: "#EEFF41",
		"color"				: "#757575",
		"border"			: "1px solid #EEFF41",
		"width"				: "90%",
		"fontSize"			: "32px",
		"cursor"			: "auto;",
		"font-weight"		: "bold"
	});
	
	$("#leftButtonSet2").css({
		"margin-top"		: "40px",
		"margin-left"		: "40px",
		"height"			: "100px",
		"background-color"	: "#EEFF41",
		"color"				: "#757575",
		"border"			: "1px solid #EEFF41",
		"width"				: "90%",
		"fontSize"			: "32px",
		"cursor"			: "auto;",
		"font-weight"		: "bold"
	});
	
	$("#rightRow1,#rightRow2,#rightRow3,#rightRow4,#rightRow5,#rightRow6").css({
		"width"				: "100%"
	});
	$("#rightbtn1").css({
		"margin-top"		: "20px",
		"margin-left"		: "40px",
		"height"			: "100px",
		"background-color"	: "#FFFFFF",
		"border-color"		: "#000000",
		"border-radius"		: "3px",
		"color"				: "#757575",
		"border"			: "1px solid #000000",
		"width"				: "90%",
		"fontSize"			: "32px"
	});
	
	$("#rightbtn2").css({
		"margin-top"		: "20px",
		"margin-left"		: "40px",
		"height"			: "120px",
		"background-color"	: "#FFFFFF",
		"border-color"		: "#000000",
		"border-radius"		: "3px",
		"color"				: "#757575",
		"border"			: "1px solid #000000",
		"width"				: "90%",
		"fontSize"			: "32px"
	});
	
	$("#rightbtn3_1,#rightbtn3_2,#rightbtn3_3,#rightbtn4_1,#rightbtn4_2,#rightbtn4_3,#rightbtn5_1,#rightbtn5_2,#rightbtn5_3,#rightbtn6_1,#rightbtn6_2,#rightbtn6_3").css({
		"margin-top"		: "10px",
		"margin-left"		: "40px",
		"height"			: "100px",
		"border"			: "1px solid #DDDDDD",
		"width"				: "25%",
		"fontSize"			: "32px",
		"font-weight"		: "bold"
	});
	
}
</script>
</body>
</html>
