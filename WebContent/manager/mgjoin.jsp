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

<script>
	
</script>
</head>
<body style="background-color: #f5f3f6">
	<div id="wrap" class="container-fluid">
		<form action="${conPath }/mgjoin.do" method="post">

			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="2"><h1 class="text-center text-monospace">관리자
								등록</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="col">ID <span style="color: red">*</span> <br>
						<span class="text-muted"><small>ID중복체크 먼저 해주세요</small></span>
						</th>
						<td class="text-center"><input type="text" name="mgid"
							required="required"> <br> <input type="button"
							class="mt-2 btn btn-primary btn-sm" value="ID 중복체크"
							onclick="location.href='${conPath}/idChk.do?id='"></td>

					</tr>
					<tr>
						<th scope="row">비밀번호 <span style="color: red">*</span></th>
						<td><input type="password" class="form.control" name="mgpw"
							required="required"></td>

					</tr>
					<tr>
						<th scope="row">비밀번호 확인 <span style="color: red">*</span></th>
						<td><input type="password" class="form-control"
							name="mgpwChk" required="required"></td>

					</tr>
					<tr>
						<th scope="row">이름 <span style="color: red">*</span></th>
						<td><input type="text" class="form-control" name="mgname"
							required="required"></td>
					</tr>
					<tr>
						<th scope="row">담당부서 <span style="color: red">*</span></th>
						<td>
							<div class="input-group mb-3">
								<select class="custom-select" name="mgpartname"
									required="required">
									<option selected>부서 선택</option>
									<option value="상품MD">상품MD</option>
									<option value="C.S관리">C.S관리</option>
									<option value="회원관리">회원관리</option>
								</select>
							</div>

						</td>
					</tr>

					<tr class="text-center">
						<th colspan="2"><input class="btn btn-outline-success"
							type="submit" value="관리자 등록"> <input
							class="btn btn-outline-secondary" type="reset" value="초기화">
						</th>
					</tr>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-right"><input type="button" onclick="history.back()" class="btn btn-outline-dark btn-sm" value="뒤로 가기">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<!--wrap-->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
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