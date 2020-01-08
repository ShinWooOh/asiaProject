<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <title>회원 상세 정보</title>

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
                        <h1 class="m-0 text-dark">회원 상세 정보</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">회원 정보</li>
                            <li class="breadcrumb-item active">회원 상세 정보</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content container-fluid" style="background-color: #FFFFFF">

            <div class="col-lg-12">
            <form:form action="/member/memberUpdate" id="memberUpdate" name="memberUpdate" modelAttribute="memberVO" method="post">
                <div>
                    <div>
                    	<c:set var="memberDetail" value="${memberDetail}" />
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                            	<td>회원번호</td>
                            	<td>
                            		<input type="hidden" id="memberSeq" name="memberSeq" value="${memberDetail.memberSeq}">
									<c:out value="${memberDetail.memberSeq}"/>
								</td>
                            </tr>
                            <tr>
                            	<td>회원명</td>
                            	<td>
                            		<c:out value="${memberDetail.name}"/>
									<input type="hidden" id="name" name="name" value="${memberDetail.name}">
                            	</td>
                            </tr>
                            <tr>
                            	<td>연락처</td>
                            	<td>
                            		<c:out value="${memberDetail.phone}"/>
									<input type="hidden" id="phone" name="phone" value="${memberDetail.phone}">
                            	</td>
                            </tr>
                            <tr>
                            	<td>이메일</td>
                            	<td>
                            		<c:out value="${memberDetail.email}"/>
									<input type="hidden" id="email" name="email" value="${memberDetail.email}">
                            	</td>
                            </tr>
                            <tr>
                            	<td>생년월일</td>
                            	<td>
                            		<c:out value="${memberDetail.birth}"/>
									<input type="hidden" id="birth" name="birth" value="${memberDetail.birth}">
                            	</td>
                            </tr>
                            <tr>
                            	<td>등록매장</td>
                            	<td>
                            		<c:out value="${memberDetail.storeName}"/>
                            		<input type="hidden" id="storeName" name="storeName" value="${memberDetail.storeName}">
                            		<input type="hidden" id="storeSeq" name="storeSeq" value="${memberDetail.storeSeq}">
                            	</td>
                            </tr>
                            <tr>
                            	<td>성별</td>
                            	<td>
	                            	<c:choose>
	                            		<c:when test="${memberDetail.sex eq 'M'}">남</c:when>
	                            		<c:otherwise>여</c:otherwise>
	                            	</c:choose>
									<input type="hidden" id="sex" name="sex" value="${memberDetail.sex}">
                            	</td>
                            </tr>
                            <tr>
                            	<th>메모</th> 
                            	<td>
                            		<textarea rows="5" cols="100" readonly="readonly"><c:out value="${memberDetail.memo}"/></textarea>
                            		<input type="hidden" id="memo" name="memo" value="${memberDetail.memo}">
                            	</td>                           	
                            </tr>
                            </tbody>
                        </table>
                        
                      <!--   <table class="table2 table-bordered">
                            <tbody>
                            </tbody>
                        </table> -->
                    </div>
                    <div style="margin-top: 10px;">
                		<input type="button" value="목록" onclick="goMemberList();" style="float: left; width:80px;">
                		<input type="button" value="수정" onclick="goUpdateMember();" style="float: right; width:80px;">
                	</div>
                </div>
                </form:form>
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

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>11
<script type="text/javascript">

function goUpdateMember(){
	
	var insertConfirm = confirm("확인 버튼 클릭 시 수정화면으로 이동합니다.");
	if(insertConfirm){
		$("#memberUpdate").submit();
	}
}

function goMemberList(){
	location.href="/member/memberList";
}

</script>
</body>
</html>
