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


    <title>직급 목록</title>

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
                        <h1 class="m-0 text-dark">직급 목록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">직급 관리</li>
                            <li class="breadcrumb-item active">직급 목록</li>
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
								<select class="form-control input-sm" id="manageGroupRow" onchange="goChangeManageGroupList();">
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
								<input type="search" id="searchWord" name="searchWord" class="form-control input-sm"  oninput="goChangeManageGroupList();">
							</label>
						</div>
						<div class="dataTables_filter" id="excelBox">
							<label>
								<a class="far fa-file-excel fa-2x" style="cursor: pointer; margin-right: -20px;"></a>
								<input type="button" class="excelBtn" id="excelDown" name="excelDown" onclick="manageGroupExcelDown(${manageGroupVO.storeSeq});" value="엑셀 다운로드" >
							</label>
						</div> 
					</div>
				</div>
				<div class="row" style="width: 100%; padding: 5px;">
		            <div class="col-lg-12">
		                <div>
		                    <div>
		                        <table class="table table-bordered">
		                            <tbody id="manageGroupHeader" style="vertical-align: middle;">
		                            <tr>
		                                <th style="width: 7%;">No</th>
		                                <th style="width: 33%;">직급명</th>
		                                <th style="width: 20%;">권한</th>
		                                <th style="width: 30%;">매장</th>
		                                <th style="width: 10%;">상태</th>
		                            </tr>
		                            <c:choose>
		                            	<c:when test="${fn:length(manageGroupList) > 0}">
				                            <c:forEach var="manageGroupList" items="${manageGroupList}">
				                            	<tr>
				                            		<td align="center"><c:out value="${manageGroupList.rowNum}"/></td>
				                            		<td><a href="#" onclick="goManageGroupDetail(${manageGroupList.manageGroupSeq});"><c:out value="${manageGroupList.groupName}"/></a></td>
				                            		<td><a href="#" onclick="goManageGroupDetail(${manageGroupList.manageGroupSeq});"><c:out value="${manageGroupList.authorityName}"/></a></td>
				                            		<td><c:out value="${manageGroupList.storeName}"/></td>
				                            		<td>
				                            			<c:choose>
				                            				<c:when test="${manageGroupList.useYn eq 'Y'}">
							                            		<input type="button" class="btn btn-block btn-warning btn-sm" onclick="goUseYnStateChange(${manageGroupList.manageGroupSeq},'${manageGroupList.useYn}');" id="useYn" name="useYn" value="사용"> 
				                            				</c:when>
				                            				<c:when test="${manageGroupList.useYn eq 'N'}">
							                            		<input type="button" class="btn btn-block btn-info btn-sm" onclick="goUseYnStateChange(${manageGroupList.manageGroupSeq},'${manageGroupList.useYn}');" id="useYn" name="useYn" value="미사용"> 
				                            				</c:when>
				                            				<c:otherwise></c:otherwise>
				                            			</c:choose>
				                            		</td>
				                            	</tr>
				                            </c:forEach>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<tr><th colspan="5" style="text-align: center;">결과가 없습니다.</th></tr>
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
						<input type="hidden" id="pageNum" name="pageNum" value="${manageGroupVO.pageNum}">
						<input type="hidden" id="pageRow" name="pageRow" value="${manageGroupVO.pageRow}">
						<input type="hidden" id="totalPage" name="totalPage" value="${manageGroupVO.totalPage}">
						<ul class="pagination" id="rowList">
							<c:choose>
								<c:when test="${manageGroupVO.pageRow > 0}">
									<li class="paginate_button previous disabled">
										<a href="#" onclick="goPreviousPage(${manageGroupVO.pageNum});">Previous</a>
									</li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							
							<c:set var="loopFlag" value="false"/>
							<c:forEach begin="${manageGroupVO.startPage}" end="${manageGroupVO.endPage}" step="1" var="i">
								<c:if test="${not loopFlag}">
									<li class="paginate_button active">
										<a href="#"  style="text-decoration: <c:if test="${manageGroupVO.pageNum eq i}">underline;</c:if>"  onclick="goClickPage(${i});">${i}</a>
									</li>
									<c:if test="${manageGroupVO.startPage eq manageGroupVO.totalPage}">
										<c:set var="loopFlag" value="true"/>
									</c:if>
								</c:if>
				 			</c:forEach>
				 			
				 			<c:choose>
				 				<c:when test="${manageGroupVO.endPage < manageGroupVO.totalPage}">
									<li class="paginate_button next">
										<a href="#" onclick="goNextPage(${manageGroupVO.pageRow});">Next</a>
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
							<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goManageGroupRegister();" style="float: right; width:80px;">
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
<form:form action="/manage/manageGroupDetail" id="manageGroupInfo" name="manageGroupInfo" modelAttribute="manageGroupVO" method="post">
	<input type="hidden" id="manageGroupSeq" name="manageGroupSeq">
