<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$('input[type="password"]').keyup(function(){
	var mpw = $('input[name="mgpw"]').val();
	var mpwChk = $('input[name="mgpwChk"]').val();
	
	if(mpw.length !=0 && mpw == mpwChk){
		$('#mgpwConfirmResult').removeClass('alert-danger').addClass('alert').addClass('alert-success').html('<small>비밀번호가 일치합니다.</small>');
		
	}else{
		$('#mgpwConfirmResult').removeClass('alert-success').addClass('alert').addClass('alert-danger').html('<small>비밀번호가 일치하지 않습니다.</small>');
	}
});
$('form').submit(function(){
	var pwConfirmResult =  $('#mgpwConfirmResult').text().trim();
	if(pwConfirmResult!='비밀번호가 일치합니다.'){
		alert('비밀번호를 확인해주세요');
		$('input[name="mgpwChk"]').focus();
		return false;
	}
});
</script>
</head>
<body>
	<form action="${conPath }/mgModify.do" method="post">

			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="2"><h1 class="text-center text-monospace">관리자
								수정</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">ID</th>
						<td class="text-center"><input type="text" name="mgid"
							class="form-control" readonly="readonly" value="${mgView.mgid }"> 
						</td>
					</tr>
					<tr>
						<th scope="col">비밀번호 <span style="color: red">*</span></th>
						<td><input type="password" class="form-control" name="mgpw"
							required="required"></td>
					</tr>
					<tr>
						<th scope="col">비밀번호 확인 <span style="color: red">*</span></th>
						<td><input type="password" class="form-control"
							name="mgpwChk" required="required">
						<p role="alert" id="mgpwConfirmResult" class="h6 mt-1 text-left"></p>
						</td>
					</tr>
					<tr>
						<th scope="col">이름 <span style="color: red">*</span></th>
						<td><input type="text" class="form-control" name="mgname"
							required="required" value="${mgView.mgname }"></td>
					</tr>
					<tr>
						<th scope="col">담당부서 <span style="color: red">*</span></th>
						<td>
							<div class="input-group mb-3">
								<select class="custom-select" name="mgpartname"
									required="required">
									<option selected>부서 선택</option>
									<option value="상품MD">상품MD</option>
									<option value="게시판관리">게시판관리</option>
									<option value="배송담당">배송담당</option>
								</select>
							</div>

						</td>
					</tr>

					<tr class="text-center">
						<th colspan="2"><input class="btn btn-outline-success"
							type="submit" value="관리자 수정"> <input
							class="btn btn-outline-secondary" type="reset" value="초기화">
						</th>
					</tr>
				</tbody>
			</table>
		</form>
</body>
</html>