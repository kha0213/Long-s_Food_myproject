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
		$('#list').click(
						function() {
							location.href = '${conPath}/csBoardsListService.do?pageNum=${param.pageNum}'
						});

		$('#deleteCs').click(function() {
			$('#modalBtn').click();
		});

		$('#delete').click(function() {
							location.href = '${conPath}/csBoardsDelete.do?cno=${csBoard.cno }&pageNum=${param.pageNum}';
						});

		$('#replyManager').click(function() {
			$('#replyView').removeClass('d-none');
		});
		/* $('#replyDo').click(function() {
			$('#replyView').removeClass('d-none');
		}); */

	});
</script>
</head>
<body style="background-color: #f5f3f6">

	<button id="modalBtn" type="button" class="d-none" data-toggle="modal"
		data-target="#mDeleteModal"></button>

	<!-- Modal -->
	<div class="modal fade" id="mDeleteModal" tabindex="-1" role="dialog"
		aria-labelledby="oDArrModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="oDArrModalLabel">
						<strong class="text-primary">정말 삭제하시겠습니까? </strong>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="delete">네</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${not empty cmCommentWriteResult }">
		<script>
			alert('${cmCommentWriteResult}');
		</script>
	</c:if>


	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<div class="row mt-5">
			<div class="col h4">${csBoard.csubject }</div>
			<div class="w-100">
				<hr>
			</div>
		</div>
		<div class="row mt-2 mb-2 text-center">
			<div class="col">글번호 ${csBoard.cno }</div>
			<div class="col">작성자 ${csBoard.mname }(${csBoard.mid })</div>
			<div class="col">조회수 ${csBoard.chit }</div>
			<div class="col">
				작성일
				<fmt:formatDate value="${csBoard.crdate}"
					pattern="yy-MM-dd HH:mm:ss" />
			</div>
		</div>
		<div class="row">
			<div class="w-100">
				<hr>
			</div>
		</div>
		<c:if test="${not empty csBoard.ono &&  csBoard.ono ne 0}">
			<div class="row mt-3">
				<div class="col">주문번호${csBoard.ono }</div>
			</div>
		</c:if>
		<div class="row mt-2">
			<div class="col text-center">
				<img alt="cs이미지"
					src="${conPath }/image/customer_service/${csBoard.cimage}">
			</div>
		</div>
		<div class="row">
			<div class="col">내용${csBoard.ccontent }</div>
		</div>

		<div class="text-right mb-5 mt-4">
			<c:if test="${not empty member && member.mid ne csBoard.mid }">
				<button class="btn btn-outline-warning" id="replyDo">답변</button>
			</c:if>
			<c:if test="${not empty manager }">
				<button class="btn btn-outline-secondary" id="replyManager">관리자
					코멘트 남기기</button>
			</c:if>
			<c:if test="${csBoard.mid eq member.mid }">
				<button class="btn btn-outline-success"
					onclick="location.href='${conPath}/csBoardModifyView.do?pageNum=${param.pageNum }&cno=${csBoard.cno}&mid=${member.mid}'">
					수정</button>
			</c:if>
			<button class="btn btn-outline-info" id="list">목록</button>
			<c:if test="${csBoard.mid eq member.mid || not empty manager }">
				<button class="btn btn-outline-danger" id="deleteCs">삭제</button>
			</c:if>
		</div>
		<div class="mt-5 mb-5">&nbsp;</div>
		<div id="replyView"
			class="row mt-5 mb-3 ml-2 d-none row table-responsive">


			<form action="${conPath }/cmCommentWrite.do" method="get">
				<input type="hidden" name="cno" value="${csBoard.cno }"> <input
					type="hidden" name="mgid" value="${manager.mgid }">
				<table class="table table-borderless w-100 table-dark">
					<thead>
						<tr>
							<td colspan="2">
								<h2>관리자 코멘트 작성</h2>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>글 제목</td>
							<td><input type="text" name="cmsubject" class="form-control"></td>
						</tr>
						<tr>
							<td>담당MD</td>
							<td>${manager.mgname }</td>
						</tr>
						<tr>
							<td>본문</td>
							<td><textarea class="form-control" name="cmcontent" rows="8"></textarea></td>
						</tr>
						<tr>
							<td scope="row" colspan="2" class="text-center"><input
								type="submit" value="작성완료" class="btn btn-primary"></td>
						</tr>
					</tbody>
				</table>

			</form>

		</div>
		<c:if test="${not empty csComment }">
			<div class="row mt-2 mb-2 ml-5">
				<p class="h4 font-weight-bold">${csComment.mgid }님 COMMINT(${csComment.cmrdate })</p>

				<table class="table table-dark">
					<tbody>
						<tr>
							<th colspan="4">${csComment.cmsubject }</th>
						</tr>
						<tr>
							<td colspan="4">${csComment.cmcontent }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>





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