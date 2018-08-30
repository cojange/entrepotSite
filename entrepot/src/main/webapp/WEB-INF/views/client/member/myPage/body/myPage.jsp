<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>	
<title>마이페이지</title>
<script src="/resources/include/client/js/html5shiv.js"></script>
<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

function aa_open() 
{
	window.open('../../common/reflat.htm','pop','width=798,height=600,top=50,left=150'); 
}

</script>
</head>
 <link rel="stylesheet" href="../../nice_common/text.css" type="TEXT/CSS"><!--사이드메뉴css-->
 <!-- Custom fonts for this template-->
  <!-- <link href="/resources/include/client/css/all.min.css" rel="stylesheet" type="text/css"> -->

<body>
<div>
	<form id="detailForm" name="detailForm">
		<input type="hidden" id="listkey" name="listkey" value="${mvo.listkey}" />
		<input type="hidden" id="mg_num" name="mg_num"  />
		<div class="container-fluid">  
		<table border="1" class="myPage"> 
			<tbody>
				<tr>
					<!-- <td width="130" valign="top" align="center">
						<table border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="center">
								
								===============================사이드 메뉴 부분 시작 ===================================
								
									 <table border="0" cellpadding="0" cellspacing="0" align="center">
										<tbody><tr height="10">
										</tr><tr><td height="1" colspan="3"></td>
									
									
												</tr><tr align="center"><td colspan="3"><img src="../../images/common/lefttitle_mypage_nm.gif" border="0"></td></tr>
									
										
									
										
										<tr height="2">
										<td width="1" style="background:url(../../images/common/lefttitle_left.gif) repeat-y;"></td>
										<td>&nbsp;</td>
										<td width="1" style="background:url(../../images/common/lefttitle_right.gif) repeat-y;"></td></tr>
									
										<tr>
										<td width="1" style="background:url(../../images/common/lefttitle_left.gif) repeat-y;"></td>
										<td></td>
										<td width="1" style="background:url(../../images/common/lefttitle_right.gif) repeat-y;"></td>
										</tr>
									
											<tr>
												<td style="background:url(../../images/common/lefttitle_line.gif) repeat-y;"></td>
												<td>
													<table border="0">    
													<tbody>
														<tr>
															<td align="right"><a href="#" target=""><font style="font-family:' 맑은고딕', '나눔고딕', '굴림';">My 찜목록</font><i class="demo-icon icon-heart-filled" style="width: 10px;" ></i></a></td>				
														</tr>     
														<tr>
															<td align="right"><a href="#" target=""><font style="font-family:' 맑은고딕', '나눔고딕', '굴림';">My 장바구니</font><i class="demo-icon icon-basket" style="width: 10px;" ></i></a></td>						
														</tr>     
														<tr>									
															<td align="center" colspan="2"><font color="#cecece">ㅡㅡㅡㅡㅡㅡㅡㅡ</font>&nbsp;&nbsp;</td>
														</tr>           
														<tr>
															<td align="right"><a href="#" target=""><font style="font-family:' 맑은고딕', '나눔고딕', '굴림';">My 주문내역</font><i class="demo-icon icon-calendar-inv" style="width: 10px;" ></i></a></td>
														</tr>           
														<tr>									
															<td align="right"><a href="#" target=""><font style="font-family:' 맑은고딕', '나눔고딕', '굴림';">My 배송정보</font><i class="demo-icon icon-truck" style="width: 10px;" ></i></a></td>					
														</tr>     
														<tr>
															<td align="right"><a href="#" target=""><font style="font-family:' 맑은고딕', '나눔고딕', '굴림';">My 정보 변경</font><i class="demo-icon icon-adult" style="width: 10px;" ></i></a></td>
														</tr>
													</tbody>
													</table>	
												</td>
											</tr>
									  		<tr><td valign="top" height="7"></td></tr>
									   		<tr><td valign="top" height="30"></td></tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
						</table>
					</td>
					<td width="10"></td> -->
					<!--===============================사이드 메뉴 끝===================================-->
			<!------------------------------------------------------------------------------------>
			<!--==============================  메인내용 부분 시작 ================================================-->
					<td width="840" valign="top" align="center"><br>
						<table align="center" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td valign="top"> 
									<table border="0" cellpadding="0" cellspacing="0" width="807.5">
									<tbody><tr height="20"><td colspan="2"><i class="demo-icon icon-basket"></i><b>선택한항목</b></td></tr>
										<tr height="2"><td bgcolor="#A6C745" width="200"></td><td bgcolor="#CDCDCD"></td></tr>
									</tbody>
									</table><br>
				<!-- <font color="red">* 장바구니 목록은 3일이 지나면 자동으로 삭제됩니다.</font> <br> -->
									<table cellpadding="0" cellspacing="0" border="0" align="center">
									<tbody>
										<tr style="background-color: #00FFFF;">
										    <td><a href="#">My 찜리스트<i class="demo-icon icon-heart-filled"   style="width: 10px;" ></i></a>/</td>
										    <td><a href="#">My 장바구니<i class="demo-icon icon-basket"  style="width: 10px;" ></i></a>/</td>
										    <td><a href="#">My 주문내역<i class="demo-icon icon-calendar-inv"  style="width: 10px;" ></i></a>/</td>
										    <td><a href="#">My 배송정보<i class="demo-icon icon-truck" style="width: 10px;" ></i></a>/</td>
										    <td><a href="#">My 정보변경<i class="demo-icon  icon-adult"  style="width: 10px;" ></i></a></td>
										    
			 		    				</tr>	
			            				<tr height="30">
			            					<td></td> 
			            				</tr>
									</tbody>
									</table>		
			<!-- 배너 끝 -->
			<!-- ------------------------------------------------------------------------------------------------------- -->
			<div id="dek" style="visibility: visible; display: none; left: 1169px; top: 172px;"></div>
			
			<!-- 리스트 시작 -->
			<form method="post" action="sub06_02_list_station.php" name="form1">
			<input type="hidden" name="code" value="issn__mybook_hope">
			<input type="hidden" name="idx_num" value="">
			<input type="hidden" name="search" value="">
			<input type="hidden" name="smenu" value="">
			<input type="hidden" name="npage" value="1">
			<input type="hidden" name="dirName" value="">
			<input type="hidden" name="file_dir" value="sub06_02_">
			<input type="hidden" name="m_idx" value="58">
			<input type="hidden" name="m_idx" value="58">
			<input type="hidden" name="num_change" value="N">
									<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
									<tbody>
										<tr height="30">
											<td>
												<!-- <FONT COLOR="red">*</FONT> 정기구독가격이 0원인 경우는 구매할수 없습니다. -->
												<b><font color="red">*</font> 장바구니 총액 : 0 원 (0 종  권)</b>
											</td>
											<td align="right">
												<!-- 검색 -->
												<select name="smenu">
													<option value="book_name">정간물명</option>
												</select>
												<input type="text" name="search" id="input_02" size="15">
												<input type="submit" name="Submit" value="검색">						
											</td>
										</tr>
									</tbody>
									</table>
			
									<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
									<tbody>
										<tr>
											<td colspan="9" bgcolor="#CDCDCD" height="2"></td>
										</tr>
										<tr height="35" bgcolor="#E8ECED">							
											<td width="35" align="center"><a href="#" onclick="javascript:reverse(this.form)"><u>선택</u></a></td>
											<td align="center"><b>No</b></td>
											<td align="center"><b>정간물명<br>발행사</b></td>
											<td align="center"><b>유형</b></td>
											<td align="center"><b>개월수</b></td>
											<td align="right"><b>정기구독가</b></td>
											<td align="right"><b>권수</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td align="right"><b>합계</b></td>			
										</tr>
										<tr>
											<td colspan="9" height="1" bgcolor="#c9c9c9"></td>
										</tr>
										<tr>
											<td colspan="9" bgcolor="#CDCDCD" height="2"></td>
										</tr>
									</tbody>
									</table><br>
			
									<table align="center" cellspacing="0" cellpadding="0" width="100%" border="0">
									<tbody>
										<tr>
											<td width="100%">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<table align="left" cellspacing="0" cellpadding="0" border="0" width="100%">
												<tbody>
													<tr>
														<td width="90%" align="left">
															<a href="#" onclick="javascript:send_sel('this.form','del','58','','')">
															<img src="../../images/common/btn_delete.gif" border="0"></a>
															<a href="#" onclick="javascript:window.open('./sub06_02_add_modify.php?mem_id=nomember20180823060226','post','width=450, height=500, scrollbars=yes');">
															<img src="../../images/common/btn_add_new.gif" border="0"></a>
														</td>							  
													</tr>
													<tr height="30">
														<td> </td> 
													</tr>	
												</tbody>
												</table>
											</td>
										</tr>
									</tbody>
									</table><br>
			</form>
			
			
			
			<!-- ------------------------------------------------------------------------------------------------------- -->
								</td>
							</tr>
						</tbody>			
						</table>       
			<!--==============================  메인내용 부분끝 ================================================-->
					</td>
				</tr>
			</tbody>
			</table>
		</div>
	</form>
</div>	
</body>
</html>
