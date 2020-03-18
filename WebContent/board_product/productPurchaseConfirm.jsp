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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(function() {
		var finalPay = Number($('#finalPay').html());
		var memberPoint = ${member.mpoint};
		$('#usePointBtn').click(function() {
			var usePointAmount = $(this).prev().val();
			if (usePointAmount == '') {
				swal({
					title : "포인트 입력 후 사용버튼을 눌러주세요",
					icon : "info",
					buttons : {
						confirm : {
							text : '확인',
						}
					}
				});
			} else {
				if (usePointAmount > memberPoint) {
					$(this).prev().val(memberPoint);
					swal({
						title : "보유 포인트보다 큰 금액은 사용이 불가능합니다.",
						icon : "error",
						buttons : {
							confirm : {
								text : '확인',
							}
						}
					});
				} else {
					if(usePointAmount>finalPay){
						usePointAmount = finalPay;
					}
					$(this).prev().val(usePointAmount);
					$('#usemp').html(usePointAmount);
					$('#finalPay').html(finalPay - usePointAmount);
				}

			}
		});
		$('#usePointBtnAll').click(function(){
			var usePointAmount = memberPoint;
			if(usePointAmount>finalPay){
				usePointAmount = finalPay;
			}
			$(this).prev().prev().val(usePointAmount);
			$('#usemp').html(usePointAmount);
			$('#finalPay').html(finalPay - usePointAmount);
		});
		$('form').submit(function(){
			var finalPayNow = Number($('#finalPay').html());
			var discount = Number($('#discount').html());
			var usemp = Number($('#usemp').html());
			var finalPayInput = $("<input>").attr("type", "hidden").attr("name", "finalPay").val(finalPayNow);
			var usempInput = $("<input>").attr("type", "hidden").attr("name", "usemp").val(usemp);
			var discountInput = $("<input>").attr("type", "hidden").attr("name", "discount").val(discount);
			$('form').append(finalPayInput).append(usempInput);
		});
	});
</script>
<script>
	function daumMapApi() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("jibunAddress").value = data.jibunAddress;

						var guideTextBox = document.getElementById("guide");

					}
				}).open();
	}
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style>
thead {
	background-color: #e4f1ff;
}

th {
	background-color: #dadee2;
}

.myColor {
	background-color: #f5f3f6;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body class="myColor">
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div class="row mt-5 mb-5">
			<p class="display-4">
				<img src="${conPath }/image/icon/payment.png" alt="결제이미지">&nbsp;
				주문/결제
			</p>
			<div class="w-100">
				<hr>
			</div>
		</div>
		<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="2"><h3>구매자 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>이름</th>
					<td>${member.mname }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.memail }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${member.mphone }</td>
				</tr>
			</tbody>
		</table>
		<div class="w-100">
			<hr>
		</div>
		
		<form action="${conPath }/payment.do" method="post">
		<input type="hidden" name="mid" value="${member.mid }">
		<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="2"><h3>받는사람 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>이름</th>
					<td><input type="text" class="form-control" name="dname"
						value="${member.mname }"></td>
				</tr>
				<tr>
					<th><br>배송주소<br></th>
					<td><input type="button"
						class="form-control btn-info btn mb-2" value="주소검색"
						onclick="daumMapApi()"><br> <input type="text"
						class="form-control mb-1" name="daddress_basic" placeholder="기본주소"
						id="jibunAddress" value="${member.maddress_basic }" required="required"> <input
						type="text" class="form-control" name="daddress_detail"
						placeholder="상세주소" value="${member.maddress_detail }" required="required"></td>
				</tr>
				<tr>
					<th>배송연락처</th>
					<td><input type="text" class="form-control" name="dphone"
						value="${member.mphone }"></td>
				</tr>
			</tbody>
		</table>
		<div class="w-100">
			<hr>
		</div>
		<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="4"><h3>주문상품 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>구매금액</th>
				</tr>
				<c:forEach var="cart" items="${carts }">
					<tr>
						<td> <input type="hidden" name="pcodeArr" value="${cart.pcode }">
						 <input type="hidden" name="pcntArr" value="${cart.pcnt }">
							<img alt="상품이미지" src="${conPath }/image/product/${cart.pimage }" width="100px"></td>
						<td>${cart.pname }</td>
						<td>${cart.pcnt }</td>
						<td><del>${cart.pprice*cart.pcnt}원</del><span
							class="font-weight-bold text-danger"><fmt:parseNumber
									value="${cart.pprice*cart.pcnt*(100-cart.pdiscount)/100 }"
									integerOnly="true" />원</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="w-100">
			<hr>
		</div>
		<table class="table table-borderless">
			<thead>
				<tr>
					<td colspan="6"><h3>결제 정보</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>할인쿠폰</th>
					<td colspan="5"><button type="button"
							class="btn btn-primary btn-lg">보유 쿠폰확인</button></td>
				</tr>
				<tr>
					<th>포인트사용</th>
					<td colspan="5"><input type="number" min="0"
						max="${member.mpoint}" id="usePointAmount"> &nbsp; (보유포인트
						: ${member.mpoint}포인트) &nbsp;
						<button type="button" class="btn btn-info" id="usePointBtn">포인트사용</button>
						<button type="button" class="btn btn-warning" id="usePointBtnAll">모든포인트사용</button></td>
				</tr>
				<tr class="text-center">
					<th class="text-left" rowspan="2">결제금액</th>
					<td>구매금액</td>
					<td>할인금액</td>
					<td>사용포인트</td>
					<td>배송비</td>
					<td>총 결제금액</td>
				</tr>
				<tr class="text-center h5">
					<td>${ppriceAll}원</td>
					<td class="text-danger"><span id="discount">${pdiscountAll}</span>원</td>
					<td class="text-danger"><span id="usemp">0</span>포인트</td>
					<td>2500원</td>
					<td class="text-primary font-weight-bold"><strong
						id="finalPay">${ppriceAll-pdiscountAll+2500}</strong>원</td>
				</tr>
			</tbody>
		</table>
		<div class="w-100 mb-3">
			<hr>
		</div>
		<div class="w-100 mb-5">
			<button type="submit" class="btn btn-success btn-lg btn-block">결제</button>
		</div>
		</form>
	</div>
	<!-- container -->
	<jsp:include page="../main/footer.jsp" />
	<!--wrap-->
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