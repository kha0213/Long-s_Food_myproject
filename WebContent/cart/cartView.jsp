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
<style>
	table{
		font-size: 1.6em;
	}
	.input_small{
		width:50px;
	}
	.pSelectCartAll, .pSelectCart{
		width:36px;
		height:36px;
	}
	
	
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
		function calCart(){
			var ppriceAll = 0;
			var pdiscount = 0;
			$('.pSelectCart').each(function(index,item){
				if($(item).is(":checked")){
					ppriceAll += Number($(item).parent().next().next().next().children('.cart_pprice').html());
					pdiscount += Math.round(Number($(item).parent().next().next().next().children('.cart_discount').html()));
				}
			})
				$('#ppriceAll').html(ppriceAll);
				$('#pdiscount').html(pdiscount);
				$('#ppriceResult').html(Number($('#ppriceAll').html())-Number($('#pdiscount').html())+2500);
		}
	$(function(){
		$('.cart_pcnt').on("propertychange change keyup paste input",function(){
			var pprice = Number($(this).next().html());
			var pcnt = $(this).val();
			var pdiscount = Number($(this).next().next().next().html());
			$(this).next().next().html(pcnt);
			$(this).parent().next().children('.cart_pprice').html(pcnt*pprice);
			$(this).parent().next().children('.cart_discount').html(Math.round(pcnt*pprice*(pdiscount)/100));
			calCart();
		});
		$('.pSelectCartAll').click(function(){
			if($('.pSelectCartAll').is(":checked")){
				$('.pSelectCart').prop("checked",true);
			}else{
				$('.pSelectCart').prop("checked",false);
			}
			calCart();
		});
		$('.pSelectCart').change(calCart);
		
		
		
		
		
		$('#selectProductDrop').click(function(){
			if($('.pSelectCart').is(":checked")){
			var pcodeStr = '';
			$('.pSelectCart').each(function(index,item){
				if($(item).is(":checked")){
					pcodeStr += 'pcode='+$(this).next().html()+'&';
				}
				location.href='${conPath}/cartDelProduct.do?mid=${member.mid}&'+pcodeStr;
			})
			}else{
					swal({
						title: "한 개 이상의 제품을 선택하세요",
						  icon: "error",
						  buttons : {
							  confirm : {
								  text : '확인',
								  className : 'btn-btn-outline-primary'
							  }
						  }
						});
			}
		});
		$('#selectProductBuy').click(function(){
			if($('.pSelectCart').is(":checked")){
			var ppriceAll = Number($('#ppriceAll').html());
			var pdiscount = Number($('#pdiscount').html());
			var pcodeStr = '';
			var pcntStr = '';
			$('.pSelectCart').each(function(index,item){
				if($(item).is(":checked")){
					pcodeStr += 'pcode='+$(this).next().html()+'&';
					pcntStr += 'pcnt='+$(this).parent().next().next().children('.cart_pcnt').val()+'&';
					}
				location.href='${conPath}/cartBuyProduct.do?ppriceAll='+ppriceAll+'&pdiscount='+pdiscount+'&mid=${member.mid}&'+pcodeStr+pcntStr;
				}
			)}else{
				swal({
					  title: "한 개 이상의 제품을 선택하세요",
					  icon: "error",
					  buttons : {
						  confirm : {
							  text : '확인',
							  className : 'btn-btn-outline-primary'
						  }
					  }
					});
			}
		});
	});

</script> 
 
</head>
<body style="background-color: #f5f3f6">
	<c:if test="${not empty cartDelProductResult}">
		<script>
		
			swal("${cartDelProductResult}", "", "success");
		
		</script>
	</c:if>
			<jsp:include page="../main/header.jsp" />
		<div class="container">
			<div class="row mt-5 mb-5">
			<p class="display-4"><img src="${conPath }/image/icon/shopping-cart.png" alt="카트이미지">&nbsp; 장바구니</p>
				<div class="w-100"><hr></div>
			</div>
			
			<c:if test="${empty carts }">
				<p class="h1 m-5">장바구니가 현재 비어있습니다. <br><br>상품을 먼저 추가해주세요</p>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
				<div class="m-5">&nbsp;</div>
			</c:if>		
			<c:if test="${not empty carts }">
				<table class="table table-hover">
  <thead>
    <tr>
      <th><input type="checkbox" class="pSelectCartAll"></th>
      <th>상품정보</th>
      <th>수량</th>
      <th>상품금액(할인금액)</th>
    </tr>
  </thead>
  <tbody>
			<c:forEach var="cart" items="${carts }">
    <tr>
      <td><input type="checkbox" class="pSelectCart" name="pSelectCart" value="${cart.pcode }">
      <span class="d-none">${cart.pcode }</span>
      </td>
      <td><img src="${conPath }/image/product/${cart.pimage}" alt="pimage" width="50">${cart.pname } </td>
      <td><input type="number" min="0" value="${cart.pcnt }" class="input_small cart_pcnt">개
      <span class="d-none pprice">${cart.pprice }</span>
      	<span class="d-none pcnt">${cart.pcnt }</span>
      	<span class="d-none pdiscount">${cart.pdiscount }</span></td>
      <td><span class="cart_pprice">${cart.pprice*cart.pcnt }</span>원 <img src="${conPath }/image/icon/minus_only.png" alt="-"> <span class="text-danger cart_discount">${cart.pprice*cart.pcnt*cart.pdiscount/100 }</span>원 할인!!</td>
    </tr>
			</c:forEach>
  </tbody>
</table>
	<div class="row justify-content-center">
		<button type="button" class="btn btn-outline-success btn-lg" id="selectProductDrop">선택상품 삭제</button> &nbsp;
<button type="button" class="btn btn-outline-info btn-lg" id="selectProductBuy">선택 제품 구매</button>
	</div>


  <div class="text-center m-5 h3">
  		<p> 상품가격 <span id="ppriceAll">0</span> 원
  			<img src="${conPath }/image/icon/minus.png" alt="-">
  			할인금액 <span id="pdiscount">0</span>원
  			<img src="${conPath }/image/icon/plus.png" alt="+"> 
  			배송비 : 2500원 
  			</p>
  			<div class="shadow-lg p-3 mt-4 mb-5 rounded font-weight-bold"><img src="${conPath }/image/icon/equal.png" alt="="> 
  			총 주문금액 <span id="ppriceResult">2500</span>원</div>
  		
  </div>
  <div class="m-5">&nbsp;</div>
  <div class="m-5">&nbsp;</div>
			</c:if>	
		</div>
			<jsp:include page="../main/footer.jsp" />




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