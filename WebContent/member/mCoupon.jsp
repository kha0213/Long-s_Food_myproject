<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
 .swal-footer{
 	text-align: center;
 }
 </style>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$('.card-event').click(function(){
	var ccondition = Number($(this).next().html());
	var cdisminus = Number($(this).next().next().html());
	var cono = Number($(this).next().next().next().html());
	var purchaseMoney = Number($('#purchaseMoney').html());
	var finalPay = Number($('#finalPay').html());
	if(ccondition <= purchaseMoney){
		var coupon = $(this).removeClass('card-event').html();
		$('#useCoupon').html(coupon);
		$('#discoupon').html();
		if(cdisminus<100){
			$('#finalPay').html(parseInt(finalPay/100*(100-cdisminus)));
			$('#discoupon').html(parseInt(finalPay/100*cdisminus));
			
		}else{
			$('#finalPay').html(finalPay-cdisminus);
			$('#discoupon').html(cdisminus);
		}
			$('#cono').html(cono);
			$('input[name=cono]').val(cono);
	}else{
		swal({
			  title: "쿠폰 사용조건에 맞지 않습니다.!",
			  icon: "error",
			  buttons : {
				  confirm : {
					  text : '확인',
				  }
			  }
			});
		$('#useCoupon').html('');
	}
	
	$('#myCoupon').click();
});
</script>
<body style="background-color: #f5f3f6">
	
      <h3 class="text-center">${member.mname }님의 보유 쿠폰정보</h3>
      <p class="text-muted mt-2 text-center">쿠폰은 장바구니 일괄결제에도 사용 가능합니다.</p>
    
    <c:forEach items="${coupons }" var="coupon">
    <div class="card-deck card-event">
    
  <div class="card m-5 border-info">
    <div class="card-body">
      <h4 class="card-title text-primary">${coupon.cname }</h4>
      <p class="card-text">사용 조건 : <strong class="font-italic"><ins><fmt:formatNumber value="${coupon.ccondition }" currencySymbol="true"/></ins></strong>원 이상 구매시 </p>
      <p class="card-text">할인액/율 : <span class="badge badge-pill badge-warning h4"><c:if test="${coupon.cdisper ne 0}">
	      ${coupon.cdisper }% 할인
      	</c:if>
      	<c:if test="${coupon.cdiscash ne 0}">
	      ${coupon.cdiscash }원 할인
      	</c:if> </span></p>
    </div>
    <div class="card-footer bg-transparent border-success">유효기간 : <strong class="text-danger">${coupon.cvalidity }</strong>까지 <small class="text-muted">(${coupon.cordate } 쿠폰생성)</small></div>
  </div>
  
</div>
<span class="d-none">${coupon.ccondition }</span>
<span class="d-none"><c:if test="${coupon.cdisper ne 0}">
	      ${coupon.cdisper }
      	</c:if>
      	<c:if test="${coupon.cdiscash ne 0}">
	      ${coupon.cdiscash }
      	</c:if></span>
<span class="d-none">${coupon.cono }</span>
    </c:forEach>











</body>
</html>