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
	            <form:form action="/member/memberUpdate" id="memberUpdate" name="memberUpdate" modelAttribute="memberVO" method="POST">
	                <div>
	                    <div>
	                    	<c:set var="memberDetail" value="${memberDetail}" />
	                        <table class="table table-bordered">
	                            <tbody>
	                            <tr>
	                            	<td>회원명</td>
	                            	<td colspan="3">
	                            		<c:out value="${memberDetail.name}"/>
										<input type="hidden" id="name" name="name" value="${memberDetail.name}">
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td>회원번호</td>
	                            	<td colspan="3">
	                            		<input type="hidden" id="memberSeq" name="memberSeq" value="${memberDetail.memberSeq}">
	                            		<input type="hidden" id="myMembership" name="myMembership" value="${memberDetail.myMembership}">
										<c:out value="${memberDetail.myMembership}"/>
									</td>
	                            </tr>
	                            <tr>
	                            	<td style="width: 8%;">생년월일</td>
	                            	<td style="width: 25%;">
	                            		<c:out value="${memberDetail.birth}"/>
										<input type="hidden" id="birth" name="birth" value="${memberDetail.birth}">
	                            	</td>
	                            	<td style="width: 8%;">성별</td>
	                            	<td style="width: 25%;">
		                            	<c:choose>
		                            		<c:when test="${memberDetail.sex eq 'M'}">남</c:when>
		                            		<c:when test="${memberDetail.sex eq 'W'}">여</c:when>
		                            		<c:otherwise></c:otherwise>
		                            	</c:choose>
										<input type="hidden" id="sex" name="sex" value="${memberDetail.sex}">
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td>연락처</td>
	                            	<td colspan="3">
	                            		<c:out value="${memberDetail.phone}"/>
										<input type="hidden" id="phone" name="phone" value="${memberDetail.phone}">
	                            	</td>
	                            </tr>
                				<tr>
                					<td>주소</td>
                					<td colspan="3">우편번호 : ${memberDetail.postCode}<br>
                									지번주소 :  ${memberDetail.jibunAddress} ${memberDetail.detailAddress}<br>
                									(${memberDetail.roadAddress} , ${memberDetail.extraAddress})
                									
            							<input type="hidden" id="postCode" name="postCode"  style="margin-bottom: 5px;" value="${memberDetail.postCode}">
										<input type="hidden" id="roadAddress" name="roadAddress" style="margin-top:5px; margin-bottom:5px; width:300px;" value="${memberDetail.roadAddress}"><br>
										<input type="hidden" id="jibunAddress" name="jibunAddress"  style="width: 300px;" value="${memberDetail.jibunAddress}">
										<input type="hidden" id="detailAddress" name="detailAddress" style="width: 300px;" value="${memberDetail.detailAddress}">
										<input type="hidden" id="extraAddress" name="extraAddress" style="width: 100px;" value="${memberDetail.extraAddress}">
                					</td>
                				</tr>
	                            <tr>
	                            	<td>이메일</td>
	                            	<td colspan="3">
	                            		<c:out value="${memberDetail.email}"/>
										<input type="hidden" id="email" name="email" value="${memberDetail.email}">
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td style="width: 8%;">등록매장</td>
	                            	<td style="width: 25%;">
	                            		<c:out value="${memberDetail.storeName}"/>
	                            		<input type="hidden" id="storeName" name="storeName" value="${memberDetail.storeName}">
	                            		<input type="hidden" id="storeSeq" name="storeSeq" value="${memberDetail.storeSeq}">
	                            	</td>
	                            	<td style="width: 8%;">가입일</td>
	                            	<td style="width: 25%;">
	                            		<fmt:formatDate value="${memberDetail.joinDate}" pattern="yyyy-MM-dd" var="joinDate"/>${joinDate}
	                            		<input type="hidden" id="joinDate" name="joinDate" value="${joinDate}">
	                            	</td>
	                            </tr>
	                            <tr>
	                            </tr>
	                            <tr>
	                            	<td>메모</td> 
	                            	<td colspan="5">
	                            		<textarea rows="6" cols="150" readonly="readonly"><c:out value="${memberDetail.memo}"/></textarea>
	                            		<input type="hidden" id="memo" name="memo" value="${memberDetail.memo}">
	                            	</td>                           	
	                            </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div style="margin-top: 10px;">
	                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goMemberList();" style="float: left; width:80px;">
	                		<input type="button" class="btn btn-block btn-success" value="수정" onclick="goUpdateMember();" style="float: right; width:80px;">
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
    <%-- <%@ include file="/WEB-INF/views/include/main_footer.jsp" %> --%>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

function defaultCss() {
	$("#checkMyMembership").css({
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
function goUpdateMember(){
	
	var insertConfirm = confirm("확인 버튼 클릭 시 수정화면으로 이동합니다.");
	if(insertConfirm){
		var joinDate = $("#joinDate").val();
		
		var joinDateSplit = joinDate.split("-");
	 	$("#joinDate").val(new Date(joinDateSplit[0],joinDateSplit[1]-1,joinDateSplit[2]));
	 	
		$("#memberUpdate").submit();
	}
}

function goMemberList(){
	location.href="/member/memberList";
}

</script>
</body>
</html>
