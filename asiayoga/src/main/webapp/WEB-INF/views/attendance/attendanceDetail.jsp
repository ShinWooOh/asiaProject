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

    <title>출석 정보 상세</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
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
    </nav>
    <!-- /.navbar -->

    <!-- Left side column-->
    <%@ include file="/WEB-INF/views/include/left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">출석 정보 상세</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">출석</li>
                            <li class="breadcrumb-item active">출석 정보 상세</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content container-fluid" style="background-color: #FFFFFF">

            <div class="col-lg-12">
                <div>
                    <div>
                        <table class="table table-bordered">
                            <tbody>
	                            <tr>
	                                <th style="width: 40px">회원번호</th>
	                                <th style="width: 100px">회원명</th>
	                                <th style="width: 100px">연락처</th>
	                                <th style="width: 100px">이메일</th>
	                                <th style="width: 150px">생년월일</th>
	                                <th style="width: 60px">성별</th>
	                            </tr>
                            	<c:set var="memberDetail" value="${memberDetail}" />
	                            <tr>
	                            	<td><c:out value="${memberDetail.memberSeq}"/></td>
	                            	<td><c:out value="${memberDetail.name}"/></td>
	                            	<td><c:out value="${memberDetail.phone}"/></td>
	                            	<td><c:out value="${memberDetail.email}"/></td>
	                            	<td><c:out value="${memberDetail.birth}"/></td>
	                            	<td>
		                            	<c:choose>
		                            		<c:when test="${memberDetail.sex eq 'M'}">남</c:when>
		                            		<c:otherwise>여</c:otherwise>
		                            	</c:choose>
	                            	</td>
	                            </tr>
                            </tbody>
                        </table>
                        
                        <table class="table table-bordered">
                            <tbody>
	                            <tr>
	                                <th style="width: 150px;">구매상품</th>
	                              	<th style="width: 40px;">상품구분</th>
	                              	<th style="width: 80px;">시작일자</th>
	                              	<th style="width: 80px;">종료일자</th>
	                              	<th style="width: 50px;">전체횟수</th>
	                              	<th style="width: 50px;">남은횟수</th>
	                              	<th style="width: 30px;">출석등록</th>
	                            </tr>
	                            <c:forEach var="orderList" items="${orderList}">
		                            <tr>
		                            	<td><c:out value="${orderList.productName}"/></td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}">기간제</c:when>
												<c:when test="${orderList.productCode eq '002'}">횟수제</c:when>
												<c:otherwise>기타</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}"><fmt:formatDate value="${orderList.productStartDay}" pattern="yyyy-MM-dd"/></c:when>
												<c:when test="${orderList.productCode eq '002'}">해당없음</c:when>
												<c:otherwise>해당없음</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}"><fmt:formatDate value="${orderList.productEndDay}" pattern="yyyy-MM-dd"/></c:when>
												<c:when test="${orderList.productCode eq '002'}">해당없음</c:when>
												<c:otherwise>해당없음</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}">해당없음</c:when>
												<c:when test="${orderList.productCode eq '002'}">${orderList.productCount}</c:when>
												<c:otherwise>해당없음</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}">해당없음</c:when>
												<c:when test="${orderList.productCode eq '002'}">${orderList.remainingCount}</c:when>
												<c:otherwise>해당없음</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
					                		<input type="button" value="출석등록" onclick="goAttendanceRegister(${attendanceVO.memberSeq},${attendanceVO.storeSeq},${orderList.orderSeq});" style="width:80px;">
		                            	</td>
		                            </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                        
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th style="width: 30px;">No</th>
                                <th style="width: 150px;">출석날짜</th>
                                <th style="width: 150px;">지점</th>
                            </tr>
                            <c:forEach var="attendanceDetailList" items="${attendanceDetailList}">
	                            <tr>
	                            	<td><c:out value="${attendanceDetailList.rowNum}"/></td>
	                            	<td><fmt:formatDate value="${attendanceDetailList.attendanceDate}" pattern="yyyy-MM-dd HH:mm"/></td>
	                            	<td>
	                            		<c:choose>
	                            			<c:when test="${attendanceDetailList.storeSeq eq '10'}">레이디요가 의정부점</c:when>
	                            			<c:otherwise>준비중입니다.</c:otherwise>
	                            		</c:choose>
	                            	</td>
	                            </tr>
                            </c:forEach>
                            
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 10px;">
                		<input type="button" value="목록" onclick="goAttendanceList();" style="float: left; width:80px;">
                	</div>
                </div>
            </div>

        </section>
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
    <%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->
<form:form action="/attendance/attendanceRegister" id="attendanceInfo" name="attendanceInfo" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="orderSeq" name="orderSeq">
</form:form>
<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

function goAttendanceList(){
	location.href="/attendance/info";
}
function goAttendanceRegister(memberSeq,storeSeq,orderSeq){
	$("#memberSeq").val(memberSeq);
	$("#storeSeq").val(storeSeq);
	$("#orderSeq").val(orderSeq);
	$("#attendanceInfo").submit();
}


</script>
</body>
</html>
