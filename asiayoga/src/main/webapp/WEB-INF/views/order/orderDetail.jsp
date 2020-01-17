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

    <title>구매 상세</title>

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
                        <h1 class="m-0 text-dark">구매 상세</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">구매 내역</li>
                            <li class="breadcrumb-item active">구매 상세</li>
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
	                                <th style="width: 50px">회원번호</th>
	                                <th style="width: 100px">회원명</th>
	                                <th style="width: 100px">연락처</th>
	                                <th style="width: 100px">이메일</th>
	                                <th style="width: 150px">생년월일</th>
	                                <th style="width: 60px">성별</th>
	                            </tr>
                            	<c:set var="memberDetail" value="${memberDetail}" />
	                            <tr>
	                            	<td style="width: 50px"><c:out value="${memberDetail.memberSeq}"/></td>
	                            	<td><c:out value="${memberDetail.name}"/></td>
	                            	<td><c:out value="${memberDetail.phone}"/></td>
	                            	<td><c:out value="${memberDetail.email}"/></td>
	                            	<td><c:out value="${memberDetail.birth}"/></td>
	                            	<td>
		                            	<c:choose>
		                            		<c:when test="${memberDetail.sex eq 'M'}">남</c:when>
		                            		<c:when test="${memberDetail.sex eq 'W'}">여</c:when>
		                            		<c:otherwise></c:otherwise>
		                            	</c:choose>
	                            	</td>
	                            </tr>
                            </tbody>
                        </table>
                        
                        <table class="table table-bordered">
                            <tbody>
	                            <tr>
	                                <th style="width: 100px;">매장</th>
	                                <th style="width: 130px;">구매상품</th>
	                              	<th style="width: 50px;">상품구분</th>
	                              	<th style="width: 70px;">시작일</th>
	                              	<th style="width: 70px;">만료일</th>
	                              	<th style="width: 50px;">전체횟수</th>
	                              	<th style="width: 50px;">남은횟수</th>
	                              	<th style="width: 30px;">정보수정일</th>
	                              	<th style="width: 30px;"></th>
	                            </tr>
	                            <c:forEach var="orderList" items="${customerOrderList}">
		                            <tr>
		                            	<td><c:out value="${orderList.storeName}"/></td>
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
												<c:when test="${orderList.productCode eq '001'}"><fmt:formatDate value="${orderList.startDay}" pattern="yyyy-MM-dd"/></c:when>
												<c:when test="${orderList.productCode eq '002'}">해당없음</c:when>
												<c:otherwise>해당없음</c:otherwise>
											</c:choose>		                            	
		                            	</td>
		                            	<td>
											<c:choose>
												<c:when test="${orderList.productCode eq '001'}"><fmt:formatDate value="${orderList.expirationDay}" pattern="yyyy-MM-dd"/></c:when>
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
		                            	<td><fmt:formatDate value="${orderList.modifyDate}" pattern="yyyy-MM-dd"/></td>
		                            	<td>
					                		<input type="button" value="수정" onclick="goOrderUpdate(${orderList.storeSeq},${orderList.orderSeq});" style="width:60px;">
		                            	</td>
		                            </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>
                    <div style="margin-top: 10px;">
                		<input type="button" value="목록" onclick="goOrderList();" style="float: left; width:80px;">
                		<input type="button" value="구매 등록" onclick="goOrderRegister(${orderList.storeSeq},${orderList.orderSeq});" style="float: right; width:80px;">
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
<form:form action="/order/orderRegister" id="orderRegisterInfo" name="orderRegisterInfo" modelAttribute="orderVO" method="post">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="orderSeq" name="orderSeq">
</form:form>

<form:form action="/order/orderUpdate" id="orderUpdateInfo" name="orderUpdateInfo" modelAttribute="orderVO" method="post">
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

function goOrderList(){
	location.href="/order/orderList";
}
function goOrderRegister(memberSeq,storeSeq,orderSeq){
	$("#orderRegisterInfo #storeSeq").val(storeSeq);
	$("#orderRegisterInfo #orderSeq").val(orderSeq);
	$("orderRegisterInfo").submit();
}
function goOrderUpdate(memberSeq,storeSeq,orderSeq){
	$("#orderUpdateInfo #storeSeq").val(storeSeq);
	$("#orderUpdateInfo #orderSeq").val(orderSeq);
	$("#orderUpdateInfo").submit();
}


</script>
</body>
</html>
