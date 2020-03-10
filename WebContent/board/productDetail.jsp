<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="container">
		<div class="row ml-5 mr-5">
			<div class="col">
				<img src="${conPath }/image/${product.pimage}">
			</div>
			<div class="col-8">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" colspan="4">
								<!-- hit이미지 big sale 이미지  highly recommended-->
							</th>
						</tr>

					</thead>
					<tbody>
						<tr>
							<th scope="col">상품명</th>
							<td scope="col">${product.pname }<!-- hit이미지 big sale 이미지  highly recommended--></td>
							<th scope="col">담당MD</th>
							<td>${product.mgname }</td>
						</tr>
						<tr>
							<th scope="col">누적판매량</th>
							<td>${product.pcumulative_sales }</td>
							<th scope="col">상품평</th>
							<td>${product.preview_count }개</td>
						</tr>
						<tr>
							<th scope="col">판매가</th>
							<td colspan="3">${product.pdiscount }%할인 &nbsp; <del>
									<fmt:formatNumber value="${product.pprice}"
										currencySymbol="true" />
									원
								</del> <br> <strong style="color: red"><fmt:formatNumber
										value="${product.pprice*(100-product.pdiscount)/100}"
										currencySymbol="true" />원</strong>
							</td>
						</tr>
						<tr>
							<th scope="col">3</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
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