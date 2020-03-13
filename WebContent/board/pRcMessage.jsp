<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="bg-info p-4 rounded">
		<div class="row h5 text-warning"><strong>상품 담당자 : ${rc.mgid } | 작성일 : ${rc.rcdate }</strong></div>
		<div class="row bg-white text-dark rounded">${rc.rccontent }</div>
	</div>
</body>
</html>