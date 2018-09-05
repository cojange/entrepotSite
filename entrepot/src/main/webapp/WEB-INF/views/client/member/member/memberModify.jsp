<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인회원가입</title>
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
		
		function errorCodeCheck(){
			var status = '<c:out value="${status}" />';
			if(status != ""){
			alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
			}
			} 

			loginM_id = "${member.m_id}";
			function emailCheck(){
			/* var email = "${email[1]}";
			$("#emailDomain").val(email).prop("selected", "true");
			} */
			
			$(function() {

				$("#ans").hide();
				$("#emailDirect").hide();
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
	<div id="page" class="container joinform">
		<div class="imgWell"><img src="/resources/images/client/member2.png"/></div>
		<div>
			<div class="title">
				<h1>개인회원가입</h1>
				<!-- <span class="byline">Pellentesque lectus gravida blandit</span> -->
			</div>
			<div class="contentContainer">
			   <div class="well joinwell">
			      <form id="memberForm" class="form-horizontal">
			      <span class="form-group hideSpan">
			      	 <label for="m_id" class="col-sm-2 control-label">회원 이메일</label>
			         <input type="hidden" name="m_email" id="m_email" />
			      </span>     	
			         <div class="form-group form-group-sm">
			            <label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
			            <div class="col-sm-3">
			               ${member.m_id}
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			         <div class="form-group form-group-sm">
			            <label for="m_pwd" class="col-sm-2 control-label">기존 비밀 번호</label>
			            <div class="col-sm-3">
			               <input type="password" id="oldm_pwd" name="oldm_pwd" maxlength="15" class="form-control" placeholder="기존 비밀번호 입력" >
			            </div>
			            <div class="form-group form-group-sm">
							<label for="userPw" class="col-sm-2 control-label">변경할 비밀 번호</label>
							<div class="col-sm-3">
								<input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력" >
							</div>
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
						</div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			         <div class="form-group form-group-sm">
			            <label for="userPwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
			            <div class="col-sm-3">
			               <input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control  inputText" placeholder="Password Confirm" >
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			         <div class="form-group form-group-sm">
			            <label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
			            <div class="col-sm-3">
			               <input type="text" id="m_phone" name="m_phone" maxlength="13" class="form-control  inputText" placeholder="Phone Number" value="${member.m_phone}">   
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div> 
			         <div class="form-group form-group-sm">
			            <label for="m_job" class="col-sm-2 control-label">직업</label>
			            <div class="col-sm-3">
			               <select id="m_job" name="m_job" class="form-control" class="form-control">
			                  <option></option>
			                  <option value="직장인">직장인</option>
			                  <option value="초등학생">초등학생</option>	
			                  <option value="중학생">중학생</option>
			                  <option value="고등학생">고등학생</option>
			                  <option value="대학생">대학생</option>
			                  <option value="운동선수">운동선수</option> 
			                  <option value="주부">주부</option> 
			                  <option value="프리랜서">프리랜서</option>
			                  <option value="디자이너">디자이너</option> 
			                  <option value="요리사">요리사</option>
			                  <option value="웹앱개발자">웹앱개발자</option> 
			                  <option value="정치인">정치인</option>
			                  <option value="건축가">건축가</option>                                            
			               </select>  
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			         <div class="form-group form-group-sm">
						 <label for="m_zipcode" class="col-sm-2 control-label">우편번호</label>
						 <div class="col-sm-3">
						<input type="text" id="m_zipcode" name="m_zipcode"class="form-control inputText" placeholder="우편번호" readonly="readonly">
						<input type="button" id="m_zipcodeFind" class="fun-btn" value="우편번호 찾기" >
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
							<input type="text" id="m_address" name="m_address"class="form-control inputText" placeholder="주소" style="width:500px;" readonly="readonly" >
						</div>
						<div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
					</div>
			         <div class="form-group form-group-sm">
			            <label for="m_birth" class="col-sm-2 control-label">생년월일</label>
			            <div class="col-sm-3">
			               <input type="text" id="m_birth" name="m_birth" maxlength="6" class="form-control inputText" placeholder="생년월일  6자리">
			               <input type="text" id="m_gender" name="m_gender" maxlength="1" class="form-control inputText" placeholder="주민번호뒷자리1번째">  
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>                              
			         <div class="form-group form-group-sm">
			            <label for="m_name" class="col-sm-2 control-label">회원이름</label>
			            <div class="col-sm-3">
			               <input type="text" id="m_name" name="m_name" maxlength="10" class="form-control inputText" placeholder="NAME" >
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>                  
			         </div>
			         <div class="form-group form-group-sm">
			            <label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
			            <div class="col-sm-3">
			               <input type="text" id="emailName" name="emailName" maxlength="60" class="form-control inputText" placeholder="'@'를빼고 입력해주세요.">
			               <input type="text" id="emailDirect" maxlength="60" class="form-control inputText" placeholder="EMAIL" style="width: 100px;"/>
			               <select id="emailDomain" class="form-control" style="width: 100px;">
			                  <option value="naver.com">naver.com</option>
			                  <option value="daum.net">daum.net</option>
			                  <option value="nate.com">nate.com</option>                                                 
			               </select>
						<input id="direct" type="checkbox" width="10px;" height="10px;" >직접입력	
			            </div>
						<div class="col-sm-3">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>        
			         <div class="form-group form-group-sm">
			            <label for="m_job" class="col-sm-2 control-label">비밀번호 질문</label>
			            <div class="col-sm-3">
			               <select id="quiz" name="quiz" class="form-control" >
			                  <option value="없음">없음</option>
			                  <option value="나의 별명은 무엇입니까?">나의 별명은 무엇입니까?</option>
			                  <option value="나의 결혼기념일은 언제입니까?">나의 결혼기념일은 언제입니까?</option>	
			                  <option value="나는 어떤사람입니까?">나는 어떤사람입니까?</option>
			                  <option value="내가 좋아하는 장소는 어디입니까?">내가 좋아하는 장소는 어디입니까?</option>
			                  <option value="내가 좋아하는 음식은 무엇입니까?">내가 좋아하는 음식은 무엇입니까?</option>
			                  <option value="내가 싫어하는 장소는 어디입니까?">내가 싫어하는 장소는 어디입니까?</option> 
			                  <option value="나는 어떠한 취미가있습니까?">나는 어떠한 취미가있습니까?</option>                                         
			               </select>  
			            </div>
			            <div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
			         </div>
			          <div class="form-group form-group-sm">
			             <label for="ans" class="col-sm-2 control-label"></label>
			            <div class="col-sm-2">
							<input type="text" id="ans" name="ans" class="form-control inputText" placeholder="비밀번호질문답" style="width:300px;" value="없음">
						</div>
						<div class="col-sm-5">
			               <p class="form-control-static error"></p>
			            </div>
					</div>
			         <div class="form-group">   
			            <div class="page col-sm-3">
			               <input type="button" class="fun-btn" value="확인" id="joinInsert"/> 
			               <input type="button" class="fun-btn" value="재작성" id="joinReset"/>
			               <input type="button" class="fun-btn" value="취소" id="joinCancel"/>                  
			            </div>   
			         </div>                                                                              
			      </form>
			   </div>
			</div>
		</div>
	</div>
</body>
</html>