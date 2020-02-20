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

    <title>상품 상세</title>

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
                        <h1 class="m-0 text-dark">상품 상세</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품</li>
                            <li class="breadcrumb-item active">상품 상세</li>
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
						<c:set var="productDetail" value="${productDetail}" />
                    	<form:form id="productInfo" name="productInfo" modelAttribute="productVO" method="post">
							<table class="table table-bordered">
								<tbody>
		                            <tr>
		                                <th style="width: 100px">등록매장</th>
		                                <td><c:out value="${productDetail.storeName}"/>
		                                	<input type="hidden" id="storeName" name="storeName" value="${productDetail.storeName}">
		                                	<input type="hidden" id="storeSeq" name="storeSeq" value="${productDetail.storeSeq}">
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">품목구분<font style=" color: red;">&nbsp;*</font></th>
		                                <td>
		                                	<select id="itemSeq" name="itemSeq" onchange="goCheckItem();">
		                                		<option value="0">선택하세요</option>
		                                		<c:forEach var="itemList" items="${itemList}">
			                                		<option value="${itemList.itemSeq}" <c:if test="${itemList.itemSeq eq productDetail.itemSeq}">selected</c:if> >${itemList.itemName}</option>
		                                		</c:forEach>
		                                	</select>
		                                </td>
		                            </tr>
		                            <tr>
		                            	<th>상품명<font style=" color: red;">&nbsp;*</font></th>
		                            	<td>
		                            		<input type="text" id="productName" name="productName" value="${productDetail.productName}" style="width: 50%">
		                            		<input type="hidden" id="productSeq" name="productSeq" value="${productDetail.productSeq}">
		                            	</td>
		                            </tr>
		                            <c:choose>
		                            	<c:when test="${productDetail.largeCategory eq '002'}">
				                            <tr id="lockerInfo">
				                                <th style="width: 150px">락커 갯수</th>
				                                <td>
				                                	<input type="text" id="lockerSeq" name="lockerSeq" value="${productDetail.lockerSeq}" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
				                                	<input type="hidden" id="largeCategory" name="largeCategory" value="${productDetail.largeCategory}">
				                                </td>
				                            </tr>
		                            	</c:when>
		                            	<c:otherwise>
				                            <tr id="lockerInfo" style="display: none;">
				                                <th style="width: 150px">락커 갯수</th>
				                                <td>
				                                	<input type="text" id="lockerSeq" name="lockerSeq" value="${productDetail.lockerSeq}" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
				                                	<input type="hidden" id="largeCategory" name="largeCategory" value="${productDetail.largeCategory}">
				                                </td>
				                            </tr>
		                            	</c:otherwise>
		                            </c:choose>
		                            <tr>
		                                <th style="width: 150px">가격</th>
		                                <td>
		                                	<input type="text" id="productPrice" name="productPrice" value="${productDetail.productPrice}" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
		                                	<font style="color: red;"> ! 가격 미입력 시 0원으로 저장 됩니다.</font>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">상품설명</th>
		                                <td>
		                                	<textarea rows="3" cols="130" id="productMemo" name="productMemo">${productDetail.productMemo}</textarea>
		                                </td>
		                            </tr>
		                            <tr>
		                            	<th colspan="2"><font style="color: red;">* 는 필수입력 사항입니다.</font></th>
		                            </tr>
	                            </tbody>
	                        </table>
						</form:form>
					</div>
					<div style="margin-top: 10px;" id="productFooter">
						<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goProductList();" style="float: left; width:80px;">
						<input type="button" class="btn btn-block btn-success" value="수정" onclick="goProductUpdate();" style="float: right; width:80px;">
						<input type="button" class="btn btn-block btn-warning" value="삭제" onclick="goProductDel();" style="float: right; width:80px; margin-right: 20px;">
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

function goProductList(){
	location.href="/product/productList";
}

/* 상품 업데이트 */
function goProductUpdate(){
	
	if($("#itemSeq").val() == 0 ){
		alert("품목명을 선택해 주세요.");
		return false;
	}
	
	if($("#productName").val() == ''){
		alert("상품명을 선택해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	
	
	var insertConfirm = confirm("수정 하시겠습니까?");
	if(insertConfirm){
		
		if($("#productPrice").val() == '' || $("#productPrice").val() == null){
			$("#productPrice").val(0);
		}
		
		if($("#largeCategory").val() != '002'){
			$("#lockerSeq").val(0);
		}
		
		productUpdate();
	}
	
}

function productUpdate(){
	
	$.ajax({
		type: 'POST',
        url : "/product/updateProduct",
        data: $("#productInfo").serialize(),
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
/* 상품 업데이트 */

/* 상품 삭제 */
function goProductDel(){
	
	var delConfirm = confirm("삭제 하시겠습니까?");
	if(!delConfirm){
		return false;
	}
	
	$.ajax({
        type:'POST',
        url : "/product/productDelete",
        data:$("#productInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("삭제 하였습니다.목록으로 이동합니다.");
              goProductList();
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
       }
    });
	
	
}

/* 품목 체크 */
function goCheckItem(){
	
	var paramItemSeq = $("#itemSeq option:selected").val();
	var storeSeq = $("#storeSeq").val();
	
	$.ajax({
		type: 'POST',
        url : "/product/checkItem",
        data: 	{	itemSeq : paramItemSeq,
        			storeSeq : storeSeq
        		},
        success : function(data){
            if(data.result == 'success')
            {
              ckItem(data.resultItem);
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}

function ckItem(resultItem){
	
	$("#largeCategory").val(resultItem.largeCategory+"");
	
	if(resultItem.largeCategory == '002'){
		$("#lockerInfo").show();
	}else{
		$("#lockerInfo").hide();
	}
}
/* 품목 체크 */



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
