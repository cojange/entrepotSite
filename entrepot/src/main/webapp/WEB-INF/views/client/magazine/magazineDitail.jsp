<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %>   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
      <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- 모바일 웹 페이지 설정 종료 -->
      
      <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
      <!-- [if lt IE 9] -->
      <!-- <script src="../js/html5shiv.js"</script> -->
      <!-- [endif] -->
 <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>  
 <script>
 	$(function(){
 	 
 		//수량 증가 수량 하락
 		$("#plus2").click(function() {
			var num = $("#su").val();
 			num++;
 			$("#su").val(num);
		});
 		$("#manus").click(function() {
			var num = $("#su").val();
 			if(num>0){
				num--;
 			}
 			$("#su").val(num);
		});
 		
 		$(".cartbtn").click(function(){
   			var id= $('#id').val();
   			var can=$("#su").val();
   			
			if (id == null || id=="") {
				alert('로그인이 안되어 있습니다. 로그인 후 다시 시도해주세요');
			}else{
				var message = confirm("장바구니에 추가하시겠습니까?");
		         if(message == true){   
		        	 var insert = "/client/list/card.do";
		 			
		 			$.ajax({
		 				url:insert,
		 				type: "post",
		 				headers : {
		 					"content-type":"application/json",
		 					"x-HTTP-Method-Dverride":"POST"
		 				},
		 				dataType:"text",
		 				data:JSON.stringify({
		 					record_num:$("#cart").val(),
		 					mg_num:$("#mg_num").val(),
		 					ea:	$("#su").val()
		 				}),
		 				error: function() {
		 					alert("시스템 오류입니다. 잠시후 다시 시도해주세요")
		 				},
		 				success : function(resultData) {
		 					if(resultData == "SUCCESS"){
		 						alert("장바구니에 추가 됬습니다.");
		 						
		 					}else{
		 						alert(resultData);
		 					}
		 				}
		 			});   
		         }else{
		            return false;
		         }	
				
				
			}
			
   		});
 		$(".jtbtn").click(function(){
   			var id= $('#id').val();
			if (id == null || id=="") {

				alert('로그인이 안되어 있습니다. 로그인 후 다시 시도해주세요');
				conesol.log($("#mg_num").val());
			}else{
				var message = confirm("찜에 추가하시겠습니까?");
		         if(message == true){   
		        	 var insert = "/client/list/card.do";
		     		
		     		$.ajax({
		     			url:insert,
		     			type: "post",
		     			headers : {
		     				"content-type":"application/json",
		     				"x-HTTP-Method-Dverride":"POST"
		     			},
		     			dataType:"text",
		     			data:JSON.stringify({
		     				record_num:$("#whish").val(),
		     				mg_num:$("#mg_num").val(),
		     				ea:$("#su").val()	
		     			}),
		     			error: function() {
		     				alert("시스템 오류입니다. 잠시후 다시 시도해주세요")
		     			},
		     			success : function(resultData) {
		     				if(resultData == "SUCCESS"){
		     					alert("찜에 추가 됬습니다.");
		     					
		     				}else{
		     					alert(resultData);
		     				}
		     			}
		     		}); 
		         }else{
		            return false;
		         }	
				
			}
   		});
 		
 	})
 function fn_press(event, type) {
        if(type == "numbers") {
            if(event.keyCode < 48 || event.keyCode > 57) return false;
            //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
        }
    }

 	function fn_press_han(obj)
    {
        //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    }


 
		

		
	</script>
</head>

<body>
	<input type="hidden" id="id" name="id" value="${login.m_id}">
	<input type="hidden" id="cart" name="cart" value="${login.cart}"/>
	<input type="hidden" id="whish" name="whish" value="${login.whish}"/>
	<input type="hidden" id="mg_num" name="mg_num" value="${mvo.mg_num}"/>
	<input type="hidden" id="mg_name" name="mg_name" value="${mvo.mg_num}"/>
	<input type="hidden" id="pl_path" name="pl_path" value="${magazine.pl_path}"/>
	<div class="container-fluid">
	<table  border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
  				<td valign="top" >
					<table  border="0" cellpadding="0" cellspacing="0" width="70%" id="tr2">
						
							<tr height="20">
								<td colspan="2"><b>잡지
										상세보기</b></td>
							</tr>
							<tr height="2">
								<td bgcolor="#A6C745" width="200"></td>
								<td bgcolor="#CDCDCD"></td>
							</tr>
						
					</table> <br>
					<table width="100%" align="left" border="0" cellpadding="5" cellspacing="0">
    					<tbody>
    						<tr>
     							 <td bgcolor="#FFFFFF">
       								 <table>
        								 <tbody>
        								 	<tr>
												<td valign="top">
            										<img src="/uploadStorage/magazineImage/main/ ${magazine.pl_path}" width="350" height="450" border="0">
				
												  <br><br><br><br>
          										</td>
          										<td width="30"></td>
		 									    <td width="550" valign="top">
													 <table border="0" width="100%">
         											   <tbody>
         											   		<tr>
             													 <td height="50" colspan="4" style="line-height=2;"><!-- [] --><font size="4" color="#3399CC" face="나눔고딕"><b> ${magazine.mg_name }</b></font>	
													             </td>
									 			            </tr>
            												<tr><td colspan="4"></td></tr>
           													<tr height="5"></tr>
           													<tr>
		              												<td width="30%" height="20"><font face="나눔고딕" color="#696969">발행사</font></td>
		             											    <td width="70%"> <font face="나눔고딕" color="#393107">: &nbsp;&nbsp; ${magazine.com_name}</font></td>
            												</tr>
												            <tr height="5"></tr>
												            <tr>
             													 <td height="20">  <font face="나눔고딕" color="#696969">정간물 유형</font></td>
              													 <td><font face="나눔고딕" color="#393107">:&nbsp;&nbsp;잡지</font></td>
            												</tr>
															 <tr height="5"></tr>
															 <tr>
													              <td height="20">  <font face="나눔고딕" color="#696969">대상</font></td>
													              <td><font face="나눔고딕" color="#393107">: &nbsp;&nbsp;${magazine.dt_target }</font></td>
            												</tr>
															<tr height="5"></tr>
															<tr>
													            <td height="20">  <font face="나눔고딕" color="#696969">주제</font></td>
													         	<td>
																	<font face="나눔고딕" color="#393107">: &nbsp;&nbsp;${magazine.dt_keyword }</font>
																</td>
															</tr>

												            <tr height="5">
            												</tr>
            												<tr>
												              <td height="20"><font face="나눔고딕" color="#696969">발행횟수</font></td>
												              <td><font face="나눔고딕" color="#393107">:&nbsp;&nbsp;${magazine.mg_period}</font></td>
												            </tr>
           													 <tr height="5"></tr>
           													 <tr>
																 <td height="20"><font face="나눔고딕" color="#696969"><b>발행일</b></font></td>
																 <td>
																	<font face="나눔고딕" color="#393107">: &nbsp;&nbsp;${magazine.pd_date}</font>
																  </td>
															</tr> 
																<!-- S: 정기발송일 추가 --> 
															<tr><td height="5" colspan="4"></td></tr>
													         <tr height="5"></tr>
													         <tr>
													                <td height="20"><font face="나눔고딕" color="#696969"><b>정기구독가</b></font><b><font color="#3399CC"> <b>(12개월)</b></font>	</b></td>
													                <td> <font face="나눔고딕" color="#393107">: 
																						&nbsp;<font color="#6B6B6B"><strike>${magazine.pd_sale}</strike></font>→<font color="#DE590A"><b>${magazine.pd_salecost }</b></font> 원
																		<font color="#0066CC">(${magazine.pd_rate}%↓)</font>
																		</font>
													              </td>
													        </tr>
															<tr height="8"><td> </td></tr>
															<tr>
																 <td height="20"><font face="나눔고딕" color="#696969"><b>수량</b></font></td>
													                <td> <font face="나눔고딕" color="#393107">: 
																						&nbsp;<input type="text" maxlength="3" onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="height: 26px; width: 40px; text-align: right; padding-right: 5px; font-weight: bold;
																						background-color: gray; ime-mode:disabled; " id="su" name="su" value="1" />
																		</font>
																		<button type="button" id="plus2"><img src="/resources/images/ditail/btn_plus.gif"></button>
																		<button type="button" id="manus"><img src="/resources/images/ditail/btn_minus.gif"></button>
													             	 </td>
															</tr>
															<tr>
																<td colspan="2"> </td>
															</tr>													
													        <tr><td height="10" colspan="4"></td></tr>
            												<tr>
              													<td colspan="4">
               														 <table>
                 														<tbody>
                 															<tr>
                 																<a href="#" >
                 																	<img src="/resources/images/ditail/btn_purchase_co.gif">
                 																</a>
                 															 </tr> 
																	  	    <tr> 
																	  	    	<td>
																		 			<a href="#" class="cartbtn">
                 																	<img src="/resources/images/ditail/btn_cart_co.gif">
                 																	</a>
                 																	<a href="#" class="jtbtn">
                 																	<img src="/resources/images/ditail/btn_zzim_co.gif">
                 																	</a>	 
																		   		</td>
														                	</tr>
														                </tbody>
														              </table>
														          </td>
														    </tr>
													 </tbody>
												</table>
											 </td>
										</tr>
								</tbody>
							</table><br>
					 </td>
    			</tr>
    		</tbody>
    	</table>
	</td>
</tr>	
</tbody>
</table>
<div >
	<a name="a"></a>   
	<div> 
		<table>
			<tr>
				<td align="left">
					<a href="#a"><img  src="/resources/images/ditail/dir_blue_01_over.gif" border="0"></a>
					<a href="#b"><img  src="/resources/images/ditail/dir_blue_03.gif" border="0"></a>
					<a href="#c"><img  src="/resources/images/ditail/dir_blue_06.gif" border="0"></a> 	
					<a href="#d"><img  src="/resources/images/ditail/dir_blue_04.gif" border="0"></a>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<img src="/resources/images/ditail/dir_intro_bm.gif" border="0" width="800">
	<br>
	<br>
	<p valign="top" height="50" width="590" style="word-break:break-all;font:10pt 나눔고딕 ;line-height:180%;padding-left:20px">
		${magazine.dt_detail}
	</p>
	<c:choose>
		<c:when test="${not empty free}">
			<c:forEach var="free" items="${free}" varStatus="status">
				<div>
					<img src="/uploadStorage/magazineImage/prev/ ${free.pl_path}" width="700" border="0" >
				</div>
			</c:forEach>
		</c:when>
	</c:choose>	
</div>
<div>
	<a name="b"></a>
	<div> 
		<table>
			<tr>
				<td align="left">
					<a href="#a"><img  src="/resources/images/ditail/dir_blue_01.gif" border="0"></a>
					<a href="#b"><img  src="/resources/images/ditail/dir_blue_03_over.gif" border="0"></a>
					<a href="#c"><img  src="/resources/images/ditail/dir_blue_06.gif" border="0"></a>
					<a href="#d"><img  src="/resources/images/ditail/dir_blue_04.gif" border="0"></a>					 	
				</td>
			</tr>
		</table>
	</div>
	<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	   <tbody><tr><td align="right"><br><br><font color="#a8a8a8"><!-- * 표지를 클릭하시면 내지를 보실 수 있습니다.</font>&nbsp;&nbsp;&nbsp;<br> --></font></td></tr>
      <tr>
      	<p  valign="top" height="50" width="590" style="word-break:break-all;font:10pt 나눔고딕 ;line-height:180%;padding-left:20px">
      		${magazine.dt_contents }
      	</p>
      </tr>
      <tr>
      	
        <td width="96%">
         
		  
		  <!-- ------------------------------ 표지리스트 시작 ---------------------------------- -->
		  
		  
          <table border="0" cellpadding="5" cellspacing="0">
          	<tbody>
          		<c:choose>
          			<c:when test="${not empty sumlist}">
          				<c:forEach  var="list" items="${sumlist}" varStatus="san">
          					<c:if test="${san.count eq 1 }">
          					 	<tr>
          					</c:if>
          					<c:if test="${san.count eq 4} ">
          						<tr>           	
          					</c:if>
          	
				                    <td valign="top" align="center">
									<!-- 표지이미지 -->
									  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
								  		<tbody>
								  			<tr>
												<td align="center" bgcolor="#FFFFFF">
													<font color="blue">
														<img src="/uploadStorage/magazineImage/main/ ${list.pl_path}" width="240" height="325" border="0">
													</font>
												</td>
								  			</tr>
								  		</tbody>
								  	</table>
									  <!-- 년월일 -->
									  <table border="0" cellspacing="0" cellpadding="0">
									 	 <tbody>
									 	 	<tr>
									 	 		<td height="10" align="center" />
									 	 	</tr>
									  	</tbody>
									  </table>
					            	</td>
							<c:if test="${san.count eq 3 }">
								</tr>
								<tr>            
            						<td height="5"></td>	
            					</tr>
							</c:if>
							<c:if test="${san.end }">
								</tr>
								<tr>            
            						<td height="5"></td>	
            					</tr>
							</c:if>
							                  	
            	
            				
            		</c:forEach>
            	</c:when>
           	</c:choose>
            	
            	
          	</tbody>
          
          </table>

		<!-- ------------------------------ 표지리스트 끝 ---------------------------------- -->

			
        </td>
	</tr>
	<c:choose>
    	<c:when test="${not empty sumlist}">
          	<c:forEach  var="list" items="${sumlist}" varStatus="san">
				<tr>
					<td>
						<img src="/uploadStorage/magazineImage/main/ ${list.pl_path}" width="500" border="0" >
					</td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>			
	</tbody>
	</table>
</div>
<div>
	<a name="c"></a>
	<div> 
		<table>
			<tr>
				<td align="left">
					<a href="#a"><img  src="/resources/images/ditail/dir_blue_01.gif" border="0"></a>
					<a href="#b"><img  src="/resources/images/ditail/dir_blue_03.gif" border="0"></a>
					<a href="#c"><img  src="/resources/images/ditail/dir_blue_06_over.gif" border="0"></a>
					<a href="#d"><img  src="/resources/images/ditail/dir_blue_04.gif" border="0"></a>					 	
				</td>
			</tr>
		</table>
	</div>
	<br>
	<img src="/resources/images/ditail/notice_paper_g.gif" width="700" border="0">
</div>
>
</div>	
</body>
</html>
