<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


    <title>통계</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/fontawesome.min.css">
      <!-- Ionicons -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/common.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
        
        <!-- Right navbar links  -->
		<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
        
    </nav>
    <!-- /.navbar -->

    <!-- Left side column-->
    <%@ include file="/WEB-INF/views/include/left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="height: 900px;">
        <!-- Content Header (Page header) -->
        <div class="content-header" style="margin-bottom: -10px;">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">대시보드</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">통계</li>
                            <li class="breadcrumb-item active">대시보드</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="row">
	        <div class="col-lg-9">
		        <section class="content" style="width: 100%;">
					<div class="dataTables_wrapper form-inline">
						<div class="row" style="width: 100%;  background-color: #B3E5FC; margin-left: 10px;">
							<div class="col-lg-12 col-xs-6">
								<div class="inner" style="margin-top: 10px; margin-bottom: 5px;">
									<span style="color: white;">
										<font size="5px;">출석체크</font> 
									</span>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="small-box" id="bgAqua">
									<div class="inner">
										<h1><c:out value="${statisticsMemberVO.attendanceYesCount}"></c:out></h1>
										<p>출석 </p>
									</div>
									<div class="icon">
										<i class="fas fa-check"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;" data-toggle="modal" data-target="#findAttendanceYes">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="small-box bg-red">
									<div class="inner">
										<h1><c:out value="${statisticsMemberVO.attendanceNoCount}"></c:out></h1>
										<p>미출석</p>
									</div>
									<div class="icon">
										<i class="fas fa-check-double"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;" data-toggle="modal" data-target="#findAttendanceNo">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
			            </div>
			            <c:choose>
			            	<c:when test="${manageInfo.getAuthority() ne 'ROLE_STAFF'}">
								<div class="row" style="width: 100%;  background-color: #E1BEE7; margin-left: 10px;">
									<div class="col-lg-12 col-xs-6">
										<div class="inner" style="margin-top: 10px; margin-bottom: 5px;">
											<span style="color: white;">
												<font size="5px;">매출</font> 
											</span>
										</div>
									</div>
									<div class="col-lg-3 col-xs-6">
										<div class="small-box" id="bgAqua1">
											<div class="inner">
												<h4><fmt:formatNumber type="number" maxFractionDigits="3" value="${saleInfoVO.todaySales}" /></h4>
												<p>금일 매출</p>
											</div>
											<div class="icon">
												<i class="fas fa-calendar-day"></i>
											</div>
											<a class="small-box-footer" style="cursor:pointer;">
											자세히 보기
												<i class="fa fa-arrow-circle-right"></i>
											</a>
										</div>
									</div>
									<div class="col-lg-3 col-xs-6">
										<div class="small-box bg-green">
											<div class="inner">
												<h4><fmt:formatNumber type="number" maxFractionDigits="3" value="${saleInfoVO.weekSales}" /></h4>
												<p>금주 매출</p>
											</div>
											<div class="icon">
												<i class="fas fa-calendar-week"></i>
											</div>
											<a class="small-box-footer" style="cursor:pointer;">
											자세히 보기
												<i class="fa fa-arrow-circle-right"></i>
											</a>
										</div>
									</div>
									<div class="col-lg-3 col-xs-6">
										<div class="small-box bg-yellow" style="color: #FFFFFF !important;">
											<div class="inner">
												<h4><fmt:formatNumber type="number" maxFractionDigits="3" value="${saleInfoVO.monthSales}" /></h4>
												<p><c:out value="${saleInfoVO.thisMonth}"/>월 매출</p>
											</div>
											<div class="icon">
												<i class="far fa-calendar-alt"></i>
											</div>
											<a class="small-box-footer" style="cursor:pointer; color: #FFFFFF !important;"">
											자세히 보기
												<i class="fa fa-arrow-circle-right"></i>
											</a>
										</div>
									</div>
									<div class="col-lg-3 col-xs-6">
										<div class="small-box bg-red" id="bgGreen">
											<div class="inner">
												<h4><fmt:formatNumber type="number" maxFractionDigits="3" value="${saleInfoVO.yearSales}" /></h4>
												<p><c:out value="${saleInfoVO.thisYear}"/>년 매출</p>
											</div>
											<div class="icon">
												<i class="fas fa-calendar-alt"></i>
											</div>
											<a class="small-box-footer" style="cursor:pointer;">
											자세히 보기
												<i class="fa fa-arrow-circle-right"></i>
											</a>
										</div>
									</div>
					            </div>
			            	</c:when>
			            </c:choose>
			            <div class="row" style="width: 100%; margin-left: 10px; background-color: #69F0AE">
							<div class="col-lg-6 col-xs-6">
								<div class="small-box bg-yellow" style="color: #FFFFFF !important;">
									<div class="inner" style="margin-top: 20px; margin-bottom: 10px;">
										<h4>회원통계</h4>
										<p>금일 / 금주 / <c:out value="${statisticsMemberVO.thisMonth}"/>월 / <c:out value="${statisticsMemberVO.thisYear}"/>년</p>
									</div>
									<div class="icon">
										<i class="fas fa-user-plus"></i>
									</div>
									<a class="small-box-footer" onclick="showMemberStat();" style="cursor:pointer; color: #FFFFFF !important;">
									<input type="hidden" id="memberFlag" value="hide">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-6 col-xs-6">
								<div class="small-box bg-green">
									<div class="inner" style="margin-top: 20px; margin-bottom: 10px;">
										<h4>회원 주소 통계</h4>
										<p>자세히 보기 클릭 시 상위 4개 정보 제공</p>
									</div>
									<div class="icon">
										<i class="fas fa-user-plus"></i>
									</div>
									<a class="small-box-footer" onclick="showMemberAddStat();" style="cursor:pointer; color: #FFFFFF !important;">
									<input type="hidden" id="statFlag" value="hide">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
			            </div>
			            <div class="row" id="newMember">
			            	<div class="col-lg-3 col-xs-6">
								<div class="small-box" id="bgAqua2">
									<div class="inner">
										<h2><c:out value="${statisticsMemberVO.newWeekMember}"/></h2>
										<p>금주 신규 가입자</p>
									</div>
									<div class="icon">
										<i class="fas fa-user-plus"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-green" id="bgGreen">
									<div class="inner">
										<h2><c:out value="${statisticsMemberVO.newMonthMember}"/></h2>
										<p><c:out value="${statisticsMemberVO.thisMonth}"/>월 신규 가입자</p>
									</div>
									<div class="icon">
										<i class="fas fa-user-friends"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-yellow" id="bgYellow" style="color: #FFFFFF !important;">
									<div class="inner">
										<h2><c:out value="${statisticsMemberVO.newYearMember}"/></h2>
										<p><c:out value="${statisticsMemberVO.thisYear}"/>년 가입자</p>
									</div>
									<div class="icon">
										<i class="fas fa-users"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer; color: #FFFFFF !important;">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-red" id="bgRed">
									<div class="inner">
										<h2><c:out value="${statisticsMemberVO.totalMember}"/></h2>
										<p>전체 회원</p>
									</div>
									<div class="icon">
										<i class="fas fa-users"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
			            </div>
			            <div class="row" id="newAddStat">
			            	<div class="col-lg-3 col-xs-6">
								<div class="small-box" id="bgAqua3">
									<div class="inner">
										<h2><c:out value="${memberAddStat.firstAddressCount}"/></h2>
										<p><c:out value="${memberAddStat.firstAddress}"/></p>
									</div>
									<div class="icon">
										<i class="fas fa-user-plus"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;" onclick="memberAddStatExcel(${memberAddStat.storeSeq});">
									엑셀 다운로드
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-green" id="bgGreen">
									<div class="inner">
										<h2><c:out value="${memberAddStat.secondAddressCount}"/></h2>
										<p><c:out value="${memberAddStat.secondAddress}"/></p>
									</div>
									<div class="icon">
										<i class="fas fa-user-friends"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;" onclick="memberAddStatExcel(${memberAddStat.storeSeq});">
									엑셀 다운로드
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-yellow" id="bgYellow" style="color: #FFFFFF !important;">
									<div class="inner">
										<h2><c:out value="${memberAddStat.thirdAddressCount}"/></h2>
										<p><c:out value="${memberAddStat.thirdAddress}"/></p>
									</div>
									<div class="icon">
										<i class="fas fa-users"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer; color: #FFFFFF !important;" onclick="memberAddStatExcel(${memberAddStat.storeSeq});">
									엑셀 다운로드
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-red" id="bgRed">
									<div class="inner">
										<h2><c:out value="${memberAddStat.fourthAddressCount}"/></h2>
										<p><c:out value="${memberAddStat.fourthAddress}"/></p>
									</div>
									<div class="icon">
										<i class="fas fa-users"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;" onclick="memberAddStatExcel(${memberAddStat.storeSeq});">
									엑셀 다운로드
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
			            </div>
					</div>
		        </section>
	        </div>
	        <div class="col-lg-3">
		        <section class="content" style="width: 100%;">
		        	<div class="dataTables_wrapper form-inline">
						<div class="row">
			        		<div class="col-lg-12" align="center" style="margin-bottom: 5px;">
			        			<!-- 275*183  -->
			        			<img src="${pageContext.request.contextPath}/resources/image/add_01.png"  alt="User Image">
			        		</div>
				        	<div class="col-lg-12" align="center" style="margin-bottom: 5px;">
				        		<img src="${pageContext.request.contextPath}/resources/image/add_02.png"  alt="User Image">
				        	</div>
				        	<div class="col-lg-12" align="center" style="margin-bottom: 5px;">
				        		<img src="${pageContext.request.contextPath}/resources/image/add_03.png"  alt="User Image">
				        	</div>
				        	<div class="col-lg-12" align="center" style="margin-bottom: 5px;">
				        		<img src="${pageContext.request.contextPath}/resources/image/add_03.png"  alt="User Image">
				        	</div>
			        	</div>
	
			        </div>
		        </section>
	        </div>
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">
            <h5>Title</h5>
            <p>Sidebar content</p>
        </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <%-- <%@ include file="/WEB-INF/views/include/main_footer.jsp" %> --%>
