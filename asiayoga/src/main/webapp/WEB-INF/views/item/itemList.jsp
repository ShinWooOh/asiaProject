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

    <title>품목 현황</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
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
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header" style="margin-bottom: -10px;">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">품목 관리</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품 품목</li>
                            <li class="breadcrumb-item active">품목 관리</li>
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
								<select class="form-control input-sm" id="memberRow" onchange="goChangeItemList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeItemList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="itemExcelDown(${itemVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="itemHeader"style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 7%">No</th>
			                                <th style="width: 15%">등록매장</th>
			                                <th style="width: 10%">품목번호</th>
			                                <th style="width: 15%">품목구분</th>
			                                <th style="width: 46%">품목명</th>
			                                <th style="width: 7%"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(itemList) > 0}">
			                            		<c:forEach var="itemList" items="${itemList}">
					                            <tr>
					                            	<td><c:out value="${itemList.rowNum}"/></td>
					                            	<td><c:out value="${itemList.storeName}"/></td>
					                            	<td><c:out value="${itemList.itemSeq}"/></td>
					                            	<td>
					                            		<c:choose>
						                            		<c:when test="${itemList.largeCategory eq '001'}">일반상품</c:when>
						                            		<c:when test="${itemList.largeCategory eq '002'}">락카</c:when>
						                            		<c:when test="${itemList.largeCategory eq '003'}">운동복</c:when>
						                            		<c:otherwise>기타</c:otherwise>
					                            		</c:choose>
					                            	</td>
					                            	<td><a href="#" onclick="goItemDetail(${itemList.itemSeq},${itemList.storeSeq});"><c:out value="${itemList.itemName}"/></a></td>
					                            	<td align="center">
					                            		<input type="button" class="btn btn-block btn-warning btn-sm" id="itemDelBtn" name="itemDelBtn" onclick="goItemDel(${itemList.itemSeq},${itemList.storeSeq});" value="삭제">
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
	            <div class="row"  style="width: 100%; padding: 5px; margin-top: -25px;"">
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
						<input type="hidden" id="pageNum" name="pageNum" value="${itemVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${itemVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${itemVO.totalPage}">
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${itemVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${itemVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${itemVO.startPage}" end="${itemVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${itemVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${itemVO.startPage eq itemVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${itemVO.endPage < itemVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${itemVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goItemRegister();" style="float: right; width:80px;">
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
    <%-- <%@ include file="/WEB-INF/views/include/main_footer.jsp" %> --%>
</div>
<!-- ./wrapper -->

<form:form action="/item/itemDetail" id="itemInfo" name="itemInfo" modelAttribute="itemVO" method="post">
	<input type="hidden" id="itemSeq" name="itemSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form action="/item/itemExcelDownload" id="itemExcelDownload" name="itemExcelDownload" modelAttribute="itemVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
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

function goItemDetail(itemSeq,storeSeq) {
 	$("#itemInfo #itemSeq").val(itemSeq);
	$("#itemInfo #storeSeq").val(storeSeq);
	$("#itemInfo").submit();
}

function goItemDel(itemSeq,storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?");
	if(!delConfirm){
		return false;
	}else{
	 	$("#itemInfo #itemSeq").val(itemSeq);
		$("#itemInfo #storeSeq").val(storeSeq);
	}
	

	$.ajax({
        type:'POST',
        url : "/item/itemDelete",
        data:$("#itemInfo").serialize(),
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

function goItemRegister(){
	location.href="/item/itemRegister";
}

/* 검색 조건 ,페이징  */
/* 검색 조건에 의한 목록  */
function goChangeItemList() {
	
	var paramTotalRow = $("#itemRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/item/searchItemList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshItemList(data.itemList);
            	goRefreshPage(data.itemVO);
            } else if(data.result == 'noCount'){
            	goRefreshItemNoCount();
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


function goRefreshItemList(itemList) {
	
	var paramItemList = '';
	paramItemList += '<tr>';
	paramItemList += '<th style="width: 5%;">No</th>';
	paramItemList += '<th style="width: 15%">등록매장</th>';
	paramItemList += '<th style="width: 10%">품목번호</th>';
	paramItemList += '<th style="width: 15%">품목구분</th>';
	paramItemList += '<th style="width: 48%">품목명</th>';
	paramItemList += '<th style="width: 7%;"></th>';
	paramItemList += '</tr>';
	
	for(var i = 0 ;  i < itemList.length ; i++){
		var paramRowNum = 0;
		var paramItemSeq = 0;
		var paramItemName = '';
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramLargeCategory = '';
		
		paramRowNum = itemList[i].rowNum;
		paramItemSeq = itemList[i].itemSeq;
		paramItemName = itemList[i].itemName;
		paramStoreSeq = itemList[i].storeSeq;
		paramStoreName = itemList[i].storeName;
		paramLargeCategory = itemList[i].largeCategory;

		paramItemList += '<tr>';
		paramItemList += '<td>'+paramRowNum+'</td>';
		paramItemList += '<td>'+paramStoreName+'</td>';
		paramItemList += '<td>'+paramItemSeq+'</td>';
		
		if(paramLargeCategory == '001'){
			paramItemList += '<td>일반상품</td>';
		} else if(paramLargeCategory == '002') {
			paramItemList += '<td>락카</td>';
		} else if(paramLargeCategory == '003') {
			paramItemList += '<td>운동복</td>';
		}else {
			paramItemList += '<td></td>';
		}
		
		paramItemList += '<td><a href="javascript:void(0);" onclick="goItemDetail('+paramItemSeq+','+paramStoreSeq+')">'+paramItemName+'</a></td>';
		paramItemList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goItemDel('+paramItemSeq+','+paramStoreSeq+');" value="삭제"></td>';
		paramItemList += '</tr>';
	}
		$("#itemHeader").text("");
		$("#itemHeader").append(paramItemList);
		
}

function goRefreshPage(itemVO) {
	var paramPageList = '';
	
	if(itemVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+itemVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= itemVO.startPage; i <= itemVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(itemVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(itemVO.startPage == itemVO.totalPage){
			break;
		}
	}

	if(itemVO.endPage != itemVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+itemVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(itemVO.pageNum);
	$("#pageRow").val(itemVO.pageRow);
	$("#totalPage").val(itemVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshItemNoCount() {
	var paramItemList = '';
	paramItemList += '<tr>';
	paramItemList += '<th style="width: 5%;">No</th>';
	paramItemList += '<th style="width: 15%">등록매장</th>';
	paramItemList += '<th style="width: 10%">품목번호</th>';
	paramItemList += '<th style="width: 15%">품목구분</th>';
	paramItemList += '<th style="width: 48%">품목명</th>';
	paramItemList += '<th style="width: 7%;"></th>';
	paramItemList += '</tr>';
	paramItemList += '<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#itemHeader").text("");
	$("#itemHeader").append(paramItemList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeItemList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeItemList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeItemList();
}

/* 검색 조건 ,페이징  */

/* 엑셀 다운로드 기능  */
function itemExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#itemExcelDownload #searchWord").val(paramSearchWord);
 	$("#itemExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#itemExcelDownload").submit();
	
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
