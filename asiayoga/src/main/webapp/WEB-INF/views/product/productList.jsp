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

    <title>상품 목록</title>

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
                        <h1 class="m-0 text-dark">상품 목록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품</li>
                            <li class="breadcrumb-item active">상품 목록</li>
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
                                <th style="width: 30px">No</th>
                                <th style="width: 50px">상품번호</th>
                                <th style="width: 90px">상품명</th>
                                <th style="width: 80px">매장명</th>
                                <th style="width: 80px">상품구분</th>
                                <th style="width: 70px">상품기간(기간제)</th>
                                <th style="width: 70px">상품횟수(횟수제)</th>
                                <th style="width: 70px"></th>
                            </tr>
                            <c:forEach var="productList" items="${productList}">
	                           	<tr>
									<td><c:out value="${productList.rowNum}"/></td>                            		
									<td><c:out value="${productList.productSeq}"/></td>                            		
									<td><c:out value="${productList.productName}"/></td>
									<td><c:out value="${productList.storeName}"/></td>
									<td>
										<c:choose>
											<c:when test="${productList.productCode eq '001'}">기간제</c:when>
											<c:when test="${productList.productCode eq '002'}">횟수제</c:when>
											<c:otherwise>기타</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${productList.productCode eq '001'}"><c:out value="${productList.productTerm}"/>일</c:when>
											<c:when test="${productList.productCode eq '002'}">해당없음</c:when>
											<c:otherwise>기타</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${productList.productCode eq '001'}">해당없음</c:when>
											<c:when test="${productList.productCode eq '002'}"><c:out value="${productList.productCount}"/>회</c:when>
											<c:otherwise>기타</c:otherwise>
										</c:choose>
									</td>
									<td>
										<input type="button" id="productDel" name="productDel" value="삭제" onclick="productDel(${productList.productSeq},${productList.storeCode})">
									</td>
	                           	</tr>
                            </c:forEach>
                            </tbody>
                        </table>
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

<form:form action="/product/productDel" id="productDel" name="productDel" modelAttribute="productVO" method="post">
	<input type="hidden" id="productSeq" name="productSeq">
	<input type="hidden" id="storeCode" name="storeCode">
</form:form>


<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

function goProductDel(productSeq,storeCode){
	$("#productSeq").val(memberSeq);
	$("#storeCode").val(storeSeq);
	$("#productDel").submit();
}

</script>
</body>
</html>
