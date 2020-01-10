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
                           
                            <tr id="memberInfo">
                            	<td><c:out value="${memberDetail.memberSeq}"/></td>
                            	<td>
                            		<c:choose>
                            			<c:when test="${memberDetail.name ne null}"><c:out value="${memberDetail.name}"/></c:when>
                            			<c:otherwise>
                            				<input type="text" id="paramName" name="paramName" readonly="readonly">
                            				<input type="button" id="findName" name="findName" value="이름 찾기" data-toggle="modal" data-target="#findMember">
                            			</c:otherwise>
                            		</c:choose>
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
                            <tr id="attendanceProductName">
                                <th>상품</th>
                            	<td><c:out value="${orderDetail.productName}"/></td>
                            </tr>
                            <tr id="attendanceProductCode">
                            	<c:choose>
                            		<c:when test="${orderDetail.productCode eq '001'}"></c:when>
                            		<c:when test="${orderDetail.productCode eq '002'}">
	                            		<th>남은 횟수</th>
	                            		<td><c:out value="${orderDetail.remainingCount}"/>회</td>
                            		</c:when>
                            		<c:otherwise></c:otherwise>
                            	</c:choose>
                            </tr>
                            <tr id="attendanceStoreSeq">
                                <th style="width: 150px;">지점</th>
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
                    <div style="margin-top: 10px;" id="attendanceFooter">
                		<input type="button" value="목록" onclick="goAttendanceList();" style="float: left; width:80px;">
                		<input type="button" value="출석 등록" onclick="goAttendanceRegister(${orderDetail.memberSeq},${orderDetail.storeSeq},${orderDetail.orderSeq},'${orderDetail.productCode}');" style="float: right; width:80px;">
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
	<input type="hidden" id="productCode" name="productCode">
	<input type="hidden" id="name" name="name">
	<input type="hidden" id="remainingCount" name="remainingCount" value="${orderDetail.remainingCount}">
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
	
	/* 회원검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popName").keydown(function(key){
		if(key.keyCode == 13){
			searchName();
		}
	});
	
});

function goAttendanceList(){
	location.href="/attendance/info";
}

function goAttendanceRegister(memberSeq,storeSeq,orderSeq,productCode){
	
	if($("#datepicker").val() == ''){
		alert("출석 날짜를 선택해주세요.");
		return false;
	}
	var insertConfirm = confirm("출석 등록 하시겠습니까?");
	if(insertConfirm){
		attendanceRegister(memberSeq,storeSeq,orderSeq,productCode);
	}
	
}

function attendanceRegister(memberSeq,storeSeq,orderSeq,productCode){
	
	$("#memberSeq").val(memberSeq);
	$("#storeSeq").val(storeSeq);
	$("#orderSeq").val(orderSeq);
	$("#productCode").val(productCode);
	
	
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
		$("#popName").focus();
		return false;
	}
	
	var paramName = $("#popName").val();
	var paramStoreSeq = 10;
	
 	$.ajax({
		type: 'POST',
        url : "/attendance/searchMember",
        data: {	name : paramName,
        		storeSeq : paramStoreSeq
        		},
        success : function(data){
            if(data.result == 'success'){
            	popMemberList(data.popMemberList);
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


/* 팝업파트 */
function popMemberList(popMemberList){
	var paramList = '';
	
	for(var i = 0 ; i < popMemberList.length; i++ ){
		var paramMemberSeq = 0;
		var paramName = '';
		var paramPhone = '';
		var paramEmail = '';
		var paramBirth = '';
		var paramSex = '';
		var paramProductName = '';
		var paramProductCode = '';
		var paramStoreSeq = 0;
		var paramStoreName = '';
		var paramOrderSeq = 0;
		var paramRemainingCount = 0;
		
		paramMemberSeq = popMemberList[i].memberSeq;
		paramName = popMemberList[i].name;
		paramPhone = popMemberList[i].phone;
		paramEmail = popMemberList[i].email;
		paramBirth = popMemberList[i].birth;
		paramSex = popMemberList[i].sex;
		paramProductName = popMemberList[i].productName;
		paramProductCode = popMemberList[i].productCode;
		var paramProductEndDay = new Date(popMemberList[i].productEndDay);
		paramProductEndDay = getFormatDate(paramProductEndDay);
		paramStoreSeq = popMemberList[i].storeSeq;
		paramStoreName = popMemberList[i].storeName;
		paramOrderSeq = popMemberList[i].orderSeq;
		paramRemainingCount = popMemberList[i].remainingCount;
		
		paramList = '<td>'+popMemberList[i].rowNum+'</td>';
		paramList += '<td>';
 		paramList += '<a href="#" onclick="popMemberSelect('+paramMemberSeq+', \''+paramName+'\' , \''+paramPhone+'\' , \''+paramEmail+'\' , \''+paramBirth+'\' , \''+paramSex+'\' , \''+paramProductName+'\' , \''+paramProductCode+'\' , \''+paramProductEndDay+'\' , '+paramStoreSeq+' , \''+paramStoreName+'\' , '+paramOrderSeq+', '+paramRemainingCount+');">'; 
		paramList +=  popMemberList[i].name+'</a>';
		paramList += '</td>';
		paramList += '<td>'+popMemberList[i].phone+'</td>';
		paramList += '<td>'+popMemberList[i].sex+'</td>';
		paramList += '<td>'+popMemberList[i].productName+'</td>';
	}
	
	$("#memberList").text("");
	$("#memberList").append(paramList);
}

