<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="icon" href="/resources/images/admin/adLog.ico">

    <title><tiles:getAsString name="adTitle"/></title>

    <!-- Bootstrap core CSS-->
    <link href="/resources/include/admin/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/resources/include/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="/resources/include/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/resources/include/admin/vendor/datatables/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/include/admin/css/sb-admin.min.css" rel="stylesheet">
    
    <!-- 사용자 추가사항 -->
    <link href="/resources/include/admin/css/ad-add.css" rel="stylesheet">
  </head>

  <body id="page-top">
		<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
			<tiles:insertAttribute name="adHeader"/>
    	</nav>		
		<div id="wrapper">
			<tiles:insertAttribute name="adSidebar"/>
			 <div id="content-wrapper">
		
				<tiles:insertAttribute name="adContent"/>
				<tiles:insertAttribute name="adFooter"/>
        	</div>
		</div>
			<tiles:insertAttribute name="adEtc"/>
	
		
		<!-- Bootstrap core JavaScript-->
	    <script src="/resources/include/admin/vendor/jquery/jquery.min.js"></script>
	    <script src="/resources/include/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="/resources/include/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Page level plugin JavaScript-->
	    <script src="/resources/include/admin/vendor/chart.js/Chart.min.js"></script>
	    <script src="/resources/include/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	    <script src="/resources/include/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	    <script src="/resources/include/admin/vendor/datatables/dataTables.bootstrap.js"></script>
		
	    <!-- Custom scripts for all pages-->
	    <script src="/resources/include/admin/js/sb-admin.min.js"></script>
	
	    <!-- Demo scripts for this page-->
	    <script src="/resources/include/admin/js/demo/datatables-demo.js"></script>
	    <script src="/resources/include/admin/js/demo/chart-area-demo.js"></script> 
	    
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script>  
	    <script type="text/javascript">
	    	$(function(){
	    		printClock();	    	
	    		
	    		/* $("#partner").change(function(){
	    			var adTbody = "";
	    			var addTbody = "";
		    		var choiceText = $("#partner option:selected").val();
		    		if(choiceText=="magazine"){
		        		console.log("잡지");
		        		adTbody = "";
		        		adTable = "<thead><tr><th>거래처명</th><th>담당자 이름</th><th>담당자 연락처</th><th>담당자 email</th><th>거래시작일</th><th>거래종료일</th></tr></thead>";
		        		adTable += "<tfoot><tr><th>거래처명</th><th>담당자 이름</th><th>담당자 연락처</th><th>담당자 email</th><th>거래시작일</th><th>거래종료일</th></tr></tfoot>";
	                  	adTable += "<tbody><c:choose><c:when test='${not empty magPartnerList}'><c:forEach var='magPartner' items='${magPartnerList}' varStatus='status'>";
	                  	adTable += "<tr class='tac' data-num='${status.count}'><td>${magPartner.com_name}</td><td>${magPartner.char_manager}</td><td>${magPartner.char_tel}</td>";
	                  	adTable += "<td>${magPartner.char_email}</td><td>${magPartner.startdate}</td><td>${magPartner.enddate}</td></tr></c:forEach></c:when><c:otherwise>";
	                  	adTable += "<tr><td colspan='4' class='tac'>등록된 게시물이 존재하지 않습니다.</td></tr></c:otherwise></c:choose></tbody>";
		        		adTbody = "<tr><td>Tiger Nixon</td><td>System Architect</td><td>Edinburgh</td><td>61</td><td>2011/04/25</td><td>$320,800</td></tr>";
		        		adTbody += "<tr><td>Garrett Winters</td><td>Accountant</td><td>Tokyo</td><td>63</td><td>2011/07/25</td><td>$170,750</td></tr>";
		        		adTbody += "<tr><td>Ashton Cox</td><td>Junior Technical Author</td><td>San Francisco</td><td>66</td><td>2009/01/12</td><td>$86,000</td></tr>";
		        		
			    		
		        	}else if(choiceText=="courier"){
		        		console.log("택배");
		        		adTbody = "";
		        		adTable = "";
		        		adTable = "<thead><tr><th>Name</th><th>Position</th><th>Office</th><th>Age</th><th>Start date</th><th>Salary</th></tr></thead>";
	                  	adTable += "<tfoot><tr><th>Name</th><th>Position</th><th>Office</th><th>Age</th><th>Start date</th><th>Salary</th></tr></tfoot>";
		        		adTable += "<tbody><tr><td>혜주</td><td>System Architect</td><td>Edinburgh</td><td>61</td><td>2011/04/25</td><td>$320,800</td></tr>";
		        		adTable += "<tr><td>으어어어아어ㅐㅓ</td><td>Accountant</td><td>Tokyo</td><td>63</td><td>2011/07/25</td><td>$170,750</td></tr>";
		        		adTable += "<tr><td>ㅇㅅㅇ</td><td>Junior Technical Author</td><td>San Francisco</td><td>66</td><td>2009/01/12</td><td>$86,000</td></tr><tbody>";
		        		adTbody = "<tr><td>혜주</td><td>System Architect</td><td>Edinburgh</td><td>61</td><td>2011/04/25</td><td>$320,800</td></tr>";
		        		adTbody += "<tr><td>ㅇㅂㅇ</td><td>Accountant</td><td>Tokyo</td><td>63</td><td>2011/07/25</td><td>$170,750</td></tr>";
		        		adTbody += "<tr><td>ㅇㅅㅇ</td><td>Junior Technical Author</td><td>San Francisco</td><td>66</td><td>2009/01/12</td><td>$86,000</td></tr>";
		        		
		        	
		        	}
		    		var addTbody = $(adTbody);
		    		
		    		$("#tbody").html(addTbody);
		    		
	    		}); */
	    	});
	    </script>
  </body>

</html>
