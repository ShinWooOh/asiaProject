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
            <li class="nav-item">
                <a class="nav-link" style="font-weight:bold; cursor:pointer;" data-toggle="modal" data-target="#openVaildMember">유효 회원 : <c:out value="${memberStat.memberVaildCount}"/> 명</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-weight:bold; cursor:pointer;" data-toggle="modal" data-target="#openMaturityMember">만기 회원 : <c:out value="${memberStat.maturityMemberCount}"/> 명</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-weight:bold; cursor:pointer;" data-toggle="modal" data-target="#openExpiredMember" href="#" style="font-weight:bold;">만기예정 회원 :  <c:out value="${memberStat.expiredMemberCount}"/>명</a>
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
							<label>게시글 &nbsp;
								<select class="form-control input-sm" id="memberRow" onchange="goChangeMemberList();">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="50">50</option>
								</select> &nbsp;
								개 씩 보기 
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
			                                <th style="width: 7%;">No</th>
			                                <th style="width: 7%;">회원번호</th>
			                                <th style="width: 13%;">매장명</th>
			                                <th style="width: 10%;">회원명</th>
			                                <th style="width: 10%;">생년월일</th>
			                                <th style="width: 13%;">연락처</th>
			                                <th style="width: 16%;">이메일</th>
			                                <th style="width: 7%;">성별</th>
			                                <th style="width: 10%;">가입일</th>
			                                <th style="width: 7%;"></th>
			                            </tr>
			                            <c:choose>
			                            	<c:when test="${fn:length(memberList) > 0}">
					                            <c:forEach var="memberList" items="${memberList}">
					                            	<tr>
														<td><c:out value="${memberList.rowNum}"/></td>                            		
														<td><c:out value="${memberList.myMembership}"/></td>                            		
														<td><c:out value="${memberList.storeName}"/></td>                            		
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
														<td><fmt:formatDate value="${memberList.joinDate}" pattern="yyyy-MM-dd"/></td>
														<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goMemberDel(${memberList.memberSeq},${memberList.storeSeq});" value="삭제"></td>                		
					                            	</tr>
					                            </c:forEach>
		                            		</c:when>
		                            		<c:otherwise>
	                            				<tr><th colspan="10" style="text-align: center;">결과가 없습니다.</th></tr>
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
					<!-- 	<div class="dataTables_info" role="status" aria-live="polite">
						<ul class="pagination">
							<li class="paginate_button active">
								총 100개 중 1번 부터10번까지의 게시물
							</li>
						</ul>
						</div> -->
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

