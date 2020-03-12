<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	
	$(document).ready(function(){
		
	});
</script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

 
</head>


<body style="background-color: #f5f3f6">
	<table class="table table-striped mt-5">
  <thead>
    <tr>
      <th colspan="2"><h3>${member.mname }님의 포인트정보</h3></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>ID</th>
      <td>${member.mid }</td>
    </tr>
    <tr>
      <th>포인트</th>
      <td>${member.mpoint }점</td>
    </tr>
    <tr>
      <th>등급</th>
      <td><c:if test="${member.gname eq 'VVIP' }">
      현재등급 : ${member.gname } | 최고등급입니다.
      </c:if>
      <c:if test="${member.gname ne 'VVIP' }">
      현재등급 : ${member.gname } | 다음등급(${nextGrade.nextGname })까지 더 필요한 금액(${nextGrade.nextMoney })
      </c:if></td>
    </tr>
    <tr>
      <th>누적구매금액</th>
      <td>${member.mcumulative_buy }원</td>
    </tr>
  </tbody>
</table>
		
			

</body>
</html>