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
    <link href="/resources/include/admin/css/card-slides.css" rel="stylesheet">
    <style type="text/css">
    	.adt{
			background-color: #ababab;
		}
    </style>
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
	    <script src="/resources/include/admin/js/dataTable-select.min.js"></script>
	    <script src="/resources/include/admin/js/demo/chart-area-demo.js"></script> 
	    
	    <!-- 사용자 정의 js -->
	    <script type="text/javascript" src="/resources/include/common/js/common.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script>  
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script> 
	    <script type="text/javascript" src="/resources/include/admin/js/ad-newDataTable.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/card-slide.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/couponList.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/regulationsList.js"></script>
	    <script type="text/javascript" src="/resources/include/common/js/jquery.form.min.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/json2html/subTable.js"></script>
	    <script type="text/javascript">
	    
	    var addTable;
	    /* input date에 현재 날짜 받아오기 */
	    	$(function(){
	    		
	    		console.log($(location).attr("href"));
	    		
	    		/* main 상단 시계 */
	    		printClock();	    	
	    	
				ad_card();   		
	    		
	    		//회원관리탭
	    		if($(location).attr("href") == "http://localhost:8080/admin/ctrl/adMember/adMemberCtrl.do"){
	    			$("#adminTable").dataTable();
	    			
	    			var gpTable = $(".switchTable").DataTable();
	      			
	      			//현재 회원관리 select 값 담기
	      			$("#mbType").change(function(){
	      				var mbType = $("#mbType").val();
	      				var mbListURL = "/admin/ctrl/adMember/pmlist.do";
	      				
	      				var column;
	      				if(mbType=='group'){
	      					column=['아이디','이름','사업자번호','기관','이메일','전화번호','등록일','수정일'];
	      				}else if(mbType=='personal'){
	      					column=['아이디','이름','성별','이메일','연락처','등급','등록일','수정일']
	      				}else {
	      					column=['회원코드','아이디','이름','직업/기관','주소','연락처','이메일','등록일']
	      				}
	      				
	      				
	      				
	      				$("#switchDiv").html("");
	      				
	      				$.getJSON(mbListURL,{
	      					mt:mbType
	      				},function(datavo){
	      					console.log(datavo.length);
	      					addNewDatatable(column,$("#switchDiv"));
	      					if(mbType=='group'){
	       					$(".switchTable").DataTable({
	       						data:datavo,
	       						columns:[
	       							{data : "m_id"},
	       							{data : "m_name"},
	       							{data : "com_no"},
	       							{data : "m_job"},
	       							{data : "m_email"},
	       							{data : "m_phone"},
	       							{data : "m_date"},
	       							{data : "m_update"}
	       						]
	       					})
	      					} else if(mbType=='personal'){
	       					$(".switchTable").DataTable({
	       						data:datavo,
	       						columns:[
	       							{data : "m_id"},
	       							{data : "m_name"},
	       							{data : "m_gender"},
	       							{data : "m_email"},
	       							{data : "m_phone"},
	       							{data : "grade"},
	       							{data : "m_date"},
	       							{data : "m_update"}
	       						]
	       					})column=['회원코드','아이디','이름','직업/기관','주소','연락처','이메일','등록일']
	      					}else {
	      						$(".switchTable").DataTable({
		       						data:datavo,
		       						columns:[
		       							{data : "m_num"},
		       							{data : "m_id"},
		       							{data : "m_name"},
		       							{data : "m_job"},
		       							{data : "m_address"},
		       							{data : "m_phone"},
		       							{data : "m_email"},
		       							{data : "m_date"}
		       						]
		       					})
	      					}
	    				});
	    			 });  		
	    			
	      			//admin 삭제시 선택하기
	    			$("#adminTable tbody").on("click","tr", function(){
	    				$(this).toggleClass('adt');
	    				$(this).parent().find("tr").not(this).removeClass("adt");
	    			});
						
	      			
	      			//admin check 변수
	    			var c=0;
					var h=0;
					var e=0;
					var c=0;
					var k=1;
					
					var message = "아이디";
	    				//아이디 중복 체크
	    				$("#id").blur(function(){
	    					spaceChange($(this));
	    					
	    					if(!inputVerify(11,"#id","아이디가","영문 숫자 혼합 6~10","admin")) return;
	    					var id = $("#id").val();
	    						$.ajax({
	    							url:"/admin/ctrl/adMember/idCheck.do",
	    							type:"post",
	    							data:"ad_id=" + id,
	    							dataType:"text",
	    							error:function(){
	    								alert("시스템 오류입니다. 관리자에게 문의하세요");
	    							},
	    							success: function(result){
	    								console.log("result : " + result);
	    								
	    								if(result=='success'){
	    									alert(id +'는 사용가능한 아이디입니다.');
	    									c=1;
	    									message="비밀번호"
	    								}else if(result=='fail'){
	    									alert(id + "는 중복 아이디 입니다. 다시 입력해 주세요.");
	    									$("#id").val("");
	    								}
	    							}
	    						})
	    					
	    				})//아이디 중복 체크
	    				
	    				//비밀번호 체크
	    				$("#coPw").blur(function(){
	    					spaceChange($("#pw"));
	    					spaceChange($(this));
	    					if(!inputVerify(1,"#pw","비밀번호가","영문 숫자, 특수문자 혼합 8~12","admin")) return;
	    					else if($("#pw").val()!=$(this).val()){
	    						alert("비밀번호 확인란과 비밀번호가 일치 하지 않습니다.");
	    						$("#coPw").val("");
	    					}else{
	    						alert("비밀번호가 일치 합니다.");
	    						h=1;
	    						message="연락처"
	    					}
	    				});
	    				$("#tell").focus(function(){
	    					console.log("tell focus");
	    				})
	    				
	    				//핸드폰 번호 체크
	    				$("#tell").blur(function(){
	    					spaceChange($("#tell"));
	    					var tell = $("#tell").val();
	    					if(!inputVerify(7,"#tell","연락처가","3-4-4","admin")) return;
	    					else {
	    						$.ajax({
	    							url:"/admin/ctrl/adMember/tellCheck.do",
	    							type:"post",
	    							data:"ad_tell=" + tell,
	    							dataType:"text",
	    							error:function(){
	    								alert("시스템 오류입니다. 관리자에게 문의하세요");
	    							},
	    							success: function(result){
	    								console.log("result : " + result);
	    								
	    								if(result=='success'){
	    									alert(tell +'은 중복되지 않은 연락처입니다.');
	    									e=1;
	    									message="이메일";
	    								}else if(result=='fail'){
	    									alert(tell + "은 중복 연락처 입니다. 다시 입력해 주세요.");
	    									$("#tell").val("");
	    								}
	    							}
	    						})
	    					}
	    				})//핸드폰 체크
	    				
	    				//이메일 체크
	    				$("#email").click(function(e){  					
	    					
	    				})//이메일 체크
	    				
	    				//등록하기(ajaxForm)
	    				$("#addAdmin").click(function(){
	    					resetData();
	    					console.log("click submit");
	    					if(emailCheck()){
	    						console.log("into if");
	    						return;
	    					}
	    					var check = c+h+e+c+k;
	    					if(check != 5){
	    						alert(message+" 입력값 중복검사 해주세요.");
		    					return;
	    				}//중복체크 검사
	    				
	    				else {
	    					$("input[type=text] ,input[type=password]").each(function(){
	    						if($(this).val()!=""){
	    							spaceChange($(this));
	    						}
	    					});
	    					if(!inputVerify(11,"#id","아이디가","영문 숫자 혼합 6~10","admin")) return;
	    					else if(!inputVerify(1,"#pw","비밀번호가","영문 숫자, 특수문자 혼합 8~12","admin")) return;
	    					else if(!inputVerify(9,"#name","이름이","3~4자리","admin")) return;
	    					else if(!chkData("#grade","직급을")) return;
	    					else if(!inputVerify(7,"#tell","연락처가","3-2-5","admin")) return;
	    					else if(!inputVerify(10,"#email","이메일이"," ","admin")) return;
	    					
	    					else{
	    						$("#ad_addForm").ajaxForm({
	    							url:"/admin/ctrl/adMember/insertAdmin.do",
	    							type:"post",
	    							dataType:"text",
	    							error:function(){
	    								alert("시스템 오류입니다. 관리자에게 문의하세요.");
	    							},success:function(result){
	    								console.log(result);
	    								
	    								if(result='success'){
	    									alert("새로운 관리자를 등록 하였습니다.");
	    									$("#adminModal").modal("hide");
	    									location.href="/admin/ctrl/adMember/adMemberCtrl.do";
	    								}else {
	    									alert("관리자 등록에 실패하였습니다.");
	    									resetData();
	    								}
	    							}
	    						});//ajax 끝
	    						$("#ad_addForm").submit();
	    						
	    					}
	    				}
	    				});//등록하기
	    			//모든 데이터 지우기
	    			function resetData(){
	    				$("#ad-addForm").each(function(){
	    					this.reset();
	    				});
	    			}
	    			//공백제거
	    			function spaceChange(target){
	    				if(target.val()!=""){
	    					target.val(getTrimStr(target.val()));
	    				}
	    			}
	    			
	    			//이메일 중복체크
	    			function emailCheck(){
	    				console.log("check email");
	    				spaceChange($("#email"));
    					var email = $("#email").val();
    					if(!inputVerify(10,"#email","이메일이"," ","admin")) return true;
    					else{
    						$.ajax({
    							url:"/admin/ctrl/adMember/emailCheck.do",
    							type:"post",
    							data:"ad_email=" + email,
    							dataType:"text",
    							error:function(){
    								alert("시스템 오류입니다. 관리자에게 문의하세요");
    							},
    							success: function(result){
    								console.log("result : " + result);
    								
    								if(result=='success'){
    									alert(email +'은 중복되지 않은 이메일 입니다.');
    									c=1;
    								}else if(result=='fail'){
    									alert(email + "은 중복 이메일 입니다. 다시 입력해 주세요.");
    									$("#email").val("");
    								}
    							}
    						})
    						return false;
    					}
	    			}

	    			
					//admin 해고버튼
	    		 	$("#adminFire").click(function(){
	    				
	    			})
	    		}
	    		
	    		//거래처 관리탭
	    		if($(location).attr("href") == "http://localhost:8080/admin/ctrl/adPartner/adPartnerListCtrl.do"){
	    			$("#adminTable").dataTable();
	    			nowTime1();
	    			$("#mcom_date").val(today1);
	    			$("#couacc_date").val(today1);
	    			/* 새창띄우기 할때 사용 
	    			$("#addMagazine").click(function(){
	    				window.open('/admin/ctrl/adPartner/magazineForm.do','_blank','width=500px, height=600px');
	    			});    
	    			$("#addCourier").click(function(){
	    				window.open('/admin/ctrl/adPartner/courierForm.do','_blank','width=500px, height=600px');
	    			}); */
					
	    			$("#couDel").click(function(){
	    				resetData2();
	    			});
	    			$("#magDel").click(function(){
	    				resetData1();
	    			});
	    			
	    			/* 잡지 거래처 등록 */
	        		$("#magInsertBtn").click(function(){
	        			console.log("가");	        			
	        			//입력값 체크
	        			if(!chkData($('#mCom_name'),"회사명을")) return;
	        			else{
	        				$("#magazineInsertForm").ajaxForm({
	        					url : "/admin/ctrl/adPartner/magazineInsert.do",
	        					type:"post",
    							dataType:"text",
    							error:function(){
    								alert("시스템 오류입니다. 관리자에게 문의하세요.");
    							},success:function(result){
    								console.log(result);
    								
    								if(result='success'){
    									alert("새로운 관리자를 등록 하였습니다.");
    									$("#magazineModel").modal("hide");
    									location.href="/admin/ctrl/adPartner/adPartnerListCtrl.do";
    								}else {
    									alert("관리자 등록에 실패하였습니다.");
    									resetData1();
    								}
    							}
	        				});
	        				$("#magazineInsertForm").submit();
	        			}
	        		});
	        		//모든 데이터 지우기
	    			function resetData1(){
	    				$("#magazineInsertForm").each(function(){
	    					this.reset();
	    				});
	    			}
	        		
	        		/* 택배 거래처 등록 */
	    			$("#couInsertForm").click(function(){
	        			console.log("나");	        			
	        			//입력값 체크
	        			if(!chkData($('#couacc_area'),"거래지역을")) return;
	        			else{
	        				$("#courierInsertForm").ajaxForm({
	        					url : "/admin/ctrl/adPartner/courierInsert.do",
	        					type:"post",
    							dataType:"text",
    							error:function(){
    								alert("시스템 오류입니다. 관리자에게 문의하세요.");
    							},success:function(result){
    								console.log(result);
    								
    								if(result='success'){
    									alert("새로운 관리자를 등록 하였습니다.");
    									$("#courierModel").modal("hide");
    									location.href="/admin/ctrl/adPartner/adPartnerListCtrl.do";
    								}else {
    									alert("관리자 등록에 실패하였습니다.");
    									resetData2();
    								}
    							}
	        				});
	        				$("#courierInsertForm").submit();
	        			}
	        		});
	        		//모든 데이터 지우기
	    			function resetData2(){
	    				$("#courierInsertForm").each(function(){
	    					this.reset();
	    				});
	    			}
	    		}
	    		
	    		//약관 관리탭
	    		if($(location).attr("href") == "http://localhost:8080/admin/adBoard/regulations/regulationsList.do"){
	    			$("#regBoard").dataTable();

		    		/* 약관추가 */
		    		addRegulation();
	    		}
	    		
	    		//공지사항,이벤트,쿠폰 관리탭 
	    		if($(location).attr("href") == "http://localhost:8080/admin/adBoard/adminBoard/adminBoardList.do"){
	    			$("#couponTable").dataTable();
	    			
	    			/* 쿠폰추가 */
		    		addCoupon();
	    		}
	    		
	    		//통계탭
	    		if($(location).attr("href")=="http://localhost:8080/admin/adChart/adChart.do"){
	    			var chartURL = "/admin/adChart/rowAndacc.do"
	    				$.getJSON(chartURL,function(columnchart){
	    					console.log(columnchart);
	    					 AmCharts.makeChart("chartdiv",
	    							{
	    								"type": "serial",
	    								"categoryField": "category",
	    								"startDuration": 1,
	    								"colors": [
	    									"#999999",
	    									"#333333",
	    									"#990000"
	    								],
	    								"categoryAxis": {
	    									"gridPosition": "start"
	    								},
	    								"trendLines": [],
	    								"graphs": [
	    									{
	    										"balloonText": "[[title]].[[category]]:[[value]]",
	    										"fillAlphas": 1,
	    										"id": "AmGraph-1",
	    										"title": "rawm",
	    										"type": "column",
	    										"valueField": "rawm"
	    									},
	    									{
	    										"balloonText": "[[title]].[[category]]:[[value]]",
	    										"fillAlphas": 1,
	    										"id": "AmGraph-2",
	    										"title": "accm",
	    										"type": "column",
	    										"valueField": "accm"
	    									}
	    								],
	    								"guides": [],
	    								"valueAxes": [
	    									{
	    										"id": "ValueAxis-1",
	    										"stackType": "regular",
	    										"title": "지출(1,000)"
	    									}
	    								],
	    								"allLabels": [],
	    								"balloon": {},
	    								"legend": {
	    									"enabled": true,
	    									"useGraphSettings": true
	    								},
	    								"titles": [
	    									{
	    										"id": "Title-1",
	    										"size": 15,
	    										"text": "원자재 & 부자재"
	    									}
	    								],
	    								"dataProvider": columnchart
	    							}
	    						);
	    					 
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

    			});	    		    		
    		}//비용 탭 일때 JS 
    		
    		//구매관리 탭
    		if($(location).attr("href")=="http://localhost:8080/admin/order/orderList/getSell.do"){
    			
    			//input date toggle
    			$("#searchDate input").click(function(){
    				if (!$("#etcDate").is(":checked")==true){
    					//다른 라디오
    					$("#searchDate input[type='date']").prop('disabled',true);
    					$(".anotherValue").removeAttr("name");
    				}else {
    					//etc 라디오
    					$(".anotherValue").eq(0).attr("name", "sDate");
    					$(".anotherValue").eq(1).attr("name", "eDate");
    					$("#searchDate input[type='date']").prop('disabled',false);
    				}
    				
    				//날짜별 search
    				if($(this).val()!='anotherDate' && $(this).val()!=""){
    					
    						$("#searchDate").ajaxForm({
	    							url:"/admin/order/orderList/searchDate.do",
	    							type:"post",
	    							dataType:"json",
	    							error:function(){
	    								alert("시스템 오류입니다. 관리자에게 문의하세요.");
	    							},success:function(result){
	    								console.log(result);
	    								
	    							}
	    						});//ajax 끝
    				
    				$("#searchDate").attr({
    					"method" : "post",
    					"action" : "/admin/order/orderList/getDateSearch"
    				}); 
    				}
    				
    			})
    			
    			// Add event listener for opening and closing details    	   	    	
    	   	    	 var table = $(".orderList").DataTable( {
    			        "order": [[1, 'asc']]
    			    } );
    			
    				//아이콘 클릭시 subtable 접기,펴기
    	   	    	$('.table tbody').on('click', 'td.details-control', function () {
    	   	    		
        	   	    	var od_num = $(this).next().html();
        	   	    	console.log("value : " + od_num);
    	   	    	console.log("뜨어엉");
    	   	    	
    				var targetTd = $(this);
    	   	    	//subtable 요청
    	   	    	var subTableURL = "/admin/order/orderList/getOrder.do";
    	   	    	$.getJSON(subTableURL,{
    	   	    		order_num:od_num
    	   	    	},function(subElements){
    	   	    		console.log("result: "+ this);
        	   	    	addTable= subtable(subElements);
        	   	    	
        	   	    	console.log(addTable);
        	   	    	//클릭시 subtable 보여주기
        	   	    	var tr = targetTd.closest('tr');
        	   	        var row = table.row( tr );
    	    	   	     if ( row.child.isShown() ) {
    	    	             // This row is already open - close it
    	    	             row.child.hide();
    	    	             if(tr.find('i').hasClass('fa-minus-circle green')){
    	    	            	 tr.find('i').removeClass('fa-minus-circle green');
    	    	            	 tr.find('i').addClass('fa-plus-circle red');	    	            	 
    	    	             }
    	    	             
    	    	         }
    	    	         else {
    	    	             // Open this row
    	    	             
    	    	             row.child(addTable).show();
    	    	             tr.find('i').removeClass('fa-plus-circle red');
    	    	             tr.find('i').addClass('fa-minus-circle green'); // FontAwesome 5
    	    	         }
    	   	    	});
    	   	    	
    	   	        
    	   	    } );//아이콘 접기,펴기
    	   	    
    	   	    //날짜별 계산
    	   	    
    			
    		}
    		
    		//1대1게시판 탭
    		if($(location).attr("href") == "http://localhost:8080/admin/adBoard/personalBoard/personalBoardList.do"){
    			
    			 var table = $('.table').DataTable( {
    			        "order": [[1, 'asc']]
    			    } );
    			
        		    // `d` is the original data object for the row
        		   var addTable = 
        			   '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        		        '<tr>'+
        		            '<div></div>'+
        		        '</tr>'+
        		    '</table>';
        		
    			// Add event listener for opening and closing details
    	   	    $('.table tbody').on('click', 'td.details-control', function () {
    	   	    	console.log("뜨어엉");
    	   	        var tr = $(this).closest('tr');
    	   	        var row = table.row( tr );
	    	   	     if ( row.child.isShown() ) {
	    	             // This row is already open - close it
	    	             row.child.hide();
	    	             if(tr.find('i').hasClass('fa-minus-circle green')){
	    	            	 tr.find('i').removeClass('fa-minus-circle green');
	    	            	 tr.find('i').addClass('fa-plus-circle red');	    	            	 
	    	             }
	    	             
	    	         }
	    	         else {
	    	             // Open this row
	    	             row.child(addTable).show();
	    	             tr.find('i').removeClass('fa-plus-circle red');
	    	             tr.find('i').addClass('fa-minus-circle green'); // FontAwesome 5
	    	         }
    	   	    } );
    		}	   		
   		} );	 
	    </script>
  </body>

</html>
