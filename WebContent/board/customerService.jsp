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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('.csBoard').mouseenter(function() {
			$(this).css('cursor', 'pointer');
			$(this).addClass('border border-primary');

		});
		$('.csBoard').mouseleave(function() {
			$(this).removeClass('border border-primary');
		});
		

	});
</script>
</head>
<body style="background-color: #f5f3f6">

	<c:if test="${not empty writeCsResult }">
		<script>
			alert('${writeCsResult}');
		</script>
	</c:if>


			<jsp:include page="../main/header.jsp" />
	<div class="container">
	<div class="row mt-5 mb-3">
	<span class="h3">고객센터  &nbsp; | &nbsp; <span class="text-muted h6">고객문의 게시판입니다.</span></span>
	</div>
	<c:if test="${not empty member || not empty manager }">
	<p class="mt-1 text-right"><a href="${conPath }/writeCsBoardView.do?pageNum=${param.pageNum}" class="btn btn-outline-dark">글쓰기</a></p>
	</c:if>
	
	
		<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
    
  </thead>
  <tbody>
  	<c:forEach var="csBoard" items="${csBoards }">
    <tr class="csBoard" onclick="location.href='productDetails.do?pageNum=${pageNum}&cno=${csBoard.cno }'">
      <td scope="row">{csBoard.cno}</td>
      <td scope="row">{csBoard.csubject}</td>
      <td scope="row">{csBoard.mname}</td>
      <td scope="row">{csBoard.crdate}</td>
      <td scope="row">{csBoard.chit}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
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