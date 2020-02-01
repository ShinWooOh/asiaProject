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

    <title>휴회 상세</title>

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
                        <h1 class="m-0 text-dark">휴회 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">휴회</li>
                            <li class="breadcrumb-item active">휴회 상세</li>
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
                    	<c:set var="memberDetail" value="${adjournmentDetail}" />
                        <table class="table table-bordered">
                            <tbody>
    							<tr>
	                                <th style="width: 10%;">회원번호</th>
	                                <th style="width: 25%">회원명</th>
	                                <th style="width: 15%">연락처</th>
	                                <th style="width: 20%">이메일</th>
	                                <th style="width: 20%">생년월일</th>
	                                <th style="width: 10%">성별</th>
	                            </tr>
                           
	                            <tr id="memberInfo">
	                            	<td align="center"><c:out value="${adjournmentDetail.memberSeq}"/></td>
	                            	<td><c:out value="${adjournmentDetail.name}"/></td>
	                            	<td><c:out value="${adjournmentDetail.phone}"/></td>
	                            	<td><c:out value="${adjournmentDetail.email}"/></td>
	                            	<td><c:out value="${adjournmentDetail.birth}"/></td>
	                            	<td>
		                            	<c:choose>
		                            		<c:when test="${adjournmentDetail.sex eq 'M'}">남</c:when>
		                            		<c:when test="${adjournmentDetail.sex eq 'W'}">여</c:when>
		                            		<c:otherwise></c:otherwise>
		                            	</c:choose>
	                            	</td>
	                            </tr>
                            </tbody>
                        </table>
                        
                        <table class="table table-bordered">
                            <tbody>
                            <tr id="adjournmentProductName">
                                <th>상품</th>
                            	<td><c:out value="${adjournmentDetail.productName}"/></td>
                                <th>품목구분</th>
                            	<td><c:out value="${adjournmentDetail.itemName}"/></td>
                            </tr>
                            <tr id="adjournmentProductCount">
                           		<th>잔여 횟수</th>
                           		<td><c:out value="${adjournmentDetail.remainingCount}"/></td>
                           		<th>등록 횟수</th>
                           		<td><c:out value="${adjournmentDetail.productCount}"/></td>
                            </tr>
                            <tr id="adjournmentStoreSeq">
                                <th>매장명</th>
                            	<td><c:out value="${adjournmentDetail.storeName}"/></td>
                                <th></th>
                            	<td></td>
                            </tr>
                            <tr>
                                <th style="width: 10%;">휴회시작일</th>
                            	<td style="width: 40%;">
                            		<fmt:formatDate pattern="yyyy-MM-dd" value="${adjournmentDetail.adjournmentStart}" var="adjournmentStart" />
                            		<input type="text" id="adjournmentStart" name="adjournmentStart" value="${adjournmentStart}" readonly="readonly">
                            	</td>
                                <th style="width: 10%;">휴회종료일</th>
                            	<td style="width: 40%;">
                            		<fmt:formatDate pattern="yyyy-MM-dd" value="${adjournmentDetail.adjournmentEnd}" var="adjournmentEnd" />
                            		<input type="text" id="adjournmentEnd" name="adjournmentEnd" value="${adjournmentEnd}" readonly="readonly">
                            	</td>
                            </tr>
                            <tr>
                            	<th style="width: 10%">휴회 상태</th>
                            	<td style="width: 40%;">
                            		<select id="adjournmentState" name="adjournmentState">
                            			<option value="S">선택하세요</option>
                            			<option value="Y" <c:if test="${adjournmentDetail.adjournmentState eq 'Y'}">selected</c:if> >휴회</option>
                            			<option value="N" <c:if test="${adjournmentDetail.adjournmentState eq 'N'}">selected</c:if> >미휴회</option>
                            		</select>
                            	</td>
                            	<th style="width: 10%"></th>
                            	<td style="width: 40%;"></td>
                            </tr>
                          	<tr>
                          		<th style="width: 10%">메모</th>
		                        <td colspan="3">
		                        	<textarea rows="3" cols="130" id="adjournmentMemo" name="adjournmentMemo">${adjournmentDetail.adjournmentMemo}</textarea>
		                        </td>
                          	</tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="adjournmentFooter" style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goAdjournmentList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="수정" onclick="goAdjournmentUpdate(${adjournmentDetail.adjournmentSeq});" style="float: right; width:80px;">
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
<form:form id="adjournmentInfo" name="adjournmentInfo" modelAttribute="adjournmentVO" method="post">
	<input type="hidden" id="adjournmentSeq" name="adjournmentSeq">
	<input type="hidden" id="adjournmentStart" name="adjournmentStart">
	<input type="hidden" id="adjournmentEnd" name="adjournmentEnd">
	<input type="hidden" id="adjournmentState" name="adjournmentState">
	<input type="hidden" id="adjournmentMemo" name="adjournmentMemo">
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
	
	$('#adjournmentStart').datepicker({
		dateFormat: 'yy-mm-dd', 
		showOtherMonths: true, 
		showMonthAfterYear:true,
		changeYear: true,
		changeMonth: true,
		showOn: "button",
		yearSuffix: "년",
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		buttonImage: "/resources/image/calendar_btn.png" //버튼에 띄워줄 이미지 경로
	});
	
	$('#adjournmentEnd').datepicker({
		dateFormat: 'yy-mm-dd', 
		showOtherMonths: true, 
		showMonthAfterYear:true,
		changeYear: true,
		changeMonth: true,
		showOn: "button",
		yearSuffix: "년",
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		buttonImage: "/resources/image/calendar_btn.png" //버튼에 띄워줄 이미지 경로
	});
	
	
});

function goAdjournmentList(){
	location.href="/adjournment/adjournmentList";
}

function goAdjournmentUpdate(adjournmentSeq){
	
	if($("#adjournmentStart").val() == ''){
		alert("휴회 시작일을 선택해주세요.");
		return false;
	}
	
	if($("#adjournmentEnd").val() == ''){
		alert("휴회 종료일을 선택해주세요.");
		return false;
	}
	
	if($("#adjournmentState option:selected").val() == 'S'){
		alert("휴회 상태를 선택해주세요.");
		return false;
	}
	
	var updateConfirm = confirm("휴회 정보를 수정 하시겠습니까?");
	if(updateConfirm){
		adjournmentUpdate(adjournmentSeq);
	}
	
}

function adjournmentUpdate(adjournmentSeq){
	
	$("#adjournmentInfo #adjournmentSeq").val(adjournmentSeq);
	
	var adjournmentStartDay = $("#adjournmentStart").val();
	var adjournmentEndDay = $("#adjournmentEnd").val();
	
	var startDateSplit = adjournmentStartDay.split("-");
	var endDateSplit = adjournmentEndDay.split("-");
 	$("#adjournmentInfo #adjournmentStart").val(new Date(startDateSplit[0],startDateSplit[1]-1,startDateSplit[2]));
 	$("#adjournmentInfo #adjournmentEnd").val(new Date(endDateSplit[0],endDateSplit[1]-1,endDateSplit[2]));
	
 	var paramAdjournmentState = $("#adjournmentState option:selected").val();
	$("#adjournmentInfo #adjournmentState").val(paramAdjournmentState);
 	
	$("#adjournmentInfo #adjournmentMemo").val($("#adjournmentMemo").val());
	
	$.ajax({
		type: 'POST',
        url : "/adjournment/updateAdjournment",
        data: $("#adjournmentInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("수정 하였습니다.");
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
