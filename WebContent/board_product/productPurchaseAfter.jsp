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
<c:if test="${not empty pbuyNowResult }">
	<script>
		alert('${pbuyNowResult}');
	</script>
</c:if>
			<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div class="row mt-5 mb-5">
			<p class="display-4">
				<img src="${conPath }/image/icon/paymentSuccess.png" alt="결제완료이미지" width="100">&nbsp;
				주문완료
			</p>
			<div class="w-100">
				<hr>
			</div>
		</div>
		<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="2"><h3>배송 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>배송지</td>
					<td>${delivery.daddress }</td>
				</tr>
				<tr>
					<td>배송지 전화번호</td>
					<td>${delivery.dphone }</td>
				</tr>
			</tbody>
		</table>
		<div class="w-100 mb-5">
			<hr>
		</div>
		<div class="row">
			<div class="col">
			<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="2"><h3>주문 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${order_detail}" >
				<tr>
					<td>
						<img alt="상품이미지" src="${conPath }/image/product/${product.pimage}" width="60px">
						${product.pname }
					</td>
					<td>
						${product.pcnt }개
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
			
			</div>
			<div class="col">
			<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="3"><h3>결제 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">상품금액</td>
					<th>${productPay }원</th>
				</tr>
				<tr>
					<td>할인금액</td>
					<td class="text-right"><img src="${conPath }/image/icon/minusGra.png" width="40"></td>
					<th class="text-danger">${discount }원</th>
				</tr>
				<tr>
					<td>사용포인트</td>
					<td class="text-right"><img src="${conPath }/image/icon/minusGra.png" width="40"></td>
					<th class="text-danger">${usemp }포인트</th>
				</tr>
				<tr>
					<td>적립포인트</td>
					<td class="text-right"><img src="${conPath }/image/icon/plusGra.png" width="40"></td>
					<th class="text-primary">(+${addmp }포인트)</th>
				</tr>
				<tr>
					<th><h3>결제금액</h3></th>
					<td class="text-right"><img src="${conPath }/image/icon/card-payment.png" width="50"></td>
					<th><h3>${finalpay }원</h3></th>
				</tr>
			</tbody>
		</table>
			</div>
		</div>
		<div class="w-100 mt-5 mb-5">
			<hr>
		</div>
		<p class="text-center">
			<button type="button" class="btn btn-info btn-lg" onclick="location.href='${conPath}/productAll.do'">계속 쇼핑하기</button>
		</p>
		<div class="mt-5 mb-5">
			&nbsp;
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