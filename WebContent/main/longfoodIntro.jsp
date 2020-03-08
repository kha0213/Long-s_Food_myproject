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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	

</head>
<body>
	<div id="wrap" class="container-fluid">
		<jsp:include page="header.jsp"/>
	
	<div class="row p-5">
		<div class="col">
			<h3>대표 : 펭수</h3>
			<img src="${conPath }/image/mainpage/pengsoo.jfif" alt="대표사진">
		</div>
		<div class="col">
			<h3>Long's Food 철학</h3>
			<p>그냥 열심히 하면 됩니다.</p>
		</div>
		
	</div>
	
	
	<h3>오시는 길</h3>
	<div id="map" class="m-5" style="width:500px;height:400px;"></div>






	</div>
<jsp:include page="footer.jsp"/>
	<!--wrap-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955fa574fcf92290ccab03a97378fe35"></script>
	<script>
	var mapContainer = document.getElementById('map'),
	mapOption = { 
            center: new kakao.maps.LatLng(37.570605, 126.989100), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(37.570605, 126.989100); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);	
	

	</script>
	
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