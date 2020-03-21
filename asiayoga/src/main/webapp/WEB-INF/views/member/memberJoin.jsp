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
    </nav>
    <!-- /.navbar -->

    <!-- Left side column-->
    <%@ include file="/WEB-INF/views/include/left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="height: 80%;">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">회원 정보 등록</h1>
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
							<c:if test="${manageInfo.getCheckAuthority() eq '1'}">
								<input type="hidden" id="storeSeq" name="storeSeq">
							</c:if>
	                		<table class="table table-bordered">
	                			<tbody>
	                				<tr>
	                					<td>회원명<font style="color: red;">*</font></td>
	                					<td><input type="text" id="name" name="name"></td>
	                				</tr>
	                				<tr>
	                					<td>연락처<font style="color: red;">*</font></td>
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
	                				</tr>
	                				<tr>
	                					<td>이메일</td>
										<td>
											<input type="email" id="email" name="email">
										</td>                				
	                				</tr>
	                				<tr>
	                					<td>생년월일<font style="color: red;">*</font></td>
	                					<td>
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
	                				</tr>
	                				<tr id="storeInfo">
	                					<td>등록매장</td>
		                                <td>
		                                	<c:choose>
		                                		<c:when test="${manageInfo.getAuthority() eq 'ROLE_ADMIN'}">
		                                			<input type="text" id="paramStoreName" name="paramStoreName" readonly="readonly">
		                            				<input type="button" id="findStoreName" name="findStoreName" value="매장 찾기" data-toggle="modal" data-target="#findStore">
		                                		</c:when>
		                                		<c:otherwise>
				                                	<%= manageInfo.getStoreName() %>
		                                		</c:otherwise>
		                                	</c:choose>
		                                </td>
	                				</tr>
	                				<tr>
	                					<td>성별<font style="color: red;">*</font></td>
	                					<td>
					                		<input type="radio" name="sex" value="M">남
					                		<input type="radio" name="sex" value="W" style="margin-left: 5px;">여
	                					</td>
	                				</tr>
	                				<tr>
	                					<td>메모</td>
	                					<td><textarea id="memo" name="memo" rows="3" cols="150"></textarea></td>
	                				</tr>
	                			</tbody>
	                		</table>
                		</form:form>
                	</div>
                	<div><font style="color: red;">*표시는 필수 입력입니다.</font></div>
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
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	defaultCss();
	
	/* 회원검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popStoreName").keydown(function(key){
		if(key.keyCode == 13){
			searchStore();
		}
	});
	
});


function goInsertMember(){
	
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
	
	 $.ajax({
	        type:'POST',
	        url : "/member/memberInsert",
	        data:$("#memberInsert").serialize(),
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

/* 팝업파트 */
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
	
	for(var i = 0 ; i < popStoreList.length; i++ ){
		var paramStoreSeq = 0;
		var paramStoreName = '';
		var paramStoreTel = '';
		var paramStoreAddress = '';
		
		paramStoreSeq = popStoreList[i].storeSeq;
		paramStoreName = popStoreList[i].storeName;
		paramStoreTel = popStoreList[i].storeTel;
		paramStoreAddress = popStoreList[i].storeAddress;
		
		paramList = '<td>'+popStoreList[i].rowNum+'</td>';
		paramList += '<td>';
		paramList += '<a href="#" onclick="popStoreSelect('+paramStoreSeq+', \''+paramStoreName+'\');">'; 
		paramList +=  paramStoreName+'</a>';
		paramList += '</td>';
		paramList += '<td>'+paramStoreTel+'</td>';
		paramList += '<td>'+paramStoreAddress+'</td>';
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
	
	var paramDefaultList = '<th colspan="4" style="text-align: center;">결과가 없습니다.</th>';
	
	$("#storeList").text("");
	$("#storeList").append(paramDefaultList);
}
function defaultCss() {
	
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
						<tbody>
							<tr>
								<th>No</th>
								<th>매장</th>
								<th>연락처</th>
								<th>주소</th>
							</tr>
							<tr id="storeList"><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
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