function popMemberSelect(memberSeq,name,phone,email,birth,sex,productName,productCode,productEndDay,storeSeq,storeName,orderSeq,remainingCount) {
	
	var paramMemberInfo = '';
	paramMemberInfo = '<td>'+memberSeq+'</td>';
	paramMemberInfo += '<td>';
	paramMemberInfo += '<input type="text" id="paramName" name="paramName" readonly="readonly" value='+name+'>';
	paramMemberInfo += '<input type="button" id="findName" name="findName" value="이름찾기" data-toggle="modal" data-target="#findMember">';
	paramMemberInfo += '</td>';
	paramMemberInfo += '<td>'+phone+'</td>';
	paramMemberInfo += '<td>'+email+'</td>';
	paramMemberInfo += '<td>'+birth+'</td>';
	paramMemberInfo += '<td>';
	if(sex == 'M'){
		paramMemberInfo += '남';
	}else if(sex == 'W'){
		paramMemberInfo += '여';
	}else{
		paramMemberInfo += '';
	}
	paramMemberInfo += '</td>';
	
	$("#memberInfo").text("");
	$("#memberInfo").append(paramMemberInfo);
	
	/* 상품 정보  */
	var paramAttendanceProductName = '';
	paramAttendanceProductName = '<th>상품</th>';
	paramAttendanceProductName += '<td>'+productName+'</td>';
	$("#attendanceProductName").text("");
	$("#attendanceProductName").append(paramAttendanceProductName);
	
	
	/* 상품 정보에 따른 추가 정보  */
	var paramProductCode = '';
	
	if(productCode == '001'){
		paramProductCode = '<tr id="productState">';
		paramProductCode +='<th>종료일</th>';
		paramProductCode +='<td>'+productEndDay+'</td>';
		paramProductCode +='</tr>';
	}else if(productCode == '002'){
		paramProductCode = '<tr id="productState">';
		paramProductCode +='<th>남은횟수</th>';
 		paramProductCode +='<td>'+remainingCount+'</td>';
		paramProductCode +='</tr>';
		$("#remainingCount").val(remainingCount);
	}
	
	if($("#productState").length == 0){
		$("#attendanceProductName").after(paramProductCode);
	}else{
		$("#productState").remove("");
		$("#attendanceProductName").after(paramProductCode);
	}
	
	/* 지점 표시 */
	var paramAttendanceStoreSeq = '';
	paramAttendanceStoreSeq = '<th style="width: 150px;">지점</th>';
	paramAttendanceStoreSeq += '<td>'+storeName+'</td>';
	$("#attendanceStoreSeq").text("");
	$("#attendanceStoreSeq").append(paramAttendanceStoreSeq);
	
	/* 하단 부분 */
	var paramAttendanceFooter = '';
	paramAttendanceFooter = '<div style="margin-top: 10px;" id="attendanceFooter">';
	paramAttendanceFooter += '<input type="button" value="목록" onclick="goAttendanceList();" style="float: left; width:80px;">';
	paramAttendanceFooter += '<input type="button" value="출석 등록" onclick="goAttendanceRegister('+memberSeq+','+storeSeq+','+orderSeq+',\''+productCode+'\');" style="float: right; width:80px;">';
	paramAttendanceFooter += '</div>';
	$("#attendanceFooter").text("");
	$("#attendanceFooter").append(paramAttendanceFooter);
	
	popClose();
	$("#findMember").modal('toggle');
}

function popClose(){
	$("#popName").val("");
	
	var paramDefaultList = '<th colspan="5" style="text-align: center;">결과가 없습니다.</th>';
	
	$("#memberList").text("");
	$("#memberList").append(paramDefaultList);
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


<!--popUp Modal -->
<div class="modal fade" id="findMember" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">회원 찾기</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popClose();">&times;</button>
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
								<th>No</th>
								<th>이름</th>
								<th>연락처</th>
								<th>성별</th>
								<th>등록상품</th>
							</tr>
							<tr id="memberList"><th colspan="5" style="text-align: center;">결과가 없습니다.</th></tr>
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
