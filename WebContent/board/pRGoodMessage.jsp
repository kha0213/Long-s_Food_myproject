<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<c:if test="${rGoodResult eq true}">
		<span class="alert alert-success m-0 p-3 h5" role="alert">
  			<img src="${conPath }/image/icon/heart.png" alt="좋아요">성공
		</span>
	</c:if>
	<c:if test="${rGoodResult eq false}">
		<div class="alert alert-danger m-0 p-3 h5" role="alert">
  			이미 <strong>좋아요</strong> 하셨어요
		</div>
	</c:if>
</body>
</html>