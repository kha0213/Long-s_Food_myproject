<%@page import="com.yl.dao.Manager_dao"%>
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
</head>
<body>

<%
	Manager_dao mgDao = Manager_dao.getInstance();
	for(int i=1;i<=150;i++){
		String pcode = "testPcode"+i;
		String pname = "testPname"+i;
		int pprice = (int)(Math.random()*100000);
		String pimage = ((i%20)+1)+".jpg";
		int pstock = (int)(Math.random()*100);
		String pdescription = i+"번 test 제품 설명";
	mgDao.registProduct(pcode, pname, pprice, pimage, pstock, pdescription);
		
	}
	



%>





</body>
</html>