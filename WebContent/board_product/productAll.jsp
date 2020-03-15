<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('[data-toggle="tooltip"]').tooltip(); 
		$('.product').mouseenter(function() {
			$(this).css('cursor', 'pointer');
			$(this).addClass('border border-primary');

		});
		$('.product').mouseleave(function() {
			$(this).removeClass('border border-primary');
		});

	});
</script>
</head>
<body style="background-color: #f5f3f6">

	<c:if test="${registProductResult eq true }">
		<script>
			alert('상품등록에 성공하셨습니다.');
		</script>
	</c:if>
	<c:if test="${registProductResult eq false }">
		<script>
			alert('상품등록에 실패하셨습니다. 관리자에게 문의하세요');
		</script>
	</c:if>

	<c:if test="${not empty pbuyNowResult }">
		<script>
			alert('${pbuyNowResult}');
		</script>
	</c:if>
	




	<div id="wrap" class="container-fluid">
		<jsp:include page="../main/header.jsp" />
		
		<div class="h3 m-5">상품 전체보기
		<img alt="sale" src="${conPath }/image/icon/sale.png" data-toggle="tooltip" title="30%이상 할인">
		<img alt="best2" src="${conPath }/image/icon/best2.png" data-toggle="tooltip" title="누적판매량 100개 이상">
		<img alt="highRating" src="${conPath }/image/icon/highRating.png" data-toggle="tooltip" title="상품 평점 8.0이상">
		</div>
		<div class="dropdown text-right mt-5 mb-5">
			<span class="text-muted">정렬순서</span>
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<c:if test="${empty param.sortingCriteria || param.sortingCriteria == 'preview_count'}" >리뷰 많은 순</c:if>
				<c:if test="${param.sortingCriteria == 'lowprice'}" >낮은 가격 순</c:if>
				<c:if test="${param.sortingCriteria == 'highprice'}" >높은 많은 순</c:if>
				<c:if test="${param.sortingCriteria == 'pregist'}" >상품 등록일 순</c:if>

			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item"
					href="${conPath }/productAll.do?sortingCriteria=preview_count">리뷰
					많은 순</a> <a class="dropdown-item"
					href="${conPath }/productAll.do?sortingCriteria=lowprice">낮은
					가격순</a> <a class="dropdown-item"
					href="${conPath }/productAll.do?sortingCriteria=highprice">높은
					가격 순</a> <a class="dropdown-item"
					href="${conPath }/productAll.do?sortingCriteria=pregist">상품 등록일 순</a>
			</div>
		</div>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
			<c:forEach var="product" items="${products }">
				<div class="col">
					<div class="card product overflow-hidden" onclick="location.href = 'productDetail.do?pcode=${product.pcode}'">
						<img src="${conPath }/image/product/${product.pimage}"
							class="card-img-top" alt="상품이미지">
						<div class="card-body">
							<c:if test="${product.pdiscount>=30 }"><img alt="sale" src="${conPath }/image/icon/sale.png"></c:if>
							<c:if test="${product.pcumulative_sales>=100 }"><img alt="best2" src="${conPath }/image/icon/best2.png"></c:if>
							<c:if test="${product.prating>=8.0 }"><img alt="best2" src="${conPath }/image/icon/highRating.png"></c:if>
							
							
							<h5 class="card-title">${product.pname }</h5>
							<h6 class="card-subtitle mt-2 mb-2">
								<c:if test="${product.pdiscount>=20 }">
									<img src="${conPath }/image/icon/sale.png" alt="sale">
								</c:if>
								${product.pdiscount }%할인 &nbsp;
								<del>
									<fmt:formatNumber value="${product.pprice}"
										currencySymbol="true" />
									원
								</del>
								<br> <strong style="color: red">
								<fmt:formatNumber value="${product.pprice*(100-product.pdiscount)/100}"
										pattern="###,###" />원</strong> (리뷰:${product.preview_count }개)
							</h6>
							<div class="cody-body">
								<p>${product.pdescription }</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>


		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-5 mb-5">
				<li class="page-item"><c:if test="${startPage ne 1 }">
						<a class="page-link" aria-label="Previous"
							href="${conPath }/productAll.do?sortingCriteria=${param.sortingCriteria}&pageNum=${startPage-1}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="page" begin="${startPage }" end="${endPage }">
					<c:if test="${page ne currentPage }">
					<li class="page-item"><a class="page-link"
						href="${conPath }/productAll.do?sortingCriteria=${param.sortingCriteria}&pageNum=${page}">${page }</a></li>
					</c:if>
					<c:if test="${page eq currentPage }">
					<li class="page-item"><span class="page-link text-danger"
						>${page }</span></li>
					</c:if>
				</c:forEach>
				<li class="page-item">
				<c:if test="${endPage ne totalPage }">
				<a class="page-link"
					href="${conPath }/productAll.do?sortingCriteria=${param.sortingCriteria}&pageNum=${endPage+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					
				</a>
				</c:if>
				</li>
			</ul>
		</nav>

	</div>
	<!-- wrap -->
	<jsp:include page="../main/footer.jsp" />

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