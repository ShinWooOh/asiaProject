<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>ASIA YOGA LOGIN</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<body>

<div class="container">

  <form class="form-signin" action="/attendance/info" method="post">
    <h2 class="form-signin-heading">ASIA YOGA LOGIN</h2>
    <label class="sr-only">input id</label>
    <input type="text" id="mangerId" class="form-control" placeholder="아이디를 입력하세요." required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <div class="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  </form>

</div> <!-- /container -->

</body>
</html>
