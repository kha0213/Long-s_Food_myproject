<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="${conPath }/css/footer.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">
</head>
<body>
	<div id="footer" class="container">
		<div class="row justify-content-center">

			<div class="col-4">대표이사 : 김영롱 | 사업자 등록번호 : 888-7777-6666 | 식품업 |
				대표전화 : 010-2344-8628</div>
			<div class="col-4">이메일 : tatujjang@gmail.com | 회사주소 : 서울시 송파구
				COPYRIGHT@Long's Food INC. ALL RIGHTS RESERVED.</div>
				</div>
				<div class="row justify-content-center">
			<div class="footer_logo col-4">
				<a href="#"> <img src="${conPath }/image/logo.png" alt="메인로고">
					<span>Long's Food</span></a>
			</div>
		</div>

	</div>

</body>
</html>