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
<style>
 .swal-footer{
 	text-align: center;
 }
 </style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(function(){
			var pstock = ${product.pstock};
			var mpoint = $();
		if(pstock == 0){
			$('#pBuy').attr('disabled', true);
			$('#cart').attr('disabled', true);
			$('#pcnt').attr('readonly', true);
			$('#pBuy').html('품절');
		}
		$('#pBuy').click(function(){
				var pcnt = $('#pcnt').val();
			if(pstock<pcnt){
				swal({
					  text: "죄송합니다. 재고 부족으로 주문할 수 없습니다. 주문 수량을 확인해주세요. 빠른 시일내에 입고하도록 하겠습니다.",
					  icon: "warning",
					  buttons : {
						  confirm : {
							  text : '확인',
						  }
					  }
					});
			}else if(pcnt<1){
				swal({
					  text: "최소구매수량은 한 개 입니다.",
					  icon: "error",
					  buttons : {
						  confirm : {
							  text : '확인',
						  }
					  }
					});
		    	$('#pcnt').val('1');
			}else{
				var pcode = '${product.pcode}';
				var mid = '${member.mid}';
				
				location.href="${conPath}/cartBuyProduct.do?pBuyNow=1&pcnt="+pcnt+"&pcode="+pcode+"&mid="+mid;
			}
		});
		$("#pcnt").on("propertychange change keyup paste input", function() {
			var pcnt = $('#pcnt').val();
		 	if(pcnt>20){
		 		swal({
					  text: "구매는 한번에 20개까지만 가능합니다.",
					  icon: "info",
					  buttons : {
						  confirm : {
							  text : '확인',
						  }
					  }
					});
		 		$('#pcnt').val('1');
		 	}else{
		    	
		 	}
		});
		
		$('#cart').click(function(){
			var pcnt = $('#pcnt').val();
			if(pstock<pcnt){
				swal({
					  text: "죄송합니다. 재고 부족으로 장바구니에 담을 수 없습니다. 주문 수량을 확인해주세요. 빠른 시일내에 입고하도록 하겠습니다.",
					  icon: "warning",
					  buttons : {
						  confirm : {
							  text : '확인',
						  }
					  }
					});
			}else{
				var pcode = '${product.pcode}';
				var mid = '${member.mid}';
				var message = $(this).next();
				$.ajax({ 
					url: '${conPath}/cartAddProduct.do', 
					data: "pcnt="+pcnt+"&pcode="+pcode+"&mid="+mid,
					dataType: "html",
					success: function(data){
						message.html(data);
						var outMessage = message.html().trim();
						swal({
							  title: outMessage,
							  icon: "info",
							  buttons : {
								  confirm : {
									  text : '확인',
								  }
							  }
							});
						setTimeout(function(){
							location.reload();
							},2000);
					}
								
				});
			}
		});
		
		
		$('.rGoodBtn').click(function(){
			if('${member.mid}'==''){
				swal('좋아요는 로그인 이후에 가능합니다.');
			}else{
				var rno = $(this).parent().children('.rno').html();
				var message = $(this).next();
				$.ajax({ 
					url: '${conPath}/rGoodPlus.do', 
					data: "mid="+"${member.mid}"+"&rno="+rno,
					dataType: "html",
					success: function(data){
						message.html(data);
						message.toast('show');
					}
								
				});
				function reload(){  
				      setTimeout('location.reload()',1000); 
				}
				reload();
			}
		});
		
		$('.mgReviewCommentWriteBtn').click(function(){
			var btnName = $(this).html().trim();
			if(btnName == '관리자 댓글 작성'){
				$(this).parent().parent().next().removeClass('d-none');
				$(this).html('작성취소');
			}else{
				$(this).parent().parent().next().addClass('d-none');
				$(this).html('관리자 댓글 작성');
			}
			
		});
		
		$('.rcView').click(function(){
			var btnName = $(this).html().trim();
			var rcDiv = $(this).parent().parent().next().next();
			if(btnName == '댓글보기'){
				var rno = $(this).parent().children('.rno').html();
				$(this).html('댓글닫기');
				rcDiv.removeClass('d-none');
				$.ajax({ 
					url: '${conPath}/rCommentView.do', 
					data: "rno="+rno,
					dataType: "html",
					success: function(data){
						rcDiv.html(data);
							}
				});
			}else{
				$(this).html('댓글보기');
				rcDiv.addClass('d-none');
			}
			
		});
		
		$('.rWriteView').click(function(){
			$('.rWriteDo').removeClass('d-none');
		});
		
		
		
	});
