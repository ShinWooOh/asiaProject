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
	        <div class="dataTables_wrapper form-inline">
	        	<div class="row" style="width: 100%; margin: 10px;">
					<div class="col-sm-6">
						<div class="dataTables_length" style="float: left; margin-left: -10px;">
							<label>Show  &nbsp;
								<select class="form-control input-sm" id="productRow" onchange="goChangeMemberList();">
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select> &nbsp;
								entries
							</label>
						</div>	
					</div>
					<div class="col-sm-6">
						<div class="dataTables_filter" style="float: right;">
							<label>Search : &nbsp;
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeProductList();">
							</label>
						</div>
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="productHeader" style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 5%">No</th>
			                                <th style="width: 20%">매장명</th>
			                                <th style="width: 13%">품목구분</th>
			                                <th style="width: 40%">상품명</th>
			                                <th style="width: 15%">상품가격</th>
			                                <th style="width: 7%"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(productList) > 0}">
					                            <c:forEach var="productList" items="${productList}">
						                           	<tr>
														<td><c:out value="${productList.rowNum}"/></td>                            		
														<td><c:out value="${productList.storeName}"/></td>
														<td ><c:out value="${productList.itemName}"/></td>                            		
														<td><a href="#" onclick="goProductDetail(${productList.productSeq},${productList.storeSeq});"><c:out value="${productList.productName}"/></a></td>
														<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${productList.productPrice}" /></td>
														<td align="center">
															<input type="button" class="btn btn-block btn-warning btn-sm" id="productDel" name="productDel" value="삭제" onclick="goProductDel(${productList.productSeq},${productList.storeSeq})">
														</td>
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
		                </div>
		            </div>
	            </div>
	            <div class="row"  style="width: 100%; padding: 5px; margin-top: -25px;">
					<div class="col-sm-5">
						<div class="dataTables_info" role="status" aria-live="polite">
						<ul class="pagination">
							<li class="paginate_button active">
								총 100개 중 1번 부터10번까지의 게시물
							</li>
						</ul>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
							<input type="hidden" id="pageNum" name="pageNum" value="${productVO.pageNum}">
							<input type="hidden" id="pageRow" name="pageRow" value="${productVO.pageRow}">
							<input type="hidden" id="totalPage" name="totalPage" value="${productVO.totalPage}">
							<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${productVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${productVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${productVO.startPage}" end="${productVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${productVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${productVO.startPage eq productVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${productVO.endPage < productVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${productVO.pageRow});">Next</a>
									</li>
				 				</c:when>
				 				<c:otherwise></c:otherwise>
				 			</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="row" style="width: 100%; margin-top: 10px; padding: 5px;">
					<div class="col-sm-6">
						<div style="float: left;">
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goProductRegister();" style="float: right; width:80px;">
						</div>
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

<form:form action="/product/productDetail" id="productDetail" name="productDetail" modelAttribute="productVO" method="post">
	<input type="hidden" id="productSeq" name="productSeq">
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

$(document).ready(function() {

	defaultCss();
	
});

function goProductDel(productSeq,storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?");
	if(!delConfirm){
		return false;
	}else{
	 	$("#productDetail #productSeq").val(productSeq);
		$("#productDetail #storeSeq").val(storeSeq);
	}
	
	$.ajax({
        type:'POST',
        url : "/product/productDelete",
        data:$("#productDetail").serialize(),
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

function goProductRegister(productSeq,storeCode){
	location.href="/product/productRegister";
}

function goProductDetail(productSeq,storeSeq){
	$("#productSeq").val(productSeq);
	$("#storeSeq").val(storeSeq);
	$("#productDetail").submit();
}

/* 검색 조건에 의한 목록  */
function goChangeProductList() {
	
	var paramTotalRow = $("#productRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/product/searchProductList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshProductList(data.productList);
            	goRefreshPage(data.productVO);
            } else if(data.result == 'noCount'){
            	goRefreshProductNoCount();
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


function goRefreshProductList(productList) {

	var paramProductList = '';
	paramProductList += '<tr>';
	paramProductList += '<th style="width: 5%">No</th>';
	paramProductList += '<th style="width: 20%">매장명</th>';
	paramProductList += '<th style="width: 13%">품목구분</th>';
	paramProductList += '<th style="width: 40%">상품명</th>';
	paramProductList += '<th style="width: 15%">상품가격</th>';
	paramProductList += '<th style="width: 7%"></th>';
	paramProductList += '</tr>';
	
	for(var i = 0 ;  i < productList.length ; i++){
		var paramRowNum = 0;
		var paramProductSeq = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramitemName ='';
		var paramProductName ='';
		var paramProductPrice = 0;
		
		paramRowNum = productList[i].rowNum;
		paramProductSeq = productList[i].productSeq;
		paramStoreSeq = productList[i].storeSeq;
		paramStoreName = productList[i].storeName;
		paramitemName = productList[i].itemName;
		paramProductName = productList[i].productName;
		paramProductPrice = productList[i].productPrice;
		
		paramProductList += '<tr>';
		paramProductList += '<td>'+paramRowNum+'</td>';
		paramProductList += '<td>'+paramStoreName+'</td>';
		paramProductList += '<td>'+paramitemName+'</td>';
		paramProductList += '<td><a href="javascript:void(0);" onclick="goProductDetail('+paramProductSeq+','+paramStoreSeq+')">'+paramProductName+'</a></td>';
 		paramProductList += '<td>'+paramProductPrice+'</td>'; 
		
		paramProductList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goProductDel('+paramProductSeq+','+paramStoreSeq+');" value="삭제"></td>';
		paramProductList += '</tr>';
	}
		$("#productHeader").text("");
		$("#productHeader").append(paramProductList);
		
}

function goRefreshPage(productVO) {
	var paramPageList = '';
	
	if(productVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+productVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= productVO.startPage; i <= productVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(productVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(productVO.startPage == productVO.totalPage){
			break;
		}
	}

	if(productVO.endPage != productVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+productVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(productVO.pageNum);
	$("#pageRow").val(productVO.pageRow);
	$("#totalPage").val(productVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshProductNoCount() {
	var paramProductList = '';
	paramProductList += '<tr>';
	paramProductList += '<th style="width: 5%">No</th>';
	paramProductList += '<th style="width: 20%">매장명</th>';
	paramProductList += '<th style="width: 13%">품목구분</th>';
	paramProductList += '<th style="width: 40%">상품명</th>';
	paramProductList += '<th style="width: 15%">상품가격</th>';
	paramProductList += '<th style="width: 7%"></th>';
	paramProductList += '</tr>';
	paramProductList += '<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#productHeader").text("");
	$("#productHeader").append(paramProductList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeProductList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeProductList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeProductList();
}

function defaultCss() {
	$(".table > tbody > tr > th").css({
		"padding"			: "5px",
		"vertical-align"	: "middle"
	});
	$(".table > tbody > tr > td").css({
		"padding"			: "5px",
		"vertical-align"	: "middle"
	});
	$(".pagination").css({
		"display"			: "inline-block",
		"margin"			: "20px 0"
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
</script>
</body>
</html>
