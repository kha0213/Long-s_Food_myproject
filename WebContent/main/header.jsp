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
<c:if test="${not empty joinView }">
	<script>
		window
				.open(
						"${conPath}/member/join.jsp",
						"_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=600,height=1000");
	</script>
</c:if>
<c:if test="${not empty loginView }">
	<script>
		window
				.open("${conPath}/member/login.jsp", "_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=500,width=462,height=364");
	</script>
</c:if>

</head>
<body>

	<div class="container" id="header">
		<div class="row clearfix" id="header_nav">
			<div class="float-none" id="header_nav_logo">
				<ul class="nav" id="header_nav_ul">
					<li class="nav-item" class="clear-fix"><a class="nav-link"
						href="${conPath }/main.do"><img alt="메인로고"
							src="${conPath }/image/logo.png" id="logo"><span
							id="logoName"> Long's Food</span></a></li>

				</ul>
			</div>
			<div class="col" id="header_nav_pc">
				<ul class="nav justify-content-end" id="header_linklist">
					<li class="nav-item"><a class="nav-link text-dark"
						href="${conPath }/main.do">Home</a></li>
					<!-- 로그인 전 헤더 -->
					<c:if test="${empty member && empty manager }">
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/loginView.do">Login</a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/joinView.do">Sign Up</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="#">Cart</a></li>
					</c:if>
					<!-- 고객 헤더 -->
					<c:if test="${not empty member }">
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/mMypage.do"><small>${member.mname }님</small></a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/logout.do">Log out</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="#">Cart</a></li>
					</c:if>
					<!-- 관리자 헤더 -->
					<c:if test="${not empty manager }">
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/main.do"><small>${manager.mgname }님</small></a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/registProductView.do">상품등록</a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="${conPath }/logout.do">Log out</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link text-dark" href="${conPath }/csBoardsListService.do">C.S</a></li>

				</ul>
			</div>
			<!-- 태블릿,PC일떄 -->

			<div class="col" id="header_nav_mob">
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link active" href="#">
							<img alt="user" src="${conPath }/image/user.png">
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <img
							alt="cart" src="${conPath }/image/cart.png">
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img alt="cart"
							src="${conPath }/image/menu.png">
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${conPath }/main.do">Home</a>
							<c:if test="${empty member && empty manager }">
								<a class="dropdown-item" href="${conPath }/loginView.do">Login</a>
								<a class="dropdown-item" href="${conPath }/joinView.do">Sign
									Up</a>
							</c:if>
							<c:if test="${not empty member }">
								<a class="dropdown-item" href="${conPath }/mMypage.do">${member.mname }님</a>
								<a class="dropdown-item" href="#">My Page</a>
								<a class="dropdown-item" href="${conPath }/logout.do">Log
									out</a>
							</c:if>
							<c:if test="${not empty manager }">
								<a class="dropdown-item" href="${conPath }/registProductView.do">상품등록</a>
								<a class="dropdown-item" href="${conPath }/logout.do">Log
									out</a>
							</c:if>
							<a class="dropdown-item" href="#">Cart</a> <a
								class="dropdown-item" href="${conPath }/csBoardsListService.do">Service Center</a>
						</div></li>
				</ul>
			</div>
			<!-- 모바일일떄 -->
		</div>
		
		<div class="row pt-5">
				<div class="col">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link active"
							href="${conPath }/productAll.do">전체 상품 보기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${conPath }/longfoodIntro.do">Long's
								Food 소개</a></li>
					</ul>
				</div>

				<div class="col">
					<form class="form-inline justify-content-end" action="#"
						method="get">
						<input class="form-control mr-2 " type="search" placeholder="제품 검색"
							name="search">
						<button class="btn btn-link" type="submit">
							<img src="${conPath }/image/search.png" alt="검색">
						</button>
					</form>

				</div>
			</div>
		
		
	</div>

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