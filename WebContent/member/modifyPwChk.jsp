<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	function mpwChk(){
		var mpw = ${member.mpw}
		if($('#mpw').val() == mpw){
			
			$('#myContent').load('${conPath}/member/modify.jsp');
		}else{
			alert('비밀번호가 일치하지 않습니다.');
		}
	}
</script>
 
</head>
<body style="background-color: #f5f3f6">

<div class="col mt-5 mb-5 overflow-hidden text-center">
		<p class="h3 mb-4">${member.mname }님 정보수정을 위해 비밀번호를 한 번 더 입력하세요</p><br>
		<div class="form-inline justify-content-center">
  <div class="form-group mx-sm-3 mb-2">
    <input type="password" class="form-control" placeholder="Password" id="mpw" required="required">
  </div>
  <button class="btn btn-primary mb-2" onclick="mpwChk()">입력</button>
</div>
</div>
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