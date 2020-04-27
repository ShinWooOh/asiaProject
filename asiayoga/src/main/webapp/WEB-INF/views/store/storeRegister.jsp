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

    <title>매장 등록</title>

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
                        <h1 class="m-0 text-dark">매장 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">매장</li>
                            <li class="breadcrumb-item active">매장 등록</li>
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
                		<form:form id="storeInfo" name="storeInfo" modelAttribute="storeVO" method="post">
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<th>매장명<font style="color: red;">&nbsp;*</font></th>
	                					<td><input type="text" id="storeName" name="storeName" style="width: 30%;"></td>
	                				</tr>
	                				<tr>
	                					<th>매장 전화 연락처<font style="color: red;">&nbsp;*</font></th>
									    <td>
										    <input type="text" id="storeTel1" name="storeTel1" style="width: 70px; margin-left: 5px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storeTel2" name="storeTel2" style="width: 70px; margin-left: 5px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storeTel3" name="storeTel3" style="width: 70px; margin-left: 5px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    <font style="color: red; font-size: 13px;">&nbsp;숫자만 입력 가능합니다.</font>
										    <input type="hidden" id="storeTel" name="storeTel">
									    </td>         				
	                				</tr>
	                				<tr>
	                					<th>휴대폰 연락처<font style="color: red;">&nbsp;*</font></th>
									    <td>
									    	<select id="storePhone1" name="storePhone1" style="margin-right: 3px;">
	                							<option value="000">선택해주세요</option>
	                							<option value="010">010</option>
	                							<option value="011">011</option>
	                							<option value="016">016</option>
	                							<option value="017">017</option>
	                							<option value="018">018</option>
	                							<option value="019">019</option>
	                							<option value="050">050</option>
	                							<option value="0505">0505</option>
	                							<option value="060">060</option>
	                							<option value="070">070</option>
	                						</select>
										    -<input type="text" id="storePhone2" name="storePhone2" style="width: 70px; margin-left: 5px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    -<input type="text" id="storePhone3" name="storePhone3" style="width: 70px; margin-left: 5px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										    <font style="color: red; font-size: 13px;">&nbsp;숫자만 입력 가능합니다.</font>
										    <input type="hidden" id="storePhone" name="storePhone">
									    </td>         				
	                				</tr>
	                				<tr>
	                					<th>주소</th>
	                					<td>
	                						<input type="text" id="sample4_postcode" name="postCode" placeholder="우편번호" style="margin-bottom: 5px;">
											<input id ="findAddress" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 5px;"><br>
											<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" style="margin-top:5px; margin-bottom:5px; width:300px;"><br>
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_jibunAddress" name="jibunAddress" placeholder="지번주소" style="width: 300px;">
											<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" style="width: 300px;">
											<input type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목" style="width: 100px;">
	                					</td>
	                				</tr>

	                				<tr>
	                					<th>메모</th>
	                					<td><textarea rows="3" cols="130" id="storeMemo" name="storeMemo"></textarea></td>
	                				</tr>
	                				<tr>
		                            	<th colspan="2"><font style="color: red;">* 는 필수입력 사항입니다.</font></th>
		                            </tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                </div>
                	<div style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goStoreList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="저장" onclick="goStoreRegister();" style="float: right; width:80px;">
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
<!-- daum address api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#findAddress").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "120px",
		"fontSize"			: "15px"
	});

});

function goStoreList(){
	location.href="/store/storeList";
}

function goStoreRegister(){
	
	if($("#storeName").val() == ''){
		alert("매장명을 입력해 주세요.");
		$("#storeName").focus();
		return false;
	}
	if($("#storeTel1").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel1").focus();
		return false;
	}
	if($("#storeTel2").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel2").focus();
		return false;
	}
	if($("#storeTel3").val() == ''){
		alert("매장 전화 연락처를 입력해 주세요.");
		$("#storeTel3").focus();
		return false;
	}
	if($("#storePhone1").val() == '' || $("#storePhone1").val() == '000'){
		alert("휴대폰 연락처를 입력해 주세요.");
		return false;
	}
	if($("#storePhone2").val() == ''){
		alert("휴대폰 연락처를 입력해 주세요.");
		$("#storePhone2").focus();
		return false;
	}
	if($("#storePhone3").val() == ''){
		alert("휴대폰 연락처를 입력해 주세요.");
		$("#storePhone3").focus();
		return false;
	}
	
	if($("#sample4_postcode").val()== ''){
		alert("우편번호 찾기 버튼을 통하여 주소를 입력해 주세요.");
		return false;
	}
	if($("#sample4_jibunAddress").val()== ''){
		alert("지번주소를 입력해 주세요");
		$("#sample4_jibunAddress").focus();
		return false;
	}
	
	if($("#sample4_extraAddress").val()== ''){
		alert("참고항목란에 '동' 또는  '읍','면' 의 주소를  입력해 주세요.");
		$("#sample4_extraAddress").focus();
		return false;
	}
	
	var insertConfirm = confirm("등록 하시겠습니까?");
	if(insertConfirm){
		storeRegister();
	}
	
}

function storeRegister(){
	
	var storeTel1 = $("#storeTel1").val();
	var storeTel2 = $("#storeTel2").val();
	var storeTel3 = $("#storeTel3").val();
	var storeTel = '';
	storeTel = storeTel1 +'-'+ storeTel2 + '-' + storeTel3;
	$("#storeTel").val(storeTel);
	
	var storePhone1 = $("#storePhone1 option:selected").val();
	var storePhone2 = $("#storePhone2").val();
	var storePhone3 = $("#storePhone3").val();
	var storePhone = '';
	storePhone = storePhone1 +'-'+ storePhone2 + '-' + storePhone3;
	$("#storePhone").val(storePhone);
	
	$.ajax({
		type: 'POST',
        url : "/store/insertStore",
        data: $("#storeInfo").serialize(),
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


/* 숫자만 입력 가능하게 하는 로직 */
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
/* 숫자만 입력 가능하게 하는 로직 */
 
 /* 다음 주소 api  */
 function execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                 var extraRoadAddr = ''; // 참고 항목 변수

                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraRoadAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
          /*        if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                     extraRoadAddr = ' ' + extraRoadAddr + '';
                 } */

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample4_postcode').value = data.zonecode;
                 document.getElementById("sample4_roadAddress").value = roadAddr;
                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                 
                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                 if(roadAddr !== ''){
                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                 } else {
                     document.getElementById("sample4_extraAddress").value = '';
                 }

                 var guideTextBox = document.getElementById("guide");
                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                 if(data.autoRoadAddress) {
                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                     guideTextBox.style.display = 'block';

                 } else if(data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                     guideTextBox.style.display = 'block';
                 } else {
                     guideTextBox.innerHTML = '';
                     guideTextBox.style.display = 'none';
                 }
             }
         }).open();
 }
</script>



</body>
</html>
