<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>  </title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     	 	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
    	  
     		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
     		 <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
    	 	 <!-- 모바일 웹 페이지 설정 -->
    		  <!-- 모바일 웹 페이지 설정 종료 -->

    		 <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
    		 <!-- [if lt IE 9] -->
        	 <!-- <script src="/resources/include/js/html5shiv.js"</script> -->
     		 <!-- [endif] -->
     		 <!-- 사용자 cSS-->
     	  <!-- Bootstrap core CSS-->
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
     		 <!--사용자 js-->
     	 		
	</head>
	 <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">관리자 등록</div>
        <div class="card-body">
          <form id="ad_addForm">
          	<div class="form-group">
              <div class="form-label-group">
                <input type="text" id="id" name="ad_id" class="form-control" placeholder="Id" required="required" autofocus="autofocus">
                <label for="id">아이디</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="pw" name="ad_pw" class="form-control" placeholder="Password" required="required" autofocus="autofocus">
                    <label for="pw">비밀번호</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="password" id="coPw" class="form-control" placeholder="Password Confirm" required="required" autofocus="autofocus">
                    <label for="coPw">비밀번호 확인</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="name" name="ad_name" class="form-control" placeholder="Name" required="required" autofocus="autofocus">
                    <label for="name">이름</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="grade" name="ad_grade" class="form-control" placeholder="Grade" required="required" autofocus="autofocus">
                    <label for="grade">직급</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="tell" name="ad_tell" class="form-control" placeholder="Phone number" required="required">
                <label for="tell">연락처</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="email" id="email" name="ad_email" class="form-control" placeholder="Email address" required="required">
                <label for="email">이메일</label>
              </div>
            </div>
            <a class="btn btn-primary btn-block" id="addAdmin">등록하기</a>
          </form>
          <div class="text-center">
            <a class="d-block small" id="addCansle">취소</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
	    <script src="/resources/include/admin/vendor/jquery/jquery.min.js"></script>
	    <script type="text/javascript" src="/resources/include/common/js/jquery.form.min.js"></script>
	    <script src="/resources/include/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
	    <script src="/resources/include/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
	    
	    <!-- 사용자 정의 js -->
	    <script src="/resources/include/common/js/common.js"></script>
	    <script src="/resources/include/admin/js/adLogin.js"></script>
		
		<script type="text/javascript">

		var check = 0;
		$(function(){
			$("#addCansle").click(function(){
				window.opener.location.reload();
				self.close();
			})
			//아이디 중복 체크
			$("#id").blur(function(){
				spaceChange($(this));
				
				if(!inputVerify(11,"#id","아이디가","영문 숫자 혼합 6~10","admin")) return;
				var id = $("#id").val();
				if(check == 0){
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
							}else if(result=='fail'){
								alert(id + "는 중복 아이디 입니다. 다시 입력해 주세요.");
								$("#id").val("");
							}
						}
					})
				}
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
				}
			})
			
			
			$("#addAdmin").click(function(){
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
								window.opener.location.reload();
								self.close();
							}else {
								alert("관리자 등록에 실패하였습니다.");
								resetData();
							}
						}
					});//ajax 끝
					$("#ad_addForm").submit();
					
				}
			});
		});
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

		</script>  
		
	</body>
</html>