</form:form>

<form:form action="/manage/manageGroupExcelDownload" id="manageGroupExcelDownload" name="manageGroupExcelDownload" modelAttribute="manageGroupVO" method="get" enctype="multipart/form-data">
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

function goManageGroupDetail(manageGroupSeq){
	$("#manageGroupInfo #manageGroupSeq").val(manageGroupSeq);
	$("#manageGroupInfo").submit();
	
}

function goManageGroupRegister(){
	location.href="/manage/manageGroupRegister";
}

function goUseYnStateChange(manageGroupSeq,useYnState){
	
	var paramUseYn = "";
	var useYn ='N';
	if(useYnState == 'Y'){
		paramUseYn = "미사용";
		useYn = "N";
	}else if(useYnState == 'N'){
		paramUseYn = "사용";
		useYn = "Y";
	}else {
		alert("해당 계정은 변경 할 수 없습니다. \n 관리자에게 문의 주세요.");
		return false;
	}
	
	var changeConfirm = confirm("해당 직급 상태를 "+paramUseYn+" 으로 변경 하시겠습니까?");
	if(!changeConfirm){
		return false;
	}
	
	 $.ajax({
	        type:'get',
	        url : "/manage/updateGroupUseYnState",
	        data:{	manageGroupSeq	:	manageGroupSeq,
	        		useYn			:	useYn
	        	 },
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
function goChangeManageGroupList() {
	
	var paramTotalRow = $("#manageGroupRow option:selected").val();
	var paramSearchWord = $("#searchWord").val();
	var paramPageNum = $("#pageNum").val();
	var paramPageRow = $("#pageRow").val();
	
	$.ajax({
        type:'get',
        url : "/manage/searchManageGroupList",
        data:{ 	totalRow	:	paramTotalRow,
        		searchWord	:	paramSearchWord,
        		pageNum		:	paramPageNum,
        		pageRow		:	paramPageRow
        	},
        success : function(data){
            if(data.result == 'success') {
            	goRefreshManageGroupList(data.manageGroupList);
            	goRefreshPage(data.manageGroupVO);
            } else if(data.result == 'noCount'){
            	goRefreshManageGroupNoCount();
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


function goRefreshManageGroupList(manageGroupList) {
    
	var paramManageGroupList = '';
	paramManageGroupList += '<tr>';
	paramManageGroupList += '<th style="width: 10%;">No</th>';
	paramManageGroupList += '<th style="width: 30%;">직급명</th>';
	paramManageGroupList += '<th style="width: 20%;">권한</th>';
	paramManageGroupList += '<th style="width: 30%;">매장</th>';
	paramManageGroupList += '<th style="width: 10%;">상태</th>';
	paramManageGroupList += '</tr>';
	
	for(var i = 0 ;  i < manageGroupList.length ; i++){
		var paramRowNum = 0;
		var paramManageGroupSeq = 0;
		var paramStoreSeq = 0;
		var paramAuthorityName ='';
		var paramGroupName = '';
		var paramStoreName = '';
		var paramUseYn = '';
		
		paramRowNum = manageGroupList[i].rowNum;
		paramManageGroupSeq = manageGroupList[i].manageGroupSeq;
		paramStoreSeq = manageGroupList[i].storeSeq;
		paramAuthorityName = manageGroupList[i].authorityName;
		paramGroupName = manageGroupList[i].groupName;
		paramStoreName = manageGroupList[i].storeName;
		paramUseYn = manageGroupList[i].useYn;
		
		paramManageGroupList += '<tr>';
		paramManageGroupList += '<td>'+paramRowNum+'</td>';
		paramManageGroupList += '<td><a href="javascript:void(0);" onclick="goManageGroupDetail('+paramManageGroupSeq+')">'+paramGroupName+'</a></td>';
		paramManageGroupList += '<td><a href="javascript:void(0);" onclick="goManageGroupDetail('+paramManageGroupSeq+')">'+paramAuthorityName+'</a></td>';
		paramManageGroupList += '<td>'+paramStoreName+'</td>';
		paramManageGroupList += '<td><input type="button" class="btn btn-block btn-warning btn-sm" onclick="goUseYnStateChange('+paramManageGroupSeq+',\''+paramUseYn+'\');" value="삭제"></td>';
		paramManageGroupList += '</tr>';
	}
		$("#manageGroupHeader").text("");
		$("#manageGroupHeader").append(paramManageGroupList);
		
}

function goRefreshPage(manageGroupVO) {
	var paramPageList = '';
	
	if(manageGroupVO.pageRow > 0){
		
		paramPageList += '<li class="paginate_button previous disabled">';
		paramPageList += '<a href="#" onclick="goPreviousPage('+manageGroupVO.pageRow+');">Previous</a>';
		paramPageList += '</li>';
	}
	
	for(var i= manageGroupVO.startPage; i <= manageGroupVO.endPage ; i++ ){
		paramPageList += '<li class="paginate_button active">';
		
		if(manageGroupVO.pageNum == i){
			paramPageList += '<a href="#"  style="text-decoration: underline;"  onclick="goClickPage('+i+');">'+i+'</a>';
		} else {
			paramPageList += '<a href="#" onclick="goClickPage('+i+');">'+i+'</a>';
		}
		
		paramPageList += '</li>';
		
		if(manageGroupVO.startPage == manageGroupVO.totalPage){
			break;
		}
	}

	if(manageGroupVO.endPage != manageGroupVO.totalPage){
		paramPageList += '<li class="paginate_button next">';
		paramPageList += '<a href="#" onclick="goNextPage('+manageGroupVO.pageRow+');">Next</a>';
		paramPageList += '</li>';
		
	}
	$("#rowList").text("");
	$("#rowList").append(paramPageList);
	
	$("#pageNum").val(manageGroupVO.pageNum);
	$("#pageRow").val(manageGroupVO.pageRow);
	$("#totalPage").val(manageGroupVO.totalPage);
	
	defaultCss();
	
}

/* 검색 조건들에서 결과가 없는 경우  */
function goRefreshManageGroupNoCount() {
	var paramManageGroupList = '';
	paramManageGroupList += '<tr>';
	paramManageGroupList += '<th style="width: 10%;">No</th>';
	paramManageGroupList += '<th style="width: 30%;">직급명</th>';
	paramManageGroupList += '<th style="width: 20%;">권한</th>';
	paramManageGroupList += '<th style="width: 30%;">매장</th>';
	paramManageGroupList += '<th style="width: 10%;">상태</th>';
	paramManageGroupList += '</tr>';
	paramManageGroupList += '<tr><th colspan="5" style="text-align: center;">결과가 없습니다.</th></tr>';
	
	$("#manageGroupHeader").text("");
	$("#manageGroupHeader").append(paramManageGroupList);
	defaultCss();
}

/* Previous 버튼 눌렀을 경우(이전 버튼) */
function goPreviousPage(pageRow) {

	$("#pageNum").val(pageRow*5-4);
	$("#pageRow").val(pageRow-1);
	goChangeManageGroupList();
}

/* Next 버튼 눌렀을 경우(다음 버튼) */
function goNextPage(pageRow) {
	
	$("#pageNum").val(pageRow*5+6);
	$("#pageRow").val(pageRow+1);
	goChangeManageGroupList();
}

/* 해당 페이지 숫자 버튼 눌렀을 경우(페이지 이동 버튼) */
function goClickPage(pageNum) {
	
	$("#pageNum").val(pageNum);
	goChangeManageGroupList();
}


/* 검색 조건 ,페이징  */


/* 엑셀 다운로드 기능  */
function manageGroupExcelDown(storeSeq) {
	
 	var paramSearchWord = $("#searchWord").val();
 	
 	$("#manageGroupExcelDownload #searchWord").val(paramSearchWord);
 	$("#manageGroupExcelDownload #storeSeq").val(storeSeq);
 	
 	$("#manageGroupExcelDownload").submit();
	
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
