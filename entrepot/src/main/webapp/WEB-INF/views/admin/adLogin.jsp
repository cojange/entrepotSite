<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Entrepot - Login</title>
	<link rel="icon" href="/resources/images/admin/adLog.ico">
    <!-- Bootstrap core CSS-->
    <link href="/resources/include/admin/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/resources/include/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/include/admin/css/sb-admin.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">로그인</div>
        <div class="card-body">
          <form id="adlogin" name="adlogin">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" name="ad_id" id="ad_id" class="form-control" placeholder="id" required="required" autofocus="autofocus">
                <label for="inputEmail">ID</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" name="ad_pw" id="ad_pw" class="form-control" placeholder="Password" required="required">
                <label for="inputPassword">Password</label>
              </div>
            </div>
            <a class="btn btn-primary btn-block" id="loginFrmBtn" href="#">Login</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="#">Forgot password</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/include/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/include/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/include/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- 사용자 정의 js -->
    <script type="text/javascript" src="/resources/include/common/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#loginFrmBtn").click(function(){
				if(!inputVerify(11,"#ad_id","아이디가","영문 숫자 혼합 6~10","admin")) return;
				else{
					$("#adlogin").attr({
						"method":"post",
						"action":"/adLogin/login.do"
					});
					$("#adlogin").submit();
				}
			})
			
			//준비중
			$("a.mt-3").click(function(event){
				event.preventDefault();
				alert('현재 구현 준비중 입니다.');
			});
			
			
		})
	</script>
  </body>

</html>
