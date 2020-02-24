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

    <title>회원 목록</title>

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
        <div class="content-header" style="margin-bottom: -20px;">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h3 class="m-0 text-dark">회원 목록</h3>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">회원 정보</li>
                            <li class="breadcrumb-item active">회원 목록</li>
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
								<select class="form-control input-sm" id="memberRow" onchange="goChangeMemberList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeMemberList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="memberExcelDown(${memberVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="memberHeader" style="vertical-align: middle;">
			                            <tr>
			                                <th style="width: 10%;">No</th>
			                                <th style="width: 15%;">회원명</th>
			                                <th style="width: 10%;">생년월일</th>
			                                <th style="width: 16%;">연락처</th>
			                                <th style="width: 20%;">이메일</th>
			                                <th style="width: 5%;">성별</th>
			                                <th style="width: 7%;">휴회여부</th>
			                                <th style="width: 10%;">가입일</th>
			                                <th style="width: 7%;"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(memberList) > 0}">
					                            <c:forEach var="memberList" items="${memberList}">
					                            	<tr>
														<td><c:out value="${memberList.rowNum}"/></td>                            		
														<td><a href="javascript:void(0);" onclick="goMemberDetail(${memberList.memberSeq},${memberList.storeSeq});">${memberList.name}</a></td>                            		
														<td><c:out value="${memberList.birth}"/></td>                            		
														<td><c:out value="${memberList.phone}"/></td>                            		
														<td><c:out value="${memberList.email}"/></td>                            		
														<td>
															<c:choose>
																<c:when test="${memberList.sex eq 'M'}">남</c:when>
																<c:otherwise>여</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${memberList.adjournmentState eq 'N'}">미휴회</c:when>
																<c:when test="${memberList.adjournmentState eq 'Y'}">휴회</c:when>
																<c:otherwise></c:otherwise>
															</c:choose>
														</td>
														<td><fmt:formatDate value="${memberList.registerDate}" pattern="yyyy-MM-dd"/></td>
														<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goMemberDel(${memberList.memberSeq},${memberList.storeSeq});" value="삭제"></td>                		
					                            	</tr>
					                            </c:forEach>
		                            		</c:when>
		                            		<c:otherwise>
	                            				<tr><th colspan="9" style="text-align: center;">결과가 없습니다.</th></tr>
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
						<input type="hidden" id="pageNum" name="pageNum" value="${memberVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${memberVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${memberVO.totalPage}">
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${memberVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${memberVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${memberVO.startPage}" end="${memberVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${memberVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${memberVO.startPage eq memberVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${memberVO.endPage < memberVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${memberVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goMemberRegister();" style="width:80px;">
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
   <%--  <%@ include file="/WEB-INF/views/include/main_footer.jsp" %> --%>
</div>
<!-- ./wrapper -->

<form:form action="/member/memberDetail" id="memberDetail" name="memberDetail" modelAttribute="memberVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>

<form:form action="/member/memberExcelDownload" id="memberExcelDownload" name="memberExcelDownload" modelAttribute="memberVO" method="get" enctype="multipart/form-data">
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

function goMemberRegister(){
	location.href="/member/memberJoin";
}

function goMemberDetail(memberSeq,storeSeq){
	$("#memberSeq").val(memberSeq);
	$("#storeSeq").val(storeSeq);
	$("#memberDetail").submit();
}

function goMemberDel(memberSeq,storeSeq){
	
	var delConfirm = confirm("해당 고객의 정보를 삭제 하시겠습니까?");
	if(delConfirm){
		$("#memberSeq").val(memberSeq);
		$("#storeSeq").val(storeSeq);
		memberDel();		
	}
}

function memberDel(){
	
	 $.ajax({
	        type:'POST',
	        url : "/member/memberDel",
	        data:$("#memberDetail").serialize(),
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
function goChangeMemberList() {
	
	var paramTotalRow = $("#memberRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/member/searchMemberList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshMemberList(data.memberList);
            	goRefreshPage(data.memberVO);
            } else if(data.result == 'noCount'){
            	goRefreshMemberNoCount();
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


function goRefreshMemberList(memberList) {
	var paramMemberList = '';
	paramMemberList += '<tr>';
	paramMemberList += '<th style="width: 10%;">No</th>';
	paramMemberList += '<th style="width: 15%;">회원명</th>';
	paramMemberList += '<th style="width: 10%;">생년월일</th>';
	paramMemberList += '<th style="width: 16%;">연락처</th>';
	paramMemberList += '<th style="width: 20%;">이메일</th>';
	paramMemberList += '<th style="width: 5%;">성별</th>';
	paramMemberList += '<th style="width: 7%;">휴회여부</th>';
	paramMemberList += '<th style="width: 10%;">가입일</th>';
	paramMemberList += '<th style="width: 7%;"></th>';
	paramMemberList += '</tr>';
	
	for(var i = 0 ;  i < memberList.length ; i++){
		var paramRowNum = 0;
		var paramMemberSeq = 0;
		var paramStoreSeq = 0;
		var paramName ='';
		var paramBirth = '';
		var paramPhone = '';
		var paramEmail = '';
		var paramSex = '';
		var paramAdjournmentState= '';
		var paramRegisterDate = '';
		
		paramRowNum = memberList[i].rowNum;
		paramMemberSeq = memberList[i].memberSeq;
		paramStoreSeq = memberList[i].storeSeq;
		paramName = memberList[i].name;
		paramBirth = memberList[i].birth;
		paramPhone = memberList[i].phone;
		paramEmail = memberList[i].email;
		paramSex = memberList[i].sex;
		paramAdjournmentState = memberList[i].adjournmentState;
		paramRegisterDate = memberList[i].registerDate;
		
		paramMemberList += '<tr>';
		paramMemberList += '<td>'+paramRowNum+'</td>';
		paramMemberList += '<td><a href="javascript:void(0);" onclick="goMemberDetail('+paramMemberSeq+','+paramStoreSeq+')">'+paramName+'</a></td>';
		paramMemberList += '<td>'+paramBirth+'</td>';
		paramMemberList += '<td>'+paramPhone+'</td>';
		paramMemberList += '<td>'+paramEmail+'</td>';
		
		if(paramSex == 'W'){
			paramMemberList += '<td>여</td>';
		} else if(paramSex == 'M'){
			paramMemberList += '<td>남</td>';
		} else {
			paramMemberList += '<td></td>';
		}
		
		if(paramAdjournmentState == 'N'){
			paramMemberList += '<td>미휴회</td>';
		} else if(paramAdjournmentState == 'Y') {
			paramMemberList += '<td>휴회</td>';
		} else {
			paramMemberList += '<td></td>';
		}
		
		var date = new Date(paramRegisterDate);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		var resultDate = year+'-'+month+'-'+day;
		
		paramMemberList += '<td>'+resultDate+'</td>';
		paramMemberList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goMemberDel('+paramMemberSeq+','+paramStoreSeq+');" value="삭제"></td>';
		paramMemberList += '</tr>';
	}
		$("#memberHeader").text("");
		$("#memberHeader").append(paramMemberList);
		
}

function goRefreshPage(memberVO) {
	var paramPageList = '';
	
	if(memberVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+memberVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= memberVO.startPage; i <= memberVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(memberVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(memberVO.startPage == memberVO.totalPage){
			break;
		}
	}

	if(memberVO.endPage != memberVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+memberVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(memberVO.pageNum);
	$("#pageRow").val(memberVO.pageRow);
	$("#totalPage").val(memberVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshMemberNoCount() {
	var paramMemberList = '';
	paramMemberList += '<tr>';
	paramMemberList += '<th style="width: 10%;">No</th>';
	paramMemberList += '<th style="width: 15%;">회원명</th>';
	paramMemberList += '<th style="width: 10%;">생년월일</th>';
	paramMemberList += '<th style="width: 16%;">연락처</th>';
	paramMemberList += '<th style="width: 20%;">이메일</th>';
	paramMemberList += '<th style="width: 5%;">성별</th>';
	paramMemberList += '<th style="width: 7%;">휴회여부</th>';
	paramMemberList += '<th style="width: 10%;">가입일</th>';
	paramMemberList += '<th style="width: 7%;"></th>';
	paramMemberList += '</tr>';
	paramMemberList += '<tr><th colspan="9" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#memberHeader").text("");
	$("#memberHeader").append(paramMemberList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeMemberList();
	
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeMemberList();
	
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeMemberList();
	
}

/* 검색 조건 ,페이징  */



/* 엑셀 다운로드 기능  */
function memberExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#memberExcelDownload #searchWord").val(paramSearchWord);
 	$("#memberExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#memberExcelDownload").submit();
	
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
