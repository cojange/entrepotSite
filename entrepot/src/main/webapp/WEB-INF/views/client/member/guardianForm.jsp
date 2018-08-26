<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보호자 인증</title>
		<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
		<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>	

		<link rel="shortcut icon" href = "../image/icon.png"/>
		<link rel="apple-touch-icon" href = "../image/icon.png"/>
		<!-- [if lt IE 9]>
		<script type="text/javascript" src="/springSite/resources/include/js/html5shiv.js"></script>
		<![emdif] -->
		<!--<script type="text/javascript" src="/springSite/resources/include/js/jquery-1.12.4.min.js"></script>-->
		<script type = "text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
		<script type = "text/javascript" src="/resources/include/common/js/common.js"></script>
		<script type = "text/javascript" src="/resources/include/client/js/join.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type = "text/javascript">
		</script>
	</head>
<body>
	<h1>보호자 인증 페이지</h1>
	<img src="/resources/images/client/member.png"/>
<div class="contentContainer">
   <div class="well">
      <form id="memberForm" class="form-horizontal">
         
         <div class="form-group">   
            <div class="col-sm-offset-2 col-sm-6">
               <input type="button" value="확인" id="joinInsert" class="btn btn-default" /> 
               <input type="button" value="재작성" id="joinReset" class="btn btn-default" />
               <input type="button" value="취소" id="joinCancel" class="btn btn-default" />                  
            </div>   
         </div>                                                                              
      </form>
   </div>
</div>	
</body>
</html>