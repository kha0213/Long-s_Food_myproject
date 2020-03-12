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
		$('.mylist').hover(function(){
			$(this).css('cursor', 'pointer');
		});
		$('#mModify').click(function(){
			$('#myContent').load('${conPath}/member/modifyPwChk.jsp');
		});
		$('#mDelete').click(function(){
			$('#myContent').load('${conPath}/member/mDeletePwChk.jsp');
		});
		$('#mPoint').click(function(){
			$('#myContent').load('${conPath}/mPoint.do?mid=${member.mid}&mcumulative_buy=${member.mcumulative_buy}');
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
			<div class="container mb-5 mt-5">
			<div class="row">
				<div class="col text-center mb-5">
					<h2>${member.mname }님 My Page</h2>
					<span>고객등급 : ${member.gname } &nbsp; &nbsp; |  &nbsp; &nbsp; 배송중 상품 : 1개 &nbsp; &nbsp; | &nbsp; &nbsp; 사용가능한 쿠폰 : 0개  &nbsp; &nbsp; | &nbsp; &nbsp; 내포인트 : ${member.mpoint }점 </span>
				</div>
			
			</div>
			<div class="row mb-5 mt-5">
<div class="list-group col-2">
  <span class="list-group-item list-group-item-action list-group-item-primary mylist">배송 확인</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist">주문 목록</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist">쿠폰 조회</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist" id="mPoint">포인트정보</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist" id="mModify">정보 수정</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist" id="mDelete">회원 탈퇴</span>
  <span class="list-group-item list-group-item-action list-group-item-primary mylist">1:1문의</span>
</div>
<div class="col mb-5 overflow-hidden" id="myContent">
	마이페이지

	
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