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
<style>
	.goPaging:hover{
		cursor: pointer;
	}
	.goODetail:hover{
		cursor: pointer;
		background-color: #F5E0E0;
	}
</style>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	function goPaging(pageNum){
		$('#myContent').load('${conPath}/mBuyHistory.do?mid=${member.mid}&pageNum='+pageNum);
	}
	$(function(){
		$('.goODetail').click(function(){
			var ono = $(this).next().html();
			location.href='${conPath}/mBuyDetail.do?ono='+ono;
		});	
	});

</script> 
 
</head>
<body style="background-color: #f5f3f6">

      <div class="row ml-5"><h2>주문목록</h2></div>
		
  	<c:forEach var="order" items="${orders }" >
  	<c:if test="${not empty order.pimage }">
	<table class="table goODetail mt-5 mb-5" data-toggle="tooltip" title="클릭시 주문 상세보기">
    <tr>
      <th>주문일</th>
      <th>주문상품</th>
      <th>결제금액</th>
      <th>배송상태</th>
    </tr>
    <tr>
      <td>${order.odate }</td>
      <td><img alt="상품이미지" src="${conPath }/image/product/${order.pimage}" width="50"> ${order.pname } </td>
      <td>${order.purchase_amount }원</td>
      <td>
      	<c:if test="${empty order.parrive_date }"><strong class="text-danger">&nbsp; &nbsp; 배송중  &nbsp; &nbsp;</strong></c:if>
      	<c:if test="${not empty order.parrive_date }"><strong class="text-info">${order.parrive_date }도착</strong></c:if>
      </td>
    </tr>
</table>
<span class="d-none">${order.ono }</span>
</c:if>
  	</c:forEach>
	
	<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-5 mb-5">
				<li class="page-item"><c:if test="${startPage ne 1 }">
						<a class="page-link goPaging" aria-label="Previous"
							onclick="goPaging(${startPage-1})">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="page" begin="${startPage }" end="${endPage }">
					<c:if test="${page ne currentPage }">
					<li class="page-item">
						<a class="page-link goPaging" onclick="goPaging(${page})">${page }</a>
					
					</li>
					</c:if>
					<c:if test="${page eq currentPage }">
					<li class="page-item"><span class="page-link text-danger"
						>${page }</span></li>
					</c:if>
				</c:forEach>
				<li class="page-item">
				<c:if test="${endPage ne totalPage }">
				<span class="page-link goPaging"
					onclick="goPaging(${endPage+1})"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</span>
				</c:if>
				</li>
			</ul>
		</nav>


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