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
    <div class="content-wrapper" style="height: 800px;">
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
										<p>출석</p>
									</div>
									<div class="icon">
										<i class="fas fa-check"></i>
									</div>
									<a href="#" class="small-box-footer">
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
									<a href="#" class="small-box-footer">
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
												<h1><c:out value="${statisticsMemberVO.newDayMember}"></c:out></h1>
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
												<h1><c:out value="${statisticsMemberVO.newDayMember}"></c:out></h1>
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
												<h1><c:out value="${statisticsMemberVO.newDayMember}"></c:out></h1>
												<p>4월 매출</p>
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
												<h1><c:out value="${statisticsMemberVO.newWeekMember}"></c:out></h1>
												<p>2020년 매출</p>
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
										<p>금일 / 금주 / 4월 / 2020년</p>
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
								<div class="small-box bg-green" id="bgGreen">
									<div class="inner" style="margin-top: 20px; margin-bottom: 10px;">
										<h4>출석통계</h4>
										<p>금일 / 금주 / 4월 / 2020년</p>
									</div>
									<div class="icon">
										<i class="far fa-calendar-check"></i>
									</div>
									<a class="small-box-footer" onclick="showAttendanceStat();" style="cursor:pointer;">
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
										<h2><c:out value="${statisticsMemberVO.newDayMember}"/></h2>
										<p>금일 신규 가입자</p>
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
										<h2><c:out value="${statisticsMemberVO.newWeekMember}"/></h2>
										<p>금주 신규 가입자</p>
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
										<h2><c:out value="${statisticsMemberVO.newMonthMember}"/></h2>
										<p><c:out value="${statisticsMemberVO.thisMonth}"/>월 신규 가입자</p>
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
										<h2><c:out value="${statisticsMemberVO.newYearMember}"/></h2>
										<p><c:out value="${statisticsMemberVO.thisYear}"/>년 신규 가입자</p>
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
			            <div class="row" id="newAttendance" style="width: 100%; margin-left: 10px; margin-bottom: 10px;">
			            	<div class="col-lg-3 col-xs-6">
								<div class="small-box" id="bgAqua3">
									<div class="inner">
										<h2>11</h2>
										<p>금일 출석</p>
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
								<div class="small-box bg-green" id="bgGreen">
									<div class="inner">
										<h2>22</h2>
										<p>금주 출석</p>
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
								<div class="small-box bg-yellow" id="bgYellow" style="color: #FFFFFF !important;">
									<div class="inner">
										<h2>33</h2>
										<p>4월 출석</p>
									</div>
									<div class="icon">
										<i class="far fa-calendar"></i>
									</div>
									<a class="small-box-footer"style="cursor:pointer; color: #FFFFFF !important;">
									자세히 보기
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-red" id="bgRed">
									<div class="inner">
										<h2>44</h2>
										<p>올해 출석</p>
									</div>
									<div class="icon">
										<i class="fas fa-calendar"></i>
									</div>
									<a class="small-box-footer" style="cursor:pointer;">
									자세히 보기
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
			        		<div class="col-lg-12" align="center">
			        			<!-- 275*183  -->
			        			<img src="${pageContext.request.contextPath}/resources/image/health_logo.jpg"  alt="User Image">
			        		</div>
				        	<div class="col-lg-12" align="center">
				        		<img src="${pageContext.request.contextPath}/resources/image/health_logo2.jpg"  alt="User Image">
				        	</div>
				        	<div class="col-lg-12" align="center">
				        		<img src="${pageContext.request.contextPath}/resources/image/health_logo3.jpg"  alt="User Image">
				        	</div>
				        	<div class="col-lg-12" align="center">
				        		<img src="${pageContext.request.contextPath}/resources/image/health_logo4.jpg"  alt="User Image">
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
<!-- ./wrapper -->
<form:form action="/attendance/attendanceDetail" id="attendanceInfo" name="attendanceInfo" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>


<form:form action="/attendance/attendanceExcelDownload" id="attendanceExcelDownload" name="attendanceExcelDownload" modelAttribute="attendanceVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form id="attendanceDelete" name="attendanceDelete" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="attendanceSeq" name="attendanceSeq">
</form:form>

<!-- REQUIRED SCRIPTS -->

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
		$("#newAttendance").hide();
		$("#memberFlag").val("show");
		$("#statFlag").val("hide");
	}
	
	if(paramFlag == "show"){
		$("#newMember").hide();
		$("#newAttendance").hide();
		$("#memberFlag").val("hide");
		$("#statFlag").val("hide");
	}
}

function showAttendanceStat() {
	
	var paramFlag = "hide";
	paramFlag = $("#statFlag").val();
	
	if(paramFlag == "hide"){
		$("#newMember").hide();
		$("#newAttendance").show();
		$("#statFlag").val("show");
		$("#memberFlag").val("hide");
	}
	
	if(paramFlag == "show"){
		$("#newMember").hide();
		$("#newAttendance").hide();
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
	
	$("#newAttendance").css({
		"width"				: "100%",
		"margin-left"		: "10px",
		"margin-bottom"		: "10px",
		"background"		: "#69F0AE",
		"color"				: "#FFFFFF"
	});
	$("#newAttendance").hide();
	
	
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
}
</script>
</body>
</html>
