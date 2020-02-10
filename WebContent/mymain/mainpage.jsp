<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Myproject</title>
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">
<%
	String conPath = request.getContextPath();
%>
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

<link rel="stylesheet" href="<%=conPath %>/css/content.css" type="text/css">

</head>

<body>
	<div id="wrap">
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
	</div>
	<!--wrap-->
</body>

</html>