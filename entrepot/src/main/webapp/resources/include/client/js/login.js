$(function(){
// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
errorCodeCheck();
	/*$('#m_id, #m_pwd').bind("keyup",function(){
		$(this).parents("div").find(".error").html("");
	});*/

/* 로그인 버튼 클릭 시 처리 이벤트 */
	$("#loginBtn").click(function(){
		if (!formCheck($('#m_id'), $('.error:eq(0)'), "아이디를")) return;
		else if (!formCheck($('#m_pwd'),$('.error:eq(1)'), "비밀번호를")) return;
		else {
			$("#loginForm").attr({
				"method":"POST",
				"action":"/client/member/login.do"
			});
			$("#loginForm").submit();
		}
		});
});