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
	if(userPw.indexOf(m_id) > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#m_pwd").val();
		$("#m_pwd").focus();
		return false;
	}else{
		return true;
	}
}

var idConfirm = 1;
$(function() {
	errCodeCheck();
	//사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = ["영문,숫자만 가능. 6~12자로 입력해 주세요",
					"영문,숫자,특수문자만 가능. 8~15자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"-포함 입력해 주세요. 예시) 010-0000-0000","직업을 입력해 주세요."];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	$('#m_id,#m_pwd,#userPwCheck,#m_phone','#m_job').bind("focus",function(){
		var idx = $('#m_id,#m_pwd,#userPwCheck,#m_phone','#m_job').index(this);
		//console.log("대상 : "+ idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	$("#idConfirmBtn").click(function() {
		if(!formCheck($("#m_id"),$('.error:eq(0)'),"아이디를"))return;
		else if(!inputVerify(0,$("#m_id"),$(".error:eq(0)")))return;
		else{
			$.ajax({
				url : "client/member/userIdConfirm.do",
				type : "post",
				data : "m_id="+$("#m_id").val(),
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.')
				},
				success : function(resultData) {
					console.log("resultData : "+resultData);
					if(resultData=="1"){
						$("#m_id").parents(".form-group").find(".error").html("현재 사용 중인 아이디입니다.");
					}else if(resultData=="2"){
						$("#m_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});
	
	/*확인 버튼 클릭 시 처리 이벤트*/
	$("#joinInsert").click(function() {
		//입력값 체크
		if(!formCheck($("#m_id"),$('.error:eq(0)'),"아이디를"))return;
		else if(!inputVerify(0,"#m_id",".error:eq(0)"))return;
		else if(!formCheck($("#m_pwd"),$(".error:eq(1)"),"비밀번호를"))return;
		else if(!inputVerify(1,"#m_pwd",".error:eq(1)"))return;
		else if(!idPwdCheck())return;
		else if(!formCheck($("#userPwCheck"),$(".error:eq(2)"),"비밀번호확인를"))return;
		else if(!inputVerify(1,"#userPwCheck",".error:eq(2)"))return;
		else if(!passwordCheck())return;
		else if(!formCheck($("#m_phone"),$(".error:eq(3)"),"전화번호를"))return;
		else if(!inputVerify(2,"#m_phone",".error:eq(3)"))return;
		else if(!formCheck($("#m_name"),$(".error:eq(5)"),"이름을"))return;
		else if(!formCheck($("#m_email"),$(".error:eq(6)"),"이메일 주소를"))return;
		else if(idConfirm!=2){alert("아이디 중복 체크 진행해 주세요.");return;}
		else{
			$("#email").val($("#m_email").val()+"@"+$("#emailDomain").val());
			$("#pinno").val($("#birth").val()+"-"+$("#gender").val());
			$("#memberForm").attr({
				"method":"post",
				"action":"/member/mForm.do"
			});
			$("#memberForm").submit();
		}
	});
	
	$("#joinCancel").click(function() {
		location.href="/member/login.do";
	});
	
	$("#joinReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});
	/* 배열 : 유효성 체크 시 필요한 정규식으로 배열을 초기화.
	 * pattren = [아이디,비밀번호,핸드폰번호]
	 * 함수명:inputVerify(배열 인덱스번호,비교할 값,출력영역)
	 * */
	var pattren = [
		"((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
		"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})",
		"^\\d{3}-\\d{3,4}-\\d{4}"];
	function inputVerify(index,data,printarea) {
		var data_regExp = new RegExp(pattren[index]);
		var match = data_regExp.exec($(data).val());
		if(match==null){
			$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
			$(data).val("");
			return false;
		}else{
			return true;
		}
		
	}
});