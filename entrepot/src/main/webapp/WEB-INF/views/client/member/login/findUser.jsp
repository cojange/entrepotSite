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
		</script>
	</head>
<body>
	<div id="page" class="container joinform">
	  	<div class="title"> 
			<h1>아이디/비밀번호 찾기</h1>
		</div>
    <div class="contentContainer" id="login_box">
		<div class="well loginwell">
	  
				<form id="findForm">
					<div class="form-group">
						<label for="m_name" class="col-sm-2 control-label">이 름</label>
						<div class="col-sm-4">
							<input type="text" id="m_name" name="m_name" class="inputLogin" placeholder="ID">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group form-group-sm">
			            <label for="m_birth" class="col-sm-2 control-label">생년월일</label>
			            <div class="col-sm-3">
			               <input type="text" id="m_birth" name="m_birth" maxlength="6" class="form-control inputLogin" placeholder="생년월일  6자리">
			               <input type="text" id="m_gender" name="m_gender" maxlength="1" class="form-control inputLogin" placeholder="주민번호뒷자리1번째">  
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			         <div class="form-group form-group-sm">
			            <label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
			            <div class="col-sm-3">
			               <input type="text" id="emailName" name="emailName" maxlength="60" class="form-control inputText" placeholder="'@'를빼고 입력해주세요.">
			               <input type="text" id="emailDirect" maxlength="60" class="form-control inputText" placeholder="EMAIL" style="width: 100px;"/>
			            </div>
						<div class="col-sm-3">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>   
					<div class="title"> 
						<h1><input type="button" value="하이"></h1>
					</div>
				</form> 
		</div>
	  </div>
    </div><!-- /container -->
</body>
</html>