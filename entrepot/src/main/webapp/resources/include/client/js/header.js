
$(function() {
	$(".loginMenu").hide();
	$("#menuDownUp").html($(".menuDown").html());
	$(".menuDown").hide();
	$(".menuUp").hide();
	/***********************로그인후 사용할 함수***********************
	 * **********************************************************/
		$("#logout").click(function() {
			//로그아웃 여부확인
			var message = confirm("정말로 로그아웃 하시겠습니까?");
			if(message == true){	
				alert("로그아웃되었습니다.");
				location.href="/client/member/logout.do";
			}else{
				return false;
			}
		});
		//마이페이지 클릭시
		$("#memberMyPage").click(function() {
			location.href="/client/member/myPage.do";
		});
		$("#groupMyPage").click(function() {
			location.href="/client/member/myPage.do";
		});
		//정보수정버튼
		$("#memberModify").click(function() {
			location.href="/client/member/memberModify.do";
		});
		$("#groupModify").click(function() {
			location.href="/client/member/groupModify.do";
		});
		//메뉴보이기,숨기기버튼
		$("#menuDownUp").click(function() {
			/*if($(this).children()==$(".menuUp")){*/
			if($(this).html()==$(".menuDown").html()){
				$(this).html($(".menuUp").html());
				$(".loginMenu").show();
			}else if($(this).html()==$(".menuUp").html()){
				$(this).html($(".menuDown").html());		
				$(".loginMenu").hide();
			}
		});
});

