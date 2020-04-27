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

    <title>회원 정보 등록</title>

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
                        <h1 class="m-0 text-dark">회원 정보 등록</h1>
                        <font style="color: red; font-weight: bold; font-size: 14px;" >*표시는 필수 입력입니다.</font>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">회원 정보</li>
                            <li class="breadcrumb-item active">회원 정보 등록</li>
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
                		<form:form id="memberInsert" name="memberInsert" modelAttribute="memberVO" method="post">
               				<input type="hidden" id="checkAuthority" name="checkAuthority" value="${manageInfo.getCheckAuthority()}">
							<input type="hidden" id="storeSeq" name="storeSeq" value="${memberInfo.storeSeq}">
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<td>회원명<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td colspan="5"><input type="text" id="name" name="name" value=""></td>
	                				</tr>
	                				<tr>
	                					<td>회원번호<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td colspan="5">
				                           	<input type="text" id="myMembership" name="myMembership" value="">
		                                	<input type="hidden" id="paramMyMembership" name="paramMyMembership" value="">
		                                	<input type="hidden" id="dupCheckYn" name="dupCheckYn" value="N">
		                                	<input type="button" id="dupCheck" name="dupCheck" onclick="goDupCheck();" value="중복체크">
		                                	&nbsp;<font id="idMent" style="color:red; display: none;"></font>
	                					</td>
	                				</tr>
	                				<tr>
	                					<td style="width: 8%;">생년월일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td style="width: 25%;">
					                		<input type="text" id="memberBirth1" name="memberBirth1" maxlength="4" size="5">년
					                		<select id="memberBirth2" name="memberBirth2" style="margin-left: 5px;">
					                			<c:forEach var="i" begin="1" end="12">
					                				<option><c:out value="${i}"/></option>
					                			</c:forEach>
					                		</select>월
					                		<select id="memberBirth3" name="memberBirth3" style="margin-left: 5px;">
					                			<c:forEach var="k" begin="1" end="31">
					                				<option><c:out value="${k}"/></option>
					                			</c:forEach>
					                		</select>일
					                		<input type="hidden" id="birth" name="birth">
	                					</td>
	                					<td style="width: 8%;">성별<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td colspan="2" style="width: 25%;">
					                		<input type="radio" name="sex" value="M">남
					                		<input type="radio" name="sex" value="W" style="margin-left: 5px;">여
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>연락처<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
									    <td>
									    	<select id="phone1" name="phone1" style="margin-right: 3px;">
	                							<option value="010">010</option>
	                							<option value="011">011</option>
	                							<option value="016">016</option>
	                							<option value="017">017</option>
	                							<option value="018">018</option>
	                							<option value="019">019</option>
	                						</select>
										    -<input type="number" id="phone2" name="phone2" style="width: 70px; margin-left: 5px;">
										    -<input type="number" id="phone3" name="phone3" style="width: 70px; margin-left: 5px;">
										    <input type="hidden" id="phone" name="phone">
									    </td>         				
	                					<td>이메일</td>
										<td colspan="3">
											<input type="email" id="email" name="email">
										</td>                				
	                				</tr>
	                				<tr>
	                					<td>주소</td>
	                					<td colspan="4">
	                						<input type="text" id="sample4_postcode" name="postCode" placeholder="우편번호" style="margin-bottom: 5px;">
											<input id ="findAddress" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 5px;"><br>
											<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" style="margin-top:5px; margin-bottom:5px; width:300px;"><br>
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_jibunAddress" name="jibunAddress" placeholder="지번주소" style="width: 300px;">
											<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" style="width: 300px;">
											<input type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목" style="width: 100px;">
	                					</td>
	                				</tr>
	                				<tr id="storeInfo">
	                					<td style="width: 8%;">상품<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                                <td style="width: 25%;">
	                               			<input type="text" id="paramProductName" name="paramProductName" readonly="readonly">
	                           				<input type="button" id="findProductName" name="findProductName" value="상품 찾기" data-toggle="modal" data-target="#findProduct">
	                           				<input type="hidden" id="productSeq" name="productSeq" value="">
		                                </td>
	                					<td>등록매장</td>
		                                <td colspan="3">
		                                	<c:choose>
		                                		<c:when test="${manageInfo.getAuthority() eq 'ROLE_ADMIN'}">
		                                			<input type="text" id="paramStoreName" name="paramStoreName" readonly="readonly" style="width: 250px;">
		                            				<input type="button" id="findStoreName" name="findStoreName" value="매장 찾기" data-toggle="modal" data-target="#findStore">
		                                		</c:when>
		                                		<c:otherwise>
				                                	<%= manageInfo.getStoreName() %>
		                                		</c:otherwise>
		                                	</c:choose>
		                                </td>
	                				</tr>
	                				<tr>
	                					<td style="width: 10%;">고객 구매 가격</td>
		                                <td style="width: 25%;">
		                                	<input type="text" id="customerPrice" name="customerPrice" value="0" style="width: 20%;">
		                                </td>
		                                <td style="width: 10%;">상품 가격</td>
		                                <td colspan="2">
		                                	<input type="text" id="productPrice" name="productPrice" value="0" style="width: 20%;">
		                                </td>
	                				</tr>
	                				<tr>
                  						<td style="width: 8%;">기간<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                                <td style="width: 25%;">
                            				<input type="number" id="productPeriod" name="productPeriod" value="0" style="width: 20%;" oninput="changeProductPeriod();">일
		                                </td>
		                            	<td  style="width: 8%;">가입일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                            	<td style="width: 25%;">
                            				<fmt:formatDate pattern="yyyy-MM-dd" value="${memberInfo.joinDate}" var="joinDate" />
		                                	<input type="text" id="paramJoinDate" name="paramJoinDate" value="${joinDate}" readonly="readonly">
		                                	<input type="hidden" id="joinDate" name="joinDate" value="${joinDate}">
                            			</td>
                            		</tr>
	                				<tr>
                  						<td style="width: 8%;">시작일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                                <td style="width: 25%;">
                            				<fmt:formatDate pattern="yyyy-MM-dd" value="${memberInfo.startDay}" var="startDay" />
		                                	<input type="text" id="paramStartDay" name="paramStartDay" value="${startDay}" readonly="readonly">
		                                	<input type="hidden" id="startDay" name="startDay">
		                                </td>
		                                <td style="width: 8%;">만료일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                                <td style="width: 25%;">
		                                	<input type="text" id="paramExpirationDay" name="paramExpirationDay" readonly="readonly">
		                                	<input type="hidden" id="expirationDay" name="expirationDay">
		                                </td>
	                				</tr>
	                				<tr>
	                					<td>메모</td>
	                					<td colspan="5"><textarea id="memo" name="memo" rows="6" cols="150"></textarea></td>
	                				</tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                </div>
                	<div style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goMemberList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="저장" onclick="goInsertMember();" style="float: right; width:80px;">
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
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

<!-- daum address api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$('#paramJoinDate').datepicker({
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
	
	$('#paramStartDay').datepicker({
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
	
	$('#paramExpirationDay').datepicker({
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
	
	defaultCss();
	
	/* 회원검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popStoreName").keydown(function(key){
		if(key.keyCode == 13){
			searchStore();
		}
	});
	
	/* 상품검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popProductName").keydown(function(key){
		if(key.keyCode == 13){
			searchProduct();
		}
	});
	
});


function goInsertMember(){
	
	if($("#name").val()==''){
		alert("회원 이름을 입력해주세요");
		$("#name").focus();
		return false;
	}
	
	var myMembership = $("#myMembership").val();
	if($("#paramMyMembership").val() == myMembership){
		$("#dupCheckYn").val('Y'); 
	}else{
		$("#dupCheckYn").val('N'); 
	}
	
	if($("#dupCheckYn").val() == 'N'){
		alert("회원번호 중복체크를 해주세요.");
		return false;
	}
	
	if($("#memberBirth1").val()==''){
		alert("생년월일을 입력해주세요");
		$("#memberBirth1").focus();
		return false;
	}
	
	if($("input:radio[name=sex]:checked").val() == undefined){
		alert("성별을 선택해주세요");
		return false;
	}
	
	if($("#phone2").val()==''){
		alert("연락처를 입력해주세요");
		$("#phone2").focus();
		return false;
	}
	
	if($("#phone3").val()==''){
		alert("연락처를 입력해주세요");
		$("#phone3").focus();
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
	
	if($("#paramJoinDate").val()==''){
		alert("가입일을 선택해주세요");
		return false;
	}
	if($("#paramStartDay").val()==''){
		alert("시작일을 선택해주세요");
		return false;
	}
	if($("#paramExpirationDay").val()==''){
		alert("만료일을 선택해주세요");
		return false;
	}
	
	
	
	var insertConfirm = confirm("저장하시겠습니까?");
	if(insertConfirm){
		insertMember();
	}
}

function insertMember(){
	
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var phone = '';
	
	phone = phone1 +'-'+ phone2 +'-'+ phone3;
	$("#phone").val(phone);
	
	
	var birth1 = $("#memberBirth1").val();
	var birth2 = $("#memberBirth2").val();
	var birth3 = $("#memberBirth3").val();

	if(birth2 < 10){
		birth2 = '0'+birth2;
	}
	if(birth3 < 10){
		birth3 = '0'+birth3;
	}
	
	var birth = '';
	birth = birth1 +'-'+ birth2 +'-'+ birth3;
	$("#birth").val(birth);
	
	var joinDate = $("#paramJoinDate").val();
	var joinDateSplit = joinDate.split("-");
 	$("#joinDate").val(new Date(joinDateSplit[0],joinDateSplit[1]-1,joinDateSplit[2]));
 	
	var startDay = $("#paramStartDay").val();
	var startDaySplit = startDay.split("-");
 	$("#startDay").val(new Date(startDaySplit[0],startDaySplit[1]-1,startDaySplit[2]));
 	
	var expirationDay = $("#paramExpirationDay").val();
	var expirationDaySplit = expirationDay.split("-");
 	$("#expirationDay").val(new Date(expirationDaySplit[0],expirationDaySplit[1]-1,expirationDaySplit[2]));
 	
	 $.ajax({
	        type:'POST',
	        url : "/member/memberInsert",
	        data: $("#memberInsert").serialize(),
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

function goMemberList(){
	location.href="/member/memberList";
}

/* 중복 체크  */
function goDupCheck() {

	var myMembership = $("#myMembership").val();
	if($("#myMembership").val() == ''){
		$("#idMent").text("*회원번호를 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	
	if($("#storeSeq").val() == '' || $("#storeSeq").val() == null){
		$("#idMent").text("*매장 선택 후 진행해 주세요.");
        $("#idMent").show();
        return false;
	} else {
		var paramStoreSeq = $("#storeSeq").val();
	}
	
	var paramData  = {};
		paramData = {	myMembership 	: 	myMembership,
						storeSeq		:	paramStoreSeq	}
	
	$.ajax({
		type: 'get',
        url : "/member/myMembershipDupCheck",
        data: paramData,
        success : function(data){
            if(data == 'success') {
              $("#idMent").text("*사용가능한 회원번호 입니다.");
              $("#idMent").show();
              $("#paramMyMembership").val(myMembership);
              $("#dupCheckYn").val('Y');
            } else if(data == 'dupName'){
              $("#idMent").text("*중복된 회원번호 입니다. 다시 입력해주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            } else if(data == 'admin'){
              $("#idMent").text("*해당 회원번호로는 사용하실 수 없습니다. 다시 입력해 주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}

/* 팝업파트 */

/* 매장 찾기  */
function searchStore(){
		
	if($("#popStoreName").val() ==''){
		alert("매장명을 입력해 주세요");
		$("#popStoreName").focus();
		return false;
	}
	
	var paramStoreName = $("#popStoreName").val();
	
	$.ajax({
		type: 'get',
       	url : "/manage/searchStore",
       	data: {		storeName : paramStoreName
       			},
       	success : function(data){
           if(data.result == 'success'){
           		popStoreList(data.popStoreList);
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
	
function popStoreList(popStoreList){
	var paramList = '';
	paramList += '<tr>';
	paramList += '<th>No</th>';
	paramList += '<th>매장</th>';
	paramList += '<th>연락처</th>';
	paramList += '<th>주소</th>';
	paramList += '</tr>';

	
	for(var i = 0 ; i < popStoreList.length; i++ ){
		var paramStoreSeq = 0;
		var paramStoreName = '';
		var paramStoreTel = '';
		var paramStoreAddress = '';
		
		paramStoreSeq = popStoreList[i].storeSeq;
		paramStoreName = popStoreList[i].storeName;
		paramStoreTel = popStoreList[i].storeTel;
		paramStoreAddress = popStoreList[i].storeAddress;
		
		paramList += '<tr>';
		paramList += '<td>'+popStoreList[i].rowNum+'</td>';
		paramList += '<td>';
		paramList += '<a href="#" onclick="popStoreSelect('+paramStoreSeq+', \''+paramStoreName+'\');">'; 
		paramList +=  paramStoreName+'</a>';
		paramList += '</td>';
		paramList += '<td>'+paramStoreTel+'</td>';
		paramList += '<td>'+paramStoreAddress+'</td>';
		paramList += '</tr>';
	}
	
	$("#storeList").text("");
	$("#storeList").append(paramList);
}

function popStoreSelect(storeSeq,storeName) {
	
	$("#paramStoreName").val(storeName);
	$("#memberInsert #storeSeq").val(storeSeq);
	
	defaultCss();
	popClose();
	
	$("#findStore").modal('toggle');
}

function popClose(){
	$("#popStoreName").val("");
	
	var paramDefaultList = 
	paramDefaultList += '<tr>';
	paramDefaultList += '<th>No</th>';
	paramDefaultList += '<th>매장</th>';
	paramDefaultList += '<th>연락처</th>';
	paramDefaultList += '<th>주소</th>';
	paramDefaultList += '</tr>';
	paramDefaultList += '<tr>';
	paramDefaultList += '<th colspan="4" style="text-align: center;">결과가 없습니다.</th>';
	paramDefaultList += '</tr>';
	
	$("#storeList").text("");
	$("#storeList").append(paramDefaultList);
}

/* 상품 찾기  */
function searchProduct(){
		
	if($("#popProductName").val() ==''){
		alert("상품명 입력해 주세요");
		$("#popProductName").focus();
		return false;
	}
	
	var paramProductName = $("#popProductName").val();
	var paramStoreSeq = $("#storeSeq").val();
	
	$.ajax({
		type: 'get',
       	url : "/member/searchProduct",
       	data: {		productName : paramProductName,
       				storeSeq	: paramStoreSeq
       			},
       	success : function(data){
           if(data.result == 'success'){
        	   popProductList(data.popProductList);
           }else if(data.result == 'noCount'){
           		alert("검색 결과가 존재하지 않습니다.");
           		return false;
           }else if(data.result == 'error'){
				alert("검색에 실패하였습니다. 관리자에게 문의하세요");
           		return false;
           }
       	},
       	error:function(request,status,error){
			alert("검색에 실패하였습니다. 관리자에게 문의하세요");
       	}
   	});
}
	
function popProductList(popProductList){
	var paramList = '';
	paramList += '<tr>';
	paramList += '<th>No</th>';
	paramList += '<th>매장</th>';
	paramList += '<th>상품</th>';
	paramList += '<th>상품 가격</th>';
	paramList += '<th>상품 기간</th>';
	paramList += '</tr>';

	
	for(var i = 0 ; i < popProductList.length; i++ ){
		var paramProductSeq = 0;
		var paramStoreName = '';
		var paramProductName = '';
		var paramProductPrice = '';
		var paramProductPeriod = '';
		
		paramStoreName = popProductList[i].storeName;
		paramProductSeq = popProductList[i].productSeq;
		paramProductName = popProductList[i].productName;
		paramProductPrice = popProductList[i].productPrice;
		paramProductPeriod = popProductList[i].productPeriod;
		
		paramList += '<tr>';
		paramList += '<td>'+popProductList[i].rowNum+'</td>';
		paramList += '<td>';
		paramList += '<a href="#" onclick="popProductSelect('+paramProductSeq+', \''+paramProductName+'\','+paramProductPrice+',,'+paramProductPeriod+');">'; 
		paramList +=  paramStoreName+'</a>';
		paramList += '</td>';
		paramList += '<td>';
		paramList += '<a href="#" onclick="popProductSelect('+paramProductSeq+', \''+paramProductName+'\','+paramProductPrice+','+paramProductPeriod+');">'; 
		paramList +=  paramProductName+'</a>';
		paramList += '</td>';
		paramList += '<td>'+paramProductPrice+'</td>';
		paramList += '<td>'+paramProductPeriod+'일</td>';
		paramList += '</tr>';
	}
	
	$("#productList").text("");
	$("#productList").append(paramList);
}

function popProductSelect(productSeq,productName,productPrice,productPeriod) {
	
	$("#paramProductName").val(productName);
	$("#memberInsert #productSeq").val(productSeq);
	$("#memberInsert #productPrice").val(productPrice);
	$("#memberInsert #customerPrice").val(productPrice);
	$("#memberInsert #productPeriod").val(productPeriod);
	
	var paramStartDate = new Date();
	var startYear = paramStartDate.getFullYear();
	var startMonth = paramStartDate.getMonth()+1;
	var startDate = paramStartDate.getDate();
	var paramProductPeriod = 0;
	paramProductPeriod = parseInt(productPeriod);
	
	var startDay = "";
	if(startMonth < 10){
		startMonth = '0'+startMonth;
	}
	if(startDate < 10){
		startDate = '0'+startDate;
	}
	startDay = startYear+"-"+startMonth+"-"+startDate;
	
	var paramExpirationDate = new Date();
	paramExpirationDate.setDate(paramExpirationDate.getDate()+paramProductPeriod);
	var expirationYear = paramExpirationDate.getFullYear();
	var expirationMonth = paramExpirationDate.getMonth()+1;
	var expirationDay = paramExpirationDate.getDate();
	var expirationDate = "";
	if(expirationMonth < 10){
		expirationMonth = '0'+expirationMonth;
	}
	if(expirationDay < 10){
		expirationDay = '0'+expirationDay;
	}
	expirationDate = expirationYear+"-"+expirationMonth+"-"+expirationDay;
	$("#paramStartDay").val(startDay);
	$("#paramExpirationDay").val(expirationDate);
	
	defaultCss();
	popProductClose();
	
	$("#findProduct").modal('toggle');
}

/* 기본 기간 변경 시 만료일 변경 */
function changeProductPeriod(){
	
	var paramProductPeriod = 0;
	paramProductPeriod = parseInt($("#productPeriod").val());
	
	var paramExpirationDate = new Date();
	paramExpirationDate.setDate(paramExpirationDate.getDate()+paramProductPeriod);
	
	var expirationYear = paramExpirationDate.getFullYear();
	var expirationMonth = paramExpirationDate.getMonth()+1;
	var expirationDay = paramExpirationDate.getDate();
	
 	var expirationDate = "";
	if(expirationMonth < 10){
		expirationMonth = '0'+expirationMonth;
	}
	if(expirationDay < 10){
		expirationDay = '0'+expirationDay;
	}
	expirationDate = expirationYear+"-"+expirationMonth+"-"+expirationDay;
	$("#paramExpirationDay").val(expirationDate);
}

function popProductClose(){
	
	$("#popProductName").val("");
	
	var paramDefaultList = 
	paramDefaultList += '<tr>';
	paramDefaultList += '<th>No</th>';
	paramDefaultList += '<th>매장</th>';
	paramDefaultList += '<th>상품</th>';
	paramDefaultList += '<th>상품 가격</th>';
	paramDefaultList += '<th>상품 기간</th>';
	paramDefaultList += '</tr>';
	paramDefaultList += '<tr>';
	paramDefaultList += '<th colspan="5" style="text-align: center;">결과가 없습니다.</th>';
	paramDefaultList += '</tr>';
	
	$("#productList").text("");
	$("#productList").append(paramDefaultList);
}


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


/* 팝업 파트 종료  */
function defaultCss() {
	
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
	
	$("#findProductName").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#findStoreName").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#popFindStore").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});
	
	$("#popFindProduct").css({
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
</script>
<!--popUp Modal -->
<div class="modal fade" id="findStore" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">매장 찾기</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popStoreName" name="popStoreName"  placeholder="매장">
					<input type="button" id="popFindStore" name="popFindStore" value="찾기" onclick="searchStore();" style="margin-bottom: 10px;">
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<table class="table table-bordered" style="margin-top: 20px;">
						<tbody id="storeList">
							<tr>
								<th>No</th>
								<th>매장</th>
								<th>연락처</th>
								<th>주소</th>
							</tr>
							<tr><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
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

<div class="modal fade" id="findProduct" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">상품 찾기</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="popProductClose();">&times;</button>
			</div>
			<div class="modal-body">
				<div style="margin: 10px;">
					<input type="text" id="popProductName" name="popProductName"  placeholder="상품">
					<input type="button" id="popFindProduct" name="popFindProduct" value="찾기" onclick="searchProduct();" style="margin-bottom: 10px;">
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<table class="table table-bordered" style="margin-top: 20px;">
						<tbody id="productList">
							<tr>
								<th>No</th>
								<th>매장</th>
								<th>상품</th>
								<th>상품 가격</th>
							</tr>
							<tr><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="popProductClose();">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
