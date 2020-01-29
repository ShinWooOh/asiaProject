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

    <title>구매 내역</title>

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
                        <h1 class="m-0 text-dark">구매 내역</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">구매</li>
                            <li class="breadcrumb-item active">구매 내역</li>
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
                                <th style="width: 5%;">No</th>
                                <th style="width: 14%;">매장</th>
                                <th style="width: 12%;">품목구분</th>
                                <th style="width: 18%;">상품</th>
                                <th style="width: 8%;">이름</th>
                                <th style="width: 10%;">연락처</th>
                                <th style="width: 8%;">시작일</th>
                                <th style="width: 8%;">만료일</th>
                                <th style="width: 8%;">만료여부</th>
                                <th style="width: 7%"></th>
                            </tr>
                            <c:forEach var="orderList" items="${orderList}">
	                            <tr>
	                            	<td>${orderList.rowNum}</td>
	                            	<td>${orderList.storeName}</td>
	                            	<td>${orderList.itemName}</td>
	                            	<td><a href="#" onclick="orderDetail(${orderList.memberSeq},${orderList.orderSeq},${orderList.storeSeq});">${orderList.productName}</a></td>
	                            	<td><a href="#" onclick="orderDetail(${orderList.memberSeq},${orderList.orderSeq},${orderList.storeSeq});">${orderList.name}</a></td>
	                            	<td>${orderList.phone}</td>
	                            	<td><fmt:formatDate value="${orderList.startDay}" pattern="yyyy-MM-dd"/></td>
	                            	<td><fmt:formatDate value="${orderList.expirationDay}" pattern="yyyy-MM-dd"/></td>
	                            	<td>${orderList.expirationYn}</td>
	                            	<td><input type="button" class="btn btn-block btn-warning btn-sm" id="orderDel" name="orderDel" value="삭제" onclick="goOrderDel(${orderList.orderSeq},${orderList.storeSeq})"></td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 10px;" id="orderFooter">
                		<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goOrderRegister();" style="float: right; width:80px;">
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
<form:form action="/order/orderDetail"  id="orderInfo" name="orderInfo" modelAttribute="orderVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="orderSeq" name="orderSeq">
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

function goOrderDel(orderSeq,storeSeq){
	var delConfirm = confirm("구매 내역을 삭제 하시겠습니까?");
	if(delConfirm){
		$("#orderInfo #orderSeq").val(orderSeq);
		$("#orderInfo #storeSeq").val(storeSeq);
		$("#orderInfo #memberSeq").val(0);
		orderDel();		
	}
}

function orderDel(orderSeq,storeSeq){
	
	 $.ajax({
	        type:'POST',
	        url : "/order/orderDelete",
	        data:$("#orderInfo").serialize(),
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


function orderDetail(memberSeq,orderSeq,storeSeq){
	$("#memberSeq").val(memberSeq);
	$("#orderSeq").val(orderSeq);
	$("#storeSeq").val(storeSeq);
	$("#orderInfo").submit();
}


function goOrderRegister(){
	location.href="/order/orderRegister";
}

</script>
</body>
</html>
