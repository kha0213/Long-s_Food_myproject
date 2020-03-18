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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
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
	<c:if test="${not empty csBoardsDeleteResult }">
		<script>
			alert('${csBoardsDeleteResult}');
		</script>
	</c:if>

			<jsp:include page="../main/header.jsp" />
	<div class="container mb-5">
	<div class="row mt-5 mb-3">
	<span class="h3 mb-5">고객센터  &nbsp; | &nbsp; <span class="text-muted h6">고객문의 게시판입니다.</span></span>
	</div>
	<p class="text-right">
	<img src="${conPath }/image/icon/reply.png" alt="reply" width="30" data-toggle="tooltip" title="답변글입니다.">
	<img src="${conPath }/image/icon/lock.png" alt="자물쇠" data-toggle="tooltip" title="비밀글입니다." width="30">
	<img src="${conPath }/image/icon/comment.png" alt="comment" data-toggle="tooltip" title="관리자가 답변한 글입니다." width="30">
	<img src="${conPath }/image/icon/imageAttach.png" alt="imageAttach" data-toggle="tooltip" title="이미지 첨부 글입니다." width="30">
	</p>
	
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
	  <c:forEach var="i" begin="1" end="${csBoard.cindent }">
	  	<c:if test="${i ne csBoard.cindent }">
	  		&nbsp; &nbsp; &nbsp;
	  	</c:if>
	  	<c:if test="${i eq csBoard.cindent }">
	  		&nbsp; &nbsp; &nbsp; <img src="${conPath }/image/icon/reply.png" alt="reply" width="20">
	  	</c:if>
	  </c:forEach>      
      <c:if test="${csBoard.csecret eq 1 }">
     	<img src="${conPath }/image/icon/lock.png" alt="자물쇠" data-toggle="tooltip" title="비밀글입니다.">비밀글입니다.
      </c:if>
      <c:if test="${csBoard.csecret ne 1 }">
	   	  ${csBoard.csubject}
      </c:if>
      <c:if test="${not empty csBoard.cimage }">
     	<img src="${conPath }/image/icon/imageAttach.png" alt="imageAttach" data-toggle="tooltip" title="이미지 첨부 글입니다." width="40">
      </c:if>
      <c:if test="${csBoard.cmexist eq true }">
     	<img src="${conPath }/image/icon/comment.png" alt="comment" data-toggle="tooltip" title="관리자가 답변한 글입니다." width="40">
      </c:if>
      </div>
      <div class="col-1 p-1 mname">${csBoard.mname}</div>
      <div class="col-2 p-1"><fmt:formatDate value="${csBoard.crdate}" pattern="yy-MM-dd"/><br>
    <fmt:formatDate value="${csBoard.crdate}" pattern="HH:mm:ss"/></div>
      <div class="col-1 p-1">${csBoard.chit}</div>
    </div>
   </c:forEach>
</div>
	
	
		<nav aria-label="Page navigation">
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