</div>

<!-- REQUIRED SCRIPTS -->
<form:form action="/statistics/todayAttendanceYesExcelDown" id="todayAttendanceYesExcelDown" name="todayAttendanceYesExcelDown" modelAttribute="statisticsVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="attendanceFlag" name="attendanceFlag">
</form:form>
<form:form action="/statistics/todayAttendanceNoExcelDown" id="todayAttendanceNoExcelDown" name="todayAttendanceNoExcelDown" modelAttribute="statisticsVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="attendanceFlag" name="attendanceFlag">
</form:form>
<form:form action="/statistics/memberAddressStatExcel" id="memberAddressStatExcel" name="memberAddressStatExcel" modelAttribute="statisticsVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>


<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#excelBox").css({
		"float"							: "right",
		"margin-top"					: "5px",
		"margin-right"					: "10px",
		"background-color"				: "#d2d6de",
		"border-top-left-radius"		: "4px",
		"border-bottom-left-radius"		: "4px",
		"border-top-right-radius"		: "4px",
		"border-bottom-right-radius"	: "4px"
	});
	
	$(".excelBtn").css({
		"width"				: "120px",
		"text-align"		: "right",
		"font-weight"		: "bold",
		"cursor"			: "pointer",
		"border"			: "none",
		"background"		: "transparent"
	});
	defaultCss();
});

