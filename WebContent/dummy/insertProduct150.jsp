<%@page import="com.yl.dao.Customer_service_dao"%>
<%@page import="java.sql.Date"%>
<%@page import="com.yl.dao.Member_dao"%>
<%@page import="com.yl.dao.Product_dao"%>
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
mgDao.joinManager("admin", "11", "관리자롱", "상품MD");

	Product_dao pDao = Product_dao.getInstance();
	for(int i=1;i<=150;i++){
		String pcode = "testPcode"+i;
		String mgid = "admin";
		String pname = "testPname"+i;
		int pprice = (int)(Math.random()*100000);
		String pimage = ((i%20)+1)+".jpg";
		int pstock = (int)(Math.random()*100);
		String pdescription = i+"번 test 제품 설명";
		pDao.registProduct(pcode,mgid, pname, pprice, pimage, pstock, pdescription);
		
	}
	
	Member_dao mDao = Member_dao.getInstance();
	mDao.adMember("aaa", 1, 1, 1);
	mDao.joinMember("aaa", "11", "롱롱이", "01023448628", "서울시 송파구", Date.valueOf("1989-03-27"), "email", "남자");

	
	Customer_service_dao csDao = Customer_service_dao.getInstance();
	
	for(int i=1;i<209;i++){
	csDao.writeCsBoardMember("aaa", "test"+i, "content"+i, true, ((i%12)+1)+".jpg", null);
	}
	
	
%>





</body>
</html>