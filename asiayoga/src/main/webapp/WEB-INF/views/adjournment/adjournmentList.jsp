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


    <title>휴회 목록</title>

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
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">휴회 목록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">휴회</li>
                            <li class="breadcrumb-item active">휴회 목록</li>
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
								<select class="form-control input-sm" id="adjournmentRow" onchange="goChangeAdjournmentList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeAdjournmentList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="adjournmentExcelDown(${adjournmentVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="adjournmentHeader" style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 10%;">No</th>
			                                <th style="width: 15%;">회원명</th>
			                                <th style="width: 15%;">연락처</th>
			                                <th style="width: 33%;">상품명</th>
			                                <th style="width: 10%;">휴회 시작일</th>
			                                <th style="width: 10%;">휴회 종료일</th>
			                                <th style="width: 7%;" align="center">상태</th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(adjournmentList) > 0}">
					                            <c:forEach var="adjournmentList" items="${adjournmentList}">
					                            	<tr>
					                            		<td><c:out value="${adjournmentList.rowNum}"/></td>
					                            		<td><a href="#" onclick="goAdjournmentDetail(${adjournmentList.adjournmentSeq});"><c:out value="${adjournmentList.name}"/></a></td>
					                            		<td><a href="#" onclick="goAdjournmentDetail(${adjournmentList.adjournmentSeq});"><c:out value="${adjournmentList.phone}"/></a></td>
					                            		<td><a href="#" onclick="goAdjournmentDetail(${adjournmentList.adjournmentSeq});"><c:out value="${adjournmentList.productName}"/></a></td>
					                            		<td><fmt:formatDate value="${adjournmentList.adjournmentStart}" pattern="yyyy-MM-dd"/></td>
					                            		<td><fmt:formatDate value="${adjournmentList.adjournmentEnd}" pattern="yyyy-MM-dd"/></td>
					                            		<td>
					                            			<c:choose>
					                            				<c:when test="${adjournmentList.adjournmentState eq 'Y'}">
								                            		<input type="button" class="btn btn-block btn-warning btn-sm" onclick="goAdjournmentStateChange(${adjournmentList.adjournmentSeq},'${adjournmentList.adjournmentState}',${adjournmentList.orderSeq});" id="adjournmentState" name="adjournmentState" value="휴회중"> 
					                            				</c:when>
					                            				<c:when test="${adjournmentList.adjournmentState eq 'N'}">
								                            		<input type="button" class="btn btn-block btn-info btn-sm" onclick="goAdjournmentStateChange(${adjournmentList.adjournmentSeq},'${adjournmentList.adjournmentState}',${adjournmentList.orderSeq});" id="adjournmentState" name="adjournmentState" value="미휴회"> 
					                            				</c:when>
					                            				<c:otherwise></c:otherwise>
					                            			</c:choose>
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
				<div class="row"  style="width: 100%; padding: 5px;"">
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
						<input type="hidden" id="pageNum" name="pageNum" value="${adjournmentVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${adjournmentVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${adjournmentVO.totalPage}">
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${adjournmentVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${adjournmentVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${adjournmentVO.startPage}" end="${adjournmentVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${adjournmentVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${adjournmentVO.startPage eq adjournmentVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${adjournmentVO.endPage < adjournmentVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${adjournmentVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goAdjournmentRegister();" style="float: right; width:80px;">
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
<form:form action="/adjournment/adjournmentDetail" id="adjournmentInfo" name="adjournmentInfo" modelAttribute="adjournmentVO" method="post">
	<input type="hidden" id="adjournmentSeq" name="adjournmentSeq">
</form:form>

<form:form action="/adjournment/adjournmentExcelDownload" id="adjournmentExcelDownload" name="adjournmentExcelDownload" modelAttribute="adjournmentVO" method="get" enctype="multipart/form-data">
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

function goAdjournmentDetail(adjournmentSeq){
	$("#adjournmentSeq").val(adjournmentSeq);
	$("#adjournmentInfo").submit();
	
}

function goAdjournmentRegister(){
	location.href="/adjournment/adjournmentRegister";
}

function goAdjournmentStateChange(adjournmentSeq,adjournmentState,orderSeq){
	
	var changeConfirm = confirm("휴회 상태를 변경 하시겠습니까?");
	if(!changeConfirm){
		return false;
	}
	
	 $.ajax({
	        type:'get',
	        url : "/adjournment/updateAdjournmentState",
	        data:{	adjournmentSeq 		: 	adjournmentSeq,
	        		adjournmentState	:	adjournmentState,
	        		orderSeq			:	orderSeq},
	        success : function(data){
	            if(data == 'success')
	            {
	              alert("변경 되었습니다.");
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
function goChangeAdjournmentList() {
	
	var paramTotalRow = $("#adjournmentRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/adjournment/searchAdjournmentList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshAdjournmentList(data.adjournmentList);
            	goRefreshPage(data.adjournmentVO);
            } else if(data.result == 'noCount'){
            	goRefreshAdjournmentNoCount();
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


function goRefreshAdjournmentList(adjournmentList) {
	
	var paramAdjournmentList = '';
	paramAdjournmentList += '<tr>';
	paramAdjournmentList += '<th style="width: 10%;">No</th>';
	paramAdjournmentList += '<th style="width: 15%;">회원명</th>';
	paramAdjournmentList += '<th style="width: 15%;">연락처</th>';
	paramAdjournmentList += '<th style="width: 33%;">상품명</th>';
	paramAdjournmentList += '<th style="width: 10%;">휴회 시작일</th>';
	paramAdjournmentList += '<th style="width: 10%;">휴회 종료일</th>';
	paramAdjournmentList += '<th style="width: 7%;"></th>';
	paramAdjournmentList += '</tr>';
	
	for(var i = 0 ;  i < adjournmentList.length ; i++){
		var paramRowNum = 0;
		var paramAdjournmentSeq = 0;
		var paramMemberSeq = 0;
		var paramStoreSeq = 0;
		var paramOrderSeq = 0;
		var paramName ='';
		var paramPhone ='';
		var paramProductName ='';
		var paramAdjournmentStart= '';
		var paramAdjournmentEnd= '';
		var paramAdjournmentState= '';
		
		paramRowNum = adjournmentList[i].rowNum;
		paramAdjournmentSeq = adjournmentList[i].adjournmentSeq;
		paramMemberSeq = adjournmentList[i].memberSeq;
		paramStoreSeq = adjournmentList[i].storeSeq;
		paramOrderSeq = adjournmentList[i].orderSeq;
		paramName = adjournmentList[i].name;
		paramPhone = adjournmentList[i].phone;
		paramProductName = adjournmentList[i].productName;
		paramAdjournmentStart = adjournmentList[i].adjournmentStart;
		paramAdjournmentEnd = adjournmentList[i].adjournmentEnd;
		paramAdjournmentState = adjournmentList[i].adjournmentState;
		
		paramAdjournmentList += '<tr>';
		paramAdjournmentList += '<td>'+paramRowNum+'</td>';
		paramAdjournmentList += '<td><a href="javascript:void(0);" onclick="goAdjournmentDetail('+paramAdjournmentSeq+')">'+paramName+'</a></td>';
		paramAdjournmentList += '<td><a href="javascript:void(0);" onclick="goAdjournmentDetail('+paramAdjournmentSeq+')">'+paramPhone+'</a></td>';
		paramAdjournmentList += '<td><a href="javascript:void(0);" onclick="goAdjournmentDetail('+paramAdjournmentSeq+')">'+paramProductName+'</a></td>';
		
		var startDate = new Date(paramAdjournmentStart);
		var startYear = startDate.getFullYear();
		var startMonth = startDate.getMonth()+1;
		var startDay = startDate.getDate();
		if(startMonth < 10){
			startMonth = '0'+startMonth;
		}
		if(startDay < 10){
			startDay = '0'+startDay;
		}
		var resultStartDate = startYear+'-'+startMonth+'-'+startDay;
		
		paramAdjournmentList += '<td>'+resultStartDate+'</td>';
		
		var endDate = new Date(paramAdjournmentEnd);
		var endYear = endDate.getFullYear();
		var endMonth = endDate.getMonth()+1;
		var endDay = endDate.getDate();
		if(endMonth < 10){
			endMonth = '0'+endMonth;
		}
		if(endDay < 10){
			endDay = '0'+endDay;
		}
		var resultEndDate = endYear+'-'+endMonth+'-'+endDay;
		
		paramAdjournmentList += '<td>'+resultEndDate+'</td>';
		
		if(paramAdjournmentState == 'N'){
			paramAdjournmentList += '<td><input type="button" class="btn btn-block btn-info btn-sm" onclick="goAdjournmentStateChange('+paramAdjournmentSeq+',\''+paramAdjournmentState+'\','+paramOrderSeq+');" id="adjournmentState" name="adjournmentState" value="미휴회"></td>';
		} else if(paramAdjournmentState == 'Y') {
			paramAdjournmentList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goAdjournmentStateChange('+paramAdjournmentSeq+',\''+paramAdjournmentState+'\','+paramOrderSeq+');" id="adjournmentState" name="adjournmentState" value="휴회중"></td>';
		} else {
			paramAdjournmentList += '<td></td>';
		}
		
		paramAdjournmentList += '</tr>';
	}
		$("#adjournmentHeader").text("");
		$("#adjournmentHeader").append(paramAdjournmentList);
		
}

function goRefreshPage(adjournmentVO) {
	var paramPageList = '';
	
	if(adjournmentVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+adjournmentVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= adjournmentVO.startPage; i <= adjournmentVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(adjournmentVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(adjournmentVO.startPage == adjournmentVO.totalPage){
			break;
		}
	}

	if(adjournmentVO.endPage != adjournmentVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+adjournmentVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(adjournmentVO.pageNum);
	$("#pageRow").val(adjournmentVO.pageRow);
	$("#totalPage").val(adjournmentVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshAdjournmentNoCount() {
	var paramAdjournmentList = '';
	paramAdjournmentList += '<tr>';
	paramAdjournmentList += '<th style="width: 10%;">No</th>';
	paramAdjournmentList += '<th style="width: 15%;">회원명</th>';
	paramAdjournmentList += '<th style="width: 15%;">연락처</th>';
	paramAdjournmentList += '<th style="width: 33%;">상품명</th>';
	paramAdjournmentList += '<th style="width: 10%;">휴회 시작일</th>';
	paramAdjournmentList += '<th style="width: 10%;">휴회 종료일</th>';
	paramAdjournmentList += '<th style="width: 7%;"></th>';
	paramAdjournmentList += '<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#adjournmentHeader").text("");
	$("#adjournmentHeader").append(paramAdjournmentList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeAdjournmentList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeAdjournmentList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeAdjournmentList();
}

/* 검색 조건 ,페이징  */


/* 엑셀 다운로드 기능  */
function adjournmentExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#adjournmentExcelDownload #searchWord").val(paramSearchWord);
 	$("#adjournmentExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#adjournmentExcelDownload").submit();
	
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
