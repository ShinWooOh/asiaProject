<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="navbar-nav ml-auto">
	<li class="nav-item">
		<a class="btn btn-block btn-secondary" id="btnLogOut" onclick="goLogOut();"><font style="color: white;">로그아웃</font></a>
		<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>
	</li>
</ul>


<script type="text/javascript">

function goLogOut(){
	var delConfirm = confirm("로그아웃 하시겠습니까?");
	if(!delConfirm){
		return false;
	}
	
	$("#logout-form").submit();
};

</script>