<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><tiles:getAsString name="adtitle"/></title>


  </head>

  <body>
		<div class="entre-adheader">
			<tiles:insertAttribute name="adHeader"/>
		</div>
		
		<div id="wrapper">
			<tiles:insertAttribute name="adSidebar"/>
			<tiles:insertAttribute name="adContent"/>
		</div>
		<div class="entre-adfooter">
			<tiles:insertAttribute name="adFooter"/>
		</div>
		    
  </body>

</html>
