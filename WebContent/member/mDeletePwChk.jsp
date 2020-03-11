<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function mpwChk(){
		var mpw = ${member.mpw}
		if($('#mpw').val() == mpw){
			
			$('#myContent').load('${conPath}/mDelete.do');
		}else{
			alert('비밀번호가 일치하지 않습니다.');
		}
	}
</script>
 
</head>
<body style="background-color: #f5f3f6">

<div class="col mt-5 mb-5 overflow-hidden text-center">
		<p class="h3 mb-4">${member.mname }님 회원탈퇴를 위해 비밀번호를 한 번 더 입력하세요</p><br>
		<div class="form-inline justify-content-center">
  <div class="form-group mx-sm-3 mb-2">
    <input type="password" class="form-control" placeholder="Password" id="mpw" required="required">
  </div>
  <button class="btn btn-primary mb-2" onclick="mpwChk()">입력</button>
</div>
</div>

</body>