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
</head>
<body style="background-color: #f5f3f6">
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div class="row mt-5">
			<div class="col h4">${csBoard.csubject }</div>
			<div class="w-100"><hr></div>
		</div>
		<div class="row mt-2 mb-2 text-center">
			<div class="col">글번호 ${csBoard.cno }  </div>
			<div class="col">작성자 ${csBoard.mname }(${csBoard.mid })  </div>
			<div class="col">조회수 ${csBoard.chit }  </div>
			<div class="col">작성일 <fmt:formatDate value="${csBoard.crdate}" pattern="yy-MM-dd HH:mm:ss"/> </div>
		</div>
		<div class="row">
			<div class="w-100"><hr></div>
		</div>
		<c:if test="${not empty csBoard.ono }">
		<div class="row mt-3">
			<div class="col">주문번호${csBoard.ono }</div>
		</div>
		</c:if>
		<div class="row mt-2">
			<div class="col text-center">
			<img alt="cs이미지" src="${conPath }/image/customer_service/${csBoard.cimage}">
			</div>
		</div>
		<div class="row">
			<div class="col">내용${csBoard.ccontent }</div>
		</div>
		
		<div class="text-right mb-5 mt-4">
		<c:if test="${not empty member || not empty manager }">
			<button class="btn btn-outline-secondary">답변</button>
		</c:if>
		<c:if test="${csBoard.mid eq member.mid }">
			<button class="btn btn-outline-success" onclick="location.href='${conPath}/csBoardModifyView.do?pageNum=${param.pageNum }&cno=${csBoard.cno}&mid=${member.mid}'">
			수정
			</button>
		</c:if>
		<button class="btn btn-outline-info">목록</button>
		<c:if test="${csBoard.mid eq member.mid || not empty manager }">
			<button class="btn btn-outline-danger">삭제</button>
		</c:if>
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