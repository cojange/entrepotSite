<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>단체회원가입</title>
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
		<script type = "text/javascript" src="/resources/include/client/js/gjoin.js"></script> 
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type = "text/javascript">
		
			function errCodeCheck() {
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
				$("#emailDirect_c").hide();
				$("#emailDirect_acc").hide();
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
				<h1>단체회원가입</h1>
				<!-- <span class="byline">Pellentesque lectus gravida blandit</span> -->
			</div>
			<div class="contentContainer">
   <div class="well">
      <form id="groupMemberForm" class="form-horizontal">
      <span class="form-group hideSpan">
		 <label for="char_email" class="col-sm-2 control-label">담당자 이메일</label>
		 <input type="hidden" name="char_email" id="char_email" value=""/>
	  </span>
	  <span class="form-group hideSpan">
		 <label for="acc_email" class="col-sm-2 control-label">회계 담당자 이메일</label>
		 <input type="hidden" name="acc_email" id="acc_email" value="" />
	  </span> 
	  <span class="form-group hideSpan">
		 <label for="com_no" class="col-sm-2 control-label">사업자등록번호</label>
		 <input type="hidden" name="com_no" id="com_no" value="" />
	  </span>        
         <img src="/resources/images/client/id.png"/><!-- id정보 -->
         <div class="form-group form-group-sm">
            <label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
            <div class="col-sm-3">
               <input type="text" id="m_id" name="m_id"  maxlength="12" class="form-control inputText" placeholder="User ID" />
               <input type="button" id="idConfirmBtn" value="아이디 중복체크" class="fun-btn" />
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="m_pwd" class="col-sm-2 control-label">비밀 번호</label>
            <div class="col-sm-3">
               <input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control inputText" placeholder="Password" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="userPwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
            <div class="col-sm-3">
               <input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control inputText" placeholder="Password Confirm" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <img src="/resources/images/client/groupMember.png"/><!-- 업체정보 -->
         <div class="form-group form-group-sm">
            <label for="com_no" class="col-sm-2 control-label">사업자등록번호</label>
            <div class="col-sm-3">
               <input type="text" id="com_no1" maxlength="3" class="form-control inputText">-
               <input type="text" id="com_no2" maxlength="2" class="form-control inputText">-
               <input type="text" id="com_no3" maxlength="5" class="form-control inputText">
               <input type="button" id="comNoConfirmBtn" value="중복검사" class="fun-btn" />  
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="m_name" class="col-sm-2 control-label">단체이름</label>
            <div class="col-sm-3">
               <input type="text" id="m_name" name="m_name" maxlength="10" class="form-control inputText" placeholder="NAME" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>                  
         </div>
         <div class="form-group form-group-sm">
            <label for="leader_name" class="col-sm-2 control-label">대표자 성명</label>
            <div class="col-sm-3">
               <input type="text" id="leader_name" name="leader_name" maxlength="10" class="form-control inputText" placeholder="NAME" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>                  
         </div>
         <div class="form-group form-group-sm">
            <label for="leader_phone" class="col-sm-2 control-label">대표자 전화번호</label>
            <div class="col-sm-3">
               <input type="text" id="leader_phone" name="leader_phone" maxlength="13" class="form-control inputText" placeholder="Phone Number">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>     
           <div class="form-group form-group-sm">
			 <label for="m_zipcode" class="col-sm-2 control-label"> 사업장 주소(사업자등록증의 주소) </label>
			 <div class="col-sm-3">
			<input type="text" id="m_zipcode" name="m_zipcode" class="form-control inputText" placeholder="우편번호" readonly="readonly">
			<input type="button" id="m_zipcodeFind" value="우편번호 찾기" class="fun-btn">
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
            <label for="m_job" class="col-sm-2 control-label">업종</label>
            <div class="col-sm-3">
               <select id="m_job" name="m_job" class="form-control" class="form-control">
                  <option></option>
                  <option value="병원">병원</option>
                  <option value="도매업">도매업</option>	
                  <option value="식품업체">식품업체</option>
                  <option value="가공업체">가공업체</option>
                  <option value="유치원">유치원</option> 
                  <option value="초등학교">초등학교</option>
                  <option value="중학교">중학교</option> 
                  <option value="고등학교">고등학교</option> 
                  <option value="대학교">대학교</option>                 
                  <option value="댄서그룹">댄서그룹</option>
                  <option value="헬스클럽">헬스클럽</option> 
                  <option value="교회">교회</option>
                  <option value="학원">학원</option>
                  <option value="스포츠단체">스포츠단체</option>                                       
               </select>  
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
       	 <img src="/resources/images/client/char.png"/><!-- 담당자정보 -->
       	 <div class="form-group form-group-sm">
            <label for="char_name" class="col-sm-2 control-label">담당자명</label>
            <div class="col-sm-3">
               <input type="text" id="char_name" name="char_name" maxlength="10" class="form-control inputText" placeholder="NAME" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>                  
         </div>
         <div class="form-group form-group-sm">
            <label for="char_phone" class="col-sm-2 control-label">담당자 전화번호</label>
            <div class="col-sm-3">
               <input type="text" id="char_phone" name="char_phone" maxlength="13" class="form-control inputText" placeholder="Phone Number">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div> 
         <div class="form-group form-group-sm">
            <label for="emailName_c" class="col-sm-2 control-label">담당자 이메일</label>
            <div class="col-sm-3">
               <input type="text" id="emailName_c" name="emailName_c" maxlength="60" class="form-control inputText" placeholder="'@'를빼고 입력해주세요.">
           	   <input type="text" id="emailDirect_c" maxlength="60" class="form-control inputText" placeholder="EMAIL" style="width: 100px;"/>
               <select id="emailDomain_c" class="form-control" style="width: 100px;">
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>                                                 
               </select>
               <input id="direct_c" type="checkbox" width="10px;" height="10px;" >직접입력	
            </div>
			<div class="col-sm-3">
               <p class="form-control-static error"></p>
            </div>
         </div>        
       	<img src="/resources/images/client/acc.png"/><!-- 회계부정보 -->
       	 <div class="form-group form-group-sm">
            <label for="acc_name" class="col-sm-2 control-label">회계담당자명</label>
            <div class="col-sm-3">
               <input type="text" id="acc_name" name="acc_name" maxlength="10" class="form-control inputText" placeholder="NAME" >
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>                  
         </div>
         <div class="form-group form-group-sm">
            <label for="acc_phone" class="col-sm-2 control-label">회계 담당자 전화번호</label>
            <div class="col-sm-3">
               <input type="text" id="acc_phone" name="acc_phone" maxlength="13" class="form-control inputText" placeholder="Phone Number">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
          <div class="form-group form-group-sm">
            <label for="fax" class="col-sm-2 control-label">팩스번호</label>
            <div class="col-sm-3">
               <input type="text" id="fax" name="fax" maxlength="13" class="form-control inputText" placeholder="FAX Number">   
            </div>
            <div class="col-sm-5">
               <p class="form-control-static error"></p>
            </div>
         </div>
         <div class="form-group form-group-sm">
            <label for="emailName_acc" class="col-sm-2 control-label">회계 담당자 이메일</label>
            <div class="col-sm-3">
               <input type="text" id="emailName_acc" name="emailName_acc" maxlength="60" class="form-control inputText" placeholder="'@'를빼고 입력해주세요.">
           	   <input type="text" id="emailDirect_acc"maxlength="60" class="form-control" placeholder="EMAIL" style="width: 100px;"/>
               <select id="emailDomain_acc" class="form-control" style="width: 100px;">
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>                                           
               </select>
               <input id="direct_acc" type="checkbox" width="10px;" height="10px;" >직접입력	 
            </div>
			<div class="col-sm-3">
               <p class="form-control-static error"></p>
            </div>
         </div>        
         <div class="form-group">   
            <div class="page col-sm-3">
               <input type="button" value="확인" id="gjoinInsert" class="fun-btn" /> 
               <input type="button" value="재작성" id="gjoinReset" class="fun-btn"  />
               <input type="button" value="취소" id="gjoinCancel" class="fun-btn" />                  
            </div>   
         </div>                                                                              
      </form>
   </div>
</div>
		</div>
	</div>

</body>
</html>