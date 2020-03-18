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
<body style="background-color: #f5f3f6">
			<jsp:include page="../main/header.jsp" />
	<div class="container">
	<div class="row mt-5 mb-3 ml-2">
	<span class="h3">${csBoard.csubject }의 답글 작성 </span>
	</div>
	<form action="${conPath }/csBoardsReply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${member.mid}">
		<input type="hidden" name="cgroup" value="${csBoard.cgroup}">
		<input type="hidden" name="cgroup_outnum" value="${csBoard.cgroup_outnum}">
		<input type="hidden" name="cindent" value="${csBoard.cindent}">
		<table class="table table-borderless">
    
  <tbody>
    <tr>
      <td scope="row">답글 제목</td>
      <td scope="row"><input type="text" name="csubject" class="form-control" required="required"></td>
    </tr>
   	<tr>
      <td scope="row">원글 주문번호</td>
      <td scope="row"><input type="text" readonly="readonly" name="ono" value="${csBoard.ono }" class="form-control">
	  </td>
    </tr>
    <tr>
      <td scope="row">첨부파일<br><small class="text-muted">(10MB이하 파일만 첨부가능합니다.)</small></td>
      <td scope="row"><input type="file" name="cimage" class="form-control"></td>
    </tr>
    <tr>
      <td scope="row">본문</td>
      <td scope="row"><textarea class="form-control" name="ccontent" rows="8" required="required"></textarea></td>
    </tr>
    <tr>

    <td scope="row" colspan="2" class="custom-control custom-checkbox">
    <c:if test="${csBoard.csecret eq 1 }">
    	<span class="text-primary">원글에 의해 비밀글로 설정되었습니다.</span>
    	<input type="hidden" name="csecret" value="1" >
    </c:if>
    <c:if test="${csBoard.csecret eq 0 }">
    	<span class="text-primary">원글에 의해 공개글로 설정되었습니다.</span>
    </c:if>
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