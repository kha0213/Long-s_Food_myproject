<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/header.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<%=conPath%>/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="<%=conPath%>/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>
	 <div id="header" class="container-fluid">    
        <div class="header_logo">
            <a href="#">
                <img src="<%=conPath %>/image/logo.png" alt="메인로고">
                <p>Long's Food</p></a>
        </div>
        <div>

        </div>
        <div id="gnbMobile">
            <ul>
                <li><a href="#"><img src="<%=conPath %>/image/user.png" alt="로그인아이콘"></a></li>
                <li><a href="#"><img src="<%=conPath %>/image/supermarket.png" alt="장바구니아이콘"></a></li>
            </ul>
        </div>
        <div id="gnb">
            <ul>
                <li class="gnb_menu"><a href="mainpage.jsp">Home</a></li>
                <li class="gnb_menu"><a href="#" onclick="parent.location.href='login.jsp'">Login</a></li>
                <li class="gnb_menu"><a href="#">Sign Up</a></li>
                <li class="gnb_menu"><a href="#">My Page</a></li>
                <li class="gnb_menu"><a href="#">Cart</a></li>
            </ul>
        </div>
    </div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="<%=conPath%>/js/bootstrap.min.js"></script>
</body>
</html>