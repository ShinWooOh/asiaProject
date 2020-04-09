<!DOCTYPE html>
<html id="headBody">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

  	<title>Mobile LOGIN</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/common.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body id="mainBody">

<div class="row" style="height: 100%; width: 100%;">
	<div class="col-md-6 leftBody">
		<div style="height: 20%;">
			<div id="btnBoxHeader">
				<input type="button" id="leftButtonSet1" value="${mobileVO.storeName}" readonly="readonly" style="cursor: auto;">
				<input type="hidden" id="storeSeq" value="${mobileVO.storeSeq}">
				<input type="hidden" id="storeName" value="${mobileVO.storeName}">
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
				<input type="button" id="leftButtonSet3" value="초기화" readonly="readonly" style="cursor: auto;" onclick="goReset();">
			</div>
		</div>
	</div>
	<div class="col-md-6 rightBody">
		<div class="col-md-12" id="rightRow1">
			<button id="rightbtn1" style="cursor: auto;">회원정보를 입력해 주세요</button>
			<!-- <input type="button" id="rightbtn1" value="회원정보를 입력해 주세요" readonly="readonly" style="cursor: auto;"> -->
		</div>
		<div class="col-md-12" id="rightRow2">
			<input type="button" id="rightbtn2" value="" readonly="readonly" style="cursor: auto;">
		</div>
		<div class="col-md-12" id="rightRow3">
			<input type="button" id="rightbtn3_1" value="1" onclick="insertNumber(1);">
			<input type="button" id="rightbtn3_2" value="2" onclick="insertNumber(2);">
			<input type="button" id="rightbtn3_3" value="3" onclick="insertNumber(3);">
		</div>
		<div class="col-md-12" id="rightRow4">
			<input type="button" id="rightbtn4_1" value="4" onclick="insertNumber(4);">
			<input type="button" id="rightbtn4_2" value="5" onclick="insertNumber(5);">
			<input type="button" id="rightbtn4_3" value="6" onclick="insertNumber(6);">
		</div>
		<div class="col-md-12" id="rightRow5">
			<input type="button" id="rightbtn5_1" value="7" onclick="insertNumber(7);">
			<input type="button" id="rightbtn5_2" value="8" onclick="insertNumber(8);">
			<input type="button" id="rightbtn5_3" value="9" onclick="insertNumber(9);">
		</div>
		<div class="col-md-12" id="rightRow6">
			<input type="button" id="rightbtn6_1" value="확인" onclick="confirmNumber();">
			<input type="button" id="rightbtn6_2" value="0" onclick="insertNumber(0);">
			<input type="button" id="rightbtn6_3" value="취소" onclick="deleteNumber();">
			<input type="hidden" id="mobileAppFlag" value="${mobileVO.mobileAppFlag}">
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


function insertNumber(paramNum) {
	
	var paramPhone = "";
	var paramLength = 0;
	paramPhone = $("#rightbtn2").val();
	paramLength = paramPhone.length;
	if(paramLength == 0){
		paramPhone += paramNum;
	} else {
		if(paramLength == 3 || paramLength == 8){
			paramPhone += "-"+paramNum;
		} else if(paramLength == 13) {
			
		} else {
			paramPhone += paramNum;
		}
	}
	
	/* $("#rightRow3").css("margin-top","6px"); */
	$("#rightbtn2").val(paramPhone);
}

