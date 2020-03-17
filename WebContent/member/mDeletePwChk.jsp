<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function mpwChk(){
		var mpw = ${member.mpw}
		if($('#mpw').val() == mpw){
			$('#modalBtn').click();
		}else{
			alert('비밀번호가 일치하지 않습니다.');
		}
	}
	$(function(){
		$('#mDeleteDo').click(function(){
			location.href='${conPath}/mDelete.do?mid=${member.mid}';
		});
	});
</script>
 
</head>
<body style="background-color: #f5f3f6">


<button id="modalBtn" type="button" class="d-none" data-toggle="modal" data-target="#mDeleteModal"></button>

<!-- Modal -->
<div class="modal fade" id="mDeleteModal" tabindex="-1" role="dialog" aria-labelledby="mDeleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mDeleteModalLabel"><strong class="text-primary"> ${member.mname }</strong>님 정말 탈퇴하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	남은 포인트 : <strong class="text-danger"> ${member.mpoint }</strong>점이 사라지며 추후에 다시 가입하여도 고객 등급, 포인트는 복원되지 않습니다.
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="mDeleteDo">회원탈퇴</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>




<div class="col mt-5 mb-5 overflow-hidden text-center">
		<p class="h3 mb-4">${member.mname }님 회원탈퇴를 위해 비밀번호를 한 번 더 입력하세요</p><br>
		<div class="form-inline justify-content-center">
  <div class="form-group mx-sm-3 mb-2">
    <input type="password" class="form-control" placeholder="Password" id="mpw" required="required">
  </div>
  <button class="btn btn-primary mb-2" onclick="mpwChk()">입력</button>
</div>
</div>

</body>