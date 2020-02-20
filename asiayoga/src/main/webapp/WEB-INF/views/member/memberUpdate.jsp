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
                        <h1 class="m-0 text-dark">회원 정보 수정</h1>
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

            <div class="col-lg-12">
                <div>
                	<div>
                		<form:form id="memberEdit" name="memberEdit" modelAttribute="memberVO" method="post">
                			<c:set var="memberInfo" value="${memberInfo}" />
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<td>회원명<font style="color: red;">*</font></td>
	                					<td>
	                						<input type="text" id="name" name="name" value="${memberInfo.name}">
	                						<input type="hidden" id="memberSeq" name="memberSeq" value="${memberInfo.memberSeq}">
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>연락처<font style="color: red;">*</font></td>
									    <td>
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
	                					<td>이메일</td>
										<td>
											<input type="email" id="email" name="email" value="${memberInfo.email}">
										</td>                				
	                				</tr>
	                				<tr>
	                					<td>생년월일<font style="color: red;">*</font></td>
	                					<td>
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
	                				</tr>
                				    <tr>
			                           	<td>등록매장</td>
			                           	<td>
			                           		<c:out value="${memberInfo.storeName}"/>
			                           		<input type="hidden" id="storeName" name="storeName" value="${memberInfo.storeName}">
			                           		<input type="hidden" id="storeSeq" name="storeSeq" value="${memberInfo.storeSeq}">
			                           	</td>
		                            </tr>
	                				<tr>
	                					<td>성별<font style="color: red;">*</font></td>
	                					<td>
	                						<c:choose>
	                							<c:when test="${memberInfo.sex eq 'M'}">
							                		<input type="radio" name="sex" value="M" checked="checked">남
							                		<input type="radio" name="sex" value="W" style="margin-left: 5px;">여
	                							</c:when>
	                							<c:when test="${memberInfo.sex eq 'W'}">
							                		<input type="radio" name="sex" value="M">남
							                		<input type="radio" name="sex" value="W" style="margin-left: 5px;" checked="checked">여
	                							</c:when>
	                							<c:otherwise>
							                		<input type="radio" name="sex" value="M">남
							                		<input type="radio" name="sex" value="W" style="margin-left: 5px;">여
	                							</c:otherwise>
	                						</c:choose>
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>메모</td>
	                					<td><textarea id="memo" name="memo" rows="3" cols="150"><c:out value="${memberInfo.memo}"/></textarea>
	                					</td>
	                				</tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                	<div><font style="color: red;">*표시는 필수 입력입니다.</font></div>
                </div>
                	<div style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goMemberList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="저장" onclick="goEditMember();" style="float: right; width:80px;">
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
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

function goEditMember(){
	
	if($("#name").val()==''){
		alert("회원 이름을 입력해주세요");
		$("#name").focus();
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
</script>
</body>
</html>
