<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
</head>
	<div id="wrap" class="container">
		<h2 class="text-center mt-5">상품수정</h2>
		<form action="${conPath }/modifyProduct.do" method="post" enctype="multipart/form-data" class="m-5 p-3">
		<input type="hidden" name="mgid" value="${manager.mgid }">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label>상품코드<span style="color:red">*</span></label>
      <input type="text" class="form-control" name="pcode" readonly="readonly" value="${product.pcode }">
    </div>
    <div class="form-group col-md-6">
      <label>상품명<span style="color:red">*</span></label>
      <input type="text" class="form-control" name="pname" required="required" value="${product.pname }">
    </div>
  </div>
   <div class="form-group">
      <label>상품가격<span style="color:red">*</span></label>
      <input type="number" class="form-control" name="pprice" required="required" value="${product.pprice }">
    </div>
    <div class="form-group">
      <label>상품할인율</label>
      <input type="number" class="form-control" name="pdiscount" min="0" max="100" value="${product.pdiscount }">
    </div>
    <div class="form-group">
      <img src="${conPath }/image/product/${product.pimage }" alt="상품이미지" width="300px"><br>
      <span class="text-muted">(상품이미지)</span>
    </div>
    <div class="form-group">
      <input type="file" class="form-control-file" name="pimage">
      <small class="form-text text-muted">(파일 첨부를 안하시면 기존이미지 그대로 유지됩니다.) *5mb이하 이미지만 등록가능합니다.</small>
    </div>
    <div class="form-group">
      <label>재고량<span style="color:red">*</span></label>
      <input type="number" class="form-control" name="pstock" required="required" value="${product.pstock }">
    </div>
    <div class="form-group">
      <label>상품설명</label>
      <pre><textarea rows="10" class="form-control" name="pdescription">${product.pdescription }</textarea></pre>
    </div>
  	<div class="form-group text-center">
  <input type="submit" class="btn btn-primary" value="상품 수정">
  	<input type="reset" class="btn btn-success" value="초기화">
  	<input type="button" class="btn btn-dark" onclick="history.back()" value="뒤로 가기">
  	</div>
</form>
		
	</div>
</html>