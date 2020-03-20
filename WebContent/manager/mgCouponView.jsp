<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.list-group-item:hover{
		cursor: pointer;
	}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	$(function(){
		$('.allSelecter').click(function(){
			$('.list-group-item').addClass('active');
		});
		$('.list-group-item').click(function(){
				if($(this).hasClass("active")){
					$(this).removeClass('active');
				}else{
					$(this).addClass('active');
				}
		});
		
		$('#cdisper').on("propertychange change keyup paste input", function() {
			$('#cdiscash').val(0);
		});
		$('#cdiscash').on("propertychange change keyup paste input", function() {
			$('#cdisper').val(0);
		});
		$('form').submit(function(){
			if($('#cdiscash').val() == 0 && $('#cdisper').val()==0){
				alert('할인율이나 할인금액 중 하나는 입력하세요');
				return false;
			}else{
				$('.list-group-item').each(function(idx,data){
					if($('.list-group-item').eq(idx).hasClass("active")){
						 var temp = $("<input type='hidden' value="+$(this).html()+" name='grades'>");
						$('form').append(temp);
						}
					});
			}
		});
	});

</script> 
 
</head>

<div class="container mb-5 mt-5 pr-5">
	
   <h2 class="text-center">쿠폰 발행</h2>
	<form action="${conPath }/mgCoupon.do" method="get">
	<table class="table">
  <tbody>
  	<tr>
      <th>발행할 유저 등급</th>
      <td><ul class="list-group list-group-horizontal justify-content-center">
  		<li class="list-group-item allSelecter">전체선택</li>
  		<li class="list-group-item">NORMAL</li>
  		<li class="list-group-item">GOLD</li>
  		<li class="list-group-item">VIP</li>
 		<li class="list-group-item">VVIP</li>
	</ul></td>
    </tr>
    <tr>
      <th>쿠폰명</th>
      <td><input type="text" name="cname" required="required" class="form-control"></td>
    </tr>
    <tr>
      <th>조건(사용시 구매최소금액)</th>
      <td><input type="number" name="ccondition" required="required" class="form-control"></td>
    </tr>
    <tr>
      <th>%할인쿠폰<br><small class="text-muted">%할인이나 금액할인중 하나만 입력 가능합니다.</small></th>
      <td><input type="number" name="cdisper" class="form-control" id="cdisper" min="0" max="100" value="0"></td>
    </tr>
    <tr>
      <th>금액할인쿠폰<br><small class="text-muted">%할인이나 금액할인중 하나만 입력 가능합니다.</small></th>
      <td><input type="number" name="cdiscash" class="form-control" id="cdiscash" min="0" value="0"></td>
    </tr>
    <tr>
      <th>유효기간(오늘로부터 몇일간 가능한지)</th>
      <td><input type="number" name="cvalidity" class="form-control" min="0"></td>
    </tr>
    <tr>
    	<td colspan="2"><button type="submit" class="btn btn-success btn-block">쿠폰생성</button></td>
    </tr>
  </tbody>
</table>
	</form>
</div>



</body>
</html>