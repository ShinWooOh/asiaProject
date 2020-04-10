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

    <title>매장 상세</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
    
    <link rel="stylesheet" href="/resources/common/css/common.css">
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
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">매장 상세</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">매장</li>
                            <li class="breadcrumb-item active">매장 상세</li>
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
                		<c:set var="storeDetail" value="${storeDetail}" />
                		<form:form id="storeInfo" name="storeInfo" modelAttribute="storeVO" method="post">
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<th>매장명<font style="color: red;">&nbsp;*</font></th>
	                					<td>
	                						<input type="text" id="storeName" name="storeName" style="width: 30%;" value="${storeDetail.storeName}">
	                						<input type="hidden" id="storeSeq" name="storeSeq" value="${storeDetail.storeSeq}">
	                					</td>
	                				</tr>
	                				<tr>
	                					<th>매장 전화 연락처<font style="color: red;">&nbsp;*</font></th>
									    <td>
										    <input type="text" id="storeTel1" name="storeTel1" style="width: 70px; margin-left: 5px;" value="${storeDetail.storeTel1}"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storeTel2" name="storeTel2" style="width: 70px; margin-left: 5px;" value="${storeDetail.storeTel2}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storeTel3" name="storeTel3" style="width: 70px; margin-left: 5px;" value="${storeDetail.storeTel3}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    <font style="color: red; font-size: 13px;">&nbsp;숫자만 입력 가능합니다.</font>
										    <input type="hidden" id="storeTel" name="storeTel" value="${storeDetail.storeTel}">
									    </td>         				
	                				</tr>
	                				<tr>
	                					<th>휴대폰 연락처<font style="color: red;">&nbsp;*</font></th>
									    <td>
									    	<select id="storePhone1" name="storePhone1" style="margin-right: 3px;">
	                							<option value="000">선택해주세요</option>
	                							<option value="010" <c:if test="${storeDetail.storePhone1 eq '010'}">selected</c:if> >010</option>
	                							<option value="011" <c:if test="${storeDetail.storePhone1 eq '011'}">selected</c:if> >011</option>
	                							<option value="016" <c:if test="${storeDetail.storePhone1 eq '016'}">selected</c:if> >016</option>
	                							<option value="017" <c:if test="${storeDetail.storePhone1 eq '017'}">selected</c:if> >017</option>
	                							<option value="018" <c:if test="${storeDetail.storePhone1 eq '018'}">selected</c:if> >018</option>
	                							<option value="019" <c:if test="${storeDetail.storePhone1 eq '019'}">selected</c:if> >019</option>
	                							<option value="050" <c:if test="${storeDetail.storePhone1 eq '050'}">selected</c:if> >050</option>
	                							<option value="0505" <c:if test="${storeDetail.storePhone1 eq '0505'}">selected</c:if> >0505</option>
	                							<option value="060" <c:if test="${storeDetail.storePhone1 eq '060'}">selected</c:if> >060</option>
	                							<option value="070" <c:if test="${storeDetail.storePhone1 eq '070'}">selected</c:if> >070</option>
	                						</select>
										    -<input type="text" id="storePhone2" name="storePhone2" style="width: 70px; margin-left: 5px;" value="${storeDetail.storePhone2}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storePhone3" name="storePhone3" style="width: 70px; margin-left: 5px;" value="${storeDetail.storePhone3}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    <font style="color: red; font-size: 13px;">&nbsp;숫자만 입력 가능합니다.</font>
										    <input type="hidden" id="storePhone" name="storePhone" value="${storeDetail.storePhone}">
									    </td>         				
	                				</tr>
	                				<tr>
	                					<th>매장 주소</th>
										<td>
											<input type="text" id="storeAddress" name="storeAddress" value="${storeDetail.storeAddress}" style="width: 70%;">
										</td>                				
	                				</tr>

	                				<tr>
	                					<th>메모</th>
	                					<td><textarea rows="3" cols="130" id="storeMemo" name="storeMemo">${storeDetail.storeMemo}</textarea></td>
	                				</tr>
	                				<tr>
		                            	<th colspan="2"><font style="color: red;">* 는 필수입력 사항입니다.</font></th>
		                            </tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                </div>
                	<div style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goStoreList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="수정" onclick="goStoreUpdate();" style="float: right; width:80px;">
						<input type="button" class="btn btn-block btn-warning" value="삭제" onclick="goStoreDel();" style="float: right; width:80px; margin-right: 20px;">
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

function goStoreList(){
	location.href="/store/storeList";
}

function goStoreUpdate(){
	
	if($("#storeName").val() == ''){
		alert("매장명을 입력해 주세요.");
		$("#storeName").focus();
		return false;
	}
	if($("#storeTel1").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel1").focus();
		return false;
	}
	if($("#storeTel2").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel2").focus();
		return false;
	}
	if($("#storeTel3").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel3").focus();
		return false;
	}
	if($("#storePhone1").val() == '' || $("#storePhone1").val() == '000'){
		alert("휴대폰 연락처를 입력해 주세요.");
		return false;
	}
	if($("#storePhone2").val() == ''){
		alert("휴대폰 연락처를 입력해 주세요.");
		$("#storePhone2").focus();
		return false;
	}
	if($("#storePhone3").val() == ''){
		alert("휴대폰 연락처를 입력해 주세요.");
		$("#storePhone3").focus();
		return false;
	}
	
	
	var updateConfirm = confirm("수정 하시겠습니까?");
	if(updateConfirm){
		storeUpdate();
	}
	
}

function storeUpdate(){
	
	var storeTel1 = $("#storeTel1").val();
	var storeTel2 = $("#storeTel2").val();
	var storeTel3 = $("#storeTel3").val();
	var storeTel = '';
	storeTel = storeTel1 +'-'+ storeTel2 + '-' + storeTel3;
	$("#storeTel").val(storeTel);
	
	var storePhone1 = $("#storePhone1 option:selected").val();
	var storePhone2 = $("#storePhone2").val();
	var storePhone3 = $("#storePhone3").val();
	var storePhone = '';
	storePhone = storePhone1 +'-'+ storePhone2 + '-' + storePhone3;
	$("#storePhone").val(storePhone);
	
	$.ajax({
		type: 'POST',
        url : "/store/updateStore",
        data: $("#storeInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("저장하였습니다.");
              location.reload();
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}


function goStoreDel(storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?\n삭제 시 해당 매장의 품목 및 판매 상품은 보여지지 않습니다.");
	if(!delConfirm){
		return false;
	}
	
	$.ajax({
        type:'POST',
        url : "/store/storeDelete",
        data:$("#storeInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("삭제 하였습니다.");
              goStoreList();
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
       }
        
    });
}


/* 숫자만 입력 가능하게 하는 로직 */
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
/* 숫자만 입력 가능하게 하는 로직 */
</script>



</body>
</html>
