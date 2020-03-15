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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
 <style>
 .swal-footer{
 	text-align: center;
 }
 </style>
<script>
$(function(){
	$('#show1').click(function(){
		swal("hellododo");
	});
	$('#show2').click(function(){
		swal("A wild Pikachu appeared! What do you want to do?","warning","warning");
		/*success,warning,error,info*/
	});
	$('#show3').click(function(){
		swal("Good job!", "You clicked the button!", "success");
	});
	$('#show4').click(function(){
		swal({
			  title: "Good job!",
			  text: "You clicked the button!",
			  icon: "success",
			  buttons : {
				  confirm : {
					  text : '확인',
					  className : 'btn-btn-outline-primary'
				  }
			  }
			});
	});
});
</script>
</head>
<body>
	<div id="wrap" class="container-fluid">
		<jsp:include page="../main/header.jsp"/>
	<button id='show1'>swal1</button>
<br>
<br>
	<button id='show2'>swal2</button>
<br>
<br>
	<button id='show3'>swal3</button>
<br>
<br>
	<button id='show4'>swal4</button>
<br>
<br>
	</div>
<jsp:include page="../main/footer.jsp"/>
	<!--wrap-->
	
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