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


    <title>직원 그룹 목록</title>

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
                        <h1 class="m-0 text-dark">직원 그룹 목록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">직원 관리</li>
                            <li class="breadcrumb-item active">직원 그룹 목록</li>
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
                                <th style="width: 10%;">No</th>
                                <th style="width: 30%;">그룹명</th>
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
                    <div id="attendanceFooter" style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="등록" onclick="goManageGroupRegister();" style="float: right; width:80px;">
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


<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

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
	
	var changeConfirm = confirm("해당 그룹 상태를 "+paramUseYn+" 으로 변경 하시겠습니까?");
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

</script>
</body>
</html>
