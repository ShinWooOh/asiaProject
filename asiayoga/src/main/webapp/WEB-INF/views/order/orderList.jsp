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
                        <h1 class="m-0 text-dark">결제 내역</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">결제 내역</li>
                            <li class="breadcrumb-item active">결제 내역</li>
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
								<select class="form-control input-sm" id="orderRow" onchange="goChangeOrderList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeOrderList();">
							</label>
						</div>
						<c:choose>
							<c:when test="${manageInfo.getAuthority() ne 'ROLE_STAFF'}">
								<div class="dataTables_filter" id="excelBox">
									<label>
										<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
										<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="orderExcelDown(${orderVO.storeSeq});" value="엑셀 다운로드" >
									</label>
								</div> 
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="orderHeader"style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 7%;">No</th>
			                                <th style="width: 14%;">매장</th>
			                                <th style="width: 7%;">회원번호</th>
			                                <th style="width: 8%;">이름</th>
			                                <th style="width: 15%;">상품</th>
			                                <th style="width: 9%;">고객 구매 가격</th>
			                                <th style="width: 10%;">연락처</th>
			                                <th style="width: 8%;">시작일</th>
			                                <th style="width: 8%;">만료일</th>
			                                <th style="width: 7%;">만료여부</th>
			                                <th style="width: 7%"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(orderList) > 0}">
					                            <c:forEach var="orderList" items="${orderList}">
						                            <tr>
						                            	<td>${orderList.rowNum}</td>
						                            	<td>${orderList.storeName}</td>
						                            	<td>${orderList.myMembership}</td>
						                            	<td><a href="#" onclick="orderDetail(${orderList.memberSeq},${orderList.orderSeq},${orderList.storeSeq});">${orderList.name}</a></td>
						                            	<td><a href="#" onclick="orderDetail(${orderList.memberSeq},${orderList.orderSeq},${orderList.storeSeq});">${orderList.productName}</a></td>
						                            	<td>
						                            		${orderList.customerPrice}
						                            	</td>
						                            	<td>${orderList.phone}</td>
						                            	<td><fmt:formatDate value="${orderList.startDay}" pattern="yyyy-MM-dd"/></td>
						                            	<td><fmt:formatDate value="${orderList.expirationDay}" pattern="yyyy-MM-dd"/></td>
						                            	<td>${orderList.expirationYn}</td>
						                            	<td><input type="button" class="btn btn-block btn-warning btn-sm" id="orderDel" name="orderDel" value="삭제" onclick="goOrderDel(${orderList.orderSeq},${orderList.storeSeq})"></td>
						                            </tr>
					                            </c:forEach>
			                            	</c:when>
			                            	<c:otherwise>
	                            				<tr><th colspan="11" style="text-align: center;">결과가 없습니다.</th></tr>
		                            		</c:otherwise>
			                            </c:choose>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		            </div>
				</div>
				<div class="row" style="width: 100%; padding: 5px; margin-top: -25px;">
					<div class="col-sm-5">