function confirmNumber() {
	var paramPhone = "";
	paramPhone = $("#rightbtn2").val();
	var paramMobileAppFlag = "";
	paramMobileAppFlag = $("#mobileAppFlag").val();
	
	if(paramPhone = ""){
		$("#rightbtn1").text("");
		$("#rightbtn1").append("직원 호출 부탁드리겠습니다.");
		return false;
	}
	
	if(paramMobileAppFlag != "mobileApp_tablet"){
		$("#rightbtn1").text("");
		$("#rightbtn1").append("직원 호출 부탁드리겠습니다.");
		return false;
	}
	$.ajax({
        type:'get',
        url : "/mobile/mobileAttendance",
        data:{ 	storeSeq		:	$("#storeSeq").val(),
        		storeName		:	$("#storeName").val(),
        		phone			:	$("#rightbtn2").val(),
        		mobileAppFlag	:	$("#mobileAppFlag").val()
        	},
        success : function(data){
            if(data.result == 'success') {
            	resultInfo(data.mobileVO);
            } else if(data.result == 'noMember'){
				$("#rightbtn1").text("");
				$("#rightbtn1").append("존재하지 않는 회원 정보 입니다.<br>직원 호출 부탁드리겠습니다.");
				defaultCss();
	            return false;
            } else if (data.result == 'adjournmentMember'){
				$("#rightbtn1").text("");
				$("#rightbtn1").append("회원님은 현재 휴회중인 상태입니다.<br>직원 호출 부탁드리겠습니다.");
				defaultCss();
	            return false;
            }else if(data.result == 'errorRoot'){
				$("#rightbtn1").text("");
				$("#rightbtn1").append("직원 호출 부탁드리겠습니다.");
				defaultCss();
	            return false;
            } else {
				$("#rightbtn1").text("");
				$("#rightbtn1").append("직원 호출 부탁드리겠습니다.");
				defaultCss();
	            return false;
            	
            }
        },
        error:function(request,status,error){
			$("#rightbtn1").text("");
			$("#rightbtn1").append("직원 호출 부탁드리겠습니다.");
       }
	});
}

function resultInfo(mobileVO) {
	var paramName = "";
	paramName = mobileVO.name;
	
	var paramInfo = "";
	paramInfo = paramName+"님 출석하였습니다.";
	$("#rightbtn1").text("");
	$("#rightbtn1").append(paramInfo);
	
	setTimeout(function() {
		$("#rightbtn1").text("");
		$("#rightbtn1").append("회원정보를 입력해 주세요");
		$("#rightbtn2").val("");
		defaultCss();
	},5000); 
	setTimeout(function() {
		$("#rightbtn1").text("");
		$("#rightbtn1").append("회원정보를 입력해 주세요");
		$("#rightbtn2").val("");
		defaultCss();
	},5000); 
	
}

function deleteNumber() {
	var paramPhone = "";
	var paramLength = 0;
	paramPhone = $("#rightbtn2").val();
	paramLength = paramPhone.length;
	
	if(paramLength != 0){
		paramPhone = paramPhone.substring(0,paramLength-1);
		$("#rightbtn2").val(paramPhone);
	}
}

function goReset() {
	$("#rightbtn1").text("회원정보를 입력해 주세요");
	$("#rightbtn2").val("");
}

function defaultCss() {
	

	
	$("#mainBody").css({
		"height"				: "100%",
		"background-color"		: "#d2d6de"
	});
	
	$(".leftBody").css({
		"height"				: "100%",
		"margin-top"			: "20px"
	});
	
	$(".rightBody").css({
		"height"				: "100%",
		"margin-top"			: "20px"
	});
	
	$("#btnBoxHeader").css({
		"background-color"	: "#d2d6de"
	});
	
	
	$("#btnBoxBody").css({
		
	});
	
	$("#btnBoxFooter").css({
		"width"				: "100%",
		"background-color"	: "#d2d6de"
	});
	
	$("#mainImg").css({
		"width"				: "100%",
		"margin-top"		: "40px",
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
		"width"				: "53%",
		"height"			: "100px",
		"background-color"	: "#EEFF41",
		"color"				: "#757575",
		"border"			: "1px solid #EEFF41",
		"fontSize"			: "32px",
		"cursor"			: "auto",
		"font-weight"		: "bold"
	});
	
	$("#leftButtonSet3").css({
		"margin-top"		: "40px",
		"margin-left"		: "40px",
		"width"				: "30%",
		"height"			: "100px",
		"background-color"	: "#EEFF41",
		"color"				: "#757575",
		"border"			: "1px solid #EEFF41",
		"fontSize"			: "32px",
		"cursor"			: "auto",
		"font-weight"		: "bold"
	});
	
	$("#rightRow1").css({
		"width"					: "100%",
		"height"				: "150px"
	});
	
	$("#rightRow2").css({
		"width"					: "100%",
		"height"				: "90px",
		"margin-bottom"			: "20px"
	});
	
	$("#rightRow3,#rightRow4,#rightRow5,#rightRow6").css({
		"width"					: "100%",
		"height"				: "110px"
	});
	
	$("#rightbtn1").css({
		"margin-top"		: "20px",
		"margin-left"		: "40px",
		"height"			: "140px",
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
		"height"			: "80px",
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
