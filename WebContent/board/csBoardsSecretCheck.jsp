<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${secretResult eq true }">
		<script>
		location.href="${conPath }/csBoardsDetail.do?pageNum=${pageNum }&cno=${cno }";
		</script>
	</c:if>
	
	
	
	<c:if test="${secretResult ne true }">
		<script>
			alert('비밀글은 관리자와 작성자만 볼 수 있습니다.');
			history.back();		
		</script>
	</c:if>
</body>
</html>