<form:form action="/member/vaildMemberExcelDownload" id="vaildMemberExcelDownload" name="vaildMemberExcelDownload" modelAttribute="memberVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>
<form:form action="/member/maturityMemberExcelDownload" id="maturityMemberExcelDownload" name="maturityMemberExcelDownload" modelAttribute="memberVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
</form:form>
<form:form action="/member/expiredMemberExcelDownload" id="expiredMemberExcelDownload" name="expiredMemberExcelDownload" modelAttribute="memberVO" method="get" enctype="multipart/form-data">
	<input type="hidden" id="searchWord" name="searchWord">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="expiredPeriod" name="expiredPeriod">
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
	paramMemberList += '<th style="width: 7%;">No</th>';
	paramMemberList += '<th style="width: 7%;">회원번호</th>';
	paramMemberList += '<th style="width: 13%;">매장명</th>';
	paramMemberList += '<th style="width: 10%;">회원명</th>';
	paramMemberList += '<th style="width: 10%;">생년월일</th>';
	paramMemberList += '<th style="width: 13%;">연락처</th>';
	paramMemberList += '<th style="width: 16%;">이메일</th>';
	paramMemberList += '<th style="width: 7%;">성별</th>';
	paramMemberList += '<th style="width: 10%;">가입일</th>';
	paramMemberList += '<th style="width: 7%;"></th>';
	paramMemberList += '</tr>';
	
	for(var i = 0 ;  i < memberList.length ; i++){
		var paramRowNum = 0;
		var paramMyMembership = 0;
		var paramMemberSeq = 0;
		var paramStoreSeq = 0;
		var paramStoreName = '';
		var paramName ='';
		var paramBirth = '';
		var paramPhone = '';
		var paramEmail = '';
		var paramSex = '';
		var paramAdjournmentState= '';
		var paramJoinDate = '';
		
		paramRowNum = memberList[i].rowNum;
		paramMyMembership = memberList[i].myMembership;
		paramMemberSeq = memberList[i].memberSeq;
		paramStoreSeq = memberList[i].storeSeq;
		paramStoreName = memberList[i].storeName;
		paramName = memberList[i].name;
		paramBirth = memberList[i].birth;
		paramPhone = memberList[i].phone;
		paramEmail = memberList[i].email;
		paramSex = memberList[i].sex;
		paramAdjournmentState = memberList[i].adjournmentState;
		paramJoinDate = memberList[i].joinDate;
		
		paramMemberList += '<tr>';
		paramMemberList += '<td>'+paramRowNum+'</td>';
		paramMemberList += '<td>'+paramMyMembership+'</td>';
		paramMemberList += '<td>'+paramStoreName+'</td>';
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
		
		var date = new Date(paramJoinDate);
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
	paramMemberList += '<th style="width: 7%;">No</th>';
	paramMemberList += '<th style="width: 7%;">회원번호</th>';
	paramMemberList += '<th style="width: 13%;">매장명</th>';
	paramMemberList += '<th style="width: 10%;">회원명</th>';
	paramMemberList += '<th style="width: 10%;">생년월일</th>';
	paramMemberList += '<th style="width: 13%;">연락처</th>';
	paramMemberList += '<th style="width: 16%;">이메일</th>';
	paramMemberList += '<th style="width: 7%;">성별</th>';
	paramMemberList += '<th style="width: 10%;">가입일</th>';
	paramMemberList += '<th style="width: 7%;"></th>';
	paramMemberList += '</tr>';
	paramMemberList += '<tr><th colspan="10" style="text-align: center;">결과가 없습니다.</th></tr>';
	
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




/* 팝업 파트 */

/*  유효 회원 팝업 */
/* 검색 조건에 의한 목록  */
function searchVaildMember() {
	
	var paramSearchWord = $("#popNameVaild").val();
	var paramPageNum = $("#pageNumVaild").val();
	var paramPageRow = $("#pageRowVaild").val();
	
	$.ajax({
        type:'get',
        url : "/member/searchVaildMemberList",
        data:{ 	searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshVaildMemberList(data.vaildMemberList);
            	goRefreshPageVaild(data.vaildMemberVO);
            } else if(data.result == 'noCount'){
            	goRefreshNoList('vaild');
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


function goRefreshVaildMemberList(vaildMemberList) {

	var paramVaildMemberList = '';
	paramVaildMemberList += '<tr>';
	paramVaildMemberList += '<th>No</th>';
	paramVaildMemberList += '<th>매장</th>';
	paramVaildMemberList += '<th>회원번호</th>';
	paramVaildMemberList += '<th>이름</th>';
	paramVaildMemberList += '<th>성별</th>';
	paramVaildMemberList += '<th>연락처</th>';
	paramVaildMemberList += '<th>만료일</th>';
	paramVaildMemberList += '</tr>';
	
	for(var i = 0 ;  i < vaildMemberList.length ; i++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramMyMembership =0;
		var paramName ='';
		var paramSex ='';
		var paramPhone ='';
		var paramExpirationDay ='';
		
		paramRowNum = vaildMemberList[i].rowNum;
		paramStoreSeq = vaildMemberList[i].storeSeq;
		paramStoreName = vaildMemberList[i].storeName;
		paramMyMembership = vaildMemberList[i].myMembership;
		paramName = vaildMemberList[i].name;
		paramSex = vaildMemberList[i].sex;
		paramPhone = vaildMemberList[i].phone;
		paramExpirationDay = vaildMemberList[i].expirationDay;
		
		var date = new Date(paramExpirationDay);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		var resultExpirationDay = year+'-'+month+'-'+day;
		
		paramVaildMemberList += '<tr>';
		paramVaildMemberList += '<td>'+paramRowNum+'</td>';
		paramVaildMemberList += '<td>'+paramStoreName+'</td>';
		paramVaildMemberList += '<td>'+paramMyMembership+'</td>';
		paramVaildMemberList += '<td>'+paramName+'</td>';
		if(paramSex == 'M'){
			paramSex = '남';
		} else if(paramSex == 'W'){
			paramSex = '여';
		} else {
			
		}
		paramVaildMemberList += '<td>'+paramSex+'</td>'; 
		paramVaildMemberList += '<td>'+paramPhone+'</td>'; 
		paramVaildMemberList += '<td>'+resultExpirationDay+'</td>'; 
		paramVaildMemberList += '</tr>';
	}
	
	$("#vaildMemberHead").text("");
	$("#vaildMemberHead").append(paramVaildMemberList);
		
}

function goRefreshPageVaild(vaildMemberVO) {
	var paramPageList = '';
	
	if(vaildMemberVO.pageRow > 0){
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPageVaild('+vaildMemberVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= vaildMemberVO.startPage; i <= vaildMemberVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(vaildMemberVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPageVaild('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPageVaild('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(vaildMemberVO.startPage == vaildMemberVO.totalPage){
			break;
		}
	}

	if(vaildMemberVO.endPage != vaildMemberVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPageVaild('+vaildMemberVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowListVaild").text("");
	$("#rowListVaild").append(paramPageList);
	
	$("#pageNumVaild").val(vaildMemberVO.pageNum);
	$("#pageRowVaild").val(vaildMemberVO.pageRow);
	$("#totalPageVaild").val(vaildMemberVO.totalPage);
	
	defaultCss();
	
}



/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPageVaild(pageRow) {

	$("#pageNumVaild").val(pageRow*5-4);
	$("#pageRowVaild").val(pageRow-1);
	searchVaildMember();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPageVaild(pageRow) {
	
	$("#pageNumVaild").val(pageRow*5+6);
	$("#pageRowVaild").val(pageRow+1);
	searchVaildMember();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPageVaild(pageNum) {
	
	$("#pageNumVaild").val(pageNum);
	searchVaildMember();
}

/*  만기 회원 팝업 */
/* 검색 조건에 의한 목록  */
function searchMaturityMember() {
	
	var paramSearchWord = $("#popNameMaturity").val();
	var paramPageNum = $("#pageNumMaturity").val();
	var paramPageRow = $("#pageRowMaturity").val();
	
	$.ajax({
        type:'get',
        url : "/member/searchMaturityMemberList",
        data:{ 	searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshMaturityMemberList(data.maturityMemberList);
            	goRefreshPageMaturity(data.maturityMemberVO);
            } else if(data.result == 'noCount'){
            	goRefreshNoList('maturity');
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


function goRefreshMaturityMemberList(maturityMemberList) {

	var paramMaturityMemberList = '';
	paramMaturityMemberList += '<tr>';
	paramMaturityMemberList += '<th>No</th>';
	paramMaturityMemberList += '<th>매장</th>';
	paramMaturityMemberList += '<th>회원번호</th>';
	paramMaturityMemberList += '<th>이름</th>';
	paramMaturityMemberList += '<th>성별</th>';
	paramMaturityMemberList += '<th>연락처</th>';
	paramMaturityMemberList += '<th>만료일</th>';
	paramMaturityMemberList += '</tr>';
	
	for(var i = 0 ;  i < maturityMemberList.length ; i++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramMyMembership =0;
		var paramName ='';
		var paramSex ='';
		var paramPhone ='';
		var paramExpirationDay ='';
		
		paramRowNum = maturityMemberList[i].rowNum;
		paramStoreSeq = maturityMemberList[i].storeSeq;
		paramStoreName = maturityMemberList[i].storeName;
		paramMyMembership = maturityMemberList[i].myMembership;
		paramName = maturityMemberList[i].name;
		paramSex = maturityMemberList[i].sex;
		paramPhone = maturityMemberList[i].phone;
		paramExpirationDay = maturityMemberList[i].expirationDay;
		
		var date = new Date(paramExpirationDay);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		var resultExpirationDay = year+'-'+month+'-'+day;
		
		paramMaturityMemberList += '<tr>';
		paramMaturityMemberList += '<td>'+paramRowNum+'</td>';
		paramMaturityMemberList += '<td>'+paramStoreName+'</td>';
		paramMaturityMemberList += '<td>'+paramMyMembership+'</td>';
		if(paramSex == 'M'){
			paramSex = '남';
		} else if(paramSex == 'W'){
			paramSex = '여';
		} else {
			
		}
		paramMaturityMemberList += '<td>'+paramName+'</td>';
		paramMaturityMemberList += '<td>'+paramSex+'</td>'; 
		paramMaturityMemberList += '<td>'+paramPhone+'</td>'; 
		paramMaturityMemberList += '<td>'+resultExpirationDay+'</td>'; 
		paramMaturityMemberList += '</tr>';
	}
		$("#maturityMemberHead").text("");
		$("#maturityMemberHead").append(paramMaturityMemberList);
		
}

function goRefreshPageMaturity(maturityMemberVO) {
	var paramPageList = '';
	
	if(maturityMemberVO.pageRow > 0){
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPageMaturity('+maturityMemberVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= maturityMemberVO.startPage; i <= maturityMemberVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(maturityMemberVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPageMaturity('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPageMaturity('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(maturityMemberVO.startPage == maturityMemberVO.totalPage){
			break;
		}
	}

	if(maturityMemberVO.endPage != maturityMemberVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPageMaturity('+maturityMemberVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowListMaturity").text("");
	$("#rowListMaturity").append(paramPageList);
	
	$("#pageNumMaturity").val(maturityMemberVO.pageNum);
	$("#pageRowMaturity").val(maturityMemberVO.pageRow);
	$("#totalPageMaturity").val(maturityMemberVO.totalPage);
	
	defaultCss();
	
}



/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPageMaturity(pageRow) {

	$("#pageNumMaturity").val(pageRow*5-4);
	$("#pageRowMaturity").val(pageRow-1);
	searchMaturityMember();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPageMaturity(pageRow) {
	
	$("#pageNumMaturity").val(pageRow*5+6);
	$("#pageRowMaturity").val(pageRow+1);
	searchMaturityMember();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPageMaturity(pageNum) {
	
	$("#pageNumMaturity").val(pageNum);
	searchMaturityMember();
}

/*  만기예정 회원 팝업 */
/* 검색 조건에 의한 목록  */
function searchExpiredMember() {
	
	var paramSearchWord = $("#popNameExpired").val();
	var paramPageNum = $("#pageNumExpired").val();
	var paramPageRow = $("#pageRowExpired").val();
	
	var expiredPeriod = "";
	expiredPeriod = $('input:radio[name=expiredPeriod]:checked').val();
	
	$.ajax({
        type:'get',
        url : "/member/searchExpiredMemberList",
        data:{ 	searchWord		:	paramSearchWord,
        		pageNum			:	paramPageNum,
        		pageRow			:	paramPageRow,
        		expiredPeriod	:	expiredPeriod
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshExpiredMemberList(data.expiredMemberList);
            	goRefreshPageExpired(data.expiredMemberVO);
            } else if(data.result == 'noCount'){
            	goRefreshNoList('expired');
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


function goRefreshExpiredMemberList(expiredMemberList) {

	var paramExpiredMemberList = '';
	paramExpiredMemberList += '<tr>';
	paramExpiredMemberList += '<th>No</th>';
	paramExpiredMemberList += '<th>매장</th>';
	paramExpiredMemberList += '<th>회원번호</th>';
	paramExpiredMemberList += '<th>이름</th>';
	paramExpiredMemberList += '<th>성별</th>';
	paramExpiredMemberList += '<th>연락처</th>';
	paramExpiredMemberList += '<th>만료일</th>';
	paramExpiredMemberList += '</tr>';
	
	for(var i = 0 ;  i < expiredMemberList.length ; i++){
		var paramRowNum = 0;
		var paramStoreSeq = 0;
		var paramStoreName ='';
		var paramMyMembership =0;
		var paramName ='';
		var paramSex ='';
		var paramPhone ='';
		var paramExpirationDay ='';
		
		paramRowNum = expiredMemberList[i].rowNum;
		paramStoreSeq = expiredMemberList[i].storeSeq;
		paramStoreName = expiredMemberList[i].storeName;
		paramMyMembership = expiredMemberList[i].myMembership;
		paramName = expiredMemberList[i].name;
		paramSex = expiredMemberList[i].sex;
		paramPhone = expiredMemberList[i].phone;
		paramExpirationDay = expiredMemberList[i].expirationDay;
		
		var date = new Date(paramExpirationDay);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		var resultExpirationDay = year+'-'+month+'-'+day;
		
		paramExpiredMemberList += '<tr>';
		paramExpiredMemberList += '<td>'+paramRowNum+'</td>';
		paramExpiredMemberList += '<td>'+paramStoreName+'</td>';
		paramExpiredMemberList += '<td>'+paramMyMembership+'</td>';
		paramExpiredMemberList += '<td>'+paramName+'</td>';
		if(paramSex == 'M'){
			paramSex = '남';
		} else if(paramSex == 'W'){
			paramSex = '여';
		} else {
			
		}
		paramExpiredMemberList += '<td>'+paramSex+'</td>'; 
		paramExpiredMemberList += '<td>'+paramPhone+'</td>'; 
		paramExpiredMemberList += '<td>'+resultExpirationDay+'</td>'; 
		paramExpiredMemberList += '</tr>';
	}
		$("#expiredMemberHead").text("");
		$("#expiredMemberHead").append(paramExpiredMemberList);
		
}

function goRefreshPageExpired(expiredMemberVO) {
	var paramPageList = '';
	
	if(expiredMemberVO.pageRow > 0){
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPageExpired('+expiredMemberVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= expiredMemberVO.startPage; i <= expiredMemberVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(expiredMemberVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPageExpired('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPageExpired('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(expiredMemberVO.startPage == expiredMemberVO.totalPage){
			break;
		}
	}

	if(expiredMemberVO.endPage != expiredMemberVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPageExpired('+expiredMemberVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowListExpired").text("");
	$("#rowListExpired").append(paramPageList);
	
	$("#pageNumExpired").val(expiredMemberVO.pageNum);
	$("#pageRowExpired").val(expiredMemberVO.pageRow);
	$("#totalPageExpired").val(expiredMemberVO.totalPage);
	
	defaultCss();
	
}


/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPageExpired(pageRow) {

	$("#pageNumExpired").val(pageRow*5-4);
	$("#pageRowExpired").val(pageRow-1);
	searchExpiredMember();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPageExpired(pageRow) {
	
	$("#pageNumExpired").val(pageRow*5+6);
	$("#pageRowExpired").val(pageRow+1);
	searchExpiredMember();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPageExpired(pageNum) {
	
	$("#pageNumExpired").val(pageNum);
	searchExpiredMember();
}

/* 공통 영역 */
/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshNoList(attendanceFlag) {
	var paramMemberList = '';
	paramMemberList += '<tr>';
	paramMemberList += '<th>No</th>';
	paramMemberList += '<th>매장</th>';
	paramMemberList += '<th>회원번호</th>';
	paramMemberList += '<th>이름</th>';
	paramMemberList += '<th>성별</th>';
	paramMemberList += '<th>연락처</th>';
	paramMemberList += '<th>만료일</th>';
	paramMemberList += '</tr>';
	paramMemberList += '<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	if(attendanceFlag == 'vaild'){
		$("#vaildMemberHead").text("");
		$("#vaildMemberHead").append(paramMemberList);
	}
	if(attendanceFlag == 'maturity'){
		$("#maturityMemberHead").text("");
		$("#maturityMemberHead").append(paramMemberList);
	}
	if(attendanceFlag == 'expired'){
		$("#expiredMemberHead").text("");
		$("#expiredMemberHead").append(paramMemberList);
	}
	
	defaultCss();
}


function popVaildMemberClose(){
	
	$("#popNameVaild").val("");
	searchVaildMember();
}
function popMaturityMemberClose(){
	
	$("#popNameMaturity").val("");
	searchMaturityMember();
}
function popExpiredMemberClose(){
	
	$('input:radio[name=expiredPeriod]:input[value="7"]').prop("checked",true);
	$('input:radio[name=expiredPeriod]:input[value="14"]').prop("checked",false);
	$('input:radio[name=expiredPeriod]:input[value="30"]').prop("checked",false);
	$("#popNameExpired").val("");
	searchExpiredMember();
}


/* 엑셀 다운로드 기능  */
function popMemberExcelDown(storeSeq,memberFlag) {
	
 	var paramSearchWord = '';
 	var expiredPeriod = '';
 	
 	if(memberFlag == 'vaild'){
 		paramSearchWord = $("#popNameVaild").val();
	 	$("#vaildMemberExcelDownload #searchWord").val(paramSearchWord);
	 	$("#vaildMemberExcelDownload #storeSeq").val(storeSeq);
	 	$("#vaildMemberExcelDownload").submit();
 	} else if(memberFlag == 'maturity'){
 		paramSearchWord = $("#popNameMaturity").val();
	 	$("#maturityMemberExcelDownload #searchWord").val(paramSearchWord);
	 	$("#maturityMemberExcelDownload #storeSeq").val(storeSeq);
	 	
	 	$("#maturityMemberExcelDownload").submit();
 	} else if(memberFlag == 'expired'){
 		paramSearchWord = $("#popNameExpired").val();
		expiredPeriod = $('input:radio[name=expiredPeriod]:checked').val();
	 	$("#expiredMemberExcelDownload #searchWord").val(paramSearchWord);
	 	$("#expiredMemberExcelDownload #storeSeq").val(storeSeq);
	 	
	 	$("#expiredMemberExcelDownload #expiredPeriod").val(expiredPeriod);
	 	$("#expiredMemberExcelDownload").submit();
	 	
 	} else {
 		
 	}
	
}

/* 팝업 파트 종료 */

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
	
	$("#popFindNameVaild , #popFindNameMaturity , #popFindNameExpired").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#excelBoxVaild , #excelBoxMaturity , #excelBoxExpired" ).css({
		"float"							: "right",
		"margin-right"					: "10px",
		"margin-bottom"					: "5px",
		"background-color"				: "#d2d6de",
		"border-top-left-radius"		: "4px",
		"border-bottom-left-radius"		: "4px",
		"border-top-right-radius"		: "4px",
		"border-bottom-right-radius"	: "4px"
	});
	
	$(".excelBtnVaild , .excelBtnMaturity, .excelBtnExpired").css({
		"margin-left"		: "5px",
		"width"				: "120px",
		"text-align"		: "right",
		"font-weight"		: "bold",
		"cursor"			: "pointer",
		"border"			: "none",
		"background"		: "transparent"
	});
}

</script>

<!-- 유효 회원  -->
<div class="modal fade" id="openVaildMember" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">유효 회원</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popVaildMemberClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popNameVaild" name="popNameVaild"   placeholder="입력해 주세요"  oninput="searchVaildMember();">
					<input type="button" id="popFindNameVaild" name="popFindNameVaild" value="찾기" onclick="searchVaildMember();" style="margin-bottom: 10px;">
					<div class="dataTables_filter" id="excelBoxVaild">
						<label>
							<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
							<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="popMemberExcelDown(${vaildMemberVO.storeSeq},'vaild');" value="엑셀 다운로드" >
						</label>
					</div>
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<div class="row">
						<table class="table table-bordered" style="margin-top: 20px;">
							<tbody id="vaildMemberHead">
								<tr>
									<th>No</th>
									<th>매장</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>연락처</th>
									<th>만료일</th>
								</tr>
									<c:choose>
										<c:when test="${fn:length(vaildMemberList) > 0}">
											<c:forEach var="vaildMemberList" items="${vaildMemberList}">
												<tr>
													<td><c:out value="${vaildMemberList.rowNum}"/></td>
													<td><c:out value="${vaildMemberList.storeName}"/></td>
													<td><c:out value="${vaildMemberList.myMembership}"/></td>
													<td><c:out value="${vaildMemberList.name}"/></td>
													<td>
														<c:choose>
															<c:when test="${vaildMemberList.sex eq 'M'}">남</c:when>
															<c:when test="${vaildMemberList.sex eq 'W'}">여</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
													</td>
													<td><c:out value="${vaildMemberList.phone}"/></td>
													<td><fmt:formatDate value="${vaildMemberList.expirationDay}" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th>	</tr>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
								<input type="hidden" id="pageNumVaild" name="pageNumVaild" value="${vaildMemberVO.pageNum}">
								<input type="hidden" id="pageRowVaild" name="pageRowVaild" value="${vaildMemberVO.pageRow}">
								<input type="hidden" id="totalPageVaild" name="totalPageVaild" value="${vaildMemberVO.totalPage}">
								<ul class="pagination" id="rowListVaild">
									<c:choose>
										<c:when test="${vaildMemberVO.pageRow > 0}">
											<li class="paginate_button previous disabled">
												<a href="#" onclick="goPreviousPageVaild(${vaildMemberVO.pageNum});">Previous</a>
											</li>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									
									<c:set var="loopFlagVaild" value="false"/>
									<c:forEach begin="${vaildMemberVO.startPage}" end="${vaildMemberVO.endPage}" step="1" var="i">
										<c:if test="${not loopFlagVaild}">
											<li class="paginate_button active">
												<a href="#"  style="text-decoration: <c:if test="${vaildMemberVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPageVaild(${i});">${i}</a>
											</li>
											<c:if test="${vaildMemberVO.startPage eq vaildMemberVO.totalPage}">
												<c:set var="loopFlagVaild" value="true"/>
											</c:if>
										</c:if>
						 			</c:forEach>
						 			
						 			<c:choose>
						 				<c:when test="${vaildMemberVO.endPage < vaildMemberVO.totalPage}">
											<li class="paginate_button next">
												<a href="#" onclick="goNextPageVaild(${vaildMemberVO.pageRow});">Next</a>
											</li>
						 				</c:when>
						 				<c:otherwise></c:otherwise>
						 			</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popVaildMemberClose();">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 만기회원 팝업 -->
<div class="modal fade" id="openMaturityMember" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">만기 회원</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popMaturityMemberClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popNameMaturity" name="popNameMaturity"   placeholder="입력해 주세요"  oninput="searchMaturityMember();">
					<input type="button" id="popFindNameMaturity" name="popFindNameMaturity" value="찾기" onclick="searchMaturityMember();" style="margin-bottom: 10px;">
					<div class="dataTables_filter" id="excelBoxMaturity">
						<label>
							<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
							<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="popMemberExcelDown(${maturityMemberVO.storeSeq},'maturity');" value="엑셀 다운로드" >
						</label>
					</div>
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<div class="row">
						<table class="table table-bordered" style="margin-top: 20px;">
							<tbody id="maturityMemberHead">
								<tr>
									<th>No</th>
									<th>매장</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>연락처</th>
									<th>만료일</th>
								</tr>
									<c:choose>
										<c:when test="${fn:length(maturityMemberList) > 0}">
											<c:forEach var="maturityMemberList" items="${maturityMemberList}">
												<tr>
													<td><c:out value="${maturityMemberList.rowNum}"/></td>
													<td><c:out value="${maturityMemberList.storeName}"/></td>
													<td><c:out value="${maturityMemberList.myMembership}"/></td>
													<td><c:out value="${maturityMemberList.name}"/></td>
													<td>
														<c:choose>
															<c:when test="${maturityMemberList.sex eq 'M'}">남</c:when>
															<c:when test="${maturityMemberList.sex eq 'W'}">여</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
													</td>
													<td><c:out value="${maturityMemberList.phone}"/></td>
													<td><fmt:formatDate value="${maturityMemberList.expirationDay}" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th>	</tr>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
								<input type="hidden" id="pageNumMaturity" name="pageNumMaturity" value="${maturityMemberVO.pageNum}">
								<input type="hidden" id="pageRowMaturity" name="pageRowMaturity" value="${maturityMemberVO.pageRow}">
								<input type="hidden" id="totalPageMaturity" name="totalPageMaturity" value="${maturityMemberVO.totalPage}">
								<ul class="pagination" id="rowListMaturity">
									<c:choose>
										<c:when test="${maturityMemberVO.pageRow > 0}">
											<li class="paginate_button previous disabled">
												<a href="#" onclick="goPreviousPageMaturity(${maturityMemberVO.pageNum});">Previous</a>
											</li>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									
									<c:set var="loopFlagMaturity" value="false"/>
									<c:forEach begin="${maturityMemberVO.startPage}" end="${maturityMemberVO.endPage}" step="1" var="i">
										<c:if test="${not loopFlagMaturity}">
											<li class="paginate_button active">
												<a href="#"  style="text-decoration: <c:if test="${maturityMemberVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPageMaturity(${i});">${i}</a>
											</li>
											<c:if test="${maturityMemberVO.startPage eq maturityMemberVO.totalPage}">
												<c:set var="loopFlagMaturity" value="true"/>
											</c:if>
										</c:if>
						 			</c:forEach>
						 			
						 			<c:choose>
						 				<c:when test="${maturityMemberVO.endPage < maturityMemberVO.totalPage}">
											<li class="paginate_button next">
												<a href="#" onclick="goNextPageMaturity(${maturityMemberVO.pageRow});">Next</a>
											</li>
						 				</c:when>
						 				<c:otherwise></c:otherwise>
						 			</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popMaturityMemberClose();">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 만기예정 회원 팝업 -->
<div class="modal fade" id="openExpiredMember" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">만기예정 회원</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popExpiredMemberClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popNameExpired" name="popNameExpired"   placeholder="입력해 주세요"  oninput="searchExpiredMember();">
					<input type="button" id="popFindNameExpired" name="popFindNameExpired" value="찾기" onclick="searchExpiredMember();" style="margin-bottom: 10px;">
					<input type="radio" id="expiredPeriod7" name="expiredPeriod" value="7"  style="margin-left: 20px;  margin-bottom: 10px;" checked="checked" onclick="searchExpiredMember();">7일 전 &nbsp;&nbsp;
					<input type="radio" id="expiredPeriod14" name="expiredPeriod" value="14"  style="margin-bottom: 10px;" onclick="searchExpiredMember();">14일 전 &nbsp;&nbsp;
					<input type="radio" id="expiredPeriod30" name="expiredPeriod" value="30"  style="margin-bottom: 10px;" onclick="searchExpiredMember();">30일 전 
					<div class="dataTables_filter" id="excelBoxExpired">
						<label>
							<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
							<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="popMemberExcelDown(${expiredMemberVO.storeSeq},'expired');" value="엑셀 다운로드" >
						</label>
					</div>
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<div class="row">
						<table class="table table-bordered" style="margin-top: 20px;">
							<tbody id="expiredMemberHead">
								<tr>
									<th>No</th>
									<th>매장</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>연락처</th>
									<th>만료일</th>
								</tr>
									<c:choose>
										<c:when test="${fn:length(expiredMemberList) > 0}">
											<c:forEach var="expiredMemberList" items="${expiredMemberList}">
												<tr>
													<td><c:out value="${expiredMemberList.rowNum}"/></td>
													<td><c:out value="${expiredMemberList.storeName}"/></td>
													<td><c:out value="${expiredMemberList.myMembership}"/></td>
													<td><c:out value="${expiredMemberList.name}"/></td>
													<td>
														<c:choose>
															<c:when test="${expiredMemberList.sex eq 'M'}">남</c:when>
															<c:when test="${expiredMemberList.sex eq 'W'}">여</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
													</td>
													<td><c:out value="${expiredMemberList.phone}"/></td>
													<td><fmt:formatDate value="${expiredMemberList.expirationDay}" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr><th colspan="7" style="text-align: center;">결과가 없습니다.</th>	</tr>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" style="text-align: right;">
								<input type="hidden" id="pageNumExpired" name="pageNumExpired" value="${expiredMemberVO.pageNum}">
								<input type="hidden" id="pageRowExpired" name="pageRowExpired" value="${expiredMemberVO.pageRow}">
								<input type="hidden" id="totalPageExpired" name="totalPageExpired" value="${expiredMemberVO.totalPage}">
								<ul class="pagination" id="rowListExpired">
									<c:choose>
										<c:when test="${expiredMemberVO.pageRow > 0}">
											<li class="paginate_button previous disabled">
												<a href="#" onclick="goPreviousPageExpired(${expiredMemberVO.pageNum});">Previous</a>
											</li>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									
									<c:set var="loopFlagExpired" value="false"/>
									<c:forEach begin="${expiredMemberVO.startPage}" end="${expiredMemberVO.endPage}" step="1" var="i">
										<c:if test="${not loopFlagExpired}">
											<li class="paginate_button active">
												<a href="#"  style="text-decoration: <c:if test="${expiredMemberVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPageExpired(${i});">${i}</a>
											</li>
											<c:if test="${expiredMemberVO.startPage eq expiredMemberVO.totalPage}">
												<c:set var="loopFlagExpired" value="true"/>
											</c:if>
										</c:if>
						 			</c:forEach>
						 			
						 			<c:choose>
						 				<c:when test="${expiredMemberVO.endPage < expiredMemberVO.totalPage}">
											<li class="paginate_button next">
												<a href="#" onclick="goNextPageExpired(${expiredMemberVO.pageRow});">Next</a>
											</li>
						 				</c:when>
						 				<c:otherwise></c:otherwise>
						 			</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popExpiredMemberClose();">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
