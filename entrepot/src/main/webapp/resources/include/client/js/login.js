$(function(){
// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
errorCodeCheck();
	/*$('#m_id, #m_pwd').bind("keyup",function(){
		$(this).parents("div").find(".error").html("");
	});*/
/***********************로그인전 사용할 함수***********************
 * **********************************************************/
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
	$("#loginFind").click(function() {
		/*location.href="javascript:void(window.open('/client/member/findUser.do', '아이디/비밀번호찾기','_blank','width=300px, height=300px'))"*/
		location.href="/client/member/findUser.do";
	});
});