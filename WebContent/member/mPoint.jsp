<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<body style="background-color: #f5f3f6">

	<table class="table table-striped mt-5 mb-5">
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
      현재등급 : <strong class="text-primary">${member.gname }</strong> | 최고등급입니다.
      </c:if>
      <c:if test="${member.gname ne 'VVIP' }">
      현재등급 : <strong class="text-primary">${member.gname }</strong> | 다음등급 <strong class="text-success">${nextGrade.nextGname }</strong>까지 더 필요한 구매 금액 <strong class="text-danger">${nextGrade.nextMoney }</strong>원
      </c:if></td>
    </tr>
    <tr>
      <th>누적구매금액</th>
      <td>${member.mcumulative_buy }원</td>
    </tr>
  </tbody>
</table>
		
      <h3 class="mt-5">각 등급별 정보</h3>
<table class="table table-bordered">
  <thead class="thead-dark">
     <tr>
    </tr>
    <tr>
      <th>등급</th>
      <th>승급조건</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-light">
      <td>NORMAL</td>
      <td>누적 구매금액 100만원 이상</td>
    </tr>
    <tr class="table-warning">
      <td>GOLD</td>
      <td>누적 구매금액 1000만원 이상</td>
    </tr>
    <tr class="table-info">
      <td>VIP</td>
      <td>누적 구매금액 1억원 이상</td>
    </tr>
    <tr class="table-danger">
      <td>VVIP</td>
      <td>최고등급</td>
    </tr>
  </tbody>
</table>
			

</body>
</html>