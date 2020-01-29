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

    <title>매장 목록</title>

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
                        <h1 class="m-0 text-dark">매장 목록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">매장</li>
                            <li class="breadcrumb-item active">매장 목록</li>
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
                                <th style="width: 10%">No</th>
                                <th style="width: 10%">매장번호</th>
                                <th style="width: 18%">매장명</th>
                                <th style="width: 10%">매장 전화번호</th>
                                <th style="width: 10%">매장 전화번호<br>(핸드폰)</th>
                                <th style="width: 35%">매장 주소</th>
                                <th style="width: 7%"></th>
                            </tr>
                            <c:forEach var="storeList" items="${storeList}">
	                           	<tr>
									<td><c:out value="${storeList.rowNum}"/></td>                            		
									<td><c:out value="${storeList.storeSeq}"/></td>                            		
									<td><a href="#" onclick="goStoreDetail(${storeList.storeSeq});"><c:out value="${storeList.storeName}"/></a></td>
									<td><c:out value="${storeList.storeTel}"/></td>
									<td><c:out value="${storeList.storePhone}"/></td>
									<td><c:out value="${storeList.storeAddress}"/></td>
									<td align="center">
										<input type="button" class="btn btn-block btn-warning btn-sm" id="storeDel" name="storeDel" value="삭제" onclick="goStoreDel(${storeList.storeSeq})">
									</td>
	                           	</tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                   <div style="margin-top: 10px;" id="storeFooter">
                		<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goStoreRegister();" style="float: right; width:80px;">
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
    <%-- <%@ include file="/WEB-INF/views/include/main_footer.jsp" %> --%>
</div>
<!-- ./wrapper -->

<form:form action="/store/storeDetail" id="storeDetail" name="storeDetail" modelAttribute="storeVO" method="post">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

function goStoreRegister(){
		location.href="/store/storeRegister";	
}
function goStoreDetail(storeSeq){
		$("#storeDetail #storeSeq").val(storeSeq);
		$("#storeDetail").submit();
	
}


function goStoreDel(storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?\n삭제 시 해당 매장의 품목 및 판매 상품은 보여지지 않습니다.");
	if(!delConfirm){
		return false;
	}else{
		$("#storeDetail #storeSeq").val(storeSeq);
	}
	
	$.ajax({
        type:'POST',
        url : "/store/storeDelete",
        data:$("#storeDetail").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("삭제 하였습니다.");
              location.reload();
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
       }
        
    });
}

</script>
</body>
</html>
