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

    <title>직원 그룹 등록</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
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
                        <h1 class="m-0 text-dark">직원 그룹 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">직원 그룹 관리</li>
                            <li class="breadcrumb-item active">직원 그룹 등록</li>
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
                        <table class="table table-bordered">
                            <tbody>
    							<tr>
	                                <th style="width: 10%;">권한</th>
	                                <td>
	                                	<input  type="checkbox" id="authority" name="authority" value="ROLE_MANAGER">&nbsp;매장관리자
	                                	&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="authority" name="authority" value="ROLE_STAFF">&nbsp;직원
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">그룹명</th>
	                                <td>
	                                	<input type="text" id="groupName" name="groupName">
	                                	<input type="hidden" id="paramName" name="paramName" value="">
	                                	<input type="hidden" id="dupCheckYn" name="dupCheckYn" value="N">
	                                	<input type="button" id="dupCheck" name="dupCheck" onclick="goDupCheck();" value="중복체크">
	                                	&nbsp;<font id="idMent" style="color:red; display: none;"></font>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">매장명</th>
	                                <td><%= manageInfo.getStoreName() %></td>
	                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="manageGoruptFooter" style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goManageGroupList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="등록" onclick="goManageGroupRegister();" style="float: right; width:80px;">
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
<form:form id="manageGroupInfo" name="manageGroupInfo" modelAttribute="manageGroupVO" method="post">
	<input type="hidden" id="authority" name="authority">
	<input type="hidden" id="groupName" name="groupName">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>
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
	
	$("#dupCheck").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("input[name='authority']").css({
		"magin"				: "0",
		"padding"			: "0",
		"width"				: "15px",
		"height"			: "15px",
		"cursor"			: "pointer"
	});
	
});

function goManageGroupList(){
	location.href="/manage/manageGroupList";
}

function goManageGroupRegister(){
	
	if($("input[name='authority']").is(":checked") == false){
		alert("권한을 선택해주세요.");
		return false;
	}
	
	if($("input[name='authority']:checked").length > 1){
		alert("권한은 한개만 선택이 가능합니다.");
		return false;
	}
	if($("#groupName").val() == ''){
		alert("그룹명을 입력해주세요.");
		$("#groupName").focus();
		return false;
	}
	
	var tempName = $("#groupName").val();
	if($("#paramName").val() == tempName){
		$("#dupCheckYn").val('Y'); 
	}else{
		$("#dupCheckYn").val('N'); 
		
	}
	
	if($("#dupCheckYn").val() == 'N'){
		alert("그룹명 중복체크를 해주세요.");
		return false;
	}
	
	var insertConfirm = confirm("그룹을 등록 하시겠습니까?");
	if(insertConfirm){
		manageGroupRegister();
	}
	
}

function manageGroupRegister(){
	
	$("#manageGroupInfo #authority").val($("input[name='authority']:checked").val());
	$("#manageGroupInfo #groupName").val($("#groupName").val());
	
	$.ajax({
		type: 'POST',
        url : "/manage/insertManageGroup",
        data: $("#manageGroupInfo").serialize(),
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

/* 중복 체크  */
function goDupCheck() {

	var paramName = $("#groupName").val();
	if($("#groupName").val() == ''){
		$("#idMent").text("*그룹명을 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	
	if(paramName == 'admin'){
		$("#idMent").text("*해당 그룹명으로는 사용하실 수 없습니다. 다시 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	
	$.ajax({
		type: 'get',
        url : "/manage/manageGroupDupCheck",
        data: {	groupName	:	paramName},
        success : function(data){
            if(data == 'success') {
              $("#idMent").text("*사용가능한 그룹명 입니다.");
              $("#idMent").show();
              $("#paramName").val(paramName);
              $("#dupCheckYn").val('Y');
            } else if(data == 'dupName'){
              $("#idMent").text("*중복된 그룹명 입니다. 다시 입력해주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            } else if(data == 'admin'){
              $("#idMent").text("*해당 그룹명으로는 사용하실 수 없습니다. 다시 입력해 주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
	
}

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    var hour = date.getHours();                   //d
    hour = hour >= 10 ? hour : '0' + hour;       //day 두자리로 저장
    var minutes = date.getMinutes();                   //d
    minutes = minutes >= 10 ? minutes : '0' + minutes;       //day 두자리로 저장
    return  year + '-' + month + '-' + day + " "+ hour+":"+minutes;
}
</script>
</body>
</html>
