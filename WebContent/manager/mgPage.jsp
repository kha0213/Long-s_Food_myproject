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
<style>
.mylist:hover {
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('.registProduct').click(function(){
			$('#mgContent').load('${conPath }/registProductView.do');
		});
	});
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>


<body style="background-color: #f5f3f6">
	<jsp:include page="../main/header.jsp" />
	<div class="container-fluid mb-5 mt-5 pr-5">
		<div class="row">
			<div class="col text-center mb-5">
				<h2><span class="text-info">${manager.mgname }</span>님 관리자페이지입니다.</h2>
			</div>
		</div>
		
	<div class="row text-center">
		<div class="col mPoint mylist">
		<img src="${conPath }/image/manager/registProduct.png" alt="상품등록">
		<h3>상품등록</h3>
		</div>
		<div class="col mglist">
		<img src="${conPath }/image/icon/mcoupon.png" alt="쿠폰이미지">
		<h3>쿠폰발행</h3>
		</div>
		<div class="col mglist">
		<img src="${conPath }/image/manager/newProduct.png" alt="재고추가">
		<h3>재고추가</h3>
		</div>
		<div class="col mglist" data-toggle="tooltip" title="등록일 최신,누적판매량 0으로 초기화">
		<h3>상품수정</h3>
		</div>
		<div class="col mglist">
		<img src="${conPath }/image/manager/modifyManager.png" alt="상품수정">
		<h3>정보수정</h3>
		</div>
		<div class="col mglist">
		<h3>매출조회</h3>
		</div>
		<div class="col mglist">
		<h3>고객정보조회</h3>
		</div>
	</div>
	
	
	<div class="col mb-5 overflow-hidden mr-5" id="mgContent"></div>
	</div>


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