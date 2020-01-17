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

    <title>품목 상세</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
                        <h1 class="m-0 text-dark">품목 상세</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품 품목</li>
                            <li class="breadcrumb-item active">품목 상세</li>
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
                    	<c:set var="itemDetail" value="${itemDetail}" />
                    	<form:form action="/item/itemUpdate" id="itemInfo" name="itemInfo" modelAttribute="itemVO" method="post">
	                        <table class="table table-bordered">
	                            <tbody>
	                            <tr>
	                                <th style="width: 100px">등록매장</th>
	                                <td><c:out value="${itemDetail.storeName}"/>
	                                	<input type="hidden" id="storeName" name="storeName" value="${itemDetail.storeName}" readonly="readonly">
	                                	<input type="hidden" id="storeSeq" name="storeSeq" value="${itemDetail.storeSeq}">
	                                	<input type="hidden" id="itemSeq" name="itemSeq" value="${itemDetail.itemSeq}">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 150px">품목구분<font style=" color: red;">&nbsp;*</font></th>
	                                <td>
	                                	<select id="largeCategory" name="largeCategory" style="margin-right: 3px; width: 15%;">
	                                		<option value="000">선택하세요</option>
		                                	<option value="001" <c:if test="${itemDetail.largeCategory eq '001'}">selected</c:if> >일반상품</option>
		                                	<option value="002" <c:if test="${itemDetail.largeCategory eq '002'}">selected</c:if> >락커</option>
		                                	<option value="003" <c:if test="${itemDetail.largeCategory eq '003'}">selected</c:if> >운동복</option>
	                                	</select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 150px">품목명<font style=" color: red;">&nbsp;*</font></th>
	                                <td><input type="text" id="itemName" name="itemName" value="${itemDetail.itemName}" style="width: 20%;"></td>
	                            </tr>
	                            <tr>
	                            	<th colspan="2">
	                            		<font style=" color: red;">-&nbsp;품목 등록 시 상품 등록 에서  쓰이게 됩니다.<br>-&nbsp;* 표시 된 항목은 필수 입력 및 선택 입니다.</font> 
	                            	</th>
	                            </tr>
	                            </tbody>
	                        </table>
                        </form:form>
                    </div>
                    <div style="margin-top: 10px;" id="attendanceFooter">
                		<input type="button" value="목록" onclick="goItemList();" style="float: left; width:80px;">
                		<input type="button" value="품목 수정" onclick="goItemUpdate();" style="float: right; width:80px;">
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

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});

function goItemList(){
	location.href="/item/itemList";
}

function goItemUpdate(){
	
	if($("#largeCategory option:selected").val() == '000' ){
		alert("품목구분을 선택해 주세요.");
		return false;
	}
	
	if($("#itemName").val() == ''){
		alert("품목명을 입력해 주세요.");
		$("#itemName").focus();
		return false;
	}
	
	
	var updateConfirm = confirm("수정 하시겠습니까?");
	if(updateConfirm){
		itemUpdate();
	}
	
}

function itemUpdate(){
	
	$.ajax({
		type: 'POST',
        url : "/item/updateItem",
        data: $("#itemInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("수정하였습니다.");
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
