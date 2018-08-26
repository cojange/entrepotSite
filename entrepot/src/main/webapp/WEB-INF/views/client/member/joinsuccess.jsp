<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 완료화면</title>
		<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
		<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>
		<!-- <meta http-equiv="refresh" content="5; url=/"> -->	

		<link rel="shortcut icon" href = "../image/icon.png"/>
		<link rel="apple-touch-icon" href = "../image/icon.png"/>
		<link rel="styleSheet" href="/resources/include/client/css/normalize.css"/>
		<!-- [if lt IE 9]>
		<script type="text/javascript" src="/springSite/resources/include/js/html5shiv.js"></script>
		<![emdif] -->
		<!--<script type="text/javascript" src="/springSite/resources/include/js/jquery-1.12.4.min.js"></script>-->
		<script type = "text/javascript">
		</script>
	</head>
<body>
	<h1>회원가입이 완료되었습니다.</h1>
	<img src="/resources/images/client/member3.png"/>
	<div class="contentContainer">
		<div class="well">
			<div class="tac">
				앙뜨흐뽀 사이트에 회원 가입해 주셔서 감사합니다.<br />
				<span id="text">아래의 로그인 버튼이나 상단에 로그인버튼을 눌러 로그인 해주세요.</span><br>
				<a href="/client/member/login.do" class="btn btn-primary">로그인하기</a>
			</div>
		</div>
	</div>
</body>
</html>