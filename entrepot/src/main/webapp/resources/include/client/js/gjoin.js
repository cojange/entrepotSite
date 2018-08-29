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

var idConfirm = 1;
var comNoConfirm =1;
$(function() {
	var direct_acc = document.getElementById('direct_acc');//회계사이메일 체크박스 체크여부확인
	var direct_c = document.getElementById('direct_c');//담당자 이메일 체크박스 체크여부확인
	errCodeCheck();//mForm.jsp 에 script함수
	//사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = ["영문,숫자만 가능. 6~12자로 입력해 주세요",
					"영문,숫자,특수문자만 가능. 8~15자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"* 사업자 등록번호는 등록 후, 수정이 불가능 합니다.",];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	$('#m_id,#m_pwd,#userPwCheck,#com_no').bind("focus",function(){
		var idx = $('#m_id,#m_pwd,#userPwCheck,#com_no').index(this);
		console.log("대상 : "+ idx);
		$(this).parents(".form-group").find(".error").html(message[idx-1]);//인덱스0번째에 이미지가들어가서 -1을적용함
	});
	//아이디중복체크
	$("#idConfirmBtn").click(function() {
		console.log("org : " + $("#m_id").val());
		$("#m_id").val(getTrimStr($("#m_id").val()));
		console.log("aft : " + $("#m_id").val());
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
	
	//사업자번호 중복체크
	$("#comNoConfirmBtn").click(function() {
		//**************************사업자 등록번호 조합
		var com_noSum=$("#com_no1").val()+"-"+$("#com_no2").val()+"-"+$("#com_no3").val();
		$("#com_no").val(com_noSum);
		console.log("사업자등록번호"+$("#com_no").val());
		//***************************************
		console.log("org : " + $("#com_no").val());
		$("#com_no").val(getTrimStr($("#com_no").val()));
		console.log("aft : " + $("#com_no").val());
		if(!formCheck($("#com_no"),$(".error:eq(3)"),"사업자등록번호를"))return;
		else if(!inputVerify(3,"#com_no",".error:eq(3)"))return;
		else{
			$.ajax({
				url : "/client/member/gm_comConfirm.do",
				type : "post",
				data : "com_no="+$("#com_no").val(),
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.')
				},
				success : function(resultData) {
					console.log("resultData : "+resultData);
					if(resultData=="1"){
						alert("현재 등록된 사업자번호입니다.");
					}else if(resultData=="2"){
						alert("사용 가능한 사업자번호입니다.");
						comNoConfirm = 2;
					}
				}
			});
		}
	});
	
	/*확인 버튼 클릭 시 처리 이벤트*/
	$("#gjoinInsert").click(function() {
		//입력값 체크
		//아이디정보 체크
		if(!formCheck($("#m_id"),$('.error:eq(0)'),"아이디를"))return;
		else if(!inputVerify(0,"#m_id",".error:eq(0)"))return;
		else if(!formCheck($("#m_pwd"),$(".error:eq(1)"),"비밀번호를"))return;
		else if(!inputVerify(1,"#m_pwd",".error:eq(1)"))return;
		else if(!idPwdCheck())return;
		else if(!formCheck($("#userPwCheck"),$(".error:eq(2)"),"비밀번호확인를"))return;
		else if(!inputVerify(1,"#userPwCheck",".error:eq(2)"))return;
		else if(!passwordCheck())return;
		//업체정보체크
		else if(!formCheck($("#com_no"),$(".error:eq(3)"),"사업자등록번호를"))return;
		else if(!inputVerify(8,"#com_no",".error:eq(3)"))return;
		else if(!formCheck($("#m_name"),$(".error:eq(4)"),"단체이름을"))return;
		else if(!formCheck($("#leader_name"),$(".error:eq(5)"),"대표자명을"))return;
		else if(!formCheck(($("#m_zipcode")&&$("#m_address")),$(".error:eq(6)"),"우편주소를"))return;
		else if(!formCheck($("#m_job"),$(".error:eq(7)"),"업종을"))return;
		//담당자정보체크
		else if(!formCheck($("#char_name"),$(".error:eq(8)"),"담당자명을"))return;
		else if(!formCheck($("#char_phone"),$(".error:eq(9)"),"담당자전화번호를"))return;
		else if(!inputVerify(7,"#char_phone",".error:eq(9)"))return;
		//이메일형식체크
		else if(!formCheck($("#emailName_c"),$(".error:eq(10)"),"이메일을 @를제거하고"))return;
		else if(!inputVerify(5,"#emailName_c",".error:eq(10)"))return;
		else if(!formCheck($("#emailDirect_c"),$(".error:eq(10)"),"도메인을"))return;
		else if(!inputVerify(6,"#emailDirect_c",".error:eq(10)"))return;
		//회계정보체크
		else if(!formCheck($("#acc_name"),$(".error:eq(11)"),"회계담당자명을"))return;
		else if(!formCheck($("#acc_phone"),$(".error:eq(12)"),"회계담당자전화번호를"))return;
		else if(!inputVerify(7,"#acc_phone",".error:eq(12)"))return;
		else if(!formCheck($("#fax"),$(".error:eq(13)"),"팩스번호를"))return;
		else if(!inputVerify(7,"#fax",".error:eq(13)"))return;
		//이메일형식체크
		else if(!formCheck($("#emailName_acc"),$(".error:eq(14)"),"이메일을 @를제거하고"))return;
		else if(!inputVerify(5,"#emailName_acc",".error:eq(14)"))return;
		else if(!formCheck($("#emailDirect_acc"),$(".error:eq(14)"),"도메인을"))return;
		else if(!inputVerify(6,"#emailDirect_acc",".error:eq(14)"))return;
		else if(idConfirm!=2){alert("아이디 중복 체크 진행해 주세요.");return;}
		else if(comNoConfirm!=2){alert("사업자번호 중복 체크 진행해 주세요.");return;}
		else{
				//****************************이메일 조합
				if($(direct_c).is(":checked")==true){// 직접입력 체크되어있을시
					$("#char_email").val($("#emailName_c").val()+"@"+$("#emailDirect_c").val());		
					console.log("체크입력C"+$("#char_email").val());		
				}else if($(direct_c).is(":checked")==false){// 직접입력 체크안되있을때
					$("#char_email").val($("#emailName_c").val()+"@"+$("#emailDomain_c").val());				
					console.log("직접입력C"+$("#char_email").val());				
				}
				if($(direct_c).is(":checked")==true){// 직접입력 체크되어있을시
					$("#acc_email").val($("#emailName_acc").val()+"@"+$("#emailDirect_acc").val());
					console.log("체크입력ACC"+$("#acc_email").val());		
				}else if($(direct_c).is(":checked")==false){// 직접입력 체크안되있을때
					$("#acc_email").val($("#emailName_acc").val()+"@"+$("#emailDomain_acc").val());
					console.log("직접입력ACC"+$("#acc_email").val());				
				}				
				//*************************주민번호 앞자리를 토대로 성별
				if($("#m_gender").val()==1){
					$("#m_gender").val("남");	
				}else if($("m_gender").val()==1){
					$("#m_gender").val("여");
				}
				//**************************사업자 등록번호 조합
/*				$("#com_no").val($("#com_no1").val()+"-"+$("#com_no2").val()+"-"+$("#com_no3").val());
				console.log("사업자등록번호"+$("#com_no").val());*/
				
				$("#groupMemberForm").attr({
					"method":"post",
					"action":"/client/member/groupForm.do"
				});
			$("#groupMemberForm").submit();
		}
	});
	//이메일 직접입력 체크시(담당자)
	$("#direct_c").click(function() {
		
		console.log(direct_c);
		if($(direct_c).is(":checked")==true){	
			$("#emailDirect_c").show();
			$("#emailDomain_c").hide();
		}else if($(direct_c).is(":checked")==false){
			$("#emailDomain_c").show();
			$("#emailDirect_c").hide();
		}
	});
	//이메일 직접입력 체크시(회계)
	$("#direct_acc").click(function() {	
		console.log(direct_acc);
		if($(direct_acc).is(":checked")==true){	
			$("#emailDirect_acc").show();
			$("#emailDomain_acc").hide();
		}else if($(direct_acc).is(":checked")==false){
			$("#emailDomain_acc").show();
			$("#emailDirect_acc").hide();
		}
	});
	//취소 클릭시 홈화면으로
	$("#gjoinCancel").click(function() {
		location.href="/";
	});
	//재작성 클릭시 입력한값 초기화
	$("#gjoinReset").click(function() {
		$("#groupMemberForm").each(function() {
			this.reset();
		});
	});
	
});