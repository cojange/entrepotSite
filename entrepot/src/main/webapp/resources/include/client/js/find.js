$(function() {
	
	$("#idFind").click(function() {
		if(!formCheck($(".m_name:eq(0)"),$(".error:eq(0)"),"이름을"))return;
		else if(!inputVerify(9,".m_name:eq(0)",".error:eq(0)","","member"))return;
		else if(!formCheck($("#m_phone"),$(".error:eq(1)"),"전화번호를"))return;
		else if(!inputVerify(7,"#m_phone",".error:eq(1)","","member"))return;
		else if(!formCheck($(".m_email:eq(0)"),$(".error:eq(2)"),"이메일을"))return;
		else if(!inputVerify(10,".m_email:eq(0)",".error:eq(2)","","member"))return;
		else{
			$("#idForm").attr({
				"method":"post",
				"action":"/client/member/findUserID.do"
			});
			$("#idForm").submit();
		}
	});
	
	$("#pwdFind").click(function() {
		if(!formCheck($("#m_id"),$('.error:eq(3)'),"아이디를"))return;
		else if(!inputVerify(0,"#m_id",".error:eq(3)","","member"))return;
		else if(!formCheck($(".m_name:eq(1)"),$(".error:eq(4)"),"이름을"))return;
		else if(!inputVerify(9,".m_name:eq(1)",".error:eq(4)","","member"))return;
		else if(!formCheck($(".m_email:eq(1)"),$(".error:eq(5)"),"이메일을"))return;
		else if(!inputVerify(10,".m_email:eq(1)",".error:eq(5)","","member"))return;
		else{
			$("#pwdForm").attr({
				"method":"post",
				"action":"/client/member/findUserPWD.do"
			});
			$("#pwdForm").submit();
		}	
	});
	
});