<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1 class="text-center mt-5 text-danger">모든 회원 정보입니다.</h1>
	<table class="table">
  <thead>
    <tr>
      <th>ID</th>
      <th>PW</th>
      <th>이름</th>
      <th>전화번호</th>
      <th>주소</th>
      <th>상세주소</th>
      <th>생일</th>
      <th>이메일</th>
      <th>성별</th>
      <th>보유포인트</th>
      <th>누적구매금액</th>
      <th>가입일</th>
      <th>등급</th>
      <th>장바구니 상품개수</th>
      <th>이메일광고</th>
      <th>문자광고</th>
      <th>전화광고</th>
      <th>탈퇴여부</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="member" items="${members }">
    <tr>
      <td>${member.mid }</td>
      <td>${member.mpw }</td>
      <td>${member.mname }</td>
      <td>${member.mphone }</td>
      <td>${member.maddress_basic }</td>
      <td>${member.maddress_detail }</td>
      <td>${member.mbirth }</td>
      <td>${member.memail }</td>
      <td>${member.mgender }</td>
      <td>${member.mpoint }포인트</td>
      <td>${member.mcumulative_buy }</td>
      <td>${member.mjoindate }</td>
      <td class="text-primary">${member.gname }</td>
      <td>${member.cart_cnt }개</td>
      <td><c:if test="${member.ad_email eq 1 }">허용</c:if><c:if test="${member.ad_email eq 0 }">거부</c:if></td>
      <td><c:if test="${member.ad_phone eq 1 }">허용</c:if><c:if test="${member.ad_phone eq 0 }">거부</c:if></td>
      <td><c:if test="${member.ad_call eq 1 }">허용</c:if><c:if test="${member.ad_call eq 0 }">거부</c:if></td>
      <td><c:if test="${member.mstatus eq false }"><span class="text-danger">탈퇴</span></c:if>
      	<c:if test="${member.mstatus eq true }"><span class="text-success">회원</span></c:if>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</body>
</html>