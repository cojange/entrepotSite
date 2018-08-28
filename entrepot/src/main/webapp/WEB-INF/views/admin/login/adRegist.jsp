<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>  </title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     	 	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
    	  
     		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
     		 <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
    	 	 <!-- 모바일 웹 페이지 설정 -->
    		  <!-- 모바일 웹 페이지 설정 종료 -->

    		 <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
    		 <!-- [if lt IE 9] -->
        	 <!-- <script src="/resources/include/js/html5shiv.js"</script> -->
     		 <!-- [endif] -->
     		 <!-- 사용자 cSS-->
     	  <!-- Bootstrap core CSS-->
			    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			
			    <!-- Custom fonts for this template-->
			    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
			
			    <!-- Custom styles for this template-->
			    <link href="css/sb-admin.css" rel="stylesheet">
     		 <!--사용자 js-->
     	 		
	</head>
	 <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Admin Login</div>
        <div class="card-body">
          <form>
          	<div class="form-group">
              <div class="form-label-group">
                <input type="text" id="id" class="form-control" placeholder="Id" required="required">
                <label for="id">Id</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="pw" class="form-control" placeholder="Password" required="required" autofocus="autofocus">
                    <label for="pw">Password</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="coPw" class="form-control" placeholder="Password" required="required" autofocus="autofocus">
                    <label for="coPw">Confirm password</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="name" class="form-control" placeholder="Name" required="required" autofocus="autofocus">
                    <label for="name">Name</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="grade" class="form-control" placeholder="Grade" required="required" autofocus="autofocus">
                    <label for="grade">Grade</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="tell" class="form-control" placeholder="Phone number" required="required">
                <label for="tell">Phone number</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="email" class="form-control" placeholder="Email address" required="required">
                <label for="email">Email address</label>
              </div>
            </div>
            <a class="btn btn-primary btn-block" href="login.html">Register</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="login.html">Login Page</a>
            <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>
</html>