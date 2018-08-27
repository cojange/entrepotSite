// 양쪽 공백 없애기 메서드 wrestTrim
//fld : 문자열. $("#문자열아이디")
/*function wrestTrim(fld)
{
    var pattern = /(^\s+)|(\s+$)/g; // \s 공백 문자
    var value = fld.val().replace(pattern,"");
    return value;
}*/

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
function birthCheck() { 
	var birth=$("#m_birth").val();
//생년월일 검사
	var birthYear = (birth.charAt(6) <= "2") ? "19" : "20";
	birthYear += birth.substr(0, 2);
	var birthMonth = birth.substr(2, 2) - 1;
	var birthDate = birth.substr(4, 2);
	var birthday = new Date(birthYear, birthMonth, birthDate);
	
	if ( birthday.getYear() % 100 != birth.substr(0,2)||birthday.getMonth() != birthMonth ||birthday.getDate() != birthDate) {
	    alert("생년월일형식이맞지않습니다.");
		return false;
	 }else{
		 return true;
	 }
}

//이메일주소 형식 검사
//fld : 검사할 문자열
/*function wrestEmail(fld){
    if (!wrestTrim(fld)) return;
    //var pattern = /(\S+)@(\S+)\.(\S+)/; 이메일주소에 한글 사용시
    var pattern = "/([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/";
    var regExp = new RegExp(pattren);//정규표현식 객체
	var matchs = regExp.exec(fld);
	if(match==null){
		$alert("이메일이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		fld.val("");
		return false;
	}else{
		return true;
	}
}*/


var idConfirm = 1;
$(function() {
	var direct = document.getElementById('direct');//체크박스 체크여부확인
	errCodeCheck();//mForm.jsp 에 script함수
	//사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = ["영문,숫자만 가능. 6~12자로 입력해 주세요",
					"영문,숫자,특수문자만 가능. 8~15자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"-포함 입력해 주세요. 예시) 010-0000-0000","직업을 선택해 주세요."];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	$('#m_id,#m_pwd,#userPwCheck,#m_phone','#m_job').bind("focus",function(){
		var idx = $('#m_id,#m_pwd,#userPwCheck,#m_phone','#m_job').index(this);
		//console.log("대상 : "+ idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	//아이디중복체크
	$("#idConfirmBtn").click(function() {
		if(!formCheck($("#m_id"),$('.error:eq(0)'),"아이디를"))return;
		else if(!inputVerify(0,$("#m_id"),$(".error:eq(0)")))return;
		else{
			$.ajax({
				url : "/client/member/m_idConfirm.do",
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
		else if(!formCheck($("#m_job"),$(".error:eq(4)"),"직업을"))return;
		else if(!formCheck(($("#m_zipcode")||$("#m_address")),$(".error:eq(5)"),"우편주소를"))return;
		else if(!formCheck(($("#m_birth")&&$("#m_gender")),$(".error:eq(7)"),"생년월일 및 주민번호를"))return;
		else if(!birthCheck())return;
		else if(!inputVerify(3,"#m_birth",".error:eq(7)"))return;
		else if(!inputVerify(4,"#m_gender",".error:eq(7)"))return;
		else if(!formCheck($("#m_name"),$(".error:eq(8)"),"이름을"))return;
		else if(!formCheck($("#emailName"),$(".error:eq(9)"),"이메일을 @를제거하고"))return;
		//이메일형식체크
		else if(!inputVerify(5,"#emailName",".error:eq(9)"))return;
		else if(!formCheck($("#ans"),$(".error:eq(11)"),"비밀번호 질문답을"))return;
		else if(idConfirm!=2){alert("아이디 중복 체크 진행해 주세요.");return;}
		else{
				if($(direct).is(":checked")==true){// 직접입력 체크되어있을시
					$("#m_email").val($("#emailName").val()+"@"+$("#emailDirect").val());
					console.log("체크입력"+$("#m_email").val());
				}else if($(direct).is(":checked")==false){// 직접입력 체크안되있을때
					$("#m_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
					console.log("직접입력"+$("#m_email").val());
				}
				
				
				if($("#m_gender").val()==1){
					$("#m_gender").val("남");	
				}else if($("m_gender").val()==1){
					$("#m_gender").val("여");
				}
				$("#memberForm").attr({
					"method":"post",
					"action":"/client/member/mForm.do"
				});
			$("#memberForm").submit();
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
	//비밀번호 질문선택시
	$("#quiz").change(function() {
		if($("#quiz").val()!="없음"){
		$("#ans").show();
		$("#ans").val("");
		}
		if($("#quiz").val()=="없음"){
		$("#ans").hide();
		$("#ans").val("없음");
		}
	});
	//취소 클릭시 홈화면으로
	$("#joinCancel").click(function() {
		location.href="/";
	});
	//재작성 클릭시 입력한값 초기화
	$("#joinReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});
	/* 배열 : 유효성 체크 시 필요한 정규식으로 배열을 초기화.
	 * pattren = [아이디,비밀번호,핸드폰번호,생년월일,주민번호앞자리,이메일]
	 * 함수명:inputVerify(배열 인덱스번호,비교할 값,출력영역)
	 * */
	var pattren = [
		"((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
		"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})",
		"^\\d{3}-\\d{3,4}-\\d{4}",
		"^(?=.*[0-9]).{6}$",
		"^[1-4]$",
		"((?=.*[a-zA-Z])(?=.*[0-9]).{3,20})"
		];
	
	/**입력 형식이 맞지않을때 발생하는메서드
	 * 
	 * if(!inputVerify(사용할pattren의index,참조할 id,비교할값))return;
	**/
	function inputVerify(index,data,printarea) {
		var data_regExp = new RegExp(pattren[index]);//정규표현식 객체
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