/* 약관추가 및 약관추가 테이블 삭제 */
function addRegulation(){
	/* 약관추가 */
	$("#addReg").click(function(){
		var rowItem = "<tr><td>-</td><td><select id='regType' name='regType'><option value='default'>-------선택해주세요-------</option><option value='pSite'>[개인회원]사이트이용약관</option>";
		rowItem += "<option value='gSite'>[단체회원]사이트이용약관</option><option value='pInfo'>[개인회원]정보이용동의약관</option>";
		rowItem += "<option value='gInfo'>[단체회원]정보이용동의약관</option><option value='pCan'>[개인회원]환불·취소규정약관</option>";
		rowItem += "<option value='gCan'>[단체회원]환불·취소규정약관</option><option value='etc'>기타</option></select></td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='regDate' name='regDate'></td><td><input type='date' style='width: 135px;' id='regUpdate' name='regUpdate'></td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='regOpen' name='regOpen'></td><td><input type='date' style='width: 135px;' id='regClose' name='regClose'></td>";
		rowItem += "<td><input type='file' style='width: 220px;' id='regFile' name='regFile'><i class='fas fa-minus-circle' id='regDel' style='font-size:20px; color:red;'></i>";
		rowItem += " <i class='fas fa-save' id='regSave' style='font-size:20px; color:green;'></i></td></tr>";
		
		$("#factory_table").append(rowItem);
		$('#addReg').attr('disabled', true);

	});
	
	/* 약관추가 테이블(빈테이블) 삭제 */
	$('#factory_table').on("click", "#regDel", function(){
		$(this).closest("tr").remove();
		$('#addReg').attr('disabled', false);
	});
	
	/* 저장버튼 클릭시 처리 이벤트 */
	$('#factory_table').on("click", "#regSave", function(){
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