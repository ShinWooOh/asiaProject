<%@page import="com.company.asiayoga.manage.domain.ManageVO"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
    
    ManageVO manageInfo = (ManageVO)session.getAttribute("manageInfo");
    String nowPath = (String)session.getAttribute("nowPath");
    String authority = manageInfo.getAuthority();
%>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
<%--     <a href="#" class="brand-link">
        <img src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-1" style="opacity: .8">
        <span class="brand-text font-weight-light" style="font-size: 14px;"><%= manageInfo.getStoreName() %></span>
    </a> --%>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
            	<sec:authorize access="isAuthenticated()">
                	<a class="d-block">
                		<c:choose>
                			<c:when test="${manageInfo.getAuthority() eq 'ROLE_ADMIN'}">
		                		<%= manageInfo.getName() %>님
                			</c:when>
                			<c:otherwise>
		                		<%= manageInfo.getStoreName() %><br>
		                		<%= manageInfo.getName() %>님
                			</c:otherwise>
                		</c:choose>
                	</a>
                </sec:authorize>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            
                <c:choose>
                	<c:when test="${nowPath eq 'member'}">
		                <li class="nav-item has-treeview menu-open">
                	</c:when>
                	<c:otherwise>
		                <li class="nav-item has-treeview" >
                	</c:otherwise>
                </c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>회원
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/member/memberList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>회원 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/member/memberJoin" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>회원 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <c:choose>
                	<c:when test="${nowPath eq 'attendance'}">
		                <li class="nav-item has-treeview menu-open">
                	</c:when>
                	<c:otherwise>
		                <li class="nav-item has-treeview" >
                	</c:otherwise>
                </c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>출석
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/attendance/info" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>출석 정보</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/attendance/attendanceRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>출석 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
				<c:choose>
					<c:when test="${nowPath eq 'order'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>구매 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/order/orderList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>구매 내역</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/order/orderRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>구매 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
				<c:choose>
					<c:when test="${nowPath eq 'product'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>판매 상품
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/product/productList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>상품 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/product/productRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>상품 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
				<c:choose>
					<c:when test="${nowPath eq 'item'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>상품 품목
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/item/itemList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>품목 관리</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/item/itemRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>품목 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
				<c:choose>
					<c:when test="${nowPath eq 'store'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>매장
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/store/storeList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>매장 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/store/storeRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>매장 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
				<c:choose>
					<c:when test="${nowPath eq 'adjournment'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>휴회
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/adjournment/adjournmentList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>휴회 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/adjournment/adjournmentRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>휴회 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
				<c:choose>
					<c:when test="${nowPath eq 'manage'}">
						<li class="nav-item has-treeview menu-open">
					</c:when>
					<c:otherwise>
						<li class="nav-item has-treeview" >
					</c:otherwise>
				</c:choose>
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>직원 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/manage/manageList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>직원 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/manage/manageRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>직원 등록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/manage/manageGroupList" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>직급 목록</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/manage/manageGroupRegister" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>직급 등록</p>
                            </a>
                        </li>
                    </ul>
                </li>
              <%--  <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Simple Link
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>--%>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