<!-- 						<div class="dataTables_info" role="status" aria-live="polite">
						<ul class="pagination">
							<li class="paginate_button active">
								총 100개 중 1번 부터10번까지의 게시물
							</li>
						</ul>
						</div> -->
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"  style="text-align: right;">
						<input type="hidden" id="pageNum" name="pageNum" value="${orderVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${orderVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${orderVO.totalPage}">
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${orderVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${orderVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${orderVO.startPage}" end="${orderVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${orderVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${orderVO.startPage eq orderVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${orderVO.endPage < orderVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${orderVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goOrderRegister();" style="float: right; width:80px;">
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
<form:form action="/order/orderDetail"  id="orderInfo" name="orderInfo" modelAttribute="orderVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="orderSeq" name="orderSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form action="/order/orderExcelDownload" id="orderExcelDownload" name="orderExcelDownload" modelAttribute="orderVO" method="get" enctype="multipart/form-data">
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

/* 검색 조건 ,페이징  */
/* 검색 조건에 의한 목록  */
function goChangeOrderList() {
	
	var paramTotalRow = $("#orderRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/order/searchOrderList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshOrderList(data.orderList);
            	goRefreshPage(data.orderVO);
            } else if(data.result == 'noCount'){
            	goRefreshOrderNoCount();
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

function goRefreshOrderList(orderList) {
	var paramOrderList = '';
	
	paramOrderList += '<tr>';
	paramOrderList += '<th style="width: 7%;">No</th>';
	paramOrderList += '<th style="width: 14%;">매장</th>';
	paramOrderList += '<th style="width: 7%;">회원번호</th>';
	paramOrderList += '<th style="width: 8%;">이름</th>';
	paramOrderList += '<th style="width: 15%;">상품</th>';
	paramOrderList += '<th style="width: 9%;">고객 구매 가격</th>';
	paramOrderList += '<th style="width: 10%;">연락처</th>';
	paramOrderList += '<th style="width: 8%;">시작일</th>';
	paramOrderList += '<th style="width: 8%;">만료일</th>';
	paramOrderList += '<th style="width: 7%;">만료여부</th>';
	paramOrderList += '<th style="width: 7%"></th>';
	paramOrderList += '</tr>';
	
	for(var i = 0 ;  i < orderList.length ; i++){
		var paramRowNum = 0;
		var paramOrderSeq = 0;
		var paramStoreSeq = 0;
		var paramProductSeq = 0;
		var paramMemberSeq = 0;
		var paramMyMembership = 0;
		var paramCustomerPrice = 0;
		var paramName ='';
		var paramPhone = '';
		var paramStartDay = '';
		var paramExpirationDay = '';
		var paramExpirationYn = '';
		var paramStoreName = '';
		var paramProductName = '';
		
		paramRowNum = orderList[i].rowNum;
		paramOrderSeq = orderList[i].orderSeq;
		paramStoreSeq = orderList[i].storeSeq;
		paramProductSeq = orderList[i].productSeq;
		paramMemberSeq = orderList[i].memberSeq;
		paramMyMembership = orderList[i].myMembership;
		paramCustomerPrice = orderList[i].customerPrice;
		paramName = orderList[i].name;
		paramPhone = orderList[i].phone;
		paramStartDay = orderList[i].startDay;
		paramExpirationDay = orderList[i].expirationDay;
		paramExpirationYn = orderList[i].expirationYn;
		paramStoreName = orderList[i].storeName;
		paramProductName = orderList[i].productName;
		
		paramOrderList += '<tr>';
		paramOrderList += '<td>'+paramRowNum+'</td>';
		paramOrderList += '<td>'+paramStoreName+'</td>';
		paramOrderList += '<td>'+paramMyMembership+'</td>';
		paramOrderList += '<td><a href="javascript:void(0);" onclick="orderDetail('+paramMemberSeq+','+paramOrderSeq+','+paramStoreSeq+')">'+paramName+'</a></td>';
		paramOrderList += '<td><a href="javascript:void(0);" onclick="orderDetail('+paramMemberSeq+','+paramOrderSeq+','+paramStoreSeq+')">'+paramProductName+'</a></td>';
		paramOrderList += '<td>'+paramCustomerPrice+'</td>';
		paramOrderList += '<td>'+paramPhone+'</td>';
		
		var startDate = new Date(paramStartDay);
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
		paramOrderList += '<td>'+resultStartDate+'</td>';
		
		var expirationDate = new Date(paramExpirationDay);
		var expirationYear = expirationDate.getFullYear();
		var expirationMonth = expirationDate.getMonth()+1;
		var expirationDay = expirationDate.getDate();
		if(expirationMonth < 10){
			expirationMonth = '0'+expirationMonth;
		}
		if(expirationDay < 10){
			expirationDay = '0'+expirationDay;
		}
		var resultExpirationDate = expirationYear+'-'+expirationMonth+'-'+expirationDay;
		paramOrderList += '<td>'+resultExpirationDate+'</td>';
		
		if(paramExpirationYn == 'Y'){
			paramOrderList += '<td>Y</td>';
		} else if(paramExpirationYn == 'N'){
			paramOrderList += '<td>N</td>';
		} else {
			paramOrderList += '<td></td>';
		}
		
		paramOrderList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goOrderDel('+paramOrderSeq+','+paramStoreSeq+');" value="삭제"></td>';
		paramOrderList += '</tr>';
	}
		$("#orderHeader").text("");
		$("#orderHeader").append(paramOrderList);
		
}

function goRefreshPage(orderVO) {
	var paramPageList = '';
	
	if(orderVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+orderVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= orderVO.startPage; i <= orderVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(orderVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(orderVO.startPage == orderVO.totalPage){
			break;
		}
	}

	if(orderVO.endPage != orderVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+orderVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(orderVO.pageNum);
	$("#pageRow").val(orderVO.pageRow);
	$("#totalPage").val(orderVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshOrderNoCount() {
	var paramOrderList = '';
	paramOrderList += '<tr>';
	paramOrderList += '<th style="width: 7%;">No</th>';
	paramOrderList += '<th style="width: 14%;">매장</th>';
	paramOrderList += '<th style="width: 7%;">회원번호</th>';
	paramOrderList += '<th style="width: 8%;">이름</th>';
	paramOrderList += '<th style="width: 15%;">상품</th>';
	paramOrderList += '<th style="width: 9%;">고객 구매 가격</th>';
	paramOrderList += '<th style="width: 10%;">연락처</th>';
	paramOrderList += '<th style="width: 8%;">시작일</th>';
	paramOrderList += '<th style="width: 8%;">만료일</th>';
	paramOrderList += '<th style="width: 7%;">만료여부</th>';
	paramOrderList += '<th style="width: 7%"></th>';
	paramOrderList += '</tr>';
	paramOrderList += '<tr><th colspan="11" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#orderHeader").text("");
	$("#orderHeader").append(paramOrderList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeOrderList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeOrderList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeOrderList();
}

/* 검색 조건 ,페이징  */

/* 엑셀 다운로드 기능  */
function orderExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#orderExcelDownload #searchWord").val(paramSearchWord);
 	$("#orderExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#orderExcelDownload").submit();
	
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
