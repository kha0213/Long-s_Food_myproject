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
</head>
<body>
	 <div id="header">    
        <div class="header_logo">
            <a href="#">
                <img src="<%=conPath %>/image/healthy-food.png" alt="메인로고">
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

</body>
</html>