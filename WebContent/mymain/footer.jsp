<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/footer.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Alata|Dancing+Script|Gochi+Hand|Indie+Flower|Kaushan+Script|Lobster|Lobster+Two|Nanum+Pen+Script|Roboto&display=swap"
	rel="stylesheet">
</head>
<body>
 <div id="footer">
        <div class="footer_content">
            <p>
                대표이사 : 김영롱 | 사업자 등록번호 : 888-7777-6666 | 식품업 | 대표전화 : 010-2344-8628 <br>
            
                 이메일 : tatujjang@gmail.com | 회사주소 : 서울시 송파구
                 COPYRIGHT@Long's Food INC. ALL RIGHTS RESERVED.
            </p>
        </div>
        <div class="footer_logo">
            <a href="#">
                <img src="<%=conPath %>/image/healthy-food.png" alt="메인로고">
                <p>Long's Food</p>
        </div>
        
    </div>
</body>
</html>