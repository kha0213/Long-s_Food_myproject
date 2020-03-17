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

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
$('[data-toggle="tooltip"]').tooltip();
$(function(){
	var ono;
	$('.deliveryOk').click(function(){
		ono = $(this).next().html();
		$('#modalBtn').click();
	});
	$('#oDArr').click(function(){
		location.href='${conPath}/mDeliveryArrive.do?ono='+ono;
	});
	
});
</script>
</head>
<body style="background-color: #f5f3f6">


<button id="modalBtn" type="button" class="d-none" data-toggle="modal" data-target="#mDeleteModal"></button>

<!-- Modal -->
<div class="modal fade" id="mDeleteModal" tabindex="-1" role="dialog" aria-labelledby="oDArrModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="oDArrModalLabel"><strong class="text-primary">물품을 수령하셨습니까? </strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="oDArr">네</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>



      <div class="ml-5"><h2>배송정보</h2><small class="text-muted">(배송 도착 안한 상품만 조회가 가능합니다.)</small></div>
		
  	<c:forEach var="oNoArr" items="${oNoArrive }" >
  	
	<table class="table goODetail mt-5 mb-5">
    <tr class="h5">
      <th>주문상품</th>
      <th>결제금액</th>
      <th>주문일</th>
      <th>배송확인</th>
    </tr>
    <tr>
      <td><img alt="상품이미지" src="${conPath }/image/product/${oNoArr.pimage}" width="50"> ${oNoArr.pname } </td>
      <td>${oNoArr.purchase_amount }원</td>
      <td>${oNoArr.odate }</td>
      <td><button type="button" class="btn btn-primary btn-lg btn-block deliveryOk" data-toggle="tooltip" title="배송 완료시만 클릭해주세요">배송 수령 완료</button>
      <span class="d-none">${oNoArr.ono }</span></td>
    </tr>
</table>
<span class="d-none">${oNoArr.ono }</span>
  	</c:forEach>
</body>
</html>