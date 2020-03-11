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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="container pt-5" style="background-color: #f5f3f6;">
		<div class="row ml-5 mr-5">
			<div class="col mb-5">
				<img src="${conPath }/image/product/${product.pimage}" alt="상품 이미지" class="img-fluid mt-5">
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
							<td>${product.pcumulative_sales }개</td>
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
						
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
	<!--wrap-->
</body>
</html>