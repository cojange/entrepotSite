function partner(){
	/* 저장 버튼 클릭 시 처리 이벤트 */
		$("#magInsertBtn").click(function(){
			console.log("가");
			//입력값 체크
			if(!chkForm($('#com_name'),"거래처 정보 등록일을")) return;
			else{
				$("#magazineInsertForm").ajaxForm({
					url : "/admin/ctrl/adPartner/magazineInsert.do",
					type : "post",
					enctype : "multipart/form-data",
					dataType : "text",
					error : function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success : function(data){
						console.log(data);
						//alert(data);
						if(data=="성공"){
							resetData();
							$('#magazineModel').modal('hide');
							
						}else{
							alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.")
							resetData();
						}
					}
				});
				$("#magazineInsertForm").submit();
			}
		});
}