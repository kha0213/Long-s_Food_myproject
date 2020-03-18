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
</head>
<body style="background-color: #f5f3f6">
	<div id="wrap" class="container">
		<h2 class="text-center mt-5">상품등록</h2>
		
		
		
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
    <div class="form-group">
      <label>상품설명</label>
      <textarea rows="10" class="form-control" name="pdescription"></textarea>
    </div>
  	<div class="form-group text-center">
  <input type="submit" class="btn btn-primary" value="상품 등록">
  	<input type="reset" class="btn btn-success" value="초기화">
  	<input type="button" class="btn btn-dark" onclick="history.back()" value="뒤로 가기">
  	</div>
</form>
		
	</div>
	<!--wrap-->
</body>
</html>