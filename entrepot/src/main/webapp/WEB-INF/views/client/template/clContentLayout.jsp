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
    <link rel="icon" href="/resources/images/favicon.ico">


    <title>앙뜨흐뽀</title>

	

    <!-- Bootstrap core CSS --> 
	

 	<link href="/resources/include/client/css/joinform.css" rel="stylesheet" type="text/css" media="all" /> 	
	
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round" rel="stylesheet" />
  	<link href="/resources/include/client/css/default.css" rel="stylesheet" type="text/css" media="all" />
 	<link href="/resources/include/client/css/list.css" rel="stylesheet" type="text/css" media="all" /> 
	<link href="/resources/include/client/css/quick.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/content.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/font/fonts.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="styleSheet" href="/resources/includ	e/client/css/normalize.css"  type="text/css" media="all"/> 
	

    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

  	<link rel="styleSheet" href="/resources/include/client/css/normalize.css"  type="text/css" media="all"/>
   <link rel="styleSheet" href="/resources/include/client/css/loginform.css"  type="text/css" media="all"/> 
  	<link rel="styleSheet" href="/resources/include/client/css/fontello-619e3562/css/animation.css"  type="text/css" media="all"/>
	<link rel="stylesheet" href="/resources/include/client/css/fontello-619e3562/css/fontello-embedded.css">
	<script type = "text/javascript" src="/resources/include/common/js/common.js"></script>

    <script src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/client/dist/assets/js/ie-emulation-modes-warning.js"></script> 
    <script src="/resources/include/client//js/header.js"></script>
    <script src="/resources/include/client//js/login.js"></script>
    <script src="/resources/include/client/js/html5shiv.js"></script>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
	
  <body>
 <div id="wrapper">
		<div id="header-wrapper"  style="position:relative;z-index:2;">
		     		<tiles:insertAttribute name="header"/>
		</div>
   		<table  class="container">
   		<tbody class="containerTbody">
   		<tr id="tr1"> 
   			<td class="containertd1">	
		     	<div >
		    		<tiles:insertAttribute name="sidebar"/>
		    	</div>
			</td>
		     <td>
		    	 <div>
		     		<%-- <div class="page-header">
		     			<h1><tiles:getAsString name="title"/></h1>
		     		</div> --%>

		     		<tiles:insertAttribute name="body"/>
		    	 </div>
		    </td>
		 </tr>
		 </tbody>	    	 
	  
	</table>


<%-- 	<div>
		<tiles:insertAttribute name="quick"/>
	</div> --%>
	<div id="footer">
	 <footer >
			<tiles:insertAttribute name="footer"/>
	</footer>
	</div>
</div>
    	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/client/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/client/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>