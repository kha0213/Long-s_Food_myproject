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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
$(document).ready(function(){
	$('input[name="mgid"]').keyup(function(){
		var mgid = $('input[name="mgid"]').val();
		
		$.ajax({
			url : '${conPath}/mgidConfirm.do',
			type : 'get',
			dataType : 'html',
			data : "mgid="+mgid,
			success : function(data){
				$('#mgidConfirmResult').html(data);
				var id = $('#mgidConfirmResult').html().trim();
				if(id == '중복된 아이디가 존재합니다.'){
					$('#mgidConfirmResult').removeClass('alert-success').addClass('alert alert-danger');
				}else{
					$('#mgidConfirmResult').removeClass('alert-danger').addClass('alert alert-success');
				}
			}
		});//ajax
	
		
	});
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
		var idConfirmResult = $('#mgidConfirmResult').text().trim();
		var pwConfirmResult =  $('#mgpwConfirmResult').text().trim();
		if(idConfirmResult!='사용 가능한 아이디입니다.'){
			alert('아이디를 확인해주세요');
			$('input[name="mgid"]').focus();
			return false;
		}
		if(pwConfirmResult!='비밀번호가 일치합니다.'){
			alert('비밀번호를 확인해주세요');
			$('input[name="mgpwChk"]').focus();
			return false;
		}
	});
});
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
						<th scope="col">ID <span style="color: red">*</span></th>
						<td class="text-center"><input type="text" name="mgid"
							class="form-control" required="required"> 
						<p class="h6 mt-1 text-left" role="alert" id="mgidConfirmResult"></p>							
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
							required="required"></td>
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