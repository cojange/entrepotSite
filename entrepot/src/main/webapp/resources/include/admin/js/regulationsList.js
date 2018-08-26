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


/* 약관추가 및 약관추가 테이블 삭제 */
function addRegulation(){
	/* 약관추가 */
	$("#addData").click(function(){
		var rowItem = "<tr><td>입력중</td><td><select id='regType' name='regType' style='width: 100px;'><option value='default'>-------선택해주세요-------</option><option value='pSite'>[개인회원]사이트이용약관</option>";
		rowItem += "<option value='gSite'>[단체회원]사이트이용약관</option><option value='pInfo'>[개인회원]정보이용동의약관</option>";
		rowItem += "<option value='gInfo'>[단체회원]정보이용동의약관</option><option value='pCan'>[개인회원]환불·취소규정약관</option>";
		rowItem += "<option value='gCan'>[단체회원]환불·취소규정약관</option><option value='etc'>기타</option></select></td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='regDate' name='regDate'></td><td><input type='date' style='width: 135px;' id='regUpdate' name='regUpdate'></td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='regOpen' name='regOpen'></td><td><input type='date' style='width: 135px;' id='regClose' name='regClose'></td>";
		rowItem += "<td><input type='file' style='width: 220px;' id='regFile' name='regFile'><i class='fas fa-minus-circle' style='font-size:20px; color:red;'></i>";
		rowItem += " <i class='fas fa-save' style='font-size:20px; color:green;'></i></td></tr>";
		
		$("#factory_table").append(rowItem);
		$('#addData').attr('disabled', true);

	});
	
	/* 약관추가 테이블(빈테이블) 삭제 */
	$('#factory_table').on("click", ".fa-minus-circle", function(){
		$(this).closest("tr").remove();
		$('#addData').attr('disabled', false);
	});
	
	/* 저장버튼 클릭시 처리 이벤트 */
	$('#factory_table').on("click", ".fa-save", function(){
		//입력값 체크
		if($("#regType").val()=='default'){
			alert("약관 유형을 선택해 주세요.");
			$("#regType").focus();
			return false;
		}
		else if(!chkData($('#regDate'),"등록일을")) return;
		else if(!chkData($('#regFile'),"파일을")) return;
		else{
			if($('#regFile').val()!=""){
				if(!chkText($('#regFile'))) return;
			}
		}
	});
	
	
}