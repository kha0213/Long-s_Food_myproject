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
	function idchk(){
		var id = frm.mid.value;
		location.href='${conPath}/idChk.do?mid='+id;
	}

</script>
</head>
<body style="background-color: #f5f3f6">
	<div id="wrap" class="container-fluid">
		<form action="${conPath }/join.do" method="post" name="frm">
	
			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="2"><h1 class="text-center text-monospace">회원가입</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="col">ID <span style="color:red">*</span>
						<br><span class="text-muted"><small>ID중복체크 먼저 해주세요</small></span>
								</th>
						<td class="text-center"><input type="text" name="mid" required="required">
						<br> <input type="button" class="mt-2 btn btn-primary btn-sm" value="ID 중복체크" 
						onclick="location.href='${conPath}/idChk.do?id='">
						</td>
						
					</tr>
					<tr>
						<th scope="row">비밀번호 <span style="color:red">*</span></th>
						<td><input type="password" class="form.control" name="mpw" required="required"></td>
					
					</tr>
					<tr>
						<th scope="row">비밀번호 확인 <span style="color:red">*</span></th>
						<td><input type="password" class="form-control" name="mpwChk" required="required"></td>
					
					</tr>
					<tr>
						<th scope="row">이름 <span style="color:red">*</span></th>
						<td><input type="text" class="form-control" name="mname" required="required"></td>
					</tr>
					<tr>
						<th scope="row">전화번호 <span style="color:red">*</span></th>
						<td><input type="text" class="form-control" name="mphone" required="required"></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><input type="text" class="form-control" name="maddress"></td>
					</tr>
					<tr>
						<th scope="row">생일</th>
						<td><input type="date" class="form-control" name="mbirth"></td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td><input type="email" class="form-control" name="memail"></td>
					</tr>
					<tr>
						<th scope="row">성별</th>
						<td>
							<input type="radio" name="mgender" value="남자">남자 &nbsp;
							<input type="radio" name="mgender" value="여자">여자
						</td>
					</tr>
					<tr>
						<th scope="row">광고</th>
						<td>
							<label><input type="checkbox" name="ad_email" value="1"> 메일 수신</label><br>
							<label><input type="checkbox" name="ad_phone" value="1"> 문자 수신</label><br>
							<label><input type="checkbox" name="ad_call" value="1"> 전화 수신</label><br>
						</td>
					</tr>
					<tr class="text-center">
						<th colspan="2">
<input class="btn btn-outline-success" type="submit" value="회원가입">
<input class="btn btn-outline-secondary" type="reset" value="초기화">
						</th>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-right"><input type="button" onclick="location.href='${conPath}/mgjoinView.do'" class="btn btn-outline-dark btn-sm" value="관리자 등록">
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