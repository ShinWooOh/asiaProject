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

    <title>품목 등록</title>

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
                        <h1 class="m-0 text-dark">품목 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품 품목</li>
                            <li class="breadcrumb-item active">품목 등록</li>
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
                    	<c:set var="itemVO" value="${itemVO}" />
                    	<form:form action="/item/itemInsert" id="itemInfo" name="itemInfo" modelAttribute="itemVO" method="post">
                    	    <input type="hidden" id="checkAuthority" name="checkAuthority" value="${manageInfo.getCheckAuthority()}">
							<c:if test="${manageInfo.getCheckAuthority() eq '1'}">
								<input type="hidden" id="storeSeq" name="storeSeq">
							</c:if>
	                        <table class="table table-bordered">
	                            <tbody>
	                				<tr id="storeInfo">
	                					<th>등록매장</th>
		                                <td>
		                                	<c:choose>
		                                		<c:when test="${manageInfo.getAuthority() eq 'ROLE_ADMIN'}">
		                                			<input type="text" id="paramStoreName" name="paramStoreName" readonly="readonly">
		                            				<input type="button" id="findStoreName" name="findStoreName" value="매장 찾기" data-toggle="modal" data-target="#findStore">
		                                		</c:when>
		                                		<c:otherwise>
				                                	<%= manageInfo.getStoreName() %>
		                                		</c:otherwise>
		                                	</c:choose>
		                                </td>
	                				</tr>
		                            <tr>
		                                <th style="width: 150px">품목구분<font style=" color: red;">&nbsp;*</font></th>
		                                <td>
		                                	<select id="largeCategory" name="largeCategory" style="width: 15%;">
		                                		<option value="000">선택하세요</option>
		                                		<option value="001">일반상품</option>
		                                		<option value="002">락커</option>
		                                		<option value="003">운동복</option>
		                                	</select>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">
		                                	품목명<font style=" color: red;">&nbsp;*</font>
		                                </th>
		                                <td><input type="text" id="itemName" name="itemName" value="" style="width: 20%;"></td>
		                            </tr>
		                            <tr>
		                            	<th colspan="2">
		                            		<font style=" color: red;">-&nbsp;품목 등록 시 상품 등록 에서  쓰이게 됩니다.<br>-&nbsp;* 표시 된 항목은 필수 입력입니다.</font> 
		                            	</th>
		                            </tr>
	                            </tbody>
	                        </table>
                        </form:form>
                    </div>
                    <div style="margin-top: 10px;" id="attendanceFooter">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goItemList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="등록" onclick="goItemRegister();" style="float: right; width:80px;">
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
	
	defaultCss();
	
	/* 회원검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popStoreName").keydown(function(key){
		if(key.keyCode == 13){
			searchStore();
		}
	});
	
});

function goItemList(){
	location.href="/item/itemList";
}

function goItemRegister(){
	
	if($("#largeCategory option:selected").val() == '000' ){
		alert("품목구분을 선택해 주세요.");
		return false;
	}
	
	if($("#itemName").val() == ''){
		alert("품목명을 입력해 주세요.");
		$("#itemName").focus();
		return false;
	}
	
	var insertConfirm = confirm("등록 하시겠습니까?");
	if(insertConfirm){
		itemRegister();
	}
	
}

function itemRegister(){
	
	$.ajax({
		type: 'POST',
        url : "/item/insertItem",
        data: $("#itemInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("저장하였습니다.");
              location.reload();
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}

/* 팝업파트 */
function searchStore(){
		
	if($("#popStoreName").val() ==''){
		alert("매장명을 입력해 주세요");
		$("#popStoreName").focus();
		return false;
	}
	
	var paramStoreName = $("#popStoreName").val();
	
	$.ajax({
		type: 'get',
       	url : "/item/searchStore",
       	data: {		storeName : paramStoreName
       			},
       	success : function(data){
           if(data.result == 'success'){
           		popStoreList(data.popStoreList);
           }else if(data.result == 'noCount'){
           		alert("검색 결과가 존재하지 않습니다.");
           		return false;
           }
       	},
       	error:function(request,status,error){
			alert("저장에 실패하였습니다. 관리자에게 문의하세요");
       	}
   	});
}
	
function popStoreList(popStoreList){
	var paramList = '';
	
	for(var i = 0 ; i < popStoreList.length; i++ ){
		var paramStoreSeq = 0;
		var paramStoreName = '';
		var paramStoreTel = '';
		var paramStoreAddress = '';
		
		paramStoreSeq = popStoreList[i].storeSeq;
		paramStoreName = popStoreList[i].storeName;
		paramStoreTel = popStoreList[i].storeTel;
		paramStoreAddress = popStoreList[i].storeAddress;
		
		paramList = '<td>'+popStoreList[i].rowNum+'</td>';
		paramList += '<td>';
		paramList += '<a href="#" onclick="popStoreSelect('+paramStoreSeq+', \''+paramStoreName+'\');">'; 
		paramList +=  paramStoreName+'</a>';
		paramList += '</td>';
		paramList += '<td>'+paramStoreTel+'</td>';
		paramList += '<td>'+paramStoreAddress+'</td>';
	}
	
	$("#storeList").text("");
	$("#storeList").append(paramList);
}

function popStoreSelect(storeSeq,storeName) {
	
	$("#paramStoreName").val(storeName);
	$("#itemInfo #storeSeq").val(storeSeq);
	
	defaultCss();
	popClose();
	
	$("#findStore").modal('toggle');
}

function popClose(){
	$("#popStoreName").val("");
	
	var paramDefaultList = '<th colspan="4" style="text-align: center;">결과가 없습니다.</th>';
	
	$("#storeList").text("");
	$("#storeList").append(paramDefaultList);
}

function defaultCss() {
	
	$("#findStoreName").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#popFindStore").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
}
</script>
<!--popUp Modal -->
<div class="modal fade" id="findStore" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">매장 찾기</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popStoreName" name="popStoreName"  placeholder="매장">
					<input type="button" id="popFindStore" name="popFindStore" value="찾기" onclick="searchStore();" style="margin-bottom: 10px;">
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<table class="table table-bordered" style="margin-top: 20px;">
						<tbody>
							<tr>
								<th>No</th>
								<th>매장</th>
								<th>연락처</th>
								<th>주소</th>
							</tr>
							<tr id="storeList"><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popClose();">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
