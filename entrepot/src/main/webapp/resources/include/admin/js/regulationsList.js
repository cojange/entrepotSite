/*function regulationSearch(){
	 검색 버튼 클릭 시 처리 이벤트 
	$("#searchData").click(function(){
		if($("#search").val()!="all"){
			if(!chkData($('#keyword'),"검색어를")) return;
		}
		goPage();
	});
	
	 검색 대상이 변경될 때마다 처리 이벤트 
	$("#search").change(function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 데이터 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
}

 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 
function goPage(){
	$("#keyword").val("");
	
	$("#f_search").attr({
		"method":"get",
		"action":"/board/boardList.do"
	});
	$("#f_search").submit();
}*/