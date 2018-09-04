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
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script>
	    <script type="text/javascript" src="/resources/include/common/js/common.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/ad-clock.js"></script> 
	    <script type="text/javascript" src="/resources/include/admin/js/ad-newDataTable.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/card-slide.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/couponList.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/regulationsList.js"></script>
	    <script type="text/javascript" src="/resources/include/common/js/jquery.form.min.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/json2html/subTable.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/json2html/mainDt.js"></script>
	    <script type="text/javascript" src="/resources/include/admin/js/json2html/json2table.js"></script>
	    <script type="text/javascript" src="/resources/include/common/js/paging.js"></script>
	    <script type="text/javascript">
	    var addTable;
	    var table;
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
	       					})
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
	    			//admin 삭제시 선택하기
	    			$("#adminTable tbody").on("click","tr", function(){
	    				$(this).toggleClass('adt');
	    				$(this).parent().find("tr").not(this).removeClass("adt");
	    			});
	    			
					//admin 해고버튼
	    		 	$("#adminFire").click(function(){
	    				var adminNo = $("#adminTable").find("tr.adt").children().eq(2).html();
	    				console.log("admin no : " + adminNo)
	
	    				$.ajax({
	    					url:"/admin/ctrl/adMember/delAdmin.do",
	    					type:'post',
	    					data:'ad_id='+adminNo,
	    					dataType:"text",
	    					error:function(){
	    						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");	
	    					},
	    					success: function(result){
	    						if(result == "success"){
	    							alert("직원 정보를 삭제 하였습니다.");
	    							location.href = "/admin/ctrl/adMember/adMemberCtrl.do";
	    						}else{
	    							alert("직원 정보를 삭제하는데 오류가 생겼습니다.");
	    						}
	    					}	
	    				})
	    				
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
	        		
	        		/** 잡지거래처 상세정보 **/
	    			var currLiMg;
	    			/* 테이블 선택행 블록처리 */
	    			$("#dataTable").on("click","tr",function(){
	    				console.log("this:"+$(this).html());
	    				if ( $(this).hasClass('selected') ) {
	    		            $(this).removeClass('selected');
	    		            currLiMg="";
	    		        }
	    		        else {
	    		            $('#dataTable tr.selected').removeClass('selected');
	    		            $(this).addClass('selected');
	    		            currLiMg= $(this);
	    		        }	    				
	    			});
	    			$("#mgDetailBtn").click(function(){
	    				mgDetail(currLiMg);
	    			});
	    			/* 잡지거래처 상세정보창에서 수정버튼 클릭 */
	    			$(document).on('click', ".mgUpdateForm", function(){
	    				console.log("가");
	    				$(".magazineUpBtn").removeClass("mgUpdateForm");
	    				$(".magazineUpBtn").addClass("mgUpdateSave");
	    				mgUpdate(currLiMg);
	    			});
	    			/* 잡지거래처 수정창에서 수정버튼 클릭 */
	    			$(document).on('click', ".mgUpdateSave", function(){
	    				if(!chkData($('#upMgDate'),"거래종료일을")) return;
	      				else if(!chkData($('#upCharName'),"담당자 이름을")) return;
	      				else if(!chkData($('#upCharTel'),"담당자 연락처를")) return;
	      				else if(!chkData($('#upCharEmail'),"담당자 이메일을")) return;
	      				else if(!chkData($('#upCharFax'),"담당자 팩스를")) return;
	      				else if(!chkData($('#upAccName'),"회계부 담당자 이름을")) return;
	      				else if(!chkData($('#upAccTel'),"회계부 담당자 연락처를")) return;
	      				else if(!chkData($('#upAccEmail'),"회계부 담당자 이메일을")) return;
	      				else if(!chkData($('#upAccFax'),"회계부 담당자 팩스를")) return;
	      				else{
	      					//해야될것
	      					$("#magUpdateSaveForm").attr({
	      						"method":"POST",
	      						"action":"/board/boardUpdate.do"
	      					});
	      					$("#magUpdateSaveForm").submit();
	      				}
	    			});
	    			
	        		
	    			/** 택배거래처 상세정보 **/
	    			var currLi;
	    			/* 테이블 선택행 블록처리 */
	    			$("#adminTable").on("click","tr",function(){
	    				console.log("this:"+$(this).html());
	    				if ( $(this).hasClass('selected') ) {
	    		            $(this).removeClass('selected');
	    		            currLi="";
	    		        }
	    		        else {
	    		            $('#adminTable tr.selected').removeClass('selected');
	    		            $(this).addClass('selected');
	    		            currLi= $(this);
	    		        }	    				
	    			});
	    			$("#couDetailBtn").click(function(){
	    				couDetail(currLi);
	    			});
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
	    			
		    		nowTime1();
	    			$("#abToday").html("<td colspan='3'>등록일 : "+today1+" | 수정일 : - </td>");
	    			
	    			/* 게시글 등록 */
	    			$("#abSaveBtn").click(function(){
	    				/* if($("#file1").val()!=null && $("#file1").val()!=""){
	    					$("#file1").attr( 'name', 'file1' );
	    				}
						if($("#file2").val()!=null && $("#file2").val()!=""){
							$("#file2").attr( 'name', 'file2' );
	    				} */
	    				console.log($("#file1").val());
	    				console.log($("#file2").val());
	    				//입력값 체크
	      				if(!chkData($('#ab_title'),"이름을")) return;
	      				else if(!chkData($('#ab_content'),"제목을")) return;
	      				else if(!chkData($('#ab_content'),"작성할 내용을")) return;
	      				else if(!chkData($('#ad_id'),"아이디를")) return;
	      				else{
	      					var insertUrl = "/admin/adBoard/adminBoard/adboardInsert.do";
	      					var abtype = $('select[name=ab_type]').val();
	      					var abpre = $('select[name=ab_pre]').val();
	      					console.log(abtype);
	      					console.log(abpre);
	      					$("#adBoardForm").ajaxForm({
	      						url :insertUrl,
	        					type:"post",
	        					enctype : "multipart/form-data",
    							dataType:"text",
    							error:function(){
    								alert("시스템 오류입니다. 관리자에게 문의하세요.");
    							},success:function(resultData){
    								console.log(resultData);
    								
    								if(resultData=='SUCCESS'){
    									alert("새로운 게시글을 등록 하였습니다.");
    									location.href="/admin/adBoard/adminBoard/adminBoardList.do";
    								}else {
    									alert("게시글 등록에 실패하였습니다.");
    								}
    							}
	      					});
	      					$("#adBoardForm").submit();
	      				}
	    			});
	    			
	    			$("#abResetBtn").click(function(){
	    				resetData();
	    			});
	    			
	    			//모든 데이터 지우기
	    			function resetData(){
	    				$("#adBoardForm").each(function(){
	    					this.reset();
	    				});
	    			}
	    			
	    			var currLi;
	    			/* 테이블 선택행 블록처리 */
	    			$("#dataTable").on("click","tr",function(){
	    				console.log("this:"+$(this).html());
	    				if ( $(this).hasClass('selected') ) {
	    		            $(this).removeClass('selected');
	    		            currLi="";
	    		        }
	    		        else {
	    		            $('#dataTable tr.selected').removeClass('selected');
	    		            $(this).addClass('selected');
	    		            currLi= $(this);
	    		        }	    				
	    			});
	    			$("#upAb").click(function(){
	    				abUpdate(currLi);
	    			});
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
    			$("#anotherDate").hide();
    			
    			//전체 및 최근 일자 조회
    			$("#searchDate input[type='radio']").not($("#etcDate")).click(function(){
    				$("#anotherDate").fadeOut();
    				console.log("aa");
    				//본테이블 만들기
    				$("#searchDate").ajaxForm({
						url:"/admin/order/orderList/searchDate.do",
						type:"post",
						dataType:"json",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},success:function(mainElements){
							
							var newDt= mainDt(mainElements);
							$("#switchDiv").html("");
							$("#switchDiv").html(newDt);
							
							table =$(".orderList").DataTable( {
		    			        "order": [[1, 'asc']]
		    			    } );
							
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
						}
					});//ajax 끝
					$("#searchDate").submit();
    			})//전체 및 최근 일자 조회
    			
    			//달력보여주기
    			$("#etcDate").click(function(){
    				$("#anotherDate").fadeIn();
    			})
    			//날짜 지정 search
    			$("#submitAnother").click(function(){
    				console.log("test");
    				if(!chkDate($(".anotherValue").eq(0),$(".anotherValue").eq(1))){
    					console.log("aa");
    					return;
    				}
    				$("#anotherDate").ajaxForm({
						url:"/admin/order/orderList/searchDate.do",
						type:"post",
						dataType:"json",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},success:function(mainElements){
							
							var newDt= mainDt(mainElements);
							$("#switchDiv").html("");
							$("#switchDiv").html(newDt);
							
							table =$(".orderList").DataTable( {
		    			        "order": [[1, 'asc']]
		    			    } );
							
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
						}
					});//ajax 끝
    				$("#anotherDate").submit();
    			})
    			
    			// 전체 테이블 데이터 테이블즈    	   	    	
    	   	    	 table = $(".orderList").DataTable( {
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
			
    	   	    //판매 현황
    	   	    var columns = ['품번','품명','거래처','담당자','연락처','email','총 수량','총 금액','비 고'];
    	   	    
    	   	    var productTableURL = "/admin/order/orderList/getKindOrder.do";
    	   	    $("#selectkey").change(function(){
    	   	    	//모달이 숨겨저 ㅇ잇으면
    	   	    	$("#orderWaitModal:hidden").find("#refundChangeDiv").html("");
    	   	    	$("#refundChangeBtn").prop("disabled",true);
    	   	    	$("#orderConfirmBtn").prop("disabled",true);
    	   	    	$("#orderChangeBtn").prop("disabled",true);
    	   	    	$("#kindOrder").ajaxForm({
    	   	    		url:productTableURL,
    	   	    		type:'post',
    	   	    		dataType:'json',
    	   	    		error:function(){
    	   	    			alert("시스템 오류입니다. 관리자에게 문의하세요.");
    	   	    		},
    	   	    		success:function(jsonElements){
    	   	    			var j2t = json2Table(jsonElements,columns,"table-striped","deteilOrder","orderProductTable");
    	   	    			$("#switchDiv2").html("");
    	   	    			$("#switchDiv2").html(j2t);
    	   	    			paging($("#orderProductTable"), $("#orderProductTable tbody tr"));
    	   	    		}
    	   	    	})
    	   	    	$("#kindOrder").submit();
    	   	    })
    	   	    
    	   	    //paging    
    			paging($("#orderProductTable"), $("#orderProductTable tbody tr"));
    	   	    
    	   	    
    	   	    var kind;
    	   	    var magazine;
    	   	//교환 환불 처리 클릭
    	   	    $(document).on("click","#orderProductTable tr.deteilOrder",function(){
    	   	    	
    	   	    	kind = $(this).children().eq(8).html()
    	   	    	magazine=$(this).children().eq(0).html();
    	   	    	var fkind = kind.substr(0,2);
    	   	    	var bkind = kind.substr(2,2);
    	   	    	
    	   	    	
    	   	    	if((fkind == '교환' || fkind =='환불') && bkind == "대기"){
    	   	    		console.log("subtable : " + kind);
    	   	    		$("#refundChangeBtn").prop("disabled",false);
    	   	    		var columns = [];
    	   	    		
    	   	    		if(fkind =='교환'){
    	   	    			columns=['check','교환번호','요청자','사유','수량','일자'];
    	   	    			$.ajax({
    	   	    				url:"/admin/order/orderList/getChange.do",
    	   	    				type:"post",
    	   	    				data:"keyword="+kind+"&search="+magazine,
    	   	    				dataType:'json',
    	   	    				error:function(){
    	   	    					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
    	   	    				},
    	   	    				success:function(jsonElements){
    	   	    					var tableHTML = json2Table(jsonElements,columns,"table-bordered","changeColumn","changeTable");
    	   	    					$("#refundChangeDiv td:eq(3)").css("width","66%");
    	   	    					$("#refundChangeDiv").html(tableHTML);
    	   	    					//행선택시 표시
        	   	    				$("#refundChangeDiv").on("click","table input.chkbox",function(){
        	   	    					$(this).parent().parent().toggleClass("adt");
        	   	    					
        	   	    				});  	
    	   	    				}
    	   	    			})
    	   	    			
    	   	    		
    	   	    		}else if(fkind='환불'){
    	   	    			 columns = ['check','환불번호','요청자','사유','은행명','계좌번호','주문번호'];
    	   	    			$.ajax({
        	   	    			url:"/admin/order/orderList/getRefund.do",
        	   	    			type:"post",
        	   	    			data:"keyword="+kind+"&search="+magazine,
        	   	    			dataType:'json',
        	   	    			error:function(){
        	   	    				alert("시스템 오류입니다. 관리자에게 문의하세요.");
        	   	    			},
        	   	    			success:function(jsonElements){
        	   	    				var tableHTML = json2Table(jsonElements,columns,"table-bordered","refundColumn","refundTable");
        	   	    				$("#refundChangeDiv").html(tableHTML);
        	   	    				//사유 td 만 width 값제어하기
        	   	    				 $("#refundChangeDiv td:eq(3)").css("width","66%");
        	   	    				
        	   	    				//행선택시 표시
        	   	    				$("#refundChangeDiv").on("click","table input.chkbox",function(){
        	   	    					$(this).parent().parent().toggleClass("adt");
        	   	    					
        	   	    				});  				
        	   	    			}
        	   	    		})
    	   	    		}		
    	   	    	}else{
    	   	    		$("#refundChangeBtn").prop("disabled",true);
    	   	    	} 
    	   	    	if(kind=='주문대기'){
    	   	    			$("#refundChangeBtn").prop("disabled",true);
    	   	    			$("#orderChangeBtn").prop("disabled",true);
    	   	    			$("#orderConfirmBtn").prop("disabled",false);			
    	   	    	}else {
    	   	    		$("#orderConfirmBtn").prop("disabled",true);	
    	   	    	}
    	   	    	if(fkind!='교환'&&fkind!='환불'&&fkind!='주문'){
    	   	    		$("#orderChangeBtn").prop("disabled",false);
    	   	    		
    	   	    		
    	   	    		
    	   	    	}else{
    	   	    		$("#orderChangeBtn").prop("disabled",true);
    	   	    	}
    	   	    		
    	   	    	
    	   	    })
    	   	    
    	   	    $("#submitUserOrder").click(function(event){
    	   	    			if(!confirm("정말 " + $(this).prev().val()+"로 수정 하시겠습니까.")){
    	   	    				return;
    	   	    			}
    	   	    			$("#orderChangeFrm").attr({
        	    	   	    	"action" : "/admin/order/orderList/userChangeOrder.do",
        	    	   	    	"method" : "get"
        	    	   	    });
    	   	    			$("#orderChangeFrm").submit();
    	   	    		})
    	   	    
    	   	    //주문 대기 물품 발주
    	   	    $("#orderConfirmBtn").click(function(){ 
    	   	    	location.href="/admin/order/orderList/confirmOrder.do?keyword="+kind+"&search="+magazine;
    	   	    })
    	    	   	    
    	   	    //check box 클릭시
    	   	    $("#refundChangeDiv").one("click","input.chkbox",function(){
    	   	    	$(".cancelReq").prop("disabled",false);
    	   	    	console.log("click");
    	   	    });
    	   	    //부여한 adt 클래스 tr은 환불 취소
    				$(".cancelReq").click(function(){
    					var refList = $("#refundChangeDiv table tr.adt");
    					if(refList.length >0){
   	    					var dataList = [];
   	    					for(var i=0; i<refList.length; i++){
   	    						dataList.push(refList.eq(i).children().eq(1).html());
   	    					}
   	    					console.log(dataList);
   	    					//환불 거절 요청
   	    					$.ajaxSettings.traditional = true;
   	    					var removeTr = $(this).prev().find("tr.adt");
   	    					
   	    					if(refList.parents("table.table-bordered").attr("id")=="refundTable"){
   	    						$.ajax({
   	   	    						url:"/admin/order/orderList/cancelRefund.do",
   	   	    						type:"post",
   	   	    						data: {refundNum : dataList},
   	   	    						dataType:"text",
   	   	    						error:function(){
   	   	    							alert("시스템 오류입니다. 관리자에게 문의하세요.");
   	   	    						},
   	   	    						success: function(result){
   	   	    							if(result == 'success'){
   	   	    								alert("해당 요청 건에 대하여 승인 거절 하였습니다.");
   	   	    								//처리된 행 지우기;
   	   	    								removeTr.hide();
   	   	    								removeTr.removeClass("adt");
   	   	    								
   	   	    							}else{
   	   	    								alert("해당 요청 건을 수행하지 못하였습니다.");
   	   	    							}
   	   	    						}
   	   	    					})
   	    					}else if(refList.parents("table.table-bordered").attr("id")=="changeTable"){
   	    						$.ajax({
   	   	    						url:"/admin/order/orderList/cancelChange.do",
   	   	    						type:"post",
   	   	    						data: {changeNum : dataList},
   	   	    						dataType:"text",
   	   	    						error:function(){
   	   	    							alert("시스템 오류입니다. 관리자에게 문의하세요.");
   	   	    						},
   	   	    						success: function(result){
   	   	    							if(result == 'success'){
   	   	    								alert("해당 요청 건에 대하여 승인 거절 하였습니다.");
   	   	    							}else{
   	   	    								alert("해당 요청 건을 수행하지 못하였습니다.");
   	   	    							}
   	   	    						}
   	   	    					})
   	    					}
   	    					
   	    					
   	    				}else {
   	    					alert("선택된 데이터가 없습니다.");
   	    					return;
   	    				}
    				})
    				
    				//교환 환불 일괄 처리
    				$(".submitRC").click(function(){
    					$(".cancelReq").prop("disabled",true);
    					var refList = $("#refundChangeDiv table tr:visible");
    					if(confirm("해당 요청을 일괄 처리 하시겠습니까?")){
    						if(refList.length >0){
       	    					var dataList = [];
       	    					for(var i=1; i<refList.length; i++){
       	    						dataList.push(refList.eq(i).children().eq(1).html());
       	    					}
       	    					console.log(dataList);
       	    					//환불 승인 요청
       	    					$.ajaxSettings.traditional = true;
       	    					
       	    					 if(refList.parents("table.table-bordered").attr("id")=="refundTable"){
       	    						$.ajax({
       	   	    						url:"/admin/order/orderList/confirmRefund.do",
       	   	    						type:"post",
       	   	    						data: {refundNum : dataList},
       	   	    						dataType:"text",
       	   	    						error:function(){
       	   	    							alert("시스템 오류입니다. 관리자에게 문의하세요.");
       	   	    						},
       	   	    						success: function(result){
       	   	    							if(result == 'success'){
       	   	    								alert("해당 요청 건에 대하여 승인 하였습니다.");
       	   	    								
       	   	    							}else{
       	   	    								alert("해당 요청 건을 수행하지 못하였습니다.");
       	   	    							}
       	   	    						}
       	   	    					})
       	    					}else if(refList.parents("table.table-bordered").attr("id")=="changeTable"){
       	    						$.ajax({
       	   	    						url:"/admin/order/orderList/confirmChange.do",
       	   	    						type:"post",
       	   	    						data: {changeNum : dataList},
       	   	    						dataType:"text",
       	   	    						error:function(){
       	   	    							alert("시스템 오류입니다. 관리자에게 문의하세요.");
       	   	    						},
       	   	    						success: function(result){
       	   	    							if(result == 'success'){
       	   	    								alert("해당 요청 건에 대하여 승인 하였습니다.");
       	   	    								
       	   	    							}else{
       	   	    								alert("해당 요청 건을 수행하지 못하였습니다.");
       	   	    							}
       	   	    						}
       	   	    					})
    					}
       	    					 //저장후 다시 로딩
    										$("#orderWaitModalLabel").next().click();
	    									location.hre="/admin/order/orderList/getSell.do";
    					}
    					}
    				})

    		}
    		
    		//1대1게시판 탭
    		if($(location).attr("href") == "http://localhost:8080/admin/adBoard/personalBoard/personalBoardList.do"){
    			
    			  table = $('.table').DataTable( {
    			        "order": [[1, 'asc']]
    			    } );
    			
        		    // `d` is the original data object for the row
        		    addTable = 
        			   '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        		        '<tr>'+
        		            '<div><textarea></textarea><img></img><img></img><img></img></div>'+
        		            '<div><table><div>'
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
    		
    		//상품폼
    		if($(location).attr("href") == "http://localhost:8080/admin/magazine/adMagazine/adMagazineList.do"){
    		
				$("#mgInsert").click(function(){
					location.href="/admin/magazine/adMagazine/adMagazineInsertForm.do"
				});
    		}
    		
    		//상품 입력폼
    		if($(location).attr("href") == "http://localhost:8080/admin/magazine/adMagazine/adMagazineInsertForm.do"){
    			$('.submit').on('click',function() {        
    				console.log("aa"+$("#mulFile").eq[0].val());
                    var form = $('#uploadForm')[0];
                    var formData = new FormData(form);
        
                    for (var index = 0; index < Object.keys(files).length; index++) {
                        //formData 공간에 files라는 이름으로 파일을 추가한다.
                        //동일명으로 계속 추가할 수 있다.
                        formData.append('files',files[index]);
                    }
     
                    //ajax 통신으로 multipart form을 전송한다.
                    $.ajax({
                        type : 'POST',
                        enctype : 'multipart/form-data',
                        processData : false,
                        contentType : false,
                        cache : false,
                        timeout : 600000,
                        url : '/admin/magazine/adMagazine/imageupload.do',
                        dataType : 'JSON',
                        data : formData,
                        success : function(result) {
                            //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                            //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                            //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                            if (result === -1) {
                                alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                                // 이후 동작 ...
                            } else if (result === -2) {
                                alert('파일이 10MB를 초과하였습니다.');
                                // 이후 동작 ...
                            } else {
                                alert('이미지 업로드 성공');
                                // 이후 동작 ...
                            }
                        }
                        //전송실패에대한 핸들링은 고려하지 않음
                    });
                });
                // <input type=file> 태그 기능 구현
                $('#attach input[type=file]').change(function() {
                    addPreview($(this)); //preview form 추가하기
                });
    		}
    		
   		} );//최상위종료///////////////////////////////////////////////////////////////////
	    
	    	var files = {};
            var previewIndex = 0;
     
            // image preview 기능 구현
            // input = file object[]
            function addPreview(input) {
	            if (input[0].files) {
	                //파일 선택이 여러개였을 시의 대응
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	 
	                    if (validation(file.name))
	                        continue;
	 
	                    var reader = new FileReader();
	                    reader.onload = function(img) {
	                        //div id="preview" 내에 동적코드추가.
	                        //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                        var imgNum = previewIndex++;
	                        $("#preview")
	                                .append(
	                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
	                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
	                                                + "<p>"
	                                                + file.name
	                                                + "</p>"
	                                                + "<a href=\"#\" value=\""
	                                                + imgNum
	                                                + "\" onclick=\"deletePreview(this)\">"
	                                                + "삭제" + "</a>" + "</div>");
	                        files[imgNum] = file;
	                    };
	                    reader.readAsDataURL(file);
	                }
	            } else
	                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
            }
  			
            //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	        function deletePreview(obj) {
	            var imgNum = obj.attributes['value'].value;
	            delete files[imgNum];
	            $("#preview .preview-box[value=" + imgNum + "]").remove();
	            resizeHeight();
	        }
            
            //client-side validation
            //always server-side validation required
            function validation(fileName) {
                fileName = fileName + "";
                var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
                var fileNameExtension = fileName.toLowerCase().substring(
                        fileNameExtensionIndex, fileName.length);
                if (!((fileNameExtension === 'jpg')
                        || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                    alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                    return true;
                } else {
                    return false;
                }
            }
            
            /* 공지사항,이벤트(관리자 게시판) 수정 동적 폼 */
            function abUpdate(currLi){
            	//console.log(currLi.html());
            	var abContent = currLi.children().eq(0);
            	var abNo = currLi.children().eq(1);
            	var abPre = currLi.children().eq(3);
            	var abType = currLi.children().eq(4);
            	var abTitle = currLi.children().eq(5);
            	var abDate = currLi.children().eq(6);
            	var abUpdate = currLi.children().eq(7);
            	var abId = currLi.children().eq(8);
            	var file1 = currLi.children().eq(9);
            	var file2 = currLi.children().eq(10);
            	
          		//console.log(abNo.html());
            	/* 파일명과 확장자만 추출 */
            	var idx1 = (file1.html()).lastIndexOf("_");
            	var file11 = (file1.html()).substring(idx1+1);
            	var idx2 = (file2.html()).lastIndexOf("_");
            	var file22 = (file2.html()).substring(idx2+1);
            	
            	//console.log("file11:"+file11);
            	//console.log("idx1:"+idx1);
            	
            	var rowUp;
            	nowTime();
            	
           		rowUp = "<table style='width: 600px;'><colgroup><col width='10%'><col width='30%'><col width='70%'></colgroup>";
           		rowUp += "<tr>등록일 : "+abDate.html()+" | 수정일 : "+today+" | 글번호 : "+abNo.html()+"</tr><tr><td colspan='2'>글유형  : <select id='ab_type' name='ab_type'>";
           		rowUp += "<option value='공지사항'>공지사항</option><option value='이벤트'>이벤트</option></select><br/>";
           		rowUp += "<span style='font-size:12px;'>기존 유형 : "+abType.html()+"</span></td>";
           		rowUp += "<td>제목 : <input type='text' id='ab_title' name='ab_title' value="+abTitle.html()+"></td></tr>";
           		rowUp += "<tr><td colspan='1' style='vertical-align: middle;'>내용 : </td><td colspan='2'>";
           		rowUp += "<textarea rows='5' cols='50' id='ab_content' name='ab_content'>"+abContent.html()+"</textarea>";
           		rowUp += "</td></tr><tr><td colspan='3'>첨부파일(팝업) : <input type='file' id='file1'><br/>";
           		rowUp += "<span style='font-size:12px;' class='fileImg'>기존 파일 : "+file11+"</span>";
           		rowUp += "<div class='fileImgShow' style='display:none;'><img style='width:500px; hight:500px;' src='/uploadStorage/adminBoardPopup/abPop/"+file1.html()+"' style='display:none;'></div>";
           		rowUp += "</td></tr><tr><td colspan='3'>첨부파일(게시글) : <input type='file' class='file2'><br/><span style='font-size:12px;' class='fileImg'>기존 파일 : "+file22+"</span>";
           		rowUp += "<div class='fileImgShow' style='display:none;'><img style='width:500px; hight:500px;' src='/uploadStorage/adminBoardImg/abImg/"+file2.html()+"' style='display:none;'></div>";
           		rowUp += "</td></tr><tr><td colspan='2'>게시유형  : <select id='ab_pre' name='ab_pre'><option value='일반'>일반</option>";
           		rowUp += "<option value='팝업'>팝업</option><option value='상단고정'>상단고정</option></select>";
           		rowUp += "<br/><span style='font-size:12px;'>기존 유형 : "+abPre.html()+"</span></td><td>아이디 : "+abId.html()+"</td></tr><tfoot>";
           		rowUp += "<tr><td colspan='3'><input type='button' id='abUpdateBtn' value='수정'>	<input type='button' id='abResetBtn' value='초기화'>";
           		rowUp += "</td></tr></tfoot></table>";
				
           		$(document).on('mouseenter', '.fileImg', function() {
           			$(this).next().css("display", "block");
           		});
           		$(document).on('mouseleave', '.fileImg', function() {
           			$(this).next().css("display", "none");
           		});
           		
           		
            	$("#adBoardForm").html(rowUp);
            }
            
            /* 잡지거래처 상세 정보 */
            function mgDetail(currLiMg){
            	console.log(currLiMg.html());
            	var comName = currLiMg.children().eq(0);
            	var charManager = currLiMg.children().eq(1);
            	var charTel = currLiMg.children().eq(2);
            	var charEmail = currLiMg.children().eq(3);
            	var startdate = currLiMg.children().eq(4);
            	var enddate = currLiMg.children().eq(5);
            	var mcomDate = currLiMg.children().eq(6);
            	var mcomUpdate = currLiMg.children().eq(7);
            	var comNo = currLiMg.children().eq(8);
            	var mcomName = currLiMg.children().eq(9);
            	var mcomTel = currLiMg.children().eq(10);
            	var mcomAdd = currLiMg.children().eq(11);
            	var charFax = currLiMg.children().eq(12);
            	var accManager = currLiMg.children().eq(13);
            	var accTel = currLiMg.children().eq(14);
            	var accEmail = currLiMg.children().eq(15);
            	var accFax = currLiMg.children().eq(16);
            	var baccBank = currLiMg.children().eq(17);
            	var baccName = currLiMg.children().eq(18);
            	var baccAccno = currLiMg.children().eq(19);
            	var rzipCode = currLiMg.children().eq(20);
            	var raddress = currLiMg.children().eq(21);
            	
            	var rowUp;            	
           		rowUp = "<table><tr><td>등록일 : "+mcomDate.html()+" | 수정일 : "+mcomUpdate.html()+"</td></tr>";
           		rowUp += "<tr><td>사업자 번호 : "+comNo.html()+"</td><td>거래시작일 : "+startdate.html()+" | 거래종료일 : "+enddate.html()+"</td></tr>";
           		rowUp += "<tr><td>회사명 : "+comName.html()+"</td></tr><tr><td>대표 이름 : "+mcomName.html()+"</td><td>대표 연락처 : "+mcomTel.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2'>회사 주소 : "+mcomAdd.html()+"</td></tr><tr><td><label>담당자</label></td></tr>";
           		rowUp += "<tr><td width='50%'>이름 : "+charManager.html()+"</td><td width='50%'>연락처 : "+charTel.html()+"</td></tr>";
           		rowUp += "<tr><td width='50%'>e-mail : "+charEmail.html()+"</td><td width='50%'>fax : "+charFax.html()+"</td></tr>";
           		rowUp += "<tr><td><label>회계부 담당자</label></td></tr>	<tr><td width='50%'>이름 : "+accManager.html()+"</td>";
           		rowUp += "<td width='50%'>연락처 : "+accTel.html()+"</td>	</tr><tr><td width='50%'>e-mail : "+accEmail.html()+"</td>";
           		rowUp += "<td width='50%'>fax : "+accFax.html()+"</td></tr><tr><td>계좌 : ["+baccBank.html()+" / "+baccName.html()+"] "+baccAccno.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2'>환불주소 : ["+rzipCode.html()+"] "+raddress.html()+"</td></tr></table>";   		
           		
            	$("#mgContent").html(rowUp);
            }
            
            /* 택배거래처 상세 정보 */
            function couDetail(currLi){
            	console.log(currLi.html());
            	var couaccName = currLi.children().eq(0);
            	var couaccArea = currLi.children().eq(1);
            	var charManager = currLi.children().eq(2);
            	var charTel = currLi.children().eq(3);
            	var couaccCnt = currLi.children().eq(4);
            	var couaccCost = currLi.children().eq(5);
            	var startdate = currLi.children().eq(6);
            	var enddate = currLi.children().eq(7);
            	var couaccDate = currLi.children().eq(8);
            	var couaccUpdate = currLi.children().eq(9);
            	var comNo = currLi.children().eq(10);
            	var couaccTel = currLi.children().eq(11);
            	var couaccFax = currLi.children().eq(12);
            	var couaccEmail = currLi.children().eq(13);
            	
            	var rowUp;            	
           		rowUp = "<table><tr><td colspan='2'>등록일 : "+couaccDate.html()+" | 수정일 : "+couaccUpdate.html()+"</td></tr>";
           		rowUp += "<tr><td width='50%'>사업자 번호 : "+comNo.html()+"</td><td width='50%'>거래시작일 : "+startdate.html()+" | 거래종료일 : "+enddate.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2' width='50%'>회사명 : "+couaccName.html()+"</td></tr><tr><td width='50%'>계약 지역 : "+couaccArea.html()+"</td><td width='50%'>거래건수 : "+couaccCnt.html()+" (건당할인요금 : "+couaccCost.html()+"원)</td></tr>";
           		rowUp += "<tr><td colspan='2'><label>회사</label></td></tr>";
           		rowUp += "<tr><td width='50%'>연락처 : "+couaccTel.html()+"</td><td width='50%'>e-mail : "+couaccEmail.html();
           		rowUp += "</td></tr><tr><td colspan='2'>fax : "+couaccFax.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2'><label>담당자</label></td></tr>";
           		rowUp += "<tr><td width='50%'>이름 : "+charManager.html()+"</td><td colspan='2' width='50%'>연락처 : "+charTel.html()+"</td></tr></table>";   		
           		
            	$("#couContent").html(rowUp);
            }
            
            /* 잡지거래처 정보 수정 */
            function mgUpdate(currLiMg){
            	console.log(currLiMg.html());
            	var comName = currLiMg.children().eq(0);
            	var charManager = currLiMg.children().eq(1);
            	var charTel = currLiMg.children().eq(2);
            	var charEmail = currLiMg.children().eq(3);
            	var startdate = currLiMg.children().eq(4);
            	var enddate = currLiMg.children().eq(5);
            	var mcomDate = currLiMg.children().eq(6);
            	var mcomUpdate = currLiMg.children().eq(7);
            	var comNo = currLiMg.children().eq(8);
            	var mcomName = currLiMg.children().eq(9);
            	var mcomTel = currLiMg.children().eq(10);
            	var mcomAdd = currLiMg.children().eq(11);
            	var charFax = currLiMg.children().eq(12);
            	var accManager = currLiMg.children().eq(13);
            	var accTel = currLiMg.children().eq(14);
            	var accEmail = currLiMg.children().eq(15);
            	var accFax = currLiMg.children().eq(16);
            	var baccBank = currLiMg.children().eq(17);
            	var baccName = currLiMg.children().eq(18);
            	var baccAccno = currLiMg.children().eq(19);
            	var rzipCode = currLiMg.children().eq(20);
            	var raddress = currLiMg.children().eq(21);
            	
            	var rowUp;
            	nowTime();
         	
           		rowUp = "<form class='magUpdateSaveForm'><table><tr><td>등록일 : "+mcomDate.html()+" | 수정일 : "+today+"</td></tr>";
           		rowUp += "<tr><td>사업자 번호 : "+comNo.html()+"</td><td>거래시작일 : "+startdate.html()+" | 거래종료일 : ";
           		rowUp += "<input type='date' id='upMgDate' name='enddate' value='20"+enddate.html()+"'><input type='checkbox' id='mgEndCheck' name='mgEndCheck'></td></tr>";
           		rowUp += "<tr><td>회사명 : "+comName.html()+"</td></tr><tr><td>대표 이름 : "+mcomName.html()+"</td><td>대표 연락처 : "+mcomTel.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2'>회사 주소 : "+mcomAdd.html()+"</td></tr><tr><td><label>담당자</label></td></tr>";
           		rowUp += "<tr><td width='50%'>이름 : <input type='text' id='upCharName' name='char_manager' value='"+charManager.html()+"'></td>";
           		rowUp += "<td width='50%'>연락처 : <input type='text' id='upCharTel' name='char_tel' value='"+charTel.html()+"'></td></tr>";
           		rowUp += "<tr><td width='50%'>e-mail : <input type='text' id='upCharEmail' name='char_email' value='"+charEmail.html()+"'></td>";
           		rowUp += "<td width='50%'>fax : <input type='text' id='upCharFax' name='char_fax' value='"+charFax.html()+"'></td></tr>";
           		rowUp += "<tr><td><label>회계부 담당자</label></td></tr>	<tr><td width='50%'>이름 : <input type='text' id='upAccName' name='acc_manager' value='"+accManager.html()+"'></td>";
           		rowUp += "<td width='50%'>연락처 : <input type='text' id='upAccTel' name='acc_tel' value='"+accTel.html()+"'></td></tr>";
           		rowUp += "<tr><td width='50%'>e-mail : <input type='text' id='upAccEmail' name='acc_email' value='"+accEmail.html()+"'></td>";
           		rowUp += "<td width='50%'>fax : <input type='text' id='upAccFax' name='acc_fax' value='"+accFax.html()+"'></td></tr><tr><td>계좌 : ["+baccBank.html()+" / "+baccName.html()+"] "+baccAccno.html()+"</td></tr>";
           		rowUp += "<tr><td colspan='2'>환불주소 : ["+rzipCode.html()+"] "+raddress.html()+"</td></tr></table></form>";   		
           		
            	$("#mgContent").html(rowUp);
            }
	    </script>
  </body>

</html>
