<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<style>
	.wi-7{
		width: 14%;
	}
	.goSales:hover{
		background-color: #5E610B;
		cursor: pointer;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$('.goSales').click(function(){
	var date = Number($(this).html());
	$('#mgContent').load("${conPath}/mgCalendarView.do?year=${year}&month=${month}&date="+date);
});
$('.preMonth').click(function(){
	var month = ${month};
	if(month>1){
		$('#mgContent').load("${conPath}/mgCalendarView.do?year=${year}&month=${month-1}&date=1");
	}else{
		$('#mgContent').load("${conPath}/mgCalendarView.do?year=${year-1}&month=12&date=1");	
	}
});
$('.nextMonth').click(function(){
	var month = ${month};
	if(month<12){
		$('#mgContent').load("${conPath}/mgCalendarView.do?year=${year}&month=${month+1}&date=1");
	}else{
		$('#mgContent').load("${conPath}/mgCalendarView.do?year=${year+1}&month=1&date=1");	
	}
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <h1 class="text-center mt-5 text-danger">${year }년 ${month }월 매출 총액 : ${salesMonth }</h1>
	  <h4 class="text-muted mb-5 text-right">일자별 조회는 달력을 클릭하세요</h4>
	  <div class="row text-center mt-5 mb-5">
    	  <div class="col"><button type="button" class="btn btn-dark preMonth">&lt;&lt; 이전달</button></div>
      	  <div class="col text-info"><h2>${year }년 ${month }월</h2></div>
      	  <div class="col"><button type="button" class="btn btn-dark nextMonth">다음달 &gt;&gt;</button></div>
  	  </div>
	<table class="table table-dark mt-5 text-center">
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		<tr>
			<c:forEach var="k" begin="2" end="${startDate}">
				<td>&nbsp;</td>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${maxDate}">
				<td class="goSales">${i }</td>
				<c:if test="${(i+startDate-1)%7==0 }"></tr><tr></c:if>
	    	</c:forEach>
		</tr>
		
	</table>
    	
    <h1 class="text-center mb-5 mt-5 text-danger">${year }년 ${month }월 ${date }일 매출정보</h1>	
    <h2 class="text-center text-primary">총 매출액 ${salesDate }원</h2>
    <h4 class="text-center mt-5">주문서</h4>
    <table class="table text-center">
  <thead>
    <tr>
      <th>주문번호</th>
      <th>주문날짜</th>
      <th>주문자 ID</th>
      <th>배송상태</th>
      <th>주문금액</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${dateOrders }" var="order">
   	 <tr>
   	   <td>${order.ono }</td>
   	   <td>${order.odate }</td>
   	   <td>${order.mid }</td>
   	   <td><c:if test="${empty order.parrive_date}"><span class="text-warning">배송중입니다.</span></c:if>
   	   <c:if test="${not empty order.parrive_date}"><span class="text-info">${order.parrive_date } 배송완료</span></c:if>
   	   </td>
   	   <td>${order.purchase_amount }원</td>
  	  </tr>
    </c:forEach>
  </tbody>
</table>
   
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
</body>
</html>