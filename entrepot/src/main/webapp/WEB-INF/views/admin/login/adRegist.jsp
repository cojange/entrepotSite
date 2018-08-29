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
			    <!-- Bootstrap core CSS-->
    <link href="/resources/include/admin/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/resources/include/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="/resources/include/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/include/admin/css/sb-admin.min.css" rel="stylesheet">
    
    <!-- 사용자 추가사항 -->
    <link href="/resources/include/admin/css/ad-add.css" rel="stylesheet">
    <link href="/resources/include/admin/css/card-slides.css" rel="stylesheet">
     		 <!--사용자 js-->
     	 		
	</head>
	 <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">관리자 등록</div>
        <div class="card-body">
          <form>
          	<div class="form-group">
              <div class="form-label-group">
                <input type="text" id="id" name="ad_id" class="form-control" placeholder="Id" required="required">
                <label for="id">아이디</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="pw" name="ad_pw" class="form-control" placeholder="Password" required="required" autofocus="autofocus">
                    <label for="pw">비밀번호</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="coPw" class="form-control" placeholder="Password Confirm" required="required" autofocus="autofocus">
                    <label for="coPw">비밀번호 확인</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="name" name="ad_name" class="form-control" placeholder="Name" required="required" autofocus="autofocus">
                    <label for="name">이름</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="grade" name="ad_grade" class="form-control" placeholder="Grade" required="required" autofocus="autofocus">
                    <label for="grade">직급</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="tell" name="ad_tell" class="form-control" placeholder="Phone number" required="required">
                <label for="tell">연락처</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="email" name="ad_email" class="form-control" placeholder="Email address" required="required">
                <label for="email">이메일</label>
              </div>
            </div>
            <a class="btn btn-primary btn-block" id="addAdmin">등록하기</a>
          </form>
          <div class="text-center">
            <a class="d-block small" href="forgot-password.html">비밀번호 찾기</a>
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
	    <script src="/resources/include/common/js/common.js"></script>
	    <script src="/resources/include/admin/js/adLogin.js"></script>
		
		<script type="text/javascript">

		$(function(){
			$("#addAdmin").click(function(){
				if(!inputVerify(0),$("#ad_id"),"","admin") return;
				
				
			})
		})

		</script>  
		
	</body>
</html>