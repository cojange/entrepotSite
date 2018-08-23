
$(function() {
	//로그아웃 클릭시
	$("#logout").click(function() {
		console.log("로그아웃실행");
		logout();
	});
	
});


//로그아웃 여부확인
function logout() {
	var message = confirm("정말로 로그아웃 하시겠습니까?");
	if(message == true){	
		alert("로그아웃되었습니다.");
		location.href="/client/member/logout.do";

	}else{
		return false;
	}
}