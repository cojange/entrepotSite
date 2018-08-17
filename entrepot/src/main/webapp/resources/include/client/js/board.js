search = "",keyword = "",start_date = "",end_date= "";
		$(function() {
			$("#dateCheck").hide();
			$("#textCheck").show(); 
			
			if(search !="b_date"){
				$("#dateCheck").hide();
				var date = getDateFormat(new Date());
				$("#start_date").val(date);
				$("#end_date").val(date);
			}else{
				$("#search").val(search);
				$("#textCheck").hide();
				$("#start_date").val(start_date);
				$("#end_date").val(end_date);
			}
			
			if(keyword !=""){
				$("#search").val(search);			
				$("#keyword").val(keyword);

			}
			
			/*검색 대상이 변경될 때마다 처리 이벤트*/
			$("#search").change(function() {
				if($("#search").val()!="b_date"){
					$("#dateCheck").hide(); //등록일 검색화면 숨기기
					$("#textCheck").show(); //검색 단어 화면 보이기
				}if($("#search").val()=="b_date"){
					$("#textCheck").hide();
					$("#dateCheck").show();
				}
				/* }if("#search").val()=="b_title"){
					$("#start_date").hide();
					$("#end_date").hide();
				} */
			});
			
			$("#search").change(function() {
				if($("#search").val()=="all"){
				 $("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			})
			/*검색 버튼 클릭스 처리 이벤트*/
			$("#serchBtn").click(function() {
				if($("#search").val()!="b_date"){
					if(!chkData("#keyword","검색어를"))return;
				}else if($("#search").val()=="b_date"){
					if(!chkData("#start_date","시작날짜를"))return;
					else if(!chkData("#end_date","종료날짜를"))return;
					else if($("#start_date").val()>$("#end_date").val()){
						alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
						return;
					}
				}
				goPage();
			});
			$("#allSearchBtn").click(function() {
				$("#serch > option:selected").val("");
				$("#keyword").val("");
				$("#start_date").val("");
				$("#end_date").val("");
				goPage();
			});
			
			/*엑셀다운로드 버튼 클릭시 처리 이벤트*/
			$("#excelDownBtn").click(function() {
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/board/boardExcel.do"
				});
				$("#f_search").submit();
			});
		});
		
		function goPage() {

			$("#f_search").attr({
				"method":"get",
				"action":"/admin/board/boardList.do"
			});
			$("#f_search").submit();
		}