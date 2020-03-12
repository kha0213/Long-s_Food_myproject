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

<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	
	
	$(function(){
			var pstock = ${product.pstock};
			var mpoint = $();
		$('#pBuy').click(function(){
				var pcnt = $('#pcnt').val();
			if(pstock<pcnt){
				alert('죄송합니다. 재고 부족으로 주문할 수 없습니다. 빠른 시일내에 입고하도록 하겠습니다.');
			}else{
				var pcode = '${product.pcode}';
				var mid = '${member.mid}';
				location.href="${conPath}/pBuyNow.do?pcnt="+pcnt+"&pcode="+pcode+"&mid="+mid;
			}
		});
		
		$('#cart').click(function(){
				var pcnt = $('#pcnt').val();
			if(pstock<pcnt){
				alert('죄송합니다. 재고 부족으로 주문할 수 없습니다. 빠른 시일내에 입고하도록 하겠습니다.');
			}else{
				var pcode = '${product.pcode}';
				var mid = '${member.mid}';
				location.href="${conPath}/cartAddProduct?pcnt="+pcnt+"&pcode="+pcode+"&mid="+mid;
			}
		});
		
		
		$('.rGoodBtn').click({
			var rno = $(this).children('.rno').html();
			$.ajax({ 
				url: '${conPath}/rGoodPlus.do', 
				data: "mid="+${member.mid}+"&rno="+rno,
				dataType: "html",
				success: function(data){
					if(${rGoodResult eq true}){
						alert('성공');
					}else{
						alert('실패');
					}
				}
							
			});
			

		});
		
		
	});
	
	

</script> 


</head>
<body style="background-color: #f5f3f6;">





	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="container pt-5">
		<div class="row ml-5 mr-5">
			<div class="col mb-5">
				<img src="${conPath }/image/product/${product.pimage}" alt="상품 이미지" class="img-fluid mt-5">
			</div>
			<div class="col-8">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" colspan="4">
								<!-- hit이미지 big sale 이미지  highly recommended-->
							</th>
						</tr>

					</thead>
					<tbody>
						<tr>
							<th scope="col">상품명</th>
							<td scope="col">${product.pname }<!-- hit이미지 big sale 이미지  highly recommended--></td>
							<th scope="col">담당MD</th>
							<td>${product.mgname }</td>
						</tr>
						<tr>
							<th scope="col">누적판매량</th>
							<td>${product.pcumulative_sales }개</td>
							<th scope="col">상품평</th>
							<td>${product.preview_count }개</td>
						</tr>
						<tr>
							<th scope="col">판매가(개당)</th>
							<td colspan="3">${product.pdiscount }%할인 &nbsp; <del>
									<fmt:formatNumber value="${product.pprice}"
										currencySymbol="true" />
									원
								</del> <br> <strong class="text-danger"><fmt:formatNumber
										value="${product.pprice*(100-product.pdiscount)/100}"
										currencySymbol="true" />원</strong>
							</td>
						</tr>
						<tr>
							<th scope="col">재고량</th>
							<td colspan="3">${product.pstock }개</td>
						</tr>
						<tr>
							<th scope="col">적립포인트[5%]</th>
							<td colspan="3"> <h5> <span class="badge badge-primary"><fmt:parseNumber
										value="${product.pprice*(100-product.pdiscount)/2000}"
										integerOnly="true" /> 포인트 적립예정</span></h5>
							</td>
						</tr>
						<tr>
							<th scope="col">배송비</th>
							<td colspan="3"> <h5>한진택배 : 2500원</h5><small class="text-muted">배송비 도서,산간 지역도 일괄 2500원 적용입니다.</small>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<div class="row mt-5 mb-5 justify-content-center">
			<div class="input-group input-group-lg col-3">
  <div class="input-group-prepend mb-5">
    <span class="input-group-text bg-dark text-white">수량</span>
  </div>
  <input type="number" class="form-control" id="pcnt" aria-label="Sizing input" aria-describedby="inputGroup-sizing-lg" value="1"  min="0" max="10">
</div>
		<div class="col-2">
			<button type="button" class="btn btn-primary btn-lg btn-block" id="pBuy">바로 구매</button>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-info btn-lg btn-block" id="cart">장바 구니</button>
		</div>
		
		</div>
		<div class="row mt-5 mb-3 ml-5">
			<div class="col bd-highlight">
 				<h2><strong>구매후기</strong></h2>
			</div>
		</div>
		
		<hr class="col">
		<c:forEach var="review" items="${reviews }">
			<div class="row mt-2 mb-2 ml-5">
				<div class="col-3">
					<p>${review.mid }님</p>
					<p>${review.rstar }별</p>
					<p>${review.rdate }</p>
				</div>
			</div>
			<div class="row mt-2 mb-2 ml-5">
				<c:if test="${not empty review.rimage1 }">
				<div class="col reviewImage">
					<img src="${conPath }/image/review/${review.rimage1}" alt="리뷰이미지1">
				</div>
				<br>
				</c:if>
				<c:if test="${not empty review.rimage2 }">
					<div class="col reviewImage">
						<img src="${conPath }/image/review/${review.rimage2}" alt="리뷰이미지2">
					</div>
				</c:if>
				<br>
				<c:if test="${not empty review.rimage3 }">
				<div class="col reviewImage">
					<img src="${conPath }/image/review/${review.rimage3}" alt="리뷰이미지3">
				</div>
				</c:if>
			</div>

			<div class="row mt-2 mb-2 ml-5">
				<div class="col">
					${review.rcontent }
				</div>
			</div>
			<div class="row mt-2 mb-2 ml-5">
				<div class="col text-center">
					<button type="button" class="btn btn-primary rGoodBtn">
  						좋아요 <span class="badge badge-light">${review.rgood }</span>
  						<span class="d-none rno">${review.rno }</span>
					</button>
				</div>
			</div>			
			<hr class="col">
		</c:forEach>
		
		
		
	</div> <!--wrap-->
	<jsp:include page="../main/footer.jsp" />
</body>
</html>