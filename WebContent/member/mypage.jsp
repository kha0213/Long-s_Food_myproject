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
	.mylist:hover{
		cursor: pointer;
	}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	$(function(){
		$('.mModify').click(function(){
			$('#myContent').load('${conPath}/member/modifyPwChk.jsp');
		});
		$('.mDelete').click(function(){
			$('#myContent').load('${conPath}/member/mDeletePwChk.jsp');
		});
		$('.mPoint').click(function(){
			$('#myContent').load('${conPath}/mPoint.do?mid=${member.mid}&mcumulative_buy=${member.mcumulative_buy}');
		});
		$('.mBuyHistory').click(function(){
			$('#myContent').load('${conPath}/mBuyHistory.do?mid=${member.mid}');
		});
		$('.mDelivery').click(function(){
			$('#myContent').load('${conPath}/mDelivery.do');
		});
		
	});

</script> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<c:if test="${not empty mModifyResult }">
	<script>
		alert('${mModifyResult}');
	</script>
</c:if>


<body style="background-color: #f5f3f6">
			<jsp:include page="../main/header.jsp" />
			<div class="container-fluid mb-5 mt-5 pr-5">
			<div class="row">
				<div class="col text-center mb-5">
					<h2>${member.mname }님 My Page입니다.</h2>
				</div>
			</div>
			<div class="row ml-5 mb-5 mt-5">
<div class="list-group col-2">
  <a class="list-group-item list-group-item-action list-group-item-primary mylist" href="${conPath }/mMypage.do">마이페이지</a>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mDelivery">배송 확인</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mBuyHistory">주문 목록</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mCoupon">쿠폰 조회</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mPoint">포인트정보</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mModify">정보 수정</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist mDelete">회원 탈퇴</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist">1:1문의</span>
</div>
<div class="col mb-5 overflow-hidden mr-5" id="myContent">
	<div class="row text-center">
		<div class="col mPoint mylist">
		<img src="${conPath }/image/icon/mgrade.png" alt="등급이미지">
		<h3>고객등급</h3>
		<h3 class="text-primary">${member.gname }</h3>
		</div>
		<div class="col mDelivery mylist">
		<img src="${conPath }/image/icon/mdelivery.png" alt="배송이미지">
		<h3>배송 중 상품</h3>
		<h3 class="text-primary">${deliveryCnt }건</h3>
		</div>
		<div class="col mCoupon mylist">
		<img src="${conPath }/image/icon/mcoupon.png" alt="쿠폰이미지">
		<h3>보유쿠폰</h3>
		</div>
		<div class="col mPoint mylist">
		<img src="${conPath }/image/icon/mpoint.png" alt="포인트이미지">
		<h3>포인트</h3>
		<h3 class="text-primary">${member.mpoint }원</h3>
		</div>
	</div>

	
</div>
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