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
	
	var currLi;
	/* 테이블 선택행 블록처리 */
	$("#regBoard").on("click","tr",function(){
		console.log("this:"+$(this).html());
		if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            currLi="";
        }
        else {
            $('#regBoard tr.selected').removeClass('selected');
            $(this).addClass('selected');
            currLi= $(this);
        }
		
	});
	
	//수정버튼 클릭
	$("#upReg").click(function(){
		regUpdate(currLi);
		$('#addCou').attr('disabled', true);
		$('#upCou').attr('disabled', true);
		$('#delCou').attr('disabled', true);		
	});
	
	//수정 중 취소 버튼
	$('#regBoard').on("click", "#regDel", function(){
		$(this).closest("tr").remove();
	});
	
	//수정완료
	$('#regBoard').on("click","#regUp", function(){
			var reg_no = $(this).closest("tr").children().eq(1).html();
			
			/*if(!chkData($('#couDiscount'),"할인율을")) return;
			else if(!chkData($('#couMemo'),"설명을")) return;
			else{*/
				$.ajax({
					url:'/admin/adBoard/adminBoard/'+coupon_no+'.do',
					type:"put",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP_Method_Override":"PUT"//대소문자 구별
					},
					data:JSON.stringify({
						coupon_discount:$("#couDiscount").val(),
						coupon_memo:$("#couMemo").val(),
						coupon_use:$('[name=couUse]').is(':checked')
					}),
					dataType:"text",
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의하세요.');
					},
					success:function(result){
						console.log("result : "+result);
						if(result == "SUCCESS"){
							alert("수정이 완료되었습니다.");
							location.href="/admin/adBoard/adminBoard/adminBoardList.do";
						}
					}
				});
			/*}*/
		});
}

function regUpdate(currLi){
	console.log(currLi.html());
	var type = currLi.children().eq(1);
	var date = currLi.children().eq(2);
	var update = currLi.children().eq(3);
	var open = currLi.children().eq(4);
	var close = currLi.children().eq(5);
	var file = currLi.children().eq(6);
	
	var rowUp;
	if (open.html()==null || open.html()==""){
		rowUp = "<td>-</td><td><select id='regType' name='regType'><option value='default'>-------선택해주세요-------</option><option value='[개인회원]사이트이용약관'>[개인회원]사이트이용약관</option>";
		rowUp += "<option value='[단체회원]사이트이용약관'>[단체회원]사이트이용약관</option><option value='[개인회원]정보이용동의약관'>[개인회원]정보이용동의약관</option>";
		rowUp += "<option value='[단체회원]정보이용동의약관'>[단체회원]정보이용동의약관</option><option value='[개인회원]환불·취소규정약관'>[개인회원]환불·취소규정약관</option>";
		rowUp += "<option value='[단체회원]환불·취소규정약관'>[단체회원]환불·취소규정약관</option><option value='기타'>기타</option></select><br/><span style='font-size:12px;'>기존 유형 : "+type.html()+"</span></td>";
		rowUp += "<td>"+date.html()+"</td><td>"+today+"</td>";
		rowUp += "<td><input type='date' id='opneDate' name='openDate'></td><td><input type='date' id='closeDate' name='closeDate' disabled='disabled'></td>";
		rowUp += "<td><input type='file' style='width: 220px;' id='regFile' name='regFile'> <i class='fas fa-minus-circle' id='regDel' style='font-size:20px; color:red;'></i>";
		rowUp += " <i class='fas fa-save' id='regSave' style='font-size:20px; color:green;'></i><br/><span style='font-size:12px;'>기존 파일명 : "+file.html()+"</span></td>";		
	}else{
		rowUp = "<td>-</td><td>"+type.html()+"</td>";
		rowUp += "<td>"+date.html()+"</td><td>"+today+"</td>";
		rowUp += "<td>"+open.html()+"</td><td><input type='date' id='closeDate' name='closeDate'></td>";
		rowUp += "<td>"+file.html()+"<i class='fas fa-minus-circle' id='regDel' style='font-size:20px; color:red;'></i>";
		rowUp += " <i class='fas fa-save' id='regSave' style='font-size:20px; color:green;'></i></td>";		
	}
	
	$("#regBoard .selected").html(rowUp);
}