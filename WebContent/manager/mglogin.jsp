<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	
	<form action="${conPath }/mglogin.do" method="post" name="loginfrm" onsubmit="closeChildWindow()">
  <div class="form-group text-center m-3">
    <h2>관리자 로그인</h2>
  </div>
  <div class="form-group m-3">
    <label>ID</label>
    <input type="text" class="form-control" placeholder="아이디를 입력하세요" required="required" name="mgid">
  </div>
  <div class="form-group m-3">
    <label>Password</label>
    <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" required="required" name="mgpw">
  </div>
  <div class="text-center">
  <button type="submit" class="btn btn-outline-success">관리자 로그인</button>
	</div>
	<div class="text-right pr-1"><input type="button" onclick="history.back()" class="btn btn-outline-dark btn-sm" value="뒤로 가기">
    </div>
</form>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>