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

    <title>출석 등록</title>

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
                        <h1 class="m-0 text-dark">출석 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">출석</li>
                            <li class="breadcrumb-item active">출석 등록</li>
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
                    	<c:set var="memberDetail" value="${memberDetail}" />
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th style="width: 60px">회원번호</th>
                                <th style="width: 80px">회원명</th>
                                <th style="width: 100px">연락처</th>
                                <th style="width: 100px">이메일</th>
                                <th style="width: 150px">생년월일</th>
                                <th style="width: 60px">성별</th>
                            </tr>
                           
	                            <tr>
	                            	<td><c:out value="${memberDetail.memberSeq}"/></td>
	                            	<td>
	                            		<c:choose>
	                            			<c:when test="${memberDetail.name ne null}"><c:out value="${memberDetail.name}"/></c:when>
	                            			<c:otherwise>
	                            				<input type="text" id="paramName" name="paramName" readonly="readonly">
	                            				<input type="button" id="findName" name="findName" value="이름 찾기" data-toggle="modal" data-target="#findMember">
	                            			</c:otherwise>
	                            		</c:choose>
	                            		<c:out value="${memberDetail.name}"/>
	                            	</td>
	                            	<td><c:out value="${memberDetail.phone}"/></td>
	                            	<td><c:out value="${memberDetail.email}"/></td>
	                            	<td><c:out value="${memberDetail.birth}"/></td>
	                            	<td>
		                            	<c:choose>
		                            		<c:when test="${memberDetail.sex eq 'M'}">남</c:when>
		                            		<c:when test="${memberDetail.sex eq 'W'}">여</c:when>
		                            		<c:otherwise></c:otherwise>
		                            	</c:choose>
	                            	</td>
	                            </tr>
                           
                            
                            </tbody>
                        </table>
                        
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th>출석날짜</th>
                            	<td>
                            		<input type="text" id="datepicker" name="datepicker" readonly="readonly">
                            	</td>
                            </tr>
                            <tr>
                                <th>시간</th>
                                <td>
                                	<select id="hour" name="hour"  style="margin-left: 5px;">
										<c:forEach var="i" begin="0" end="24">
											<option><c:out value="${i}"/></option>
										</c:forEach>
                                	</select>시
                                	<select id="minute" name="minute"  style="margin-left: 5px;">
										<c:forEach var="k" begin="0" end="59">
											<option><c:out value="${k}"/></option>
										</c:forEach>
                                	</select>분
                                </td>
                            </tr>
                            <tr>
                                <th>상품</th>
                            	<td><c:out value="${orderDetail.productName}"/></td>
                            </tr>
                            <tr id="pdRow">
                            	<c:choose>
                            		<c:when test="${orderDetail.productCode eq '001'}"></c:when>
                            		<c:when test="${orderDetail.productCode eq '002'}">
                            		<th>남은 횟수</th>
                            		<td><c:out value="${orderDetail.remainingCount}"/>회</td></c:when>
                            		<c:otherwise></c:otherwise>
                            	</c:choose>
                            </tr>
                            <tr>
                                <th style="width: 150px">지점</th>
                            	<td>
                            		<c:choose>
                            			<c:when test="${orderDetail.storeSeq eq '10'}">레이디요가 의정부점</c:when>
                            			<c:when test="${orderDetail.storeSeq eq null}"></c:when>
                            			<c:otherwise>준비중입니다.</c:otherwise>
                            		</c:choose>
                            	</td>
                            </tr>
                            
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 10px;">
                		<input type="button" value="목록" onclick="goAttendanceList();" style="float: left; width:80px;">
                		<input type="button" value="출석 등록" onclick="goAttendanceRegister(${orderDetail.memberSeq},${orderDetail.storeSeq},${orderDetail.orderSeq});" style="float: right; width:80px;">
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
<form:form id="attendanceInfo" name="attendanceInfo" modelAttribute="attendanceVO" method="post">
	<input type="hidden" id="memberSeq" name="memberSeq">
	<input type="hidden" id="storeSeq" name="storeSeq">
	<input type="hidden" id="attendanceDate" name="attendanceDate">
	<input type="hidden" id="orderSeq" name="orderSeq">
	<input type="hidden" id="name" name="name">
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
	
	$('#datepicker').datepicker({
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

function goAttendanceList(){
	location.href="/attendance/info";
}

function goAttendanceRegister(memberSeq,storeSeq,orderSeq){
	
	if($("#datepicker").val() == ''){
		alert("출석 날짜를 선택해주세요.");
		return false;
	}
	var insertConfirm = confirm("출석 등록 하시겠습니까?");
	if(insertConfirm){
		attendanceRegister(memberSeq,storeSeq,orderSeq);
	}
	
}

function attendanceRegister(memberSeq,storeSeq,orderSeq){
	
	$("#memberSeq").val(memberSeq);
	$("#storeSeq").val(storeSeq);
	$("#orderSeq").val(orderSeq);
	
	
	var date = $("#datepicker").val();
	var hour = $("#hour").val();
	var minute = $("#minute").val();
	
	if(hour.length < 2){
		hour = '0'+ hour;
	}
	if(minute.length < 2){
		minute = '0'+ minute;
	}
	
	var dateSplit = date.split("-");
 	var attendanceDate = new Date(dateSplit[0],dateSplit[1]-1,dateSplit[2],hour,minute);
	$("#attendanceDate").val(attendanceDate);
	
	$.ajax({
		type: 'POST',
        url : "/attendance/insertAttendance",
        data: $("#attendanceInfo").serialize(),
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

function searchName(){
	
	if($("#popName").val() ==''){
		alert("이름을 입력해 주세요");
		return false;
	}
	
	var paramName = $("#popName").val();
	$("#name").val(paramName);
	
/* 	$.ajax({
		type: 'POST',
        url : "/attendance/searchMember",
        data: $("#attendanceInfo").serialize(),
        success : function(data){
            if(data == 'success'){
            	
            }
            
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
        
    }); */
}


</script>


<!--popUp Modal -->
<div class="modal fade" id="findMember" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">회원 찾기</h4>
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popName" name="popName"  placeholder="이름">
					<input type="button" id="popFindName" name="popFindName" value="찾기" onclick="searchName();" style="margin-bottom: 10px;">
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<table class="table table-bordered" style="margin-top: 20px;">
						<tbody>
							<tr>
								<th>이름</th>
								<th>연락처</th>
								<th>성별</th>
								<th>등록상품</th>
							</tr>
							<c:choose>
								<c:when test="${popMemberList ne null and popMemberList ne ''}">
									<c:forEach var="popMemberList" items="${popMemberList}">
										<tr>
											<td>${popMemberList.name}</td>
											<td>${popMemberList.phone}</td>
											<td>${popMemberList.sex}</td>
											<td>${popMemberList.productName}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
								</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
