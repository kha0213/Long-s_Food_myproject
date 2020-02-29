<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Myproject</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">

<!--다운받은 폰트목록
       font-family: 'Dancing Script', cursive;
        font-family: 'Gochi Hand', cursive;
        font-family: 'Indie Flower', cursive;
        font-family: 'Kaushan Script', cursive;
        font-family: 'Lobster Two', cursive;
        font-family: 'Lobster', cursive;
        
        font-family: 'Nanum Pen Script', cursive;
        font-family: 'Roboto', sans-serif;
        font-family: 'Alata', sans-serif;
    -->

<link rel="stylesheet" href="${conPath }/css/content.css" type="text/css">

</head>
<c:if test="${joinResult eq 1 }">
	<script>
		alert('회원가입에 성공하셨습니다. 로그인 이후에 서비스이용해주세요');
		window.close();
	</script>
</c:if>
<c:if test="${joinResult eq 0 }">
	<script>
		alert('회원가입에 실패하셨습니다. 관리자에게 문의해주세요');
		window.close();
	</script>
</c:if>

<c:if test="${loginResult eq true }">
	<script>
		alert('로그인 성공');
		window.close();
	</script>
</c:if>
<c:if test="${loginResult eq false }">
	<script>
		alert('로그인 실패 아이디와 비밀번호를 확인해주세요');
		window.close();
	</script>
</c:if>










<body>
	<div id="wrap" class="container-fluid">
		<jsp:include page="header.jsp"/>

		<div id="content">
			<div id="content_search">
				<form action="#" method="GET">
					<input type="text" name="text" id="search_text" placeholder="검색">
					<input type="submit" name="submit" id="search_submit" value="">
				</form>
			</div>
			<div id="content_background"></div>
			<div id="main">
				<div class="top">top1</div>
				<div class="top">top2</div>
				<div class="top">top3</div>
			</div>
			<div id="ad_side">ad_side</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"/>
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