<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Myproject</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">

<!--다운받은 폰트목록
       font-family: 'Dancing Script', cursive;
        font-family: 'Gochi Hand', cursive;
        font-family: 'Indie Flower', cursive;
        font-family: 'Kaushan Script', cursive;
        font-family: 'Lobster Two', cursive;
        font-family: 'Lobster', cursive;
        
        font-family: 'Nanum Pen Script', cursive;
        font-family: 'Roboto', sans-serif;
        font-family: 'Alata', sans-serif;
    -->

<link rel="stylesheet" href="${conPath }/css/content.css"
	type="text/css">

</head>
<c:if test="${joinResult eq true }">
	<script>
		alert('회원가입에 성공하셨습니다. 로그인 이후에 서비스이용해주세요');
		window.close();
	</script>
</c:if>
<c:if test="${joinResult eq false }">
	<script>
		alert('회원가입에 실패하셨습니다. 관리자에게 문의해주세요');
		history.back();
	</script>
</c:if>

<c:if test="${loginResult eq true }">
	<script>
		alert('로그인 성공');
		opener.location.href = "${conPath}/main.do"
		window.close();
	</script>
</c:if>
<c:if test="${loginResult eq false }">
	<script>
		alert('로그인 실패 아이디와 비밀번호를 확인해주세요');
		history.back();
	</script>
</c:if>
<c:if test="${logoutResult eq true }">
	<script>
		alert('로그아웃 성공하였습니다.');
	</script>
</c:if>
<!-- 관리자 가입 결과 -->
<c:if test="${mgjoinResult eq true }">
	<script>
		alert('관리자 등록 성공 관리자 로그인 후 서비스 이용하세요.');
		window.close();
	</script>
</c:if>
<c:if test="${mgjoinResult eq false }">
	<script>
		alert('관리자 등록 실패 담당관리자에게 문의하세요');
		history.back();
	</script>
</c:if>

<c:if test="${mgloginResult eq true }">
	<script>
		alert('관리자 로그인 성공');
		opener.location.href = "${conPath}/main.do"
		window.close();
	</script>
</c:if>
<c:if test="${mgloginResult eq false }">
	<script>
		alert('관리자 로그인 실패 아이디와 비밀번호를 확인해주세요');
		history.back();
	</script>
</c:if>






<body>
		<jsp:include page="header.jsp" />
	<div id="wrap" class="container">

		<div id="content">
			
			<div id="carouselImage" class="carousel slide carousel-fade"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${conPath }/image/mainpage/img1.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img2.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img3.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img4.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img5.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img6.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>
					<div class="carousel-item">
						<img src="${conPath }/image/mainpage/img7.jpg"
							class="d-block w-100 img-fluid" alt="mainImage">
					</div>

				</div>
				<a class="carousel-control-prev" href="#carouselImage" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselImage"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<!-- top3 -->
			<div
				class="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4 p-3 card-deck">
				<div class="col mb-4">
					<div class="card mh-100">
						<div class="bg-warning">
							<img src="${conPath }/image/food/yogurt.jpg" class="card-img-top"
								alt="yogurt">
						</div>
						<div class="card-body">
							<h5 class="card-title text-center">TOP1</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card">
						<img src="${conPath }/image/food/hotcake.jpg" class="card-img-top"
							alt="hotcake">
						<div class="card-body">
							<h5 class="card-title text-center">TOP2</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card">
						<img src="${conPath }/image/food/blueberry_icecream.jpg"
							class="card-img-top" alt="blueberry_icecream">
						<div class="card-body">
							<h5 class="card-title text-center">TOP3</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card">
						<img src="${conPath }/image/food/avocado.jpg" class="card-img-top"
							alt="avoado">
						<div class="card-body">
							<h5 class="card-title text-center">TOP4</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>

			</div>

			<div id="ad_side">ad_side</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<!--wrap-->
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