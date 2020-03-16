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
	table{
		font-size: 1.6em;
	}
	.input_small{
		width:50px;
	}
</style>
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
			<div class="row mt-5 mb-5">
			<p class="display-4"><img src="${conPath }/image/icon/shopping-cart.png" alt="카트이미지">&nbsp; 장바구니</p>
				<div class="w-100"><hr></div>
			</div>
			
			<c:if test="${empty carts }">
				<p class="h1 m-5">장바구니가 현재 비어있습니다. <br><br>상품을 먼저 추가해주세요</p>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
			</c:if>		
			<c:if test="${not empty carts }">
				<table class="table table-hover">
  <thead>
    <tr>
      <th><input type="checkbox" name="pOutCartAll"></th>
      <th>상품정보</th>
      <th>수량</th>
      <th>상품금액(할인금액)</th>
    </tr>
  </thead>
  <tbody>
			<c:forEach var="cart" items="${carts }">
    <tr>
      <td><input type="checkbox" name="pOutCart"></td>
      <td><img src="${conPath }/image/product/${cart.pimage}" alt="pimage" width="50">${cart.pname } </td>
      <td><input type="number" min="0" value="${cart.pcnt }" class="input_small">개</td>
      <td>${cart.pprice*cart.pcnt }원 <img src="${conPath }/image/icon/minus_only.png" alt="-"> <span class="text-danger"><fmt:parseNumber value="${cart.pprice*cart.pcnt*cart.pdiscount/100 }" integerOnly="true"/>원 할인!!</span></td>
    </tr>
			</c:forEach>
  </tbody>
</table>
  <div class="text-center m-5 h3">
  		 상품가격 <span id="ppriceAll"></span> 
  			<img src="${conPath }/image/icon/minus.png" alt="-">
  			할인금액 <span id="pdiscount"></span>
  			<img src="${conPath }/image/icon/plus.png" alt="+"> 
  			배송비 : 2500원 
  			<img src="${conPath }/image/icon/equal.png" alt="="> 
  			총 주문금액 <span id="ppriceResult"></span>
  		
  </div>
  <div class="m-5">&nbsp;</div>
  <div class="m-5">&nbsp;</div>
			</c:if>	
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