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

    <title>직원 등록</title>

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
                        <h1 class="m-0 text-dark">직원 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">직원 관리</li>
                            <li class="breadcrumb-item active">직원 등록</li>
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
	                                <th style="width: 10%;">아이디</th>
	                                <td>
	                                	<input type="text" id="id" name="id">
	                                	<input type="hidden" id="paramId" name="paramId" value="">
	                                	<input type="hidden" id="dupCheckYn" name="dupCheckYn" value="N">
	                                	<input type="button" id="dupCheck" name="dupCheck" onclick="goDupCheck();" value="중복체크">
	                                	&nbsp;<font id="idMent" style="color:red; display: none;"></font>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">비밀번호</th>
	                                <td><input type="password" id="passwd" name="passwd"></td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">이름</th>
	                                <td><input type="text" id="name" name="name"></td>
	                            </tr>
	                            <tr>
	                                <th style="width: 10%">연락처</th>
	                                <td>
	                               	 	<select id="phone1" name="phone1" style="width: 70px; margin-right: 3px;">
	               							<option value="010">010</option>
	               							<option value="011">011</option>
	               							<option value="016">016</option>
	               							<option value="017">017</option>
	               							<option value="018">018</option>
	               							<option value="019">019</option>
	               						</select>
									    -<input type="number" id="phone2" name="phone2" style="width: 70px; margin-left: 5px;">
									    -<input type="number" id="phone3" name="phone3" style="width: 70px; margin-left: 5px;">
	                                </td>
	                            </tr>
	                            <tr id="manageGroupInfo">
	                                <th style="width: 10%">직급</th>
	                                <td>
	                                	<select id="manageGroupSeq" name="manageGroupSeq" style="width: 250px;">
	                                		<option value="000">직급을 선택하세요</option>
	                                		<c:forEach var="manageGroupList" items="${manageGroupList}">
		                                		<option value="${manageGroupList.manageGroupSeq}">${manageGroupList.groupName}</option>
	                                		</c:forEach>
	                                	</select>
	                                </td>
	                            </tr>
	                            <tr id="storeInfo">
	                                <th style="width: 10%">매장명</th>
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
                					<th style="width: 10%">메모</th>
                					<td><textarea id="memo" name="memo" rows="3" cols="150"></textarea></td>
	                			</tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="manageFooter" style="margin-top: 10px;">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goManageList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="등록" onclick="goManageRegister();" style="float: right; width:80px;">
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
<form:form id="manageInfo" name="manageInfo" modelAttribute="manageVO">
	<input type="hidden" id="id" name="id">
	<input type="hidden" id="passwd" name="passwd">
	<input type="hidden" id="name" name="name">
	<input type="hidden" id="phone" name="phone">
	<input type="hidden" id="manageGroupSeq" name="manageGroupSeq">
	<input type="hidden" id=memo name="memo">
	<input type="hidden" id="checkAuthority" name="checkAuthority" value="${manageInfo.getCheckAuthority()}">
	<c:if test="${manageInfo.getCheckAuthority() eq '1'}">
		<input type="hidden" id="storeSeq" name="storeSeq">
	</c:if>
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
	
	defaultCss();
	
	/* 매장검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popStoreName").keydown(function(key){
		if(key.keyCode == 13){
			searchStore();
		}
	});
	
});

function goManageList(){
	location.href="/manage/manageList";
}

function goManageRegister(){
	
	if($("#paramName").val() == ''){
		alert("'이름 찾기' 버튼을 통하여 회원을 선택해주세요.");
		return false;
	}
	
	if($("#id").val() == ''){
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	
	var tempId = $("#id").val();
	if($("#paramId").val() == tempId){
		$("#dupCheckYn").val('Y'); 
	}else{
		$("#dupCheckYn").val('N'); 
	}
	
	if($("#dupCheckYn").val() == 'N'){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	var insertConfirm = confirm("직원 등록 하시겠습니까?");
	if(insertConfirm){
		manageRegister();
	}
	
}

function manageRegister(){
	
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var phone = '';
	
	phone = phone1 +'-'+ phone2 +'-'+ phone3;
	$("#manageInfo #phone").val(phone);
	$("#manageInfo #id").val($("#id").val());
	$("#manageInfo #passwd").val($("#passwd").val());
	$("#manageInfo #name").val($("#name").val());
	
	var manageGroupSeq = $("#manageGroupSeq option:selected").val();
	$("#manageInfo #manageGroupSeq").val(manageGroupSeq);
	$("#manageInfo #memo").val($("#memo").val());
	
	$.ajax({
		type: 'POST',
        url : "/manage/insertManage",
        data: $("#manageInfo").serialize(),
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

/* 중복 체크  */
function goDupCheck() {

	var paramId = $("#id").val();
	if($("#id").val() == ''){
		$("#idMent").text("*아이디를 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	if(paramId == 'admin'){
		$("#idMent").text("*해당 아이디로는 사용하실 수 없습니다. 다시 입력해 주세요.");
        $("#idMent").show();
		return false;
	}
	
	$.ajax({
		type: 'get',
        url : "/manage/manageDupIdCheck",
        data: {	id	:	paramId},
        success : function(data){
            if(data == 'success') {
              $("#idMent").text("*사용가능한 아이디입니다.");
              $("#idMent").show();
              $("#paramId").val(paramId);
              $("#dupCheckYn").val('Y');
            } else if(data == 'dupId'){
              $("#idMent").text("*중복된 아이디입니다. 다시 입력해주세요.");
              $("#idMent").show();
              $("#dupCheckYn").val('N');
            } else if(data == 'admin'){
              $("#idMent").text("*해당 아이디로는 사용하실 수 없습니다. 다시 입력해 주세요.");
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
	$("#manageInfo #storeSeq").val(storeSeq);
	
	/* 매장 정보 세팅 후 선택된 매장에 대하여 설정*/
	storeSelectAtferGroupList(storeSeq);
}

function storeSelectAtferGroupList(storeSeq) {
	
	$.ajax({
		type: 'get',
       	url : "/manage/searchGroupList",
       	data: {		storeSeq : storeSeq
       			},
       	success : function(data){
           if(data.result == 'success'){
           		groupList(data.manageGroupList);
           }else if(data.result == 'noCount'){
           		alert("직급을 등록 한 후 직원을 등록해 주시 바랍니다.");
           		return false;
           }
       	},
       	error:function(request,status,error){
			alert("저장에 실패하였습니다. 관리자에게 문의하세요");
       	}
   	});
}

function groupList(manageGroupList) {
	var paramGroupList ='';
	
	var paramGroupSeq =  0;
	var paramGroupName = '';
    
	paramGroupList+= '<th style="width: 10%">직급</th>';
	paramGroupList+= '<td>';
	paramGroupList+= '<select id="manageGroupSeq" name="manageGroupSeq" style="width: 250px;">';
	paramGroupList+= '<option value="000">직급을 선택하세요</option>';
	
	for(var i = 0 ; i < manageGroupList.length;i++){
		paramGroupList+= '<option value="'+manageGroupList[i].manageGroupSeq+'">'+manageGroupList[i].groupName+'</option>';
	}
	
	paramGroupList+= '</select>';
	paramGroupList+= '</td>';
	
	$("#manageGroupInfo").text("");
	$("#manageGroupInfo").append(paramGroupList);
	
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


function defaultCss() {
	
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
