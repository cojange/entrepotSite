<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
		<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>	

		<link rel="shortcut icon" href = "../image/icon.png"/>
		<link rel="apple-touch-icon" href = "../image/icon.png"/>
		<!-- [if lt IE 9]>
		<script type="text/javascript" src="/springSite/resources/include/js/html5shiv.js"></script>
		<![emdif] -->
		<!--<script type="text/javascript" src="/springSite/resources/include/js/jquery-1.12.4.min.js"></script>-->
		<script type="text/javascript" src="/resources/include/client/js/find.js"></script>
		<script type = "text/javascript">
		 function errorCodeCheck(){
		    	var status = '<c:out value="${status}" />';
		    	if(status != ""){
		    	// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
			    	switch (parseInt(status)) {
			    		case 1:
			    			alert("입력정보가일치하지 않습니다 다시 입력해주세요.");
			    			break;
		    		}
		    	 }
		    }
		</script>
	</head>
<body>
	<div id="page" class="container joinform">
	  	<div class="title"> 
			<h1>아이디/비밀번호 찾기</h1>
		</div>
    <div class="contentContainer">
		<div class="content well"style="display: inline;">
		<div class="agree"> 
					<form id="idForm">
					<div class="srh_box or" style="border: solid 3px; border-radius: 20px; width: 500px; float: left;">
						<div class="srh_top">
							<h2 align="center">ID찾기</h2>  
							<p align="center">내정보에 등록한 정보로<br>아이디를 찾을 수 있습니다.</p>
						</div>
						<div align="center">
						<div class="form-group form-group-sm">
				            <label for="m_name" class="col-sm-2 control-label">이름</label>
				            <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				               <input type="text" name="m_name" maxlength="10" class="form-control inputText m_name" placeholder="이름을 입력해주세요" >
				            </div>
				            <div class="col-sm-5">
				               <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				            </div>                  
				        </div>
				        <div class="form-group form-group-sm">
				           <label for="m_phone" class="col-sm-2 control-label">가입시 전화번호</label>
				           <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				              <input type="text" id="m_phone" name="m_phone" maxlength="13" class="form-control  inputText" placeholder="전화번호를입력해주세요">   
				           </div>
				           <div class="col-sm-5">
				              <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				           </div>
				        </div> 
				        <div class="form-group form-group-sm">
				           <label for="m_email" class="col-sm-2 control-label">가입시 이메일</label>
				           <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				              <input type="text"  name="m_email" class="form-control inputText m_email" placeholder="이메일을입력해주세요">	
				           </div>
						   <div class="col-sm-3">
				              <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				           </div>
			        	</div>
			        		<input type="button" class="fun-btn" value="아이디찾기" id="idFind"/>
			        	</div>
						<!-- <div class="info">
							<form name="id_form" method="post" action="search_idpw.asp" onsubmit="return chk_idform(this)">
							<input type="hidden" name="s_type" value="id">
								<fieldset> 
									<p><label for="id_name">이름</label> <input type="text" name="m_name" id="id_name" title="이름 입력" class="inputText"></p>
									<div class="form-group form-group-sm">
			            <label for="m_phone" class="col-sm-2 control-label">핸드폰 번호</label>
			            <div class="col-sm-3">
			               <input type="text" id="m_phone" name="m_phone" maxlength="13" class="form-control  inputText" placeholder="Phone Number">   
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div> 
									<p><label for="id_mail">가입시 이메일</label> <input type="text" name="m_email" id="m_email" title="가입시 이메일 입력" class="inputText"></p>
									<button type="button" id="searchId ">찾기</button>
								</fieldset>
							</form>
						</div> -->
					</div>
					</form>
					<form id="pwdForm">
					<div class="srh_box br" style="border: solid 3px; border-radius: 20px; width: 500px;float: right;">
						<div class="srh_top">
							<h2 align="center">비밀번호찾기</h2>
							<p align="center">내정보에 등록한 정보로<br>비밀번호를 재설정할 수 있습니다.</p>
							
						</div>
						<div align="center">
						<div class="form-group form-group-sm">
				            <label for="m_id" class="col-sm-2 control-label">ID</label>
				            <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				               <input type="text" id="m_id" name="m_id"maxlength="12" class="form-control inputText" placeholder="아이디를입력해주세요" />
				            </div> 
				            <div class="col-sm-5"> 
				               <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				            </div>
				         </div>
						<div class="form-group form-group-sm">
				            <label for="m_name" class="col-sm-2 control-label">회원이름</label>
				            <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				               <input type="text" name="m_name" maxlength="10" class="form-control inputText m_name" placeholder="이름을 입력해주세요" >
				            </div>
				            <div class="col-sm-5">
				               <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				            </div>                  
				        </div> 
				        <div class="form-group form-group-sm">
				           <label for="m_email" class="col-sm-2 control-label">가입시 이메일</label>
				           <div class="col-sm-3" style="text-align: left; margin-left: 71px">
				              <input type="text" name="m_email" class="form-control inputText m_email" placeholder="이메일을입력해주세요">	
				           </div>
						   <div class="col-sm-3">
				              <p class="form-control-static error" style="text-align: left; margin-left: 5px"></p>
				           </div>
			        	</div>
			        		<input type="button" class="fun-btn" value="비밀번호찾기" id="pwdFind"/>
			        	</div>
			        	
						<!-- <div class="info">
							<form name="pw_form" method="post" action="search_idpw.asp" onsubmit="return chk_pwform(this)">
							<input type="hidden" name="s_type" value="pw">
								<fieldset>
									<p><label for="pw_name">ID</label> <input type="text" name="me_id" id="pw_name" title="아이디 입력" class="inputText"></p>
									<p><label for="pw_phone">이름</label> <input type="text" name="me_name" id="pw_phone" title="이름 입력" class="inputText"></p>
									<p><label for="pw_mail">가입시 이메일</label> <input type="text" name="me_email" id="pw_mail2" title="가입시 이메일 입력" class="inputText"></p>
									<button type="button" id="searchPwd">찾기</button>
								</fieldset>
							</form>
						</div> -->
					</div>
					</form>
		</div>
	</div>
	  </div>
    </div><!-- /container -->
</body>
</html>