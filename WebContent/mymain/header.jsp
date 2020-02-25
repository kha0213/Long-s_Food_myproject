<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>

</style>
<link rel="stylesheet" href="${conPath }/css/header.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="container-flude" id="header">
		<div class="row" id="header_nav">
			<div class="col-5" id="header_nav_logo">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="#"><img
							alt="메인로고" src="${conPath }/image/logo.png" id="logo"></a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">
					Long's Food
					</a></li>

				</ul>
			</div>
			<div class="col-7" id="header_nav_pc">
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link text-dark" href="#">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Login</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">My Page</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Cart</a></li>
				</ul>
			</div>
			<!-- 태블릿,PC일떄 -->

			<div class="col-sm" id="header_nav_mob">
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link active" href="#">
							<img alt="user" src="${conPath }/image/user.png">
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <img
							alt="cart" src="${conPath }/image/cart.png">
					</a></li>
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<img alt="cart" src="${conPath }/image/menu.png">
					</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Home</a> 
							<a class="dropdown-item" href="#">Login</a> 
							<a class="dropdown-item" href="#">Sign Up</a> 
							<a class="dropdown-item" href="#">My Page</a> 
							<a class="dropdown-item" href="#">Cart</a>
							<a class="dropdown-item" href="#">Service Center</a>
						</div></li>

				</ul>
			</div>
			<!-- 모바일일떄 -->
		</div>

	</div>
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