/* 약관추가 및 약관추가 테이블 삭제 */
function addRegulation(){
	nowTime();
	
	/* 약관추가 */
	$("#addReg").click(function(){
		var rowItem = "<tr><td>-</td><td><select id='reg_type' name='reg_type'><option value='default'>-------선택해주세요-------</option><option value='[개인회원]사이트이용약관'>[개인회원]사이트이용약관</option>";
		rowItem += "<option value='[단체회원]사이트이용약관'>[단체회원]사이트이용약관</option><option value='[개인회원]정보이용동의약관'>[개인회원]정보이용동의약관</option>";
		rowItem += "<option value='[단체회원]정보이용동의약관'>[단체회원]정보이용동의약관</option><option value='[개인회원]환불·취소규정약관'>[개인회원]환불·취소규정약관</option>";
		rowItem += "<option value='[단체회원]환불·취소규정약관'>[단체회원]환불·취소규정약관</option><option value='기타'>기타</option></select></td>";
		rowItem += "<td>"+today+"</td><td>-</td><td><input type='date' style='width: 135px;' id='reg_open' name='reg_open'></td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='reg_close' name='reg_close' disabled='disabled'></td>";
		rowItem += "<td><input type='file' style='width: 220px;' id='file' name='file'><i class='fas fa-minus-circle' id='regDel' style='font-size:20px; color:red;'></i>";
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
		console.log($("select[name='reg_type']").val());
		//입력값 체크
		if($("#reg_type").val()=='default'){
			alert("약관 유형을 선택해 주세요.");
			$("#reg_type").focus();
			return false;
		}
		else if(!chkData($('#file'),"파일을")) return;
		else{			
			var insertUrl = "/admin/adBoard/regulations/addRegulations.do";
			
			$("#regWriteForm").ajaxForm({
				url:insertUrl,
				type:"post",
				enctype : "multipart/form-data",
				dataType:"text",
				error:function(){ //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success:function(resultData){
					if(resultData=="SUCCESS"){
						alert("약관 등록이 완료되었습니다.");
						location.href="/admin/adBoard/regulations/regulationsList.do";
					}else{
						alert("["+resultData+"] \n 등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.")
					}
				}
			});
			$("#regWriteForm").submit();
		}
	});
	
	
}