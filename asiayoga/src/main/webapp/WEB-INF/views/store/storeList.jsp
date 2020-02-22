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
			<div class="dataTables_wrapper form-inline">
				<div class="row" style="width: 100%; margin: 10px;">
					<div class="col-sm-6">
						<div class="dataTables_length" style="float: left; margin-left: -10px;">
							<label>Show  &nbsp;
								<select class="form-control input-sm" id="memberRow" onchange="goChangeStoreList();">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="50">50</option>
								</select> &nbsp;
								entries
							</label>
						</div>	
					</div>
					<div class="col-sm-6">
						<div class="dataTables_filter" style="float: right;">
							<label>Search : &nbsp;
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeStoreList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="storeExcelDown(${storeVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="storeHeader"style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 10%">No</th>
			                                <th style="width: 10%">매장번호</th>
			                                <th style="width: 18%">매장명</th>
			                                <th style="width: 10%">매장 전화번호</th>
			                                <th style="width: 10%">매장 전화번호<br>(핸드폰)</th>
			                                <th style="width: 35%">매장 주소</th>
			                                <th style="width: 7%"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(storeList) > 0}">
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
			                            	</c:when>
			                            	<c:otherwise>
			                            		<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th></tr>
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
						<input type="hidden" id="pageNum" name="pageNum" value="${storeVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${storeVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${storeVO.totalPage}">							
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${storeVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${storeVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${storeVO.startPage}" end="${storeVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${storeVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${storeVO.startPage eq storeVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${storeVO.endPage < storeVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${storeVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goStoreRegister();" style="float: right; width:80px;">
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

<form:form action="/store/storeDetail" id="storeDetail" name="storeDetail" modelAttribute="storeVO" method="post">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form action="/store/storeExcelDownload" id="storeExcelDownload" name="storeExcelDownload" modelAttribute="storeVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
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

/* 검색 조건 ,페이징  */
/* 검색 조건에 의한 목록  */
function goChangeStoreList() {
	
	var paramTotalRow = $("#storeRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/store/searchStoreList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshStoreList(data.storeList);
            	goRefreshPage(data.storeVO);
            } else if(data.result == 'noCount'){
            	goRefreshStoreNoCount();
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


function goRefreshStoreList(storeList) {
    
	var paramStoreList = '';
	paramStoreList += '<tr>';
	paramStoreList += '<th style="width: 10%;">No</th>';
	paramStoreList += '<th style="width: 10%">매장번호</th>';
	paramStoreList += '<th style="width: 18%">매장명</th>';
	paramStoreList += '<th style="width: 10%">매장 전화번호</th>';
	paramStoreList += '<th style="width: 10%">매장 전화번호<br>(핸드폰)</th>';
	paramStoreList += '<th style="width: 35%">매장 주소</th>';
	paramStoreList += '<th style="width: 7%;"></th>';
	paramStoreList += '</tr>';
	
	for(var i = 0 ;  i < storeList.length ; i++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramStoreTel = '';
		var paramStorePhone = '';
		var paramStoreAddress = '';
		
		paramRowNum = storeList[i].rowNum;
		paramStoreSeq = storeList[i].storeSeq;
		paramStoreName = storeList[i].storeName;
		paramStoreTel = storeList[i].storeTel;
		paramStorePhone = storeList[i].storePhone;
		paramStoreAddress = storeList[i].storeAddress;
		
		paramStoreList += '<tr>';
		paramStoreList += '<td>'+paramRowNum+'</td>';
		paramStoreList += '<td>'+paramStoreSeq+'</td>';
		paramStoreList += '<td><a href="javascript:void(0);" onclick="goStoreDetail('+paramStoreSeq+')">'+paramStoreName+'</a></td>';
		paramStoreList += '<td>'+paramStoreTel+'</td>';
		paramStoreList += '<td>'+paramStorePhone+'</td>';
		paramStoreList += '<td>'+paramStoreAddress+'</td>';
		
		
		paramStoreList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goStoreDel('+paramStoreSeq+');" value="삭제"></td>';
		paramStoreList += '</tr>';
	}
		$("#storeHeader").text("");
		$("#storeHeader").append(paramStoreList);
		
}

function goRefreshPage(storeVO) {
	var paramPageList = '';
	
	if(storeVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+storeVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= storeVO.startPage; i <= storeVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(storeVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(storeVO.startPage == storeVO.totalPage){
			break;
		}
	}

	if(storeVO.endPage != storeVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+storeVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(storeVO.pageNum);
	$("#pageRow").val(storeVO.pageRow);
	$("#totalPage").val(storeVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshStoreNoCount() {
	var paramStoreList = '';
	paramStoreList += '<tr>';
	paramStoreList += '<th style="width: 10%;">No</th>';
	paramStoreList += '<th style="width: 10%">매장번호</th>';
	paramStoreList += '<th style="width: 18%">매장명</th>';
	paramStoreList += '<th style="width: 10%">매장 전화번호</th>';
	paramStoreList += '<th style="width: 10%">매장 전화번호<br>(핸드폰)</th>';
	paramStoreList += '<th style="width: 35%">매장 주소</th>';
	paramStoreList += '<th style="width: 7%;"></th>';
	paramStoreList += '</tr>';
	paramStoreList += '<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#storeHeader").text("");
	$("#storeHeader").append(paramStoreList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeStoreList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeStoreList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeStoreList();
}

/* 검색 조건 ,페이징  */


/* 엑셀 다운로드 기능  */
function storeExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#storeExcelDownload #searchWord").val(paramSearchWord);
 	$("#storeExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#storeExcelDownload").submit();
	
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
