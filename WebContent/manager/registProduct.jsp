<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div id="wrap" class="container">
		<jsp:include page="../main/header.jsp"/>
		
		<h2 class="text-center mt-5">상품등록<small>(${manager.mgname }님)</small></h2>
		
		
		
		<form action="${conPath }/registProduct.do" method="post" enctype="multipart/form-data" class="m-5 p-3">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label>상품코드<span style="color:red">*</span></label>
      <input type="text" class="form-control" name="pcode" required="required">
    </div>
    <div class="form-group col-md-6">
      <label>상품명<span style="color:red">*</span></label>
      <input type="text" class="form-control" name="pname" required="required">
    </div>
  </div>
   <div class="form-group">
      <label>상품가격<span style="color:red">*</span></label>
      <input type="number" class="form-control" name="pprice" required="required">
    </div>
    <div class="form-group">
      <label>상품이미지</label>
      <input type="file" class="form-control-file" name="pimage">
      <small class="form-text text-muted">5mb이하 이미지만 등록가능합니다.</small>
    </div>
    <div class="form-group">
      <label>재고량<span style="color:red">*</span></label>
      <input type="number" class="form-control" name="pstock" required="required">
    </div>
    <div class="form-group col-md-6">
      <label>상품설명</label>
      <textarea rows="5" class="form-control" name="pdescription"></textarea>
    </div>
  	<div class="form-group text-center">
  <input type="submit" class="btn btn-primary" value="상품 등록">
  	<input type="reset" class="btn btn-success" value="초기화">
  	<input type="button" class="btn btn-dark" onclick="history.back()" value="뒤로 가기">
  	</div>
</form>
		
		
		
		
		
		
		
		
		
	</div>
<jsp:include page="../main/footer.jsp"/>
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