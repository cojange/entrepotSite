/* 쿠폰추가 및 쿠폰추가 테이블 삭제 그리고 쿠폰수정 및 삭제 */
function addCoupon(){
	nowTime2()
	
	/* 쿠폰 수정, 삭제 버튼 비활성화 */ 
	defaultBtn();
	
	/* 쿠폰추가 */
	$("#addCou").click(function(){
		var rowItem = "<tr><td>-</td><td>-</td><td>event</td><td><input type='number' id='couDiscount' name='couDiscount' style='width: 50px;'>%</td>";
		rowItem += "<td>"+today2+"</td><td>-</td><td><input type='text' style='width: 100px;' id='couMemo' name='couMemo' value='-'></td>";
		rowItem += "<td><input type='checkbox' id='couUse' name='couUse' checked='checked'> <i class='fas fa-minus-circle' id='couDel' style='font-size:20px; color:red;'></i>";
		rowItem += " <i class='fas fa-save' id='couSave' style='font-size:20px; color:green;'></i></td></tr>";
		
		$("#coupon_table").append(rowItem);		
		$('#addCou').attr('disabled', true);
	});
	
	/* 쿠폰추가 테이블(빈테이블) 삭제 */
	$('#coupon_table').on("click", "#couDel", function(){
		$(this).closest("tr").remove();
	});
	
	/* 저장버튼 클릭시 처리 이벤트 */
	$('#coupon_table').on("click", "#couSave", function(){
		//입력값 체크
		/*if($("#couType").val()=='default'){
			alert("쿠폰 유형을 선택해 주세요.");
			$("#couType").focus();
			return false;
		}*/
		if(!chkData($('#couDiscount'),"할인율을")) return;
		else if(!chkData($('#couMemo'),"설명을")) return;
		else{
			var insertUrl = "/admin/adBoard/adminBoard/couponInsert.do";
			var coupUse = $('[name=couUse]').is(':checked');
			//console.log(coupUse);
			$.ajax({
				url:insertUrl,
				type:"post",
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:"text",
				data:JSON.stringify({
					coupon_discount:$("#couDiscount").val(),
					coupon_memo:$("#couMemo").val(),
					coupon_use:coupUse
				}),
				error:function(){ //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success:function(resultData){
					if(resultData=="SUCCESS"){
						alert("쿠폰 등록이 완료되었습니다.");
						location.href="/admin/adBoard/adminBoard/adminBoardList.do";
					}
				}
			});
		}
	});
	
	var currLi;
	/* 테이블 선택행 블록처리 */
	$("#coupon_table").on("click","tr",function(){
		console.log("this:"+$(this).html());
		if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            currLi="";
            $('#addCou').attr('disabled', false);
            $('#upCou').attr('disabled', true);
     		$('#delCou').attr('disabled', true);
        }
        else {
            $('#coupon_table tr.selected').removeClass('selected');
            $(this).addClass('selected');
            currLi= $(this);
            $('#addCou').attr('disabled', true);
            $('#upCou').attr('disabled', false);
     		$('#delCou').attr('disabled', false);
        }
		
	});
	
	//수정버튼 클릭
	$("#upCou").click(function(){
		couUpdate(currLi);
		$('#addCou').attr('disabled', true);
		$('#upCou').attr('disabled', true);
		$('#delCou').attr('disabled', true);		
	});
	
	//수정 중 취소 버튼
	$('#coupon_table').on("click", "#couUpDel", function(){
		$(this).closest("tr").remove();
	});
	
	//수정완료
	$('#coupon_table').on("click","#couUp", function(){
			var coupon_no = $(this).closest("tr").children().eq(1).html();
			
			if(!chkData($('#couDiscount'),"할인율을")) return;
			else if(!chkData($('#couMemo'),"설명을")) return;
			else{
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
			}
		});
}

function couUpdate(currLi){
	console.log(currLi.html() | today1);
	var code = currLi.children().eq(1);
	var type = currLi.children().eq(2);
	var dis = currLi.children().eq(3); //문자형태이므로 숫자형태로 형변환 필요!!('%'제거 후)
	var date = currLi.children().eq(4);
	var update = currLi.children().eq(5);
	var memo = currLi.children().eq(6);
	var use = currLi.children().eq(7);

	var disc = dis.html().replace('%',"");
	
	var rowChan = "<td>-</td><td>"+code.html()+"</td><td>"+type.html()+"</td><td><input type='number' id='couDiscount' name='couDiscount' style='width: 50px;' value="+parseInt(disc)+">%</td>";
	rowChan += "<td>"+date.html()+"</td><td>"+today2+"</td>";
	rowChan += "<td><input type='text' style='width: 100px;' id='couMemo' name='couMemo' value="+memo.html()+"></td>";
	if(use.html()=='활성'){
		rowChan += "<td><input type='checkbox' id='couUse' name='couUse' checked='checked'>";
	}else if(use.html()=='비활성'){
		rowChan += "<td><input type='checkbox' id='couUse' name='couUse'>";
	}	
	rowChan += " <i class='fas fa-minus-circle' id='couUpDel' style='font-size:20px; color:red;'></i>";
	rowChan += " <i class='fas fa-save' id='couUp' style='font-size:20px; color:green;'></i></td>";
	
	$("#coupon_table .selected").html(rowChan);
}

function defaultBtn(){
	$('#addCou').attr('disabled', false);
	$('#upCou').attr('disabled', true);
	$('#delCou').attr('disabled', true);
}