function showMemberStat() {
	
	var paramFlag = "hide";
	paramFlag = $("#memberFlag").val();
	
	if(paramFlag == "hide"){
		$("#newMember").show();
		$("#newAddStat").hide();
		$("#memberFlag").val("show");
		$("#statFlag").val("hide");
	}
	
	if(paramFlag == "show"){
		$("#newMember").hide();
		$("#newAddStat").hide();
		$("#memberFlag").val("hide");
		$("#statFlag").val("hide");
	}
}

function showMemberAddStat() {
	
	var paramFlag = "hide";
	paramFlag = $("#statFlag").val();
	
	if(paramFlag == "hide"){
		$("#newMember").hide();
		$("#newAddStat").show();
		$("#statFlag").val("show");
		$("#memberFlag").val("hide");
	}
	
	if(paramFlag == "show"){
		$("#newMember").hide();
		$("#newAddStat").hide();
		$("#statFlag").val("hide");
		$("#memberFlag").val("hide");
	}
}


function defaultCss() {

	$("#newMember").css({
		"width"				: "100%",
		"margin-left"		: "10px",
		"margin-bottom"		: "10px",
		"background"		: "#69F0AE",
		"color"				: "#FFFFFF"
	});
	
	$("#newMember").hide();
	
	$("#newAddStat").css({
		"width"				: "100%",
		"margin-left"		: "10px",
		"margin-bottom"		: "10px",
		"background"		: "#69F0AE",
		"color"				: "#FFFFFF"
	});
	$("#newAddStat").hide();
	
	
	$("#bgAqua").css({
		"background"		: "#00c0ef",
		"color"				: "#FFFFFF"
	});
	
	$("#bgAqua1").css({
		"background"		: "#00c0ef",
		"color"				: "#FFFFFF"
	});
	$("#bgAqua2").css({
		"background"		: "#00c0ef",
		"color"				: "#FFFFFF"
	});
	$("#bgAqua3").css({
		"background"		: "#00c0ef",
		"color"				: "#FFFFFF"
	});
	
	$("#popFindNameYes,#popFindNameNo").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#excelBoxYes, #excelBoxNo").css({
		"float"							: "right",
		"margin-right"					: "10px",
		"margin-bottom"					: "5px",
		"background-color"				: "#d2d6de",
		"border-top-left-radius"		: "4px",
		"border-bottom-left-radius"		: "4px",
		"border-top-right-radius"		: "4px",
		"border-bottom-right-radius"	: "4px"
	});
	
	$(".excelBtnYes , .excelBtnNo").css({
		"margin-left"		: "5px",
		"width"				: "120px",
		"text-align"		: "right",
		"font-weight"		: "bold",
		"cursor"			: "pointer",
		"border"			: "none",
		"background"		: "transparent"
	});
	$(".pagination").css({
		"display"			: "inline-block",
	});
	$(".pagination > li").css({
		"display"			: "inline"
	});
	$(".pagination > li > a").css({
		"background"		: "#fafafa",
		"position"			: "relative",
		"margin-left"		: "-3px",
		"margin-right"		: "1px",
		"padding"			: "6px 12px",
		"border"			: "1px solid #ddd"
	});
	$(".pagination > .disabled > a").css({
		"background"		: "#fff"
	});
	$(".pagination > li:first-child > a").css({
		"border-top-left-radius"	: "4px",
		"border-bottom-left-radius"	: "4px"
	});
	
	$(".pagination > li:last-child > a").css({
		"border-top-right-radius"		: "4px",
		"border-bottom-right-radius"	: "4px"
	});
}

/* 검색 조건 ,페이징  */
/* 검색 조건에 의한 목록  */
function searchNameYes() {
	
	var paramSearchWord = $("#popNameYes").val();
	var paramPageNum = $("#pageNumYes").val();
	var paramPageRow = $("#pageRowYes").val();
	
	$.ajax({
        type:'get',
        url : "/statistics/searchAttendanceYesList",
        data:{ 	searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshAttendanceYesList(data.attendanceYesList);
            	goRefreshPageYes(data.attendanceYesVO);
            } else if(data.result == 'noCount'){
            	goRefreshAttendanceNoCount('YES');
            } else {
	            alert("검색에 실패하였습니다. 관리자에게 문의하세요");
	            return false;
            }
        },
        error:function(request,status,error){
            alert("검색에 실패하였습니다. 관리자에게 문의하세요");
       }
	});
}


function goRefreshAttendanceYesList(attendanceYesList) {

	var paramAttendanceList = '';
	paramAttendanceList += '<tr>';
	paramAttendanceList += '<th>No</th>';
	paramAttendanceList += '<th>매장</th>';
	paramAttendanceList += '<th>회원번호</th>';
	paramAttendanceList += '<th>이름</th>';
	paramAttendanceList += '<th>성별</th>';
	paramAttendanceList += '<th>연락처</th>';
	paramAttendanceList += '</tr>';
	
	for(var i = 0 ;  i < attendanceYesList.length ; i++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramMyMembership =0;
		var paramName ='';
		var paramSex ='';
		var paramPhone ='';
		
		paramRowNum = attendanceYesList[i].rowNum;
		paramStoreSeq = attendanceYesList[i].storeSeq;
		paramStoreName = attendanceYesList[i].storeName;
		paramMyMembership = attendanceYesList[i].myMembership;
		paramName = attendanceYesList[i].name;
		paramSex = attendanceYesList[i].sex;
		paramPhone = attendanceYesList[i].phone;
		
		paramAttendanceList += '<tr>';
		paramAttendanceList += '<td>'+paramRowNum+'</td>';
		paramAttendanceList += '<td>'+paramStoreName+'</td>';
		paramAttendanceList += '<td>'+paramMyMembership+'</td>';
		paramAttendanceList += '<td>'+paramName+'</td>';
		paramAttendanceList += '<td>'+paramSex+'</td>'; 
		paramAttendanceList += '<td>'+paramPhone+'</td>'; 
		paramAttendanceList += '</tr>';
	}
		$("#attendanceYesHead").text("");
		$("#attendanceYesHead").append(paramAttendanceList);
		
}

