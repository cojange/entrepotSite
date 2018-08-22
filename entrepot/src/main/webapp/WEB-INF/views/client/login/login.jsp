<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="../image/icon.png">

    <title>로그인창</title>
    <!-- Bootstrap core CSS -->
  	<link href="/resources/include/client/dist/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/include/client/dist/css/signin.css" rel="stylesheet">
    <script src="/resources/include/client/js/html5shiv.js"></script>
    <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/client/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/client/js/login.js"></script>
    <script type="text/javascript">

    function errorCodeCheck(){
    	var status = '<c:out value="${status}" />';
    	if(status != ""){
    	// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
	    	switch (parseInt(status)) {
	    		case 1:
	    			alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
	    			break;
	    		case 6:
	    			alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
	    			break;
    		}
    	}
    }
    
    </script>
  </head>

  <body>

    <div class="contentContainer">
		<div class="well">
     <!--  <form class="form-signin">
        <h2 class="form-signin-heading">앙뜨흐뽀</h2>
        <label for="inputEmail" class="sr-only">Id</label>
        <input type="text" id="m_id" name="m_id" class="form-control" placeholder="아이디" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="m_pwd" name="m_pwd" class="form-control" placeholder="비밀번호" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 아이디 기억하기
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" id="loginBtn">로그인</button>
      </form> -->
      <c:if test="${login.m_id == null or login.m_id == ''}">
			<form id="loginForm" class="form-horizontal">
				<div class="form-group">
					<label for="m_id" class="col-sm-2 control-label">아 이 디 </label>
					<div class="col-sm-4">
						<input type="text" id="m_id" name="m_id" class="form-control" placeholder="ID">
					</div>
					<p class="form-control-static error"></p>
				</div>
				<div class="form-group">
					<label for="m_pwd" class="col-sm-2 control-label">비밀번호  </label> 
					<div class="col-sm-4">
						<input type="password"  id="m_pwd" name="m_pwd" class="form-control" placeholder="Password">
					</div>
					<p class="form-control-static error"></p>
				</div> 
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="로그인" id="loginBtn" class="btn btn-default" /> 
					</div>
				</div>
			</form> 
		</c:if>
		</div>
    </div> <!-- /container -->

  </body>
</html>
