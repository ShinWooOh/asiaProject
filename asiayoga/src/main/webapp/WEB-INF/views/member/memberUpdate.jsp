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

    <title>회원 정보 수정</title>

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
                        <h1 class="m-0 text-dark">회원 정보 수정</h1>
                        <font style="color: red; font-weight: bold; font-size: 14px;">*표시는 필수 입력입니다.</font>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">회원 정보</li>
                            <li class="breadcrumb-item active">회원 정보 수정</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content container-fluid" style="background-color: #FFFFFF">
			<div class="row" style="width: 100%;">
            <div class="col-lg-12 col-xs-6">
                <div>
                	<div>
                		<form:form id="memberEdit" name="memberEdit" modelAttribute="memberVO" method="post">
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<td>회원명<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td colspan="3">
	                						<input type="text" id="name" name="name" value="${memberInfo.name}">
	                						<input type="hidden" id="memberSeq" name="memberSeq" value="${memberInfo.memberSeq}">
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>회원번호<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td colspan="3">
				                           		<input type="text" id="myMembership" name="myMembership" value="${memberInfo.myMembership}">
		                                	<input type="hidden" id="paramMyMembership" name="paramMyMembership" value="${memberInfo.myMembership}">
		                                	<input type="hidden" id="tempMyMembership" name="tempMyMembership" value="${memberInfo.myMembership}">
		                                	<input type="hidden" id="dupCheckYn" name="dupCheckYn" value="N">
		                                	<input type="button" id="dupCheck" name="dupCheck" onclick="goDupCheck();" value="중복체크">
		                                	&nbsp;<font id="idMent" style="color:red; display: none;"></font>
	                					</td>
	                				</tr>
	                				<tr>
	                					<td style="width: 8%;">생년월일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td style="width: 25%;">
					                		<input type="text" id="memberBirth1" name="memberBirth1" maxlength="4" size="5" value="${memberInfo.year}">년
					                		<select id="memberBirth2" name="memberBirth2" style="margin-left: 5px;">
					                			<c:forEach var="i" begin="1" end="12">
					                				<option value="${i}" <c:if test="${memberInfo.month eq i}">selected</c:if> >
					                					<c:out value="${i}"/>
					                				</option>
					                			</c:forEach>
					                		</select>월
					                		<select id="memberBirth3" name="memberBirth3" style="margin-left: 5px;">
					                			<c:forEach var="k" begin="1" end="31">
					                				<option value="${k}" <c:if test="${memberInfo.day eq k}">selected</c:if> >
					                					<c:out value="${k}"/>
					                				</option>
					                			</c:forEach>
					                		</select>일
					                		<input type="hidden" id="birth" name="birth" value="${memberInfo.birth}">
	                					</td>
	                					<td style="width: 8%;">성별<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
	                					<td style="width: 25%;">
	                						<c:choose>
	                							<c:when test="${memberInfo.sex eq 'M'}">
							                		<input type="radio" name="sex" value="M" style="margin-top: 10px;" checked="checked">남
							                		<input type="radio" name="sex" value="W" style="margin-top: 10px; margin-left: 5px;">여
	                							</c:when>
	                							<c:when test="${memberInfo.sex eq 'W'}">
							                		<input type="radio" name="sex" value="M" style="margin-top: 10px;">남
							                		<input type="radio" name="sex" value="W" style="margin-top: 10px; margin-left: 5px;" checked="checked">여
	                							</c:when>
	                							<c:otherwise>
							                		<input type="radio" name="sex" value="M" style="margin-top: 10px;">남
							                		<input type="radio" name="sex" value="W" style="margin-top: 10px; margin-left: 5px;">여
	                							</c:otherwise>
	                						</c:choose>
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>연락처<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
									    <td colspan="3">
									    	<select id="phone1" name="phone1" style="margin-right: 3px;">
	                							<option value="010" <c:if test="${memberInfo.phone1 eq '010'}">selected</c:if> >010</option>
	                							<option value="011" <c:if test="${memberInfo.phone1 eq '011'}">selected</c:if> >011</option>
	                							<option value="016" <c:if test="${memberInfo.phone1 eq '016'}">selected</c:if> >016</option>
	                							<option value="017" <c:if test="${memberInfo.phone1 eq '017'}">selected</c:if> >017</option>
	                							<option value="018" <c:if test="${memberInfo.phone1 eq '018'}">selected</c:if> >018</option>
	                							<option value="019" <c:if test="${memberInfo.phone1 eq '019'}">selected</c:if> >019</option>
	                						</select>
										    -<input type="number" id="phone2" name="phone2" style="width: 70px; margin-left: 5px;" value="${memberInfo.phone2}">
										    -<input type="number" id="phone3" name="phone3" style="width: 70px; margin-left: 5px;" value="${memberInfo.phone3}">
										    <input type="hidden" id="phone" name="phone" value="${memberInfo.phone}">
									    </td>         				
	                				</tr>
	                				<tr>
	                					<td>주소</td>
	                					<td colspan="3"> 
	                						<input type="text" id="sample4_postcode" name="postCode" placeholder="우편번호" style="margin-bottom: 5px;" value="${memberInfo.postCode}">
											<input id ="findAddress" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 5px;"><br>
											<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" value="${memberInfo.roadAddress}" style="margin-top:5px; margin-bottom:5px; width:300px;"><br>
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_jibunAddress" name="jibunAddress" placeholder="지번주소" value="${memberInfo.jibunAddress}" style="width: 300px;">
											<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" value="${memberInfo.detailAddress}" style="width: 300px;">
											<input type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목"  value="${memberInfo.extraAddress}" style="width: 100px;">
	                					</td>
                					</tr>
	                				<tr>
	                					<td>이메일</td>
										<td colspan="3">
											<input type="email" id="email" name="email" value="${memberInfo.email}">
										</td>                				
	                				</tr>
                				    <tr>
			                           	<td style="width: 8%;">등록매장</td>
			                           	<td style="width: 25%;">
			                           		<c:out value="${memberInfo.storeName}"/>
			                           		<input type="hidden" id="storeName" name="storeName" value="${memberInfo.storeName}">
			                           		<input type="hidden" id="storeSeq" name="storeSeq" value="${memberInfo.storeSeq}">
			                           	</td>
		                            	<td style="width: 8%;">가입일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></td>
		                            	<td style="width: 25%;">
                            				<fmt:formatDate pattern="yyyy-MM-dd" value="${memberInfo.joinDate}" var="joinDate" />
		                                	<input type="text" id="paramJoinDate" name="paramJoinDate" value="${joinDate}" readonly="readonly">
		                                	<input type="hidden" id="joinDate" name="joinDate" value="${joinDate}" readonly="readonly">
                            			</td>
		                            </tr>
	                				<tr>
	                					<td>메모</td>
	                					<td colspan="3"><textarea id="memo" name="memo" rows="6" cols="150"><c:out value="${memberInfo.memo}"/></textarea>
	                					</td>
	                				</tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                </div>
                	<div style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goMemberList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="저장" onclick="goEditMember();" style="float: right; width:80px;">
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

function goEditMember(){
	
	if($("#name").val()==''){
		alert("회원 이름을 입력해주세요");
		$("#name").focus();
		return false;
	}
	
	var myMembership = $("#myMembership").val();
	if($("#paramMyMembership").val() == myMembership){
		$("#dupCheckYn").val('Y'); 
	}
	
	if($("#dupCheckYn").val() == 'N'){
		alert("회원번호 중복체크를 해주세요.");
		return false;
	} else {
		if($("#tempMyMembership").val() != myMembership){
			if($("#paramMyMembership").val() != myMembership){
				alert("회원번호 중복체크를 해주세요.");
				return false;
			}
		}
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
	
	if($("#memberBirth1").val()==''){
		alert("생년월일을 입력해주세요");
		$("#memberBirth1").focus();
		return false;
	}
	
	if($("input:radio[name=sex]:checked").val() == undefined){
		alert("성별을 선택해주세요");
		return false;
	}
	
	var editConfirm = confirm("저장하시겠습니까?");
	if(editConfirm){
		editMember();
	}
}

function editMember(){
	
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var phone = '';
	
	phone = phone1 +'-'+ phone2 +'-'+ phone3;
	$("#phone").val(phone);
	
	
	var birth1 = $("#memberBirth1").val();
	var birth2 = $("#memberBirth2").val();
	var birth3 = $("#memberBirth3").val();
	var birth = '';
	
	if(birth2.length < 2){
		birth2 = '0'+ birth2;
	}
	if(birth3.length < 2){
		birth3 = '0'+ birth3;
	}
	
	birth = birth1 +'-'+ birth2 +'-'+ birth3;
	$("#birth").val(birth);
	
	var joinDate = $("#paramJoinDate").val();
	var joinDateSplit = joinDate.split("-");
 	$("#joinDate").val(new Date(joinDateSplit[0],joinDateSplit[1]-1,joinDateSplit[2]));
	
	 $.ajax({
	        type:'POST',
	        url : "/member/memberEdit",
	        data:$("#memberEdit").serialize(),
	        success : function(data){
	            if(data == 'success')
	            {
	              alert("정보 수정 하였습니다.");
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
	var storeSeq = $("#storeSeq").val();
	if($("#myMembership").val() == ''){
		$("#idMent").text("*회원번호를 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	
	if($("#paramMyMembership").val() == myMembership){
		$("#idMent").text("*현재 사용하고 있는 회원번호 입니다.");
        $("#idMent").show();
        return false;
	}
	
	$.ajax({
		type: 'get',
        url : "/member/myMembershipDupCheck",
        data: {	myMembership	:	myMembership,
        		storeSeq		:	storeSeq
        	  },
        success : function(data){
            if(data == 'success') {
              $("#idMent").text("*사용가능한 회원번호 입니다.");
              $("#idMent").show();
              $("#dupCheckYn").val('Y');
              $("#tempMyMembership").val(myMembership);
            } else if(data == 'dupName'){
              $("#idMent").text("*중복된 회원번호명 입니다. 다시 입력해주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            } else {
            	
            }
        },
        error:function(request,status,error){
            alert("저장에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}

//* 다음 주소 api  */
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
                /* if(data.buildingName !== '' && data.apartment === 'Y'){
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