function goRefreshPageYes(attendanceYesVO) {
	var paramPageList = '';
	
	if(attendanceYesVO.pageRow > 0){
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPageYes('+attendanceYesVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= attendanceYesVO.startPage; i <= attendanceYesVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(attendanceYesVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPageYes('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPageYes('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(attendanceYesVO.startPage == attendanceYesVO.totalPage){
			break;
		}
	}

	if(attendanceYesVO.endPage != attendanceYesVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPageYes('+attendanceYesVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowListYes").text("");
	$("#rowListYes").append(paramPageList);
	
	$("#pageNumYes").val(attendanceYesVO.pageNum);
	$("#pageRowYes").val(attendanceYesVO.pageRow);
	$("#totalPageYes").val(attendanceYesVO.totalPage);
	
	defaultCss();
	
}


/* 출석 */
/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPageYes(pageRow) {

	$("#pageNumYes").val(pageRow*5-4);
	$("#pageRowYes").val(pageRow-1);
	searchNameYes();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPageYes(pageRow) {
	
	$("#pageNumYes").val(pageRow*5+6);
	$("#pageRowYes").val(pageRow+1);
	searchNameYes();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPageYes(pageNum) {
	
	$("#pageNumYes").val(pageNum);
	searchNameYes();
}
/* 출석 영역 종료  */

/* 미출석 */
function searchNameNo() {
	
	var paramSearchWord = $("#popNameNo").val();
	var paramPageNum = $("#pageNumNo").val();
	var paramPageRow = $("#pageRowNo").val();
	
	$.ajax({
        type:'get',
        url : "/statistics/searchAttendanceNoList",
        data:{ 	searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshAttendanceNoList(data.attendanceNoList);
            	goRefreshPageNo(data.attendanceNoVO);
            } else if(data.result == 'noCount'){
            	goRefreshAttendanceNoCount('NO');
            } else {
	            alert("검색에 실패하였습니다. 관리자에게 문의하세요");
	            return false;
            }
        },
        error:function(request,status,error){
            alert("검색에 실패하였습니다. 관리자에게 문의하세요");
       }
	});
}


function goRefreshAttendanceNoList(attendanceNoList) {

	var paramAttendanceList = '';
	paramAttendanceList += '<tr>';
	paramAttendanceList += '<th>No</th>';
	paramAttendanceList += '<th>매장</th>';
	paramAttendanceList += '<th>회원번호</th>';
	paramAttendanceList += '<th>이름</th>';
	paramAttendanceList += '<th>성별</th>';
	paramAttendanceList += '<th>연락처</th>';
	paramAttendanceList += '</tr>';
	
	for(var k = 0 ;  k < attendanceNoList.length ; k++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramMyMembership =0;
		var paramName ='';
		var paramSex ='';
		var paramPhone ='';
		
		paramRowNum = attendanceNoList[k].rowNum;
		paramStoreSeq = attendanceNoList[k].storeSeq;
		paramStoreName = attendanceNoList[k].storeName;
		paramMyMembership = attendanceNoList[k].myMembership;
		paramName = attendanceNoList[k].name;
		paramSex = attendanceNoList[k].sex;
		paramPhone = attendanceNoList[k].phone;
		
		paramAttendanceList += '<tr>';
		paramAttendanceList += '<td>'+paramRowNum+'</td>';
		paramAttendanceList += '<td>'+paramStoreName+'</td>';
		paramAttendanceList += '<td>'+paramMyMembership+'</td>';
		paramAttendanceList += '<td>'+paramName+'</td>';
		paramAttendanceList += '<td>'+paramSex+'</td>'; 
		paramAttendanceList += '<td>'+paramPhone+'</td>'; 
		paramAttendanceList += '</tr>';
	}
		$("#attendanceNoHead").text("");
		$("#attendanceNoHead").append(paramAttendanceList);
		
}

function goRefreshPageNo(attendanceNoVO) {
	var paramPageList = '';
	
	if(attendanceNoVO.pageRow > 0){
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPageNo('+attendanceNoVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= attendanceNoVO.startPage; i <= attendanceNoVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(attendanceNoVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPageNo('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPageNo('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(attendanceNoVO.startPage == attendanceNoVO.totalPage){
			break;
		}
	}

	if(attendanceNoVO.endPage != attendanceNoVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPageNo('+attendanceNoVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowListNo").text("");
	$("#rowListNo").append(paramPageList);
	
	$("#pageNumNo").val(attendanceNoVO.pageNum);
	$("#pageRowNo").val(attendanceNoVO.pageRow);
	$("#totalPageNo").val(attendanceNoVO.totalPage);
	
	defaultCss();
	
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPageNo(pageRow) {

	$("#pageNumNo").val(pageRow*5-4);
	$("#pageRowNo").val(pageRow-1);
	searchNameNo();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPageNo(pageRow) {
	
	$("#pageNumNo").val(pageRow*5+6);
	$("#pageRowNo").val(pageRow+1);
	searchNameNo();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPageNo(pageNum) {
	
	$("#pageNumNo").val(pageNum);
	searchNameNo();
}
/* 미출석 영역 종료  */

/* 공통 영역 */
/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshAttendanceNoCount(attendanceFlag) {
	var paramAttendanceList = '';
	paramAttendanceList += '<tr>';
	paramAttendanceList += '<th>No</th>';
	paramAttendanceList += '<th>매장</th>';
	paramAttendanceList += '<th>회원번호</th>';
	paramAttendanceList += '<th>이름</th>';
	paramAttendanceList += '<th>성별</th>';
	paramAttendanceList += '<th>연락처</th>';
	paramAttendanceList += '</tr>';
	paramAttendanceList += '<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	
	if(attendanceFlag == 'YES'){
		$("#attendanceYesHead").text("");
		$("#attendanceYesHead").append(paramAttendanceList);
	}
	
	if(attendanceFlag == 'NO'){
		$("#attendanceNoHead").text("");
		$("#attendanceNoHead").append(paramAttendanceList);
	}
	defaultCss();
}


function popAttendanceYesClose(){
	
	$("#popNameYes").val("");
	searchNameYes();
}

function popAttnedanceNoClose(){
	
	$("#popNameNo").val("");
	searchNameNo();
}
/* 검색 조건 ,페이징  */

/* 엑셀 다운로드 기능  */
function attendanceExcelDown(storeSeq,attendanceFlag) {
	
 	var paramSearchWord = '';
 	
 	if(attendanceFlag == 'Y'){
 		paramSearchWord = $("#popNameYes").val();
	 	$("#todayAttendanceYesExcelDown #searchWord").val(paramSearchWord);
	 	$("#todayAttendanceYesExcelDown #storeSeq").val(storeSeq);
	 	$("#todayAttendanceYesExcelDown #attendanceFlag").val("YES");
	 	
	 	$("#todayAttendanceYesExcelDown").submit();
 	} else if(attendanceFlag == 'N'){
 		paramSearchWord = $("#popNameNo").val();
	 	$("#todayAttendanceNoExcelDown #searchWord").val(paramSearchWord);
	 	$("#todayAttendanceNoExcelDown #storeSeq").val(storeSeq);
	 	$("#todayAttendanceNoExcelDown #attendanceFlag").val("NO");
	 	
	 	$("#todayAttendanceNoExcelDown").submit();
 	} else {
 	}
	
}
function memberAddStatExcel(storeSeq) {
 	$("#memberAddressStatExcel #storeSeq").val(storeSeq);
 	$("#memberAddressStatExcel").submit();
	
}
</script>


<div class="modal fade" id="findAttendanceYes" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">출석 체크</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popAttendanceYesClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popNameYes" name="popNameYes"   placeholder="입력해 주세요"  oninput="searchNameYes();">
					<input type="button" id="popFindNameYes" name="popFindNameYes" value="찾기" onclick="searchNameYes();" style="margin-bottom: 10px;">
					<div class="dataTables_filter" id="excelBoxYes">
						<label>
							<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
							<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="attendanceExcelDown(${attendanceNoVO.storeSeq},'Y');" value="엑셀 다운로드" >
						</label>
					</div>
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<div class="row">
						<table class="table table-bordered" style="margin-top: 20px;">
							<tbody id="attendanceYesHead">
								<tr>
									<th>No</th>
									<th>매장</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>연락처</th>
								</tr>
									<c:choose>
										<c:when test="${fn:length(attendanceYesList) > 0}">
											<c:forEach var="attendanceYesList" items="${attendanceYesList}">
												<tr>
													<td>${attendanceYesList.rowNum}</td>
													<td>${attendanceYesList.storeName}</td>
													<td>${attendanceYesList.myMembership}</td>
													<td>${attendanceYesList.name}</td>
													<td>
														<c:choose>
															<c:when test="${attendanceYesList.sex eq 'M'}">남</c:when>
															<c:when test="${attendanceYesList.sex eq 'W'}">여</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
													</td>
													<td>${attendanceYesList.phone}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th>	</tr>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
								<input type="hidden" id="pageNumYes" name="pageNumYes" value="${attendanceYesVO.pageNum}">
								<input type="hidden" id="pageRowYes" name="pageRowYes" value="${attendanceYesVO.pageRow}">
								<input type="hidden" id="totalPageYes" name="totalPageYes" value="${attendanceYesVO.totalPage}">
								<ul class="pagination" id="rowListYes">
									<c:choose>
										<c:when test="${attendanceYesVO.pageRow > 0}">
											<li class="paginate_button previous disabled">
												<a href="#" onclick="goPreviousPageYes(${attendanceYesVO.pageNum});">Previous</a>
											</li>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									
									<c:set var="loopFlagYes" value="false"/>
									<c:forEach begin="${attendanceYesVO.startPage}" end="${attendanceYesVO.endPage}" step="1" var="i">
										<c:if test="${not loopFlagYes}">
											<li class="paginate_button active">
												<a href="#"  style="text-decoration: <c:if test="${attendanceYesVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPageYes(${i});">${i}</a>
											</li>
											<c:if test="${attendanceYesVO.startPage eq attendanceYesVO.totalPage}">
												<c:set var="loopFlagYes" value="true"/>
											</c:if>
										</c:if>
						 			</c:forEach>
						 			
						 			<c:choose>
						 				<c:when test="${attendanceYesVO.endPage < attendanceYesVO.totalPage}">
											<li class="paginate_button next">
												<a href="#" onclick="goNextPageYes(${attendanceYesVO.pageRow});">Next</a>
											</li>
						 				</c:when>
						 				<c:otherwise></c:otherwise>
						 			</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popAttendanceYesClose();">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 미출석 팝업 -->
<div class="modal fade" id="findAttendanceNo" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">미출석 체크</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popAttnedanceNoClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popNameNo" name="popNameNo" placeholder="입력해 주세요"  oninput="searchNameNo();">
					<input type="button" id="popFindNameNo" name="popFindNameNo" value="찾기" onclick="searchNameNo();" style="margin-bottom: 10px;">
					<div class="dataTables_filter" id="excelBoxNo">
						<label>
							<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
							<input type="button" class="excelBtnNo" id="excelDownNo" name="excelDownNo" onclick="attendanceExcelDown(${attendanceNoVO.storeSeq},'N');" value="엑셀 다운로드" >
						</label>
					</div>
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<div class="row">
						<table class="table table-bordered" style="margin-top: 20px;">
							<tbody id="attendanceNoHead">
								<tr>
									<th>No</th>
									<th>매장</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>연락처</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(attendanceNoList) > 0}">
										<c:forEach var="attendanceNoList" items="${attendanceNoList}">
											<tr>
												<td>${attendanceNoList.rowNum}</td>
												<td>${attendanceNoList.storeName}</td>
												<td>${attendanceNoList.myMembership}</td>
												<td>${attendanceNoList.name}</td>
												<td>
													<c:choose>
														<c:when test="${attendanceNoList.sex eq 'M'}">남</c:when>
														<c:when test="${attendanceNoList.sex eq 'W'}">여</c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
												</td>
												<td>${attendanceNoList.phone}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th></tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
								<input type="hidden" id="pageNumNo" name="pageNumNo" value="${attendanceNoVO.pageNum}">
								<input type="hidden" id="pageRowNo" name="pageRowNo" value="${attendanceNoVO.pageRow}">
								<input type="hidden" id="totalPageNo" name="totalPageNo" value="${attendanceNoVO.totalPage}">
								<ul class="pagination" id="rowListNo">
									<c:choose>
										<c:when test="${attendanceNoVO.pageRow > 0}">
											<li class="paginate_button previous disabled">
												<a href="#" onclick="goPreviousPageNo(${attendanceNoVO.pageNum});">Previous</a>
											</li>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									
									<c:set var="loopFlagNo" value="false"/>
									<c:forEach begin="${attendanceNoVO.startPage}" end="${attendanceNoVO.endPage}" step="1" var="i">
										<c:if test="${not loopFlagNo}">
											<li class="paginate_button active">
												<a href="#"  style="text-decoration: <c:if test="${attendanceNoVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPageNo(${i});">${i}</a>
											</li>
											<c:if test="${attendanceNoVO.startPage eq attendanceNoVO.totalPage}">
												<c:set var="loopFlagNo" value="true"/>
											</c:if>
										</c:if>
						 			</c:forEach>
						 			
						 			<c:choose>
						 				<c:when test="${attendanceNoVO.endPage < attendanceNoVO.totalPage}">
											<li class="paginate_button next">
												<a href="#" onclick="goNextPageNo(${attendanceNoVO.pageRow});">Next</a>
											</li>
						 				</c:when>
						 				<c:otherwise></c:otherwise>
						 			</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popAttnedanceNoClose();">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
