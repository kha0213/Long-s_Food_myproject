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
			$(this).css('cursor', 'pointer').addClass('bg-info');
		});
		$('.csBoard').mouseleave(function() {
			$(this).removeClass('bg-info');
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
	<c:if test="${not empty csBoardModifyResult }">
		<script>
			alert('${csBoardModifyResult}');
		</script>
	</c:if>

			<jsp:include page="../main/header.jsp" />
	<div class="container mb-5">
	<div class="row mt-5 mb-3">
	<span class="h3 mb-5">고객센터  &nbsp; | &nbsp; <span class="text-muted h6">고객문의 게시판입니다.</span></span>
	</div>
	<c:if test="${not empty member || not empty manager }">
	<p class="m-4 text-right"><a href="${conPath }/csBoardWriteView.do?pageNum=${param.pageNum}&mid=${member.mid}" class="btn btn-dark">글쓰기</a></p>
	</c:if>
	
	
  <div class="row mt-4 text-center h5">
      <div class="col-1">글번호</div>
      <div class="col">제목</div>
      <div class="col-1">작성자</div>
      <div class="col-2">작성일</div>
      <div class="col-1">조회수</div>
  </div>
<hr class="my-4">
  <div>
  
  	<c:forEach var="csBoard" items="${csBoards }">
  	
    <div class="csBoard row text-center" onclick="location.href='${conPath}/csBoardsSecretCheck.do?pageNum=${param.pageNum }&cno=${csBoard.cno }'">
      <div class="col-1 border-right border-dark p-1 cno">${csBoard.cno} </div>
      <div class="col text-left p-1 pl-3">
      
      <c:if test="${csBoard.csecret eq 1 }">
     	<img src="${conPath }/image/icon/lock.png" alt="자물쇠">비밀글입니다.
      </c:if>
      <c:if test="${csBoard.csecret ne 1 }">
	   	  ${csBoard.csubject}
      </c:if>
      
      </div>
      <div class="col-1 p-1 mname">${csBoard.mname}</div>
      <div class="col-2 p-1"><fmt:formatDate value="${csBoard.crdate}" pattern="yy-MM-dd"/><br>
    <fmt:formatDate value="${csBoard.crdate}" pattern="HH:mm:ss"/></div>
      <div class="col-1 p-1">${csBoard.chit}</div>
    </div>
   </c:forEach>
</div>
	
	
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center mt-5 mb-5">
				<li class="page-item"><c:if test="${startPage ne 1 }">
						<a class="page-link" aria-label="Previous"
							href="${conPath }/csBoardsListService.do?pageNum=${startPage-1}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="page" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage eq page }">
						<li class="page-item disabled"><a class="page-link"
						href="${conPath }/csBoardsListService.do?pageNum=${page}">${page }</a></li>
					</c:if>
					<c:if test="${currentPage ne page }">
						<li class="page-item"><a class="page-link"
						href="${conPath }/csBoardsListService.do?pageNum=${page}">${page }</a></li>
					</c:if>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="${conPath }/csBoardsListService.do?pageNum=${endPage+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	
	
	
	
	
	
	
	
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