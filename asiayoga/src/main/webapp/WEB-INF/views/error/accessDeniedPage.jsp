<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <title>접근 거부</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<body>

<div class="container">

  <br><br>
      <div class="container text-center">
          <h1>Access Deined</h1><br>
      </div>
      <br><br>
      <div class="container text-center">
          <h6 class="font-italic text-danger">권한이 없어 접근이 불가합니다.<br>관리자에게 문의하세요.</h6>
          <%= System.out.println("요청 결과 여기는 나오네요") %>
      </div>
      <br><br>
      <div class="container text-center">
        <a href='<c:url value="/"/>' class="text-dark"><i class="fas fa-undo"></i></a>
      </div>

</div> <!-- /container -->

</body>
</html>
