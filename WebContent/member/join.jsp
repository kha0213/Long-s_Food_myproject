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
	
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script>
	
	$(document).ready(function(){
		$('input[name="mid"]').keyup(function(){
			var mid = $('input[name="mid"]').val();
			
			$.ajax({
				url : '${conPath}/idConfirm.do',
				type : 'get',
				dataType : 'html',
				data : "mid="+mid,
				success : function(data){
					$('#idConfirmResult').html(data);
					var id = $('#idConfirmResult').html().trim();
					if(id == '<small>사용 가능한 아이디입니다.</small>'){
						$('#idConfirmResult').removeClass('alert-danger').addClass('alert alert-success');
					}else{
						$('#idConfirmResult').removeClass('alert-success').addClass('alert alert-danger');
					}
				}
			});//ajax
		
			
		});
		$('input[type="password"]').keyup(function(){
			var mpw = $('input[name="mpw"]').val();
			var mpwChk = $('input[name="mpwChk"]').val();
			
			if(mpw.length !=0 && mpw == mpwChk){
				$('#pwConfirmResult').removeClass('alert-danger').addClass('alert').addClass('alert-success').html('<small>비밀번호가 일치합니다.</small>');
				
			}else{
				$('#pwConfirmResult').removeClass('alert-success').addClass('alert').addClass('alert-danger').html('<small>비밀번호가 일치하지 않습니다.</small>');
			}
		});
		
		
		
		
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmResult').text().trim();
			var pwConfirmResult =  $('#pwConfirmResult').text().trim();
			if(idConfirmResult!='사용 가능한 아이디입니다.'){
				alert('아이디를 확인해주세요');
				$('input[name="mid"]').focus();
				return false;
			}
			if(pwConfirmResult!='비밀번호가 일치합니다.'){
				alert('비밀번호를 확인해주세요');
				$('input[name="mpwChk"]').focus();
				return false;
			}
		});
	});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumMapApi() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("jibunAddress").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
              
            }
        }).open();
    }
</script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $( "#datepicker" ).datepicker({
	    	dateFormat : 'yy-mm-dd',
	    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	showMonthAfterYear : true,
	    	yearSuffix : '년',
	    	showOtherMonths : true,
	    	dayNamesMin:['일','월','화','수','목','금','토']
	    });
  } ); 
  </script>
</head>
<body style="background-color: #f5f3f6">
	<div id="wrap" class="container-fluid">
		<form action="${conPath }/join.do" method="post" name="frm">
	
			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="2"><h1 class="text-center text-monospace">회원가입</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">ID <span style="color:red">*</span></th>
						<td class="text-center"><input type="text" class="form-control" name="mid" required="required">
						<p role="alert" id="idConfirmResult" class="h6 mt-1 text-left" ></p>
						</td>
						
					</tr>
					<tr>
						<th scope="col">비밀번호 <span style="color:red">*</span></th>
						<td><input type="password" class="form-control" name="mpw" required="required"></td>
					
					</tr>
					<tr>
						<th scope="col">비밀번호 확인 <span style="color:red">*</span></th>
						<td><input type="password" class="form-control" name="mpwChk" required="required">
						<p role="alert" id="pwConfirmResult" class="h6 mt-1 text-left"></p>
						</td>
					</tr>
					<tr>
						<th scope="col">이름 <span style="color:red">*</span></th>
						<td><input type="text" class="form-control" name="mname" required="required"></td>
					</tr>
					<tr>
						<th scope="col">전화번호 <span style="color:red">*</span></th>
						<td><input type="text" class="form-control" name="mphone" required="required"></td>
					</tr>
					<tr>
						<th scope="col">주소</th>
						<td><input type="button" class="form-control btn-info btn mb-2" value="주소검색" onclick="daumMapApi()"><br>
						<input type="text" class="form-control mb-1" name="maddress_basic" placeholder="기본주소" id="jibunAddress">
						<input type="text" class="form-control" name="maddress_detail" placeholder="상세주소">
						</td>
					</tr>
					
					<tr>
						<th scope="col">생일</th>
						<td><input type="text" class="form-control" name="mbirth" id="datepicker"></td>
					</tr>
					<tr>
						<th scope="col">이메일</th>
						<td><input type="email" class="form-control" name="memail"></td>
					</tr>
					<tr>
						<th scope="col">성별</th>
						<td>
							<input type="radio" name="mgender" value="남자">남자 &nbsp;
							<input type="radio" name="mgender" value="여자">여자
						</td>
					</tr>
					<tr>
						<th scope="col">광고</th>
						<td>
							<label><input type="checkbox" name="ad_email" value="1"> 메일 수신</label><br>
							<label><input type="checkbox" name="ad_phone" value="1"> 문자 수신</label><br>
							<label><input type="checkbox" name="ad_call" value="1"> 전화 수신</label><br>
						</td>
					</tr>
					<tr class="text-center">
						<th colspan="2">
<input class="btn btn-outline-success" type="submit" value="회원가입">
<input class="btn btn-outline-secondary" type="reset" value="초기화">
						</th>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-right"><input type="button" onclick="location.href='${conPath}/mgjoinView.do'" class="btn btn-outline-dark btn-sm" value="관리자 등록">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<!--wrap-->
	
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