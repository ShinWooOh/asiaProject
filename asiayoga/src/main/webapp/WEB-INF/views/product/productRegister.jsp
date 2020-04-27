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

    <title>상품 등록</title>

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
                        <h1 class="m-0 text-dark">상품 등록</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">상품</li>
                            <li class="breadcrumb-item active">상품 등록</li>
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
						<c:set var="productVO" value="${productVO}" />
                    	<form:form id="productInfo" name="productInfo" modelAttribute="productVO" method="post">
							<table class="table table-bordered">
								<tbody>
		                            <tr>
		                                <th style="width: 100px">등록매장</th>
		                            	<td>
		                            	    <c:choose>
		                                		<c:when test="${manageInfo.getAuthority() eq 'ROLE_ADMIN'}">
		                                			<input type="text" id="paramStoreName" name="paramStoreName" readonly="readonly">
		                            				<input type="button" id="findStoreName" name="findStoreName" value="매장 찾기" data-toggle="modal" data-target="#findStore">
		                                		</c:when>
		                                		<c:otherwise>
					                                <c:out value="${productVO.storeName}"/>
		                                		</c:otherwise>
		                                	</c:choose>
		                                	<input type="hidden" id="storeName" name="storeName" value="${productVO.storeName}">
		                                	<input type="hidden" id="storeSeq" name="storeSeq" value="${productVO.storeSeq}">
		                            	</td>
		                            </tr>
		                            <tr>
		                            	<th>상품명<font style=" color: red;">&nbsp;*</font></th>
		                            	<td><input type="text" id="productName" name="productName" value="" style="width: 50%"></td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">가격</th>
		                                <td>
		                                	<input type="text" id="productPrice" name="productPrice" value="" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
		                                	<font style="color: red;">! 가격 미입력 시 0원으로 저장 됩니다.</font>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">기간</th>
		                                <td>
		                                	<input type="text" id="productPeriod" name="productPeriod" value="" placeholder="숫자만 입력하세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 150px">상품설명</th>
		                                <td>
		                                	<textarea rows="3" cols="130" id="productMemo" name="productMemo"></textarea>
		                                </td>
		                            </tr>
		                            <tr>
		                            	<th colspan="2"><font style="color: red;">* 는 필수입력 사항입니다.</font></th>
		                            </tr>
	                            </tbody>
	                        </table>
						</form:form>
					</div>
					<div style="margin-top: 10px;" id="productFooter">
						<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goProductList();" style="float: left; width:80px;">
						<c:choose>
							<c:when test="${fn:length(itemList) > 0}">
								<input type="button" class="btn btn-block btn-success" value="등록" onclick="goProductRegister();" style="float: right; width:80px;">
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
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

function goProductList(){
	location.href="/product/productList";
}

function goProductRegister(){
	
	if($("#productName").val() == ''){
		alert("상품명을 선택해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	
	var insertConfirm = confirm("등록 하시겠습니까?");
	if(insertConfirm){
		if($("#productPrice").val() == '' || $("#productPrice").val() == null){
			$("#productPrice").val(0);
		}
		
		if($("#largeCategory").val() != '002'){
			$("#lockerSeq").val(0);
		}
		
		productRegister();
	}
	
}

function productRegister(){
	
	$.ajax({
		type: 'POST',
        url : "/product/insertProduct",
        data: $("#productInfo").serialize(),
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
       	url : "/product/searchStore",
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
 	$("#productInfo #storeSeq").val(storeSeq);
 	$("#productInfo #storeName").val(storeName);
 	
 	
 	defaultCss();
 	popClose();
 	
 	$("#findStore").modal('toggle');
 }
 

function popClose(){
	$("#popStoreName").val("");
	
	var paramDefaultList = '';
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
</body>
</html>
