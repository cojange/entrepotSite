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
	    <script src="/resources/include/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		
	    <!-- Custom scripts for all pages-->
	    <script src="/resources/include/admin/js/sb-admin.min.js"></script>
		<script type="text/javascript" src="/resources/include/common/js/common.js"></script>
	    <!-- Demo scripts for this page-->
	    <script src="/resources/include/admin/js/demo/datatables-demo.js"></script>
	    <script src="/resources/include/admin/js/demo/chart-area-demo.js"></script> 
	    
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script>  
	    <script type="text/javascript">
	    	$(function(){
	    		printClock();	    	
	    		
	    		console.log($(location).attr("href"));
	    		
	    		//회원관리탭
	    		if($(location).attr("href") == "http://localhost:8080/admin/ctrl/adMember/adMemberCtrl.do"){
	    			$("#adminList").dataTable();
	    			$("#memberList").DataTable({
	    				destroy : true
	    			});
	    			//현재 회원관리 select 값 담기

	    			
	    			$("#mbType").change(function(){
		    			var mbType = $("#mbType").val();
		    			console.log(mbType);
		    			
		    			//기존 데이터 테이블 삭제
		    			$("#memberList").destroy();
	    				
	    				var mbListURL = "/admin/ctrl/adMember/pmlist.do";
	    				//회원 테이블 교체 ajax
	    						
	    				if(mbType == 'persnal'){
	    						$("#memberList").dataTable({
		    							ajax:{
		    							url : mbListURL,
		    							type : "post",
		    							data : 	function(d){
		    								d.mt = mbType;
		    							}
		    						},
		    						columns :[
		    							{data:"아이디"},
		    							{data:"이름"},
		    							{data:"성별"},
		    							{data:"직업"},
		    							{data:"이메일"},
		    							{data:"연락처"},
		    							{data:"등록일"},
		    							{data:"수정일"}
		    						]
		    							
	    						});//동적 데이터 테이블
	    				} else if(mbType == 'group'){
	    					$("#memberList").dataTable({
    							ajax:{
    							url : mbListURL,
    							type : "post",
    							data : 	function(d){
    								d.mt = mbType;
    							}
    						},
    						columns :[
    							{data:"아이디"},
    							{data:"이름"},
    							{data:"사업자번호"},
    							{data:"기관"},
    							{data:"이메일"},
    							{data:"연락처"},
    							{data:"등록일"},
    							{data:"수정일"}
    						]
    							
						});
	    				}
	    			});
	    		}
	    		
	    		//비용관리탭
	    		if($(location).attr("href")=="http://localhost:8080/admin/adcost/adCostList.do" ||
	    				$(location).attr("href")=="http://localhost:8080/admin/adcost/readExcel.do" ){
	    			/* if(${status} == "fail"){
	    				alert("엑셀 파일이 존재하지 않습니다.");
	    			} */
	    			
	    			//엑셀 파일 업로드
	    			$("#uploadBtn").click(function(){
	    				if($("#excelCost").val() ==""){
	    					alert("파일을 선택해 주세요.");
	    					//엑셀파일여부 유효성검사
	    				}else if(!chkExcelFile($("#excelCost"))){
	    					return;
	    				}else{
	    					$("#cost_ExcelFile").attr({
	    						"method":"POST",
	    						"action":"/admin/adcost/uploadExcel"
	    					});
	    					$("#cost_ExcelFile").submit();
	    				} 

	    			});//Excel 업로드 Btn
	    			
	    			$("#templateDown").click(function(){
	    				location.href ="/admin/adcost/downloadTemplate.do";
	    			});
	    			
	    			//card 클릭시 엑셀 로드
	    			$(".viewExcel").click(function(event){
	    				event.preventDefault();
	    				if($(this).attr("href")=="#"){
	    					return;
	    				}
	    				var formId=$("#loadExcel"+$(this).attr("href"));
	    				formId.attr({
	    					"method":"post",
	    					"action":"/admin/adcost/readExcel.do"
	    				});
	    				formId.submit();
	    			})
	    		}//비용 탭 일때 JS 
	    	});
	    </script>
  </body>

</html>
