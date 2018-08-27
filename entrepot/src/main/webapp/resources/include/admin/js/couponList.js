/* 쿠폰추가 및 쿠폰추가 테이블 삭제 */
function addCoupon(){
	/* 쿠폰추가 */
	$("#addCou").click(function(){
		var rowItem = "<tr><td>-</td><td>-</td><td>이벤트쿠폰</td><td><input type='number' id='couDiscount' name='couDiscount' style='width: 50px;'>%</td>";
		rowItem += "<td><input type='date' style='width: 135px;' id='couDate' name='couDate'></td><td><input type='date' style='width: 135px;' id='couUpdate' name='couUpdate'></td>";
		rowItem += "<td><input type='text' style='width: 100px;' id='couMemo' name='couMemo' value='-'> <i class='fas fa-minus-circle' id='couDel' style='font-size:20px; color:red;'></i>";
		rowItem += " <i class='fas fa-save' id='couSave' style='font-size:20px; color:green;'></i></td></tr>";
		
		$("#coupon_table").append(rowItem);
		$('#addCou').attr('disabled', true);

	});
	
	/* 쿠폰추가 테이블(빈테이블) 삭제 */
	$('#coupon_table').on("click", "#couDel", function(){
		$(this).closest("tr").remove();
		$('#addCou').attr('disabled', false);
	});
	
	/* 저장버튼 클릭시 처리 이벤트 */
	$('#coupon_table').on("click", "#couSave", function(){
		//입력값 체크
		if($("#couType").val()=='default'){
			alert("쿠폰 유형을 선택해 주세요.");
			$("#couType").focus();
			return false;
		}
		else if(!chkData($('#couDiscount'),"할인율을")) return;
		else if(!chkData($('#couDate'),"등록일을")) return;
		else{
			var insertUrl = "/admin/adBoard/adminBoard/couponInsert.do";
			
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
					coupon_date:$("#couDate").val(),
					coupon_memo:$("#couMemo").val()
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
	
	
}