<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
    <link href="/resources/include/client/css/joinform.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round" rel="stylesheet" />
  	<link href="/resources/include/client/css/default.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/list.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/resources/include/client/css/quick.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/content.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/font/fonts.css" rel="stylesheet" type="text/css" media="all" />
  	<link rel="styleSheet" href="/resources/include/client/css/normalize.css"  type="text/css" media="all"/>
  	<link rel="styleSheet" href="/resources/include/client/css/loginform.css"  type="text/css" media="all"/>
  	<link rel="styleSheet" href="/resources/include/client/css/fontello-619e3562/css/animation.css"  type="text/css" media="all"/>
	<link rel="stylesheet" href="/resources/include/client/css/fontello-619e3562/css/fontello-embedded.css">
<script type = "text/javascript" src="/resources/include/common/js/common.js"></script>
    <script src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/client/dist/assets/js/ie-emulation-modes-warning.js"></script> 
    <script src="/resources/include/client//js/login.js"></script>
    <script src="/resources/include/client//js/header.js"></script>
    <script src="/resources/include/client/js/html5shiv.js"></script>
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
			<tiles:insertAttribute name="header"/>	
	</div>			
	<div id="page" class="container">
		<div><a href="#" class="image image-full"><img src="/resources/images/03.jpg" alt="" /></a></div>
		<div class="column1">
			<div class="title">
				<h2>Maecenas luctus</h2>
				<span class="byline">Pellentesque lectus gravida blandit</span>
			</div>
			<p>This is <strong>Reciprocal</strong>, a free, fully standards-compliant CSS template designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. The photos in this template are from <a href="http://fotogrph.com/"> Fotogrph</a>. This free template is released under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so you're pretty much free to do whatever you want with it (even use it commercially) provided you give us credit for it. Have fun :) </p>
			<a href="#" class="button">Etiam posuere</a>
		</div>
		<div class="column3">
			<div class="title">
				<h2>Mauris vulputate</h2>
			</div>
			<img src="/resources/images/pic01.jpg" width="282" height="150" alt="" />
			<p>Phasellus tempor vehicula justo. Aliquam lacinia metus ut elit.</p>
			<a href="#" class="button">Etiam posuere</a>
		</div>
		<div class="column4">
			<div class="title">
				<h2>Praesent tempor</h2>
			</div>
			<img src="/resources/images/pic02.jpg" width="282" height="150" alt="" />
			<p>Quisque eleifend. Phasellus tempor vehicula justo. Aliquam lacinia metus.</p>
			<a href="#" class="button">Etiam posuere</a>
		</div>
	</div>
	<div id="portfolio-wrapper">
		<div id="portfolio" class="container">
			<div class="title">
				<h2>Aenean elementum</h2>
				<span class="byline">Integer sit amet pede vel arcu aliquet pretium</span> </div>
			<div class="column1">
				<div class="box">
					<span class="icon icon-cloud-download"></span>
					<h3>Vestibulum venenatis</h3>
					<p>Fermentum nibh augue praesent a lacus at urna congue rutrum.</p>
					<a href="#" class="button">Etiam posuere</a> </div>
			</div>
			<div class="column2">
				<div class="box">
					<span class="icon icon-coffee"></span>
					<h3>Praesent scelerisque</h3>
					<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
					<a href="#" class="button">Etiam posuere</a> </div>
			</div>
			<div class="column3">
				<div class="box">
					<span class="icon icon-globe"></span>
					<h3>Donec dictum metus</h3>
					<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
					<a href="#" class="button">Etiam posuere</a> </div>
			</div>
			<div class="column4">
				<div class="box">
					<span class="icon icon-dashboard"></span>
					<h3>Mauris vulputate dolor</h3>
					<p>Rutrum fermentum nibh in augue praesent urna congue rutrum.</p>
					<a href="#" class="button">Etiam posuere</a> </div>
			</div>
		</div>
	</div>
</div>
<div>
	<tiles:insertAttribute name="quick"/>
</div> 
<div id="footer">
	<tiles:insertAttribute name="footer"/>
</div>
</body>
</html>
