<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%-- 아래 내용은 DB에 이메일 정보가 javauser2018@naver.com으로 저장되어 있기에 @를 구분자로 분리하고 작성한 소스--%>
<c:set var="m_email" value="${fn:split(member.m_email,'@')}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Update Member!</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript">
	function errorCodeCheck(){
		var status = '<c:out value="${status}" />';
		if(status != ""){
		alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
		}
	} 
	
	loginUserId = "${member.m_id}";
	function emailCheck(){
		var email = "${m_email[1]}";
		$("#emailDomain").val(email).prop("selected", "true");
	}
	
	//비밀번호와 비밀번호 확인 일치 여부 확인
	function passwordCheck() {
		if($("#m_pwd").val() != $("#userPwCheck").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#userPwCheck").focus();
			$("#userPwCheck").val("");
			return false;
		}else{
			return true;
		}
	}

	//아이디에 비밀번호 포함여부 확인
	function idPwdCheck() {
		var m_id = $("#m_id").val();
		var m_pwd = $("#m_pwd").val();
		if(m_pwd.indexOf(m_id) > -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			$("#m_pwd").val();
			$("#m_pwd").focus();
			return false;
		}else{
			return true;
		}
	}
	//재작성 클릭시 입력한값 초기화
	$("#joinReset").click(function() {
		$("#memberModifyForm").each(function() {
			this.reset();
		});
	});
	//취소 클릭시 홈화면으로
	$("#joinCancel").click(function() {
		location.href="/";
	});
	
	$(function() {
		
		
		$("#emailDirect").hide();
		var direct = document.getElementById('direct');//체크박스 체크여부확인
		
		$("#deleteMemberBtn").click(function() {
			var message = confirm("정말로 탈퇴 하시겠습니까?계정을 다시복구하기 불가능합니다.");
			if(message == true){
				alert("앙뜨흐뽀 사이트를 이용해주셔서 감사합니다.");
				location.href = "/client/member/deleteMember.do";
			}		
		});
		//이메일 직접입력 체크시
		$("#direct").click(function() {		
			console.log(direct);
			if($(direct).is(":checked")==true){	
				$("#emailDirect").show();
				$("#emailDomain").hide();
			}else if($(direct).is(":checked")==false){
				$("#emailDomain").show();
				$("#emailDirect").hide();
			}
		});
		//회원정보수정
		$("#modify").click(function() {
			
			if(!formCheck($("#oldUserPw"),$(".error:eq(0)"),"기존비밀번호를"))return;
			else if(!inputVerify(1,"#oldUserPw",".error:eq(0)","","member"))return;
			else if(!formCheck($("#m_pwd"),$(".error:eq(1)"),"변경할비밀번호를"))return;
			else if(!inputVerify(1,"#m_pwd",".error:eq(1)","","member"))return;
			else if(!idPwdCheck())return;
			else if(!formCheck($("#userPwCheck"),$(".error:eq(2)"),"비밀번호확인를"))return;
			else if(!inputVerify(1,"#userPwCheck",".error:eq(2)","","member"))return;
			else if(!passwordCheck())return;
			else if(!formCheck($("#m_phone"),$(".error:eq(3)"),"전화번호를"))return;
			else if(!inputVerify(2,"#m_phone",".error:eq(3)","","member"))return;
			else if(!formCheck($("#emailName"),$(".error:eq(5)"),"이메일을"))return;
			else if(!inputVerify(5,"#emailName",".error:eq(5)","","member"))return;
			else{
				if($(direct).is(":checked")==true){// 직접입력 체크되어있을시
					$("#m_email").val($("#emailName").val()+"@"+$("#emailDirect").val());
					if(!inputVerify(10,"#m_email",".error:eq(5)","","member"))return;
					console.log("체크입력"+$("#m_email").val());
				}else if($(direct).is(":checked")==false){// 직접입력 체크안되있을때
					$("#m_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
					if(!inputVerify(10,"#m_email",".error:eq(5)","","member"))return;
					console.log("직접입력"+$("#m_email").val());
				}
			
				msg = confirm("회원정보를 수정하시겠습니까?");
				if(msg==true){
					console.log("수정실행");
					$("#memberModifyForm").attr({
						"method":"post",
						"action":"/client/member/memberModify.do"
					});
					$("#memberModifyForm").submit();
					alter("수정이 완료되었습니다");
					}else{
					alert("회원정보수정이 취소되었습니다 메인페이지로 이동합니다");
					location.href = "/";
				}
			}											 
		});
		/*확인 버튼 클릭 시 처리 이벤트*/
		/* $("#joinInsert").click(function() { */
			/*console.log("org : " + $("#m_id").val());
			$("#m_id").val(getTrimStr($("#m_id").val()));
			console.log("aft : " + $("#m_id").val());*/
			/* if($(direct).is(":checked")==false){
				$("#emailDirect").val("naver.com");
		} */
		
		/* if($(direct).is(":checked")==true){// 직접입력 체크되어있을시
			$("#m_email").val($("#emailName").val()+"@"+$("#emailDirect").val());
			if(!inputVerify(10,"#m_email",".error:eq(9)","","member"))return;
			console.log("체크입력"+$("#m_email").val());
		}else if($(direct).is(":checked")==false){// 직접입력 체크안되있을때
			$("#m_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
			if(!inputVerify(10,"#m_email",".error:eq(9)","","member"))return;
			console.log("직접입력"+$("#m_email").val());
		} */
	});
</script>
</head>
<body> 
	<div  id="page" class="container joinform">
	<div class="title">
		<h1>개인회원수정</h1>
		<!-- <span class="byline">Pellentesque lectus gravida blandit</span> -->
	</div>
	<div class="contentContainer">
		<div class="well joinwell">
		<form id="memberModifyForm" class="form-horizontal">
			<input type="hidden" name="m_num" id="m_num" value="${member.m_num}" />
			<input type="hidden" name="m_email" id="m_email" />

			<div class="form-group form-group-sm">
				<label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					<label>${member.m_id}</label> 
				</div>
				<div class="col-sm-5">
			      <p></p>
			    </div>
			</div>
			<div class="form-group form-group-sm">
				<label for="oldUserPw" class="col-sm-2 control-label">기존 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="oldUserPw" name="oldUserPw" maxlength="15" class="form-control inputText" placeholder="기존 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p> 
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="m_pwd" class="col-sm-2 control-label">변경할 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control inputText" placeholder="변경할 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="userPwCheck" class="col-sm-2 control-label">변경할 비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="userPwCheck" name="userPwCheck" maxlength="15" class="form-control inputText" placeholder="변경할 비밀번호 입력 확인" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="m_phone" class="col-sm-2 control-label">전화 번호</label>
				<div class="col-sm-3">
					<input type="text" id="m_phone" name="m_phone" maxlength="15" class="form-control inputText" value="${member.m_phone}"> 
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
			            <label for="m_job" class="col-sm-2 control-label">직업</label>
			            <div class="col-sm-3">
			               <select id="m_job" name="m_job" class="form-control" class="form-control">
			                  <option value="${member.m_job}">${member.m_job}(현재)</option>
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
				<label for="m_birth" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3"> 
					<label>${member.m_birth} ******</label>
				</div>
				<div class="col-sm-5">
			      <p></p>
			    </div>
			</div>          
			<div class="form-group form-group-sm">
				<label for="m_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					<label>${member.m_name}</label>
				</div>
				<div class="col-sm-5">
			      <p></p>
			    </div>
			</div>
			<div class="form-group form-group-sm">
			   <label for="emailName" class="col-sm-2 control-label">회원 이메일</label>
			   <div class="col-sm-3">
			      <input type="text" id="emailName" name="emailName" maxlength="60" class="form-control inputText"  value="${m_email[0]}">
			      <input type="text" id="emailDirect" maxlength="60" class="form-control inputText" placeholder="EMAIL" style="width: 100px;"/>
			      <select id="emailDomain" class="form-control" style="width: 100px;">
			         <option value="naver.com">naver.com</option>
			         <option value="daum.net">daum.net</option>
			         <option value="nate.com">nate.com</option>                                                 
			     </select>
					<input id="direct" type="checkbox" width="10px;" height="10px;" >직접입력	
			   </div>
				<div class="col-sm-5">
				   <p class="form-control-static error"></p>
				</div>
			</div>        
			<div class="form-group"> 
				<div class="page col-sm-3"> 
					<input type="button" value="확인" id="modify" class="fun-btn" /> 
					<input type="button" value="재작성" id="modifyReset" class="fun-btn" />
					<input type="button" value="취소" id="modifyCancel" class="fun-btn" />
					<input type="button" value="회원탈퇴" id="deleteMemberBtn" class="fun-btn" />
				</div> 
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>