<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../image/icon.png">

    <title>로그인창</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/client/dist/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/client/dist/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/client/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    
    </script>
  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">앙뜨흐뽀</h2>
        <label for="inputEmail" class="sr-only">Id</label>
        <input type="email" id="m_id" name="m_id" class="form-control" placeholder="아이디" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="m_pwd" name="m_pwd" class="form-control" placeholder="비밀번호" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 아이디 기억하기
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
