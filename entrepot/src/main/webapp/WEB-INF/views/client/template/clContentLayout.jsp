<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  

    <title><tiles:getAsString name="title"/></title>

	
	
  	<link href="/resources/include/client/css/default.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/list.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/resources/include/client/css/quick.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/client/dist/assets/js/ie-emulation-modes-warning.js"></script>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
<div id="wrapper">
	<div id="header-wrapper">
     	<tiles:insertAttribute name="header"/>
   	</div>
     <div class="sidebar">
    	<tiles:insertAttribute name="sidebar"/>
    </div>

     <div class="container">
     	
     	<tiles:insertAttribute name="body"/>
     </div>
</div>
	<div>
		<tiles:insertAttribute name="quick"/>
	</div>
    <footer class="footer">
     	<!-- 푸터 설정 -->
     	<tiles:insertAttribute name="footer"/>
    </footer>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/client/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/client/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>