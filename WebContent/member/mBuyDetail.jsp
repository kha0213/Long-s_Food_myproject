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
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	$(function(){
		
		
	});

</script> 
 
</head>
<body style="background-color: #f5f3f6">
			<jsp:include page="../main/header.jsp" />
			
			<div class="container">
			<div class="m-5">
				<h2>주문상세내역</h2>
				<p class="mt-5 mb-5 text-weight-bold h4">주문일자 : <span class="text-">${order.odate }</span> &nbsp; &nbsp; | &nbsp; &nbsp;  주문번호 ${order.ono } &nbsp; &nbsp; | &nbsp; &nbsp; 총 주문금액: ${order.purchase_amount}원</p>
				<c:if test="${empty order.parrive_date }">
					<div class="alert alert-warning" role="alert">
  						아직 배송완료 되지 않은 상품입니다.
					</div>
				</c:if>
				<c:if test="${not empty order.parrive_date }">
					<div class="alert alert-success" role="alert">
  						${order.parrive_date }에 배송 성공!
					</div>
				</c:if>
			</div>
				<c:forEach var="odetail" items="${ods }">
					<div class="order_detail row border border-dark mt-5 mb-5">
							<div class="m-5 row text-center">
								<div class="col-3">
								<img alt="상품이미지" src="${conPath }/image/product/${odetail.pimage }" width="70%">
								</div>
								<div class="col-3">
								<p class="h3">${odetail.pname }</p>
								</div>
								<div class="col-3">
								<p class="h3">${odetail.pcnt }개</p>
								</div>
								<div class="col-3">
								<p class="h3">${odetail.pprice }원</p>
								</div>
							</div>
					</div>
				</c:forEach>
				<div class="w-100 mt-5 mb-5">
					&nbsp;
				</div>
				
			<h2 class="text-primary mt-5 mb-5 display-5">받는 사람 정보</h2>
			<table class="table table-dark table-borderless">
				<tr>
					<th>받는사람이름</th>
					<td>${delivery.dname }</td>
				</tr>
				<tr>
					<th>배송주소</th>
					<td>${delivery.daddress }</td>
				</tr>
				<tr>
					<th>배송연락처</th>
					<td>${delivery.dphone }</td>
				</tr>
				<tr>
					<th>배송업체</th>
					<td>${delivery.dcompany }</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>${delivery.dprice }원</td>
				</tr>
			</table>
			<div class="w-100 mt-5 mb-5">
				<hr>
			</div>
			
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