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

    <title>구매 상세</title>

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
                        <h1 class="m-0 text-dark">결제 상세</h1>
                        <font style="color: red; font-weight: bold; font-size: 14px;" >*표시는 필수 입력입니다.</font>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">결제 내역</li>
                            <li class="breadcrumb-item active">결제 상세</li>
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
                    	<c:set var="customerOrderDetail" value="${customerOrderDetail}" />
                    	<form:form id="orderInfo" name="orderInfo" modelAttribute="orderVO" method="post">
	                        <table class="table table-bordered">
	                            <tbody>
		                            <tr>
		                                <th style="width: 15%;">이름</th>
		                                <td style="width: 30%;">
		                                	<c:out value="${customerOrderDetail.name}"/>
		                                	<input type="hidden" id="memberSeq" name="memberSeq" value="${customerOrderDetail.memberSeq}">
		                                </td>
		                                <th style="width: 15%;">회원번호</th>
		                                <td style="width: 30%;"><c:out value="${customerOrderDetail.myMembership}"/></td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">연락처</th>
		                                <td style="width: 30%;">
		                                	<c:out value="${customerOrderDetail.phone}"/><input type="hidden" id="phone" name="phone" value="${customerOrderDetail.phone}">
		                                </td>
		                                <th style="width: 15%;">가입일</th>
		                                <td style="width: 30%;"><fmt:formatDate value="${customerOrderDetail.joinDate}" pattern="yyyy-MM-dd"/></td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">매장명</th>
		                                <td colspan="3">
		                                	<c:out value="${customerOrderDetail.storeName}"/>
				                            <input type="hidden" id="storeName" name="storeName" value="${customerOrderDetail.storeName}">
				                            <input type="hidden" id="storeSeq" name="storeSeq" value="${customerOrderDetail.storeSeq}">
				                            <input type="hidden" id="orderSeq" name="orderSeq" value="${customerOrderDetail.orderSeq}">
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">상품<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></th>
		                                <td style="width: 30%;">
		                                	<select id="productSeq" name="productSeq" onchange="goSearchProduct();">
		                                		<option value="0">상품을 선택해주세요</option>
		                                		<c:forEach var="productList" items="${productList}">
			                                		<option value="${productList.productSeq}"  <c:if test="${productList.productSeq eq customerOrderDetail.productSeq}">selected</c:if> >${productList.productName}</option>
		                                		</c:forEach>
		                                	</select>
		                                </td>
		                                <th style="width: 15%;">기간<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></th>
		                                <td style="width: 30%;">
		                                	<input type="number" id="customerPeriod" name="customerPeriod" value="${customerOrderDetail.customerPeriod}" style="width: 20%;" oninput="changeProductPeriod();">일
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">고객 구매 가격</th>
		                                <td style="width: 30%;">
		                                	<input type="number" id="customerPrice" name="customerPrice" value="${customerOrderDetail.customerPrice}" style="width: 20%;">
		                                </td>
		                                <th id ="productCountInfo1" style="width: 15%;">상품 가격</th>
		                                <td id ="productCountInfo2" style="width: 30%;">
		                                	<input type="number" id="productPrice" name="productPrice" value="${customerOrderDetail.productPrice}" style="width: 20%;">
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">시작일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></th>
		                                <td style="width: 30%;">
		                                	<fmt:formatDate pattern="yyyy-MM-dd" value="${customerOrderDetail.startDay}" var="paramStartDay" />
		                                	<input type="text" id="paramStartDay" name="paramStartDay" value="${paramStartDay}" readonly="readonly">
		                                	<input type="hidden" id="startDay" name="startDay" value="${paramStartDay}" readonly="readonly">
		                                </td>
		                                <th style="width: 15%;">만료일<font style="color: red; font-weight: bold; font-size: 20px;" >*</font></th>
		                                <td style="width: 30%;">
		                                	<fmt:formatDate pattern="yyyy-MM-dd" value="${customerOrderDetail.expirationDay}" var="paramExpirationDay" />
		                                	<input type="text" id="paramExpirationDay" name="paramExpirationDay" value="${paramExpirationDay}" readonly="readonly">
		                                	<input type="hidden" id="expirationDay" name="expirationDay" value="${paramExpirationDay}">
		                                </td>
		                            </tr>
		                            <tr>
		                                <th style="width: 15%;">메모</th>
		                                <td colspan="3"><textarea id="memo" name="orderMemo" rows="6" cols="150">${customerOrderDetail.orderMemo}</textarea></td>
		                            </tr>
	                            </tbody>
	                        </table>
                        </form:form>
                        
                    </div>
                    <div style="margin-top: 10px;" id="orderFooter">
                		<input type="button" class="btn btn-block btn-primary" value="목록" onclick="goOrderList();" style="float: left; width:80px;">
                		<input type="button" class="btn btn-block btn-success" value="수정" onclick="goOrderUpdate();" style="float: right; width:80px;">
						<input type="button" class="btn btn-block btn-warning" value="삭제" onclick="goOrderDel(${customerOrderDetail.orderSeq},${customerOrderDetail.storeSeq});" style="float: right; width:80px; margin-right: 20px;">
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
	
	/* 회원검색 팝업창에서 입력 후 엔터 눌렀를 때 기능  */
	$("#popName").keydown(function(key){
		if(key.keyCode == 13){
			searchName();
		}
	});
	
	$("#searchName").css({
		"margin-left"		: "5px",
		"background-color"	: "#00c0ef",
		"border-color"		: "#00c0ef",
		"border-radius"		: "3px",
		"color"				: "white",
		"border"			: "1px solid",
		"width"				: "80px",
		"fontSize"			: "15px"
	});

	$("#popFindName").css({
			"margin-left"		: "5px",
			"background-color"	: "#00c0ef",
			"border-color"		: "#00c0ef",
			"border-radius"		: "3px",
			"color"				: "white",
			"border"			: "1px solid",
			"width"				: "80px",
			"fontSize"			: "15px"
	});
});

function goOrderList(){
	location.href="/order/orderList";
}

/* 상품 선택 시 품목명 및 데이터 세팅 */
function goSearchProduct(){
	
	var paramProductSeq = $("#productSeq option:selected").val();
	var paramStoreSeq = $("#storeSeq").val();
	
	
	if(paramProductSeq == 0){
		return false;
	}
	
	$.ajax({
		type: 'get',
        url : "/order/searchProduct",
        data: {	productSeq 	: 	paramProductSeq,
        		storeSeq	:	paramStoreSeq
        		},
        success : function(data){
            if(data.result == 'success'){
            	adjustItemInfo(data.productVO);
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

/* 상품 선택 시 품목명 및 데이터 세팅 */
function adjustItemInfo(productVO){
	
	$("#productPrice").val(productVO.productPrice);
	
	if($("customerPrice").val() == 0){
		$("#customerPrice").val(productVO.productPrice);
	}else if($("customerPrice").val() == null){
		$("#customerPrice").val(productVO.productPrice);
	}else if($("customerPrice").val() == ''){
		$("#customerPrice").val(productVO.productPrice);
	}else{
		
	}
	
	$("#customerPeriod").val(productVO.productPeriod);
	
	var paramStartDate = new Date($("#paramStartDay").val());
	var startYear = paramStartDate.getFullYear();
	var startMonth = paramStartDate.getMonth()+1;
	var startDate = paramStartDate.getDate();
	var paramProductPeriod = 0;
	paramProductPeriod = parseInt(productVO.productPeriod);
	
	var startDay = "";
	if(startMonth < 10){
		startMonth = '0'+startMonth;
	}
	if(startDate < 10){
		startDate = '0'+startDate;
	}
	
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

/* 기본 기간 변경 시 만료일 변경 */
function changeProductPeriod(){
	
	var paramProductPeriod = 0;
	paramProductPeriod = parseInt($("#customerPeriod").val());
	
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


/* 구매 등록 */
function goOrderUpdate(){
	
	if($("#productSeq option:selected").val() == 0){
		alert("상품을 선택해주세요.");
		return false;
	}
	
	if($("#name").val() == ''){
		alert("이름을 입력해주세요.");
		return false;
	}
	
	if($("#product").val() == ''){
		alert("가격을 선택해주세요.");
		return false;
	}
	
	if($("#paramStartDay").val() == ''){
		alert("시작일자를 선택해주세요.");
		return false;
	}
	
	if($("#paramExpirationDay").val() == ''){
		alert("만료일자를 선택해주세요.");
		return false;
	}
	
	
	var updateConfirm = confirm("수정 하시겠습니까?");
	if(updateConfirm){
		orderUpdate();
	}
	
}

function orderUpdate(){
	
	
	var startDay = $("#paramStartDay").val();
	var expirationDay = $("#paramExpirationDay").val();
	
	var startDateSplit = startDay.split("-");
	var expirationDateSplit = expirationDay.split("-");
 	$("#startDay").val(new Date(startDateSplit[0],startDateSplit[1]-1,startDateSplit[2]));
 	$("#expirationDay").val(new Date(expirationDateSplit[0],expirationDateSplit[1]-1,expirationDateSplit[2]));
 	
	$.ajax({
		type: 'POST',
        url : "/order/updateOrder",
        data: $("#orderInfo").serialize(),
        success : function(data){
            if(data == 'success')
            {
              alert("수정하였습니다.");
              location.reload();
            }
        },
        error:function(request,status,error){
            alert("수정에 실패하였습니다. 관리자에게 문의하세요");
        }
    });
}
/* 구매 등록 */

/* 구매 삭제 */
function goOrderDel(orderSeq,storeSeq){
	
	var delConfirm = confirm("삭제 하시겠습니까?");
	if(!delConfirm){
		return false;
	}
	
	
	$.ajax({
	       type:'POST',
	       url : "/order/orderDelete",
	       data: {	orderSeq 	: 	orderSeq,
       				storeSeq	:	storeSeq
   				},
	       success : function(data){
	           if(data == 'success')
	           {
	             alert("삭제 하였습니다.");
	             goOrderList();
	           }
	       },
	       error:function(request,status,error){
	           alert("저장에 실패하였습니다. 관리자에게 문의하세요");
	      }
	       
	});
}
/* 구매 삭제 */


/* 검색 팝업 */
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
        url : "/order/searchMember",
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


function popMemberList(popMemberList){
	var paramList = '';
	
	for(var i = 0 ; i < popMemberList.length; i++ ){
		var paramMemberSeq = 0;
		var paramName = '';
		var paramPhone = '';
		var paramSex = '';
		
		paramMemberSeq = popMemberList[i].memberSeq;
		paramName = popMemberList[i].name;
		paramPhone = popMemberList[i].phone;
		paramSex = popMemberList[i].sex;
		
		paramList = '<td>'+popMemberList[i].rowNum+'</td>';
		paramList += '<td>';
 		paramList += '<a href="#" onclick="popMemberSelect('+paramMemberSeq+', \''+paramName+'\' , \''+paramPhone+'\');">'; 
		paramList +=  popMemberList[i].name+'</a>';
		paramList += '</td>';
		paramList += '<td>'+popMemberList[i].phone+'</td>';
		paramList += '<td>'+popMemberList[i].sex+'</td>';
	}
	
	$("#memberList").text("");
	$("#memberList").append(paramList);
}

function popMemberSelect(memberSeq,name,phone) {
	
	$("#name").val(name);
	$("#memberSeq").val(memberSeq);
	
	var paramMemberPhoneInfo = phone.split('-');
	$("#phone1").val(paramMemberPhoneInfo[0]);
	$("#phone2").val(paramMemberPhoneInfo[1]);
	$("#phone3").val(paramMemberPhoneInfo[2]);
	$("#phone").val(phone);
	
	popClose();
	$("#findMember").modal('toggle');
}

function popClose(){
	$("#popName").val("");
	
	var paramDefaultList = '<th colspan="4" style="text-align: center;">결과가 없습니다.</th>';
	
	$("#memberList").text("");
	$("#memberList").append(paramDefaultList);
}
/* 검색 팝업 */



function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
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
					<input type="button" id="popFindName" name="popFindName" value="찾기" onclick="searchName();">
				</div>
				<div style="margin: 10px; border-top-style: solid;">
					<table class="table table-bordered" style="margin-top: 20px;">
						<tbody>
							<tr>
								<th>No</th>
								<th>이름</th>
								<th>연락처</th>
								<th>성별</th>
							</tr>
							<tr id="memberList"><th colspan="4" style="text-align: center;">결과가 없습니다.</th></tr>
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
