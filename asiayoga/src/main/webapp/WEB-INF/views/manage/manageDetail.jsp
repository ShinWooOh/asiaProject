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

    <title>직원 정보</title>

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
                        <h1 class="m-0 text-dark">직원 정보</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">직원 관리</li>
                            <li class="breadcrumb-item active">직원 정보</li>
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
	                                <th style="width: 10%;">아이디</th>
	                                <td>
	                                	<c:out value="${manageDetail.id}"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">이름</th>
	                                <td><input type="text" id="name" name="name" value="${manageDetail.name}"></td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">연락처</th>
	                                <td>
	                               	 	<select id="phone1" name="phone1" style="width: 70px; margin-right: 3px;">
	               							<option value="010" <c:if test="${manageDetail.phone1 eq '010'}">selected</c:if> >010</option>
	               							<option value="011" <c:if test="${manageDetail.phone1 eq '011'}">selected</c:if> >011</option>
	               							<option value="016" <c:if test="${manageDetail.phone1 eq '016'}">selected</c:if> >016</option>
	               							<option value="017" <c:if test="${manageDetail.phone1 eq '017'}">selected</c:if> >017</option>
	               							<option value="018" <c:if test="${manageDetail.phone1 eq '018'}">selected</c:if> >018</option>
	               							<option value="019" <c:if test="${manageDetail.phone1 eq '019'}">selected</c:if> >019</option>
	               						</select>
									    -<input type="number" id="phone2" name="phone2" value="${manageDetail.phone2}" style="width: 70px; margin-left: 5px;">
									    -<input type="number" id="phone3" name="phone3" value="${manageDetail.phone3}" style="width: 70px; margin-left: 5px;">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">권한</th>
									<td><c:out value="${manageDetail.authorityName}"/></td>	                            	
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">매장명</th>
	                                <td><c:out value="${manageDetail.storeName}"/></td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">직급</th>
	                                <td>
	                                	<select id="manageGroupSeq" name="manageGroupSeq" style="width: 250px;">
	                                		<option value="000">직급을 선택하세요</option>
	                                		<c:forEach var="manageGroupList" items="${manageGroupList}">
		                                		<option value="${manageGroupList.manageGroupSeq}" <c:if test="${manageGroupList.manageGroupSeq eq manageDetail.manageGroupSeq}">selected</c:if> >${manageGroupList.groupName}</option>
	                                		</c:forEach>
	                                	</select>
	                                </td>
	                            </tr>
                           		<tr>
                					<th style="width: 10%">메모</th>
                					<td><textarea id="memo" name="memo" rows="3" cols="150"><c:out value="${manageDetail.memo}"/></textarea></td>
	                			</tr>
	                			<tr>
	                            	<th colspan="2">
	                            		<font style=" color: red;">	*&nbsp;직급 선택 시 없는 경우<br>
	                            								   	 &nbsp;"직원관리 > 직급등록" 에서 등록 절차를 거치신 후 선택 가능합니다.<br>
	                            								   	*기타 문의의 경우 관리자에게 문의를 주시면 감사하겠습니다.
	                            		</font> 
	                            	</th>
	                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="manageFooter" style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goManageList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="수정" onclick="goUpdateManage(${manageDetail.manageSeq});" style="float: right; width:80px;">
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
<form:form id="manageDetail" name="manageDetail" modelAttribute="manageVO">
	<input type="hidden" id="manageSeq" name="manageSeq">
	<input type="hidden" id="name" name="name">
	<input type="hidden" id="phone" name="phone">
	<input type="hidden" id="manageGroupSeq" name="manageGroupSeq">
	<input type="hidden" id=memo name="memo">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>
<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
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
	
	
});

function goManageList(){
	location.href="/manage/manageList";
}

function goUpdateManage(manageSeq){
	
	if($("#phone2").val() == ''){
		alert("연락처를 입력해주세요");
		$("#phone2").focus();
		return false;
	}
	if($("#phone3").val() == ''){
		alert("연락처를 입력해주세요");
		$("#phone3").focus();
		return false;
	}
	
	if($("#manageGroupSeq option:selected").val() == '000'){
		alert("직급을 선택해주세요");
		return false;
	}
	
	var insertConfirm = confirm("수정 하시겠습니까?");
	if(insertConfirm){
		manageRegister(manageSeq);
	}
	
}

function manageRegister(manageSeq){
	
	$("#manageDetail #manageSeq").val(manageSeq);
	
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var phone = '';
	
	phone = phone1 +'-'+ phone2 +'-'+ phone3;
	$("#manageDetail #phone").val(phone);
	$("#manageDetail #name").val($("#name").val());
	
	var manageGroupSeq = $("#manageGroupSeq option:selected").val();
	$("#manageDetail #manageGroupSeq").val(manageGroupSeq);
	$("#manageDetail #memo").val($("#memo").val());
	
	$.ajax({
		type: 'POST',
        url : "/manage/updateManage",
        data: $("#manageDetail").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("수정하였습니다.");
              location.reload();
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
