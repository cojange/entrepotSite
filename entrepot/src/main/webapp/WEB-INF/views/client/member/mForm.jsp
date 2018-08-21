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
		<script type = "text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
		<script type = "text/javascript" src="/resources/include/client/js/common.js"></script>
		<script type = "text/javascript" src="/resources/include/client/js/join.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type = "text/javascript">
		
			function errCodeCheck() {
				$("#emailDirect").hide();
				var errCode = '<c:out value="${errCode}" />';
				if(errCode !=''){
					switch(parseInt(errCode)){
					case 1:
						alert("이미 가입된 회원입니다!");
						break;
					case 2:
						alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.")
						break;
					}
				}
			}
			
			$(function() {
			    $("#m_zipcodeFind").click(function(){
			    	new daum.Postcode({//다음 우편코드 프로그램 사용.
			    		oncomplete: function(data) {
			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			              var fullAddr = data.address; // 최종 주소 변수
			              var extraAddr = ''; // 조합형 주소 변수

			              // 기본 주소가 도로명 타입일때 조합한다.
			              if(data.addressType === 'R'){
			                  //법정동명이 있을 경우 추가한다.
			              if(data.bname !== ''){
			                  extraAddr += data.bname;
			              }
			              // 건물명이 있을 경우 추가한다.
			              if(data.buildingName !== ''){
			                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			              }
			              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			              fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			          	  }

			                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                    $("#m_zipcode").val(data.zonecode); //5자리 새우편번호 사용
			                    $("#m_address").val(fullAddr);
			    	    }
			    	 }).open();
			    });
			    
			});
		</script>
	</head>
<body>
	<div class="contentContainer">
   <div class="well">
      <form id="memberForm" class="form-horizontal">
         <input type="hidden" name="email" id="email" />
         <input type="hidden" name="pinno" id="pinno" />
         <div class="form-group form-group-sm">
            <label for="userId" class="col-sm-2 control-label">사용자 ID</label>
            <div class="col-sm-3">
               <input type="text" id="m_id" name="m_id"  maxlength="12" class="form-control" placeholder="User ID" />
            </div>
            <div class="col-sm-2">
               <input type="button" id="idConfirmBtn" value="아이디 중복체크" class="form-control btn-primary" />
            </div> 
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="m_pwd" class="col-sm-2 control-label">비밀 번호</label>
            <div class="col-sm-3">
               <input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control" placeholder="Password" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="userPwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
            <div class="col-sm-3">
               <input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control" placeholder="Password Confirm" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
            <div class="col-sm-3">
               <input type="text" id="m_phone" name="m_phone" maxlength="15" class="form-control" placeholder="Phone Number">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div> 
         <div class="form-group form-group-sm">
            <label for="m_job" class="col-sm-2 control-label">직업</label>
            <div class="col-sm-3">
               <input type="text" id="m_job" name="m_job" maxlength="15" class="form-control" placeholder="Job">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
			 <label for="m_zipcode" class="col-sm-2 control-label">우편번호</label>
			 <div class="col-sm-3">
			<input type="text" id="m_zipcode" name="m_zipcode" class="form-control" placeholder="우편번호" readonly="readonly">
			</div>
			<div class="col-sm-2">
               <input type="button" id="m_zipcodeFind" value="우편번호 찾기" >
            </div>
			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
			<div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
          <div class="form-group form-group-sm">
             <label for="m_address" class="col-sm-2 control-label"></label>
             <div class="col-sm-2">
			<input type="text" id="m_address" class="form-control" placeholder="주소" style="width:500px;" readonly="readonly" >
			</div>
			<div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
		</div>
         <div class="form-group form-group-sm">
            <label for="birth" class="col-sm-2 control-label">생년월일</label>
            <div class="col-sm-3">
               <input type="text" id="m_birth" name="m_birth" maxlength="6" class="form-control" placeholder="생년월일  6자리">   
            </div>
            <div class="col-sm-2">
               <input type="text" id="m_gender" name="m_gender" maxlength="1" class="form-control" placeholder="주민번호뒷자리1번째">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>                              
         <div class="form-group form-group-sm">
            <label for="userName" class="col-sm-2 control-label">회원이름</label>
            <div class="col-sm-3">
               <input type="text" id="m_name" name="m_name" maxlength="10" class="form-control" placeholder="NAME" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>                  
         </div>
         <div class="form-group form-group-sm">
            <label for="m_email" class="col-sm-2 control-label">회원 이메일</label>
            <div class="col-sm-3">
               <input type="text" id="m_email" name="m_email" maxlength="60" class="form-control" placeholder="EMAIL">
            </div>
            <div class="col-sm-2">
               <select id="emailDomain" class="form-control">
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>                                                 
               </select>
               <input type="text" id="emailDirect" name="emailDirect" maxlength="60" class="form-control" placeholder="EMAIL"/>
				<input id="direct" type="checkbox" width="10px;" height="10px;" >직접입력	
			</div>
         </div>   
            <div class="col-sm-3">
               <p class="form-control-static error"></p>
            </div>
         </div>
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