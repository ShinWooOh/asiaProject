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

    <title>품목 현황</title>

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
                        <h1 class="m-0 text-dark">품목 관리</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품 품목</li>
                            <li class="breadcrumb-item active">품목 관리</li>
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
                                <th style="width: 5%">No</th>
                                <th style="width: 15%">등록매장</th>
                                <th style="width: 10%">품목번호</th>
                                <th style="width: 15%">품목구분</th>
                                <th style="width: 45%">품목명</th>
                                <th style="width: 10%"></th>
                            </tr>
                            <c:choose>
                            	<c:when test="${fn:length(itemList) > 0}">
                            		<c:forEach var="itemList" items="${itemList}">
		                            <tr>
		                            	<td><c:out value="${itemList.rowNum}"/></td>
		                            	<td><c:out value="${itemList.storeName}"/></td>
		                            	<td><c:out value="${itemList.itemSeq}"/></td>
		                            	<td>
		                            		<c:choose>
			                            		<c:when test="${itemList.largeCategory eq '001'}">일반상품</c:when>
			                            		<c:when test="${itemList.largeCategory eq '002'}">락카</c:when>
			                            		<c:when test="${itemList.largeCategory eq '003'}">운동복</c:when>
			                            		<c:otherwise>기타</c:otherwise>
		                            		</c:choose>
		                            	</td>
		                            	<td><a href="#" onclick="goDetailItem(${itemList.itemSeq},${itemList.storeSeq});"><c:out value="${itemList.itemName}"/></a></td>
		                            	<td align="center">
		                            		<input type="button" id="itemDelBtn" name="itemDelBtn" onclick="goItemDel(${itemList.itemSeq},${itemList.storeSeq});" value="삭제">
		                            	</td>
		                            </tr>
                            		</c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		<tr><th colspan="6" style="text-align: center;">결과가 없습니다.</th></tr>
                            	</c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 10px;" id="attendanceFooter">
                		<input type="button" value="품목 등록" onclick="goItemRegister();" style="float: right; width:80px;">
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
    <%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<form:form action="/item/itemDetail" id="itemInfo" name="itemInfo" modelAttribute="itemVO" method="post">
	<input type="hidden" id="itemSeq" name="itemSeq">
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

function goDetailItem(itemSeq,storeSeq) {
 	$("#itemInfo #itemSeq").val(itemSeq);
	$("#itemInfo #storeSeq").val(storeSeq);
	$("#itemInfo").submit();
}

function goItemDel(itemSeq,storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?");
	if(!delConfirm){
		return false;
	}else{
	 	$("#itemInfo #itemSeq").val(itemSeq);
		$("#itemInfo #storeSeq").val(storeSeq);
	}
	

	$.ajax({
        type:'POST',
        url : "/item/itemDelete",
        data:$("#itemInfo").serialize(),
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

function goItemRegister(){
	location.href="/item/itemRegister";
}

</script>
</body>
</html>
