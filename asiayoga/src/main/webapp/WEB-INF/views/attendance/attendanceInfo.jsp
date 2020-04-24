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


    <title>출석 정보</title>

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
                        <h1 class="m-0 text-dark">출석 정보</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">출석</li>
                            <li class="breadcrumb-item active">출석 정보</li>
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
								<select class="form-control input-sm" id="attendanceRow" onchange="goChangeAttendanceList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm" oninput="goChangeAttendanceList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="attendanceExcelDown(${attendanceVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
			</div>
			<div class="row" style="width: 100%; padding: 5px;">
	            <div class="col-lg-12">
	                <div>
	                    <div>
	                        <table class="table table-bordered">
	                            <tbody id="attendanceHeader" style="vertical-align: middle;">
		                            <tr>
		                                <th style="width: 7%;">No</th>
		                                <th style="width: 10%;">회원번호</th>
		                                <th style="width: 15%;">회원명</th>
		                                <th style="width: 24%;">상품명</th>
		                                <th style="width: 15%;">출석일</th>
		                                <th style="width: 15%;">연락처</th>
		                                <th style="width: 7%;">성별</th>
		                                <th style="width: 7%;"></th>
		                            </tr>
		                            <c:choose>
		                            	<c:when test="${fn:length(attendanceList) > 0}">
				                            <c:forEach var="attendanceList" items="${attendanceList}">
				                            	<tr>
													<td><c:out value="${attendanceList.rowNum}"/></td>                            		
													<td><c:out value="${attendanceList.myMembership}"/></td>                            		
													<td>
														<a href="javascript:void(0);" onclick="goAttendanceDetail(${attendanceList.memberSeq},${attendanceList.storeSeq});"><c:out value="${attendanceList.name}"/></a> 
													</td>
													<td>
														<a href="javascript:void(0);" onclick="goAttendanceDetail(${attendanceList.memberSeq},${attendanceList.storeSeq});"><c:out value="${attendanceList.productName}"/></a>
													</td>
													<td>
														<fmt:formatDate value="${attendanceList.attendanceDate}" pattern="yyyy-MM-dd HH:mm"/>
													</td>                          		
													<td><c:out value="${attendanceList.phone}"/></td>                            		
													<td>
														<c:choose>
															<c:when test="${attendanceList.sex eq 'M'}">남</c:when>
															<c:otherwise>여</c:otherwise>
														</c:choose>
													</td>
													<td align="center">
														<input type="button" class="btn btn-block btn-warning btn-sm" id="attendanceDel" name="attendanceDel" onclick="goAttendanceDel(${attendanceList.attendanceSeq})" value="삭제">
													</td>
				                            	</tr>
				                            </c:forEach>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<tr><th colspan="8" style="text-align: center;">결과가 없습니다.</th></tr>
		                            	</c:otherwise>
		                            </c:choose>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	            <div class="row" style="width: 100%; padding: 5px; margin-top: -25px;">
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
						<div class="dataTables_paginate paging_simple_numbers"  style="text-align: right;">
							<input type="hidden" id="pageNum" name="pageNum" value="${attendanceVO.pageNum}">
							<input type="hidden" id="pageRow" name="pageRow" value="${attendanceVO.pageRow}">
							<input type="hidden" id="totalPage" name="totalPage" value="${attendanceVO.totalPage}">
							<ul class="pagination"  id="rowList">
								<c:choose>
									<c:when test="${attendanceVO.pageRow > 0}">
										<li class="paginate_button previous disabled">
											<a href="#" onclick="goPreviousPage(${attendanceVO.pageNum});">Previous</a>
										</li>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
								
								<c:set var="loopFlag" value="false"/>
								<c:forEach begin="${attendanceVO.startPage}" end="${attendanceVO.endPage}" step="1" var="i">
									<c:if test="${not loopFlag}">
										<li class="paginate_button active">
											<a href="#"  style="text-decoration: <c:if test="${attendanceVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
										</li>
										<c:if test="${attendanceVO.startPage eq attendanceVO.totalPage}">
											<c:set var="loopFlag" value="true"/>
										</c:if>
									</c:if>
					 			</c:forEach>
					 			
					 			<c:choose>
					 				<c:when test="${attendanceVO.endPage < attendanceVO.totalPage}">
										<li class="paginate_button next">
											<a href="#" onclick="goNextPage(${attendanceVO.pageRow});">Next</a>
										</li>
					 				</c:when>
					 				<c:otherwise></c:otherwise>
					 			</c:choose>
							</ul>
						</div>
					</div>
				</div>
	            <div class="row" style="width: 100%;">
					<div class="col-sm-6">
						<div style="float: left;">
						</div>
					</div>
					<div class="col-sm-6">
						<div style="float: right;">
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goAttendanceRegister();" style="float: right; width:80px;">
						</div>
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
<form:form action="/attendance/attendanceDetail" id="attendanceInfo" name="attendanceInfo" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>


<form:form action="/attendance/attendanceExcelDownload" id="attendanceExcelDownload" name="attendanceExcelDownload" modelAttribute="attendanceVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form id="attendanceDelete" name="attendanceDelete" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="attendanceSeq" name="attendanceSeq">
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

function goAttendanceDetail(memberSeq,storeSeq){
	$("#memberSeq").val(memberSeq);
	$("#storeSeq").val(storeSeq);
	$("#attendanceInfo").submit();
	
}

function goAttendanceRegister(){
	location.href="attendanceRegister";
/* 	location.href="/attendance/attendanceRegister"; */
}

function goAttendanceDel(attendanceSeq){
	
	var delConfirm = confirm("출석 정보를 삭제 하시겠습니까?\n삭제 시 남은 횟수가 존재하는 경우 복구되지 않습니다.");
	if(!delConfirm){
		return false;
	} else {
		$("#attendanceDelete #attendanceSeq").val(attendanceSeq);
	}
	
	$.ajax({
		type:'POST',
		url : "/attendance/attendanceDelete",
		data:$("#attendanceDelete").serialize(),
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
function goChangeAttendanceList() {
	
	var paramTotalRow = $("#attendanceRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/attendance/searchAttendanceInfo",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshAttendanceList(data.attendanceList);
            	goRefreshPage(data.attendanceVO);
            } else if(data.result == 'noCount'){
            	goRefreshAttendanceNoCount();
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

function goRefreshAttendanceList(attendanceList) {
    
	var paramAttendanceList = '';
	paramAttendanceList += '<tr>';
	paramAttendanceList += '<th style="width: 7%;">No</th>';
	paramAttendanceList += '<th style="width: 10%;">회원번호</th>';
	paramAttendanceList += '<th style="width: 15%;">회원명</th>';
	paramAttendanceList += '<th style="width: 24%;">상품명</th>';
	paramAttendanceList += '<th style="width: 15%;">출석일</th>';
	paramAttendanceList += '<th style="width: 15%;">연락처</th>';
	paramAttendanceList += '<th style="width: 7%;">성별</th>';
	paramAttendanceList += '<th style="width: 7%;"></th>';
	paramAttendanceList += '</tr>';
	
	for(var i = 0 ;  i < attendanceList.length ; i++){
		var paramRowNum = 0;
		var paramAttendanceSeq = 0;
		var paramMemberSeq = 0;
		var paramMyMembership = 0;
		var paramStoreSeq = 0;
		var paramProductName = '';
		var paramAttendanceDate = '';
		var paramName ='';
		var paramPhone = '';
		var paramEmail = '';
		var paramSex = '';
		
		paramRowNum = attendanceList[i].rowNum;
		paramAttendanceSeq = attendanceList[i].attendanceSeq;
		paramMemberSeq = attendanceList[i].memberSeq;
		paramMyMembership = attendanceList[i].myMembership;
		paramStoreSeq = attendanceList[i].storeSeq;
		paramProductName = attendanceList[i].productName;
		paramAttendanceDate = attendanceList[i].attendanceDate;
		paramName = attendanceList[i].name;
		paramBirth = attendanceList[i].birth;
		paramPhone = attendanceList[i].phone;
		paramSex = attendanceList[i].sex;
		
		paramAttendanceList += '<tr>';
		paramAttendanceList += '<td>'+paramRowNum+'</td>';
		paramAttendanceList += '<td>'+paramMyMembership+'</td>';
		paramAttendanceList += '<td><a href="javascript:void(0);" onclick="goAttendanceDetail('+paramMemberSeq+','+paramStoreSeq+')">'+paramName+'</a></td>';
		paramAttendanceList += '<td><a href="javascript:void(0);" onclick="goAttendanceDetail('+paramMemberSeq+','+paramStoreSeq+')">'+paramProductName+'</a></td>';
		
		var date = new Date(paramAttendanceDate);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var hour = date.getHours();
		var min = date.getMinutes();
		
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		if(hour < 10){
			hour = '0'+hour; 
		}
		if(min < 10){
			min = '0'+min; 
		}
		var resultDate = year+'-'+month+'-'+day+' '+hour+':'+min;
		paramAttendanceList += '<td>'+resultDate+'</td>';
		
		paramAttendanceList += '<td>'+paramPhone+'</td>';
		
		if(paramSex == 'W'){
			paramAttendanceList += '<td>여</td>';
		} else if(paramSex == 'M'){
			paramAttendanceList += '<td>남</td>';
		} else {
			paramAttendanceList += '<td></td>';
		}
		
		paramAttendanceList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goAttendanceDel('+paramAttendanceSeq+');" value="삭제"></td>';
		paramAttendanceList += '</tr>';
	}
		$("#attendanceHeader").text("");
		$("#attendanceHeader").append(paramAttendanceList);
		
}

function goRefreshPage(attendanceVO) {
	var paramPageList = '';
	
	if(attendanceVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+attendanceVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= attendanceVO.startPage; i <= attendanceVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(attendanceVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(attendanceVO.startPage == attendanceVO.totalPage){
			break;
		}
	}

	if(attendanceVO.endPage != attendanceVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+attendanceVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(attendanceVO.pageNum);
	$("#pageRow").val(attendanceVO.pageRow);
	$("#totalPage").val(attendanceVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshAttendanceNoCount() {
	var paramAttendanceList = '';
	paramAttendanceList += '<tr>';
	paramAttendanceList += '<th style="width: 7%;">No</th>';
	paramAttendanceList += '<th style="width: 10%;">회원번호</th>';
	paramAttendanceList += '<th style="width: 15%;">회원명</th>';
	paramAttendanceList += '<th style="width: 24%;">상품명</th>';
	paramAttendanceList += '<th style="width: 15%;">출석일</th>';
	paramAttendanceList += '<th style="width: 15%;">연락처</th>';
	paramAttendanceList += '<th style="width: 7%;">성별</th>';
	paramAttendanceList += '<th style="width: 7%;"></th>';
	paramAttendanceList += '</tr>';
	paramAttendanceList += '<tr><th colspan="8" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#attendanceHeader").text("");
	$("#attendanceHeader").append(paramAttendanceList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeAttendanceList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeAttendanceList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeAttendanceList();
}

/* 검색 조건 ,페이징  */

/* 엑셀 다운로드 기능  */
function attendanceExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#attendanceExcelDownload #searchWord").val(paramSearchWord);
 	$("#attendanceExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#attendanceExcelDownload").submit();
	
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
