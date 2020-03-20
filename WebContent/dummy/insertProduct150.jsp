<%@page import="com.yl.dao.Review_dao"%>
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
		int pprice = (int)(Math.random()*1000)*100;
		String pimage = ((i%20)+1)+".jpg";
		int pstock = (int)(Math.random()*30);
		String pdescription = i+"번 test 제품 설명";
		int pdiscount = (int)(Math.random()*30);
		pDao.registProduct(pcode, mgid, pname, pprice, pimage, pstock, pdescription, pdiscount);
		
	}
	pDao.modifyProductDiscount(15, "admin");
	Member_dao mDao = Member_dao.getInstance();
	String[] mids = {"aaa","bbb","ccc","ddd"};
	mDao.adMember("aaa", 1, 0, 1);
	mDao.joinMember("aaa", "11", "롱롱이", "01023448628", "서울시 송파구","현대빌라", Date.valueOf("1989-03-27"), "email", "남자");
	mDao.adMember("bbb", 0, 0, 0);
	mDao.joinMember("bbb", "11", "롱롱이2", "01023448628", "서울시 송파구","현대빌라", Date.valueOf("1989-03-27"), "email", "남자");
	mDao.adMember("ccc", 1, 1, 1);
	mDao.joinMember("ccc", "11", "롱롱이3", "01023448628", "서울시 송파구","현대빌라", Date.valueOf("1989-03-27"), "email", "남자");
	mDao.adMember("ddd", 1, 1, 1);
	mDao.joinMember("ddd", "11", "롱롱이4", "01023448628", "서울시 송파구","현대빌라", Date.valueOf("1989-03-27"), "email", "남자");
	
	mDao.getMember("aaa");
	mDao.mPointPlus(10000, "aaa");
	mDao.mcumulative_buy_plus(1001000, "aaa");
	mDao.mcumulative_buy_plus(11001000, "bbb");
	mDao.mcumulative_buy_plus(111001000, "ccc");
	mDao.mcumulative_buy_plus(511100100, "ddd");
	
	Customer_service_dao csDao = Customer_service_dao.getInstance();
	for(int i=1;i<209;i++){
		csDao.writeCsBoardMember(mids[(int)(Math.random()*4)], "test"+i, "content"+i, true, ((i%12)+1)+".jpg", (int)(Math.random()*2));
	}
	Review_dao rDao = Review_dao.getInstance();
	for(int i=1;i<2000;i++){
		rDao.reviewWrite("testPcode"+((int)(Math.random()*150)), mids[(int)(Math.random()*4)], (i%12+1)+".jpg", null, null, (int)(Math.random()*10)+1, "testReview"+i);
	}
%>


</body>
</html>