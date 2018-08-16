<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!--     <link rel="icon" href="/resources/images/icon.png"> -->

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
	<link href="/resources/include/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="/resources/include/assets/css/sticky-footer-navbar.css" rel="stylesheet">
    <link href="/resources/include/assets/css/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <!-- hearder.jsp에 설정 (상단 메뉴영역) / tiles-setting.xml에 내용에 해당하는 속성 설정 -->
      <tiles:insertAttribute name="header" />
    </nav>
    
    <!-- Begin page content -->
    <div class="container">
       <div class="page-header">
         <div class="jumbotron">
           <h1>뚠뚠한 개미</h1>
           <p>개미는 뚠뚠 오늘도 뚠뚠 열심히 일을 하네~</p>
           <!-- <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p> -->
         </div><!-- /.page-header -->
       </div><!-- /.jumbotron -->
       <div class="row">
         <div class="col-md-4">
           <h2>게시판 관리</h2>
           <p>처음으로 만든 게시판. 이미지 첨부가 가능한 게시판. 입력/수정/삭제 및 댓글 작성까지 처리 완료.</p>
           <p><a class="btn btn-default" href="/board/boardList.do" role="button">게시판 &raquo;</a></p>
         </div>
         <div class="col-md-4">
           <h2>갤러리 게시판 관리</h2>
           <p>썸네일 처리 개시판. 입력 처리 완료. lightbox 처리.</p>
           <p><a class="btn btn-default" href="/gallery/galleryList.do" role="button">갤러리 게시판 &raquo;</a></p>
         </div>
         <div class="col-md-4">
           <h2>로그인 및 회원 관리</h2>
           <p>회원 가입/정보 수정/회원 탈퇴 처리 완료. 로그인 및 로그아웃 처리 완료.</p>
           <p><a class="btn btn-default" href="#" role="button">로그인 및 회원 &raquo;</a></p>
         </div>
       </div><!-- /.row -->
   </div><!-- /.container -->
    <footer class="footer">
      <!-- footer.jsp에 설정 / tiles-setting.xml에 내용에 해당하는 속성 설정 -->
      <tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/assets/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>