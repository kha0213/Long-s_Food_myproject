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
<body>
			<jsp:include page="../main/header.jsp" />
	<div class="container">
	<div class="row mt-5 mb-3 ml-2">
	<span class="h3">고객센터 글 작성 </span>
	</div>
	<form action="${conPath }/writeCsBoard.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${member.mid}">
		<table class="table table-borderless">
    
  <tbody>
    <tr>
      <td scope="row">글 제목</td>
      <td scope="row"><input type="text" name="csubject" class="form-control"></td>
    </tr>
   	<tr>
      <td scope="row">주문번호<br><small class="text-muted">(주문 관련 문의만 작성해주세요)</small></td>
      <td scope="row">(내 주문 보기)<input type="text" name="ono" class="form-control"></td>
    </tr>
    <tr>
      <td scope="row">첨부파일<br><small class="text-muted">(10MB이하 파일만 첨부가능합니다.)</small></td>
      <td scope="row"><input type="file" name="cimage" class="form-control"></td>
    </tr>
    <tr>
      <td scope="row">본문</td>
      <td scope="row"><textarea class="form-control" name="ccontent"></textarea></td>
    </tr>
    <tr>

    <td scope="row" colspan="2" class="custom-control custom-checkbox">
    
    <div class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input" id="customCheck1" name="csecretCheckbox" value="1">
  <label class="custom-control-label" for="customCheck1">비밀글 설정</label>
</div>
    
    
   </td>
    </tr>
    <tr>
      <td scope="row" colspan="2" class="text-center"><input type="submit" value="작성완료" class="btn btn-primary"></td>
    </tr>
  </tbody>
</table>
	
	</form>
		
	
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