</script> 
</head>
<body style="background-color: #f5f3f6;">
	<c:if test="${not empty rcWriteResult }">
		<script>
		alert('${rcWriteResult}');
		</script>
	</c:if>
	<c:if test="${not empty reviewWriteResult }">
		<script>
		alert('${reviewWriteResult}');
		</script>
	</c:if>



	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="container pt-5">
		<div class="row ml-5 mr-5">
			<div class="col mb-5">
				<img src="${conPath }/image/product/${product.pimage}" alt="상품 이미지" class="img-fluid mt-5">
			</div>
			<div class="col-8">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" colspan="4">
							<c:if test="${product.pdiscount>=30 }">
								<img alt="sale" src="${conPath }/image/icon/sale.png">
							</c:if>
							<c:if test="${product.pcumulative_sales>=100 }">
		<img alt="best2" src="${conPath }/image/icon/best2.png" >
							</c:if>
							<c:if test="${product.prating>=8 }">
		<img alt="highRating" src="${conPath }/image/icon/highRating.png" >
							</c:if>
							</th>
						</tr>

					</thead>
					<tbody>
						<tr>
							<th scope="col">상품명</th>
							<td scope="col">${product.pname }</td>
							<th scope="col">담당MD</th>
							<td>${product.mgname }</td>
						</tr>
						<tr>
							<th scope="col">평점</th>
							<td scope="col" class="text-danger font-weight-bold font-italic"><ins>${product.prating eq -1? "아직 평점이 등록되지 않았습니다":product.prating  }</ins></td>
							<th scope="col">상품등록일</th>
							<td>${product.pregist }</td>
						</tr>
						<tr>
							<th scope="col">누적판매량</th>
							<td>${product.pcumulative_sales }개</td>
							<th scope="col">상품평</th>
							<td>${product.preview_count }개</td>
						</tr>
						<tr>
							<th scope="col">판매가(개당)</th>
							<td colspan="3">${product.pdiscount }%할인 &nbsp; <del>
									<fmt:formatNumber value="${product.pprice}"
										pattern="###,###" />
									원
								</del> <br> <strong class="text-danger"><fmt:formatNumber
										value="${product.pprice*(100-product.pdiscount)/100}"
										pattern="###,###" />원</strong>
							</td>
						</tr>
						<tr>
							<th scope="col">재고량</th>
							<td colspan="3">${product.pstock }개</td>
						</tr>
						<tr>
							<th scope="col">적립포인트[5%]</th>
							<td colspan="3"> <h5> <span class="badge badge-primary"><fmt:parseNumber
										value="${product.pprice*(100-product.pdiscount)/2000}"
										integerOnly="true" /> 포인트 적립예정</span></h5>
							</td>
						</tr>
						<tr>
							<th scope="col">배송비</th>
							<td colspan="3"> <h5>한진택배 : 2500원</h5><small class="text-muted">배송비 도서,산간 지역도 일괄 2500원 적용입니다.</small>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<c:if test="${empty manager }"> <!-- 회원 & 비회원일때 -->
		<div class="row mt-5 mb-5 justify-content-center">
			<div class="input-group input-group-lg col-3">
			
			
			
  <div class="input-group-prepend mb-5">
    <span class="input-group-text bg-dark text-white">수량</span>
  </div>
  <input type="number" class="form-control" id="pcnt" aria-label="Sizing input" aria-describedby="inputGroup-sizing-lg" value="1" min="0" max="10">
</div>
		<div class="col-2">
			<button type="button" class="btn btn-primary btn-lg btn-block" id="pBuy">바로 구매</button>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-info btn-lg btn-block" id="cart">장바 구니</button>
			<div class="d-none"></div>
		</div>
		
		</div>
		
		</c:if> 
		
		
		<div class="row mt-5 mb-3 ml-5">
			<div class="col bd-highlight">
 				<span class="h2"><strong>구매후기 | </strong></span><a href="#" class="btn btn-success">좋아요 순</a> &nbsp; <a href="#" class="btn btn-warning text-white">최신순</a> &nbsp;
 				<br>
 				<small class="text-muted">구매후기는 구입 후 2주내에 작성 가능합니다.</small>
 				<br>
 				<c:if test="${not empty reviewWriteCheck}">
 				<button class="btn btn-secondary btn-lg btn-block rWriteView">구매 후기 작성</button>
 				</c:if>
 				
			</div>
		</div>
		<div class="d-none rWriteDo">
		<form action="${conPath }/rWrite.do" method="post" enctype="multipart/form-data"> 
			<input type="hidden" name="pcode" value="${product.pcode }">
			<input type="hidden" name="mid" value="${member.mid }">
	<table class="table table-dark table-borderless ml-5">
    <tr>
      <th scope="row">상품명</th>
      <td><input type="text" value="${product.pname }" readonly="readonly" class="form-control"></td>
    </tr>
    <tr>
      <th scope="row">별점<br><small class="text-muted">(별점은 0~10점만 가능합니다)</small></th>
      <td><input type="number" name="rstar" value="10" class="form-control" min="0" max="10" required="required"></td>
    </tr>
    <tr>
      <th scope="row">리뷰내용</th>
      <td><textarea class="form-control" name="rcontent" rows="8"></textarea></td>
    </tr>
    </table>
    <table class="table table-borderless ml-5">
    <thead>
    	<tr>
    	<th colspan="2" class="h4 text-center">*파일첨부는 3개까지만 가능합니다.</th>
    	</tr>
    </thead>
    <tbody>
    <tr>
      <th scope="row">첨부파일1</th>
      <td><input type="file" name="rimage1" class="form-control"></td>
    </tr>
    <tr>
      <th scope="row">첨부파일2</th>
      <td><input type="file" name="rimage2" class="form-control"></td>
    </tr>
    <tr>
      <th scope="row">첨부파일3</th>
      <td><input type="file" name="rimage3" class="form-control"></td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
      	<input type="submit" class="btn btn-lg btn-primary" value="후기 작성">
      	<input type="reset" class="btn btn-lg btn-secondary" value="초기화">
      </td>
    </tr>
      </tbody>
</table>
</form>
		</div>
		
		<!-- 리뷰 보이기 -->
		<c:forEach var="review" items="${reviews }">
			<div class="row mt-2 mb-2 ml-5">
				<div class="col-4">
					<p class="h4 font-weight-bold">${review.mid }님 리뷰</p>
					<p><c:forEach begin="1" end="${review.rstar/2 }"><img src="${conPath }/image/icon/star.png" alt="별 이미지"></c:forEach><c:if test="${review.rstar%2 eq 1 }"><img src="${conPath }/image/icon/half-star.png" alt="별반 이미지"></c:if>
					<strong class="text-danger">(${review.rstar }점)</strong></p>
					<p>${review.rdate }</p>
				</div>
			</div>
			<div class="row mt-2 mb-2 ml-5">
				<c:if test="${not empty review.rimage1 }">
				<div class="col reviewImage">
					<img src="${conPath }/image/review/${review.rimage1}" alt="리뷰이미지1">
				</div>
				<br>
				</c:if>
				<c:if test="${not empty review.rimage2 }">
					<div class="col reviewImage">
						<img src="${conPath }/image/review/${review.rimage2}" alt="리뷰이미지2">
					</div>
				</c:if>
				<br>
				<c:if test="${not empty review.rimage3 }">
				<div class="col reviewImage">
					<img src="${conPath }/image/review/${review.rimage3}" alt="리뷰이미지3">
				</div>
				</c:if>
			</div>

			<div class="row mt-2 mb-2 ml-5">
				<div class="col">
					${review.rcontent }
				</div>
			</div>
			<div class="row mt-2 mb-2 ml-5">
				<div class="col">
					<span class="d-none rno">${review.rno }</span>
					<button type="button" class="btn btn-primary rGoodBtn">
  						리뷰가 좋아요 <span class="badge badge-light">${review.rgood }</span>
					</button>
  					<div class="toast position-absolute"></div>
  					<c:if test="${review.rcexist eq true}">
					<button type="button" class="btn btn-success rcView">
  						댓글보기
					</button>	
					</c:if>	
  					<c:if test="${not empty manager }">
  					<button type="button" class="btn btn-secondary mgReviewCommentWriteBtn">
  						관리자 댓글 작성
					</button>
  					</c:if>
				</div>
			</div>
			<div class="row mt-4 mb-2 ml-5 rCommentWrite d-none">
				<div class="col bg-secondary">
					<form action="${conPath }/rCommentWrite.do" method="post">
  					<input type="hidden" name=rno value="${review.rno }">
  					<input type="hidden" name=mgid value="${manager.mgid }">
  					<input type="hidden" name=pcode value="${param.pcode }">

					<div class="form-group">
						<p>관리자 [${manager.mgname }]님 댓글</p>
    					<textarea class="form-control" rows="3" name="rccontent"></textarea>
  					</div>
  					<button type="submit" class="btn btn-warning mb-2 text-white">입력</button>
  					</form>
				</div>
			</div>	
			
			<div class="row mt-4 mb-2 ml-5 rCommentView d-none">
				<div class="col">
					
					
				</div>
			</div>	
			<br><br><br>
			<hr class="col">
		</c:forEach>
		
		<!-- paging -->
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center mt-5 mb-5">
				<li class="page-item">
					<c:if test="${startPage ne 1 }">
						<a class="page-link" aria-label="Previous"
							href="${conPath }/productDetail.do?pcode=${param.pcode }&pageNum=${startPage-1}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="page" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage eq page }">
						<li class="page-item disabled"><a class="page-link"
						href="${conPath }/productDetail.do?pcode=${param.pcode }&pageNum=${page}">${page }</a></li>
					</c:if>
					<c:if test="${currentPage ne page }">
						<li class="page-item"><a class="page-link"
						href="${conPath }/productDetail.do?pcode=${param.pcode }&pageNum=${page}">${page }</a></li>
					</c:if>
				</c:forEach>
					<c:if test="${endPage ne totalPage }">
				<li class="page-item"><a class="page-link"
					href="${conPath }/productDetail.do?pcode=${param.pcode }&pageNum=${endPage+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
					</c:if>
			</ul>
		</nav>
		
		
		
		
	</div> <!--wrap-->
	<jsp:include page="../main/footer.jsp" />
</body>
</html>