<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
		<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>	

		<link rel="shortcut icon" href = "../image/icon.png"/>
		<link rel="apple-touch-icon" href = "../image/icon.png"/>
		<!-- [if lt IE 9]>
		<script type="text/javascript" src="/springSite/resources/include/js/html5shiv.js"></script>
		<![emdif] -->
		<!--<script type="text/javascript" src="/springSite/resources/include/js/jquery-1.12.4.min.js"></script>-->
		<script type = "text/javascript">
		/* $("#pwdCheckBtn").click(function() {
			if($("#pwdHidden").val() == $("#pwdText").val()){
				
			}
			alert("인증번호가 틀리셨습니다 다시입력해주세요");
		}); */
		$(function() {
			$("#loginPage").click(function() {
				location.href="/client/member/login.do";
			});
		});
		</script>
	</head>
<body>
	<h1>임시 비밀번호가 메일로 발송 되었습니다.</h1>
	<h1>로그인후 수정하여 사용하시기 바랍니다.</h1>
	<input type="button" id="loginPage" class="fun-btn" value="로그인 페이지로 이동">
</body>
</html>