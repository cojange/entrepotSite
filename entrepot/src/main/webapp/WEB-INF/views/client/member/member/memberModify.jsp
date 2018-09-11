<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%-- 아래 내용은 DB에 이메일 정보가 javauser2018@naver.com으로 저장되어 있기에 @를 구분자로 분리하고 작성한 소스--%>
<c:set var="m_email" value="${fn:split(member.m_email,'@')}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Update Member!</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/modify.js"></script>
<script type="text/javascript">
	function errorCodeCheck(){
		var status = '<c:out value="${status}" />';
		if(status != ""){
		alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
		}
	} 
	
	loginUserId = "${member.m_id}";
	function emailCheck(){
		var email = "${m_email[1]}";
		$("#emailDomain").val(email).prop("selected", "true");
	}
	
	$(function() {
		$("#deleteMemberBtn").click(function() {
			var message = confirm("정말로 탈퇴 하시겠습니까?계정을 다시복구하기 불가능합니다.");
			if(message == true){
				alert("앙뜨흐뽀 사이트를 이용해주셔서 감사합니다.");
				location.href = "/client/member/deleteMember.do";
			}		
		});
	});
</script>
</head>
<body> 
	<div  id="page" class="container joinform">
	<div class="title">
		<h1>개인회원수정</h1>
		<!-- <span class="byline">Pellentesque lectus gravida blandit</span> -->
	</div>
	<div class="contentContainer">
		<div class="well joinwell" style="border: solid;">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="m_num" id="m_num" value="${member.m_num}" />
			<input type="hidden" name="m_mail" id="m_email" />

			<div class="form-group form-group-sm">
				<label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					${member.m_id}
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="oldUserPw" class="col-sm-2 control-label">기존 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="oldUserPw" name="oldUserPw" maxlength="15" class="form-control" placeholder="기존 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p> 
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="m_pwd" class="col-sm-2 control-label">변경할 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="userPwCheck" class="col-sm-2 control-label">변경할 비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력 확인" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="m_phone" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="m_phone" name="m_phone" maxlength="15" class="form-control" value="${member.m_phone}"> 
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div> 
			<div class="form-group form-group-sm">
				<label for="m_birth" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3"> 
					${member.m_birth} ******
				</div>
			</div>          
			<div class="form-group form-group-sm">
				<label for="m_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					${member.m_name}
				</div>      
			</div>
			<div class="form-group form-group-sm">
				<label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="emailName" name="emailName" maxlength="60" class="form-control" value="${m_email[0]}">
				</div>
				<div class="col-sm-2">
					<select id="emailDomain" class="form-control">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>
					</select> 
				</div>
				<div class="col-sm-3">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group"> 
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="modify" class="btn btn-default" /> 
					<input type="button" value="재작성" id="modifyReset" class="btn btn-default" />
					<input type="button" value="취소" id="modifyCancel" class="btn btn-default" />
					<input type="button" value="회원탈퇴" id="deleteMemberBtn" class="btn btn-default" />
				</div> 
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>