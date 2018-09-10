<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"content="IE=edge,chrome=1">
<meta name = "viewport"content="width=device-width,initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no"/>	
<title>마이페이지</title>
<script src="/resources/include/client/js/html5shiv.js"></script>
<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/client/js/myPage.js"></script>
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
	<div class="divss"> 
	<!-- <form id="detailForm" name="detailForm"> -->
		<input type="hidden" id="listkey" name="listkey" value="${mvo.listkey}" />
		<input type="hidden" id="mg_num" name="mg_num"  />
		<div class="container-fluid" style="width: 860px;">
		<table border="0" class="myPage" style="width: 860px;">
			<tbody>
				<tr>
			<!------------------------------------------------------------------------------------>
			<!--==============================  메인내용 부분 시작 ================================================-->
					<td width="840" valign="top" align="center"><br>
						<table align="center" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td valign="top"> 
									<%-- <c:if test="${not empty cartList or not empty whishList}"> --%>
									<c:if test="${not empty cartList}">
										<table border="0" cellpadding="0" cellspacing="0" width="807.5">
										<tbody>
											<tr height="20">
												<td colspan="2"><i class="demo-icon icon-basket"></i><b>장바구니</b></td>	
											</tr>
											<tr height="2">
												<td bgcolor="#A6C745" width="200"></td><td bgcolor="#CDCDCD"></td>
											</tr>
										</tbody>
										</table>
									</c:if>
									<c:if test="${not empty whishList}">
										<table border="0" cellpadding="0" cellspacing="0" width="807.5">
										<tbody>
											<tr height="20">
												<td colspan="2">
													<i class="demo-icon icon-heart-filled"   style="width: 10px;" ></i><b>찜리스트</b>
												</td>
											</tr>
											<tr height="2">
												<td bgcolor="#A6C745" width="200"></td><td bgcolor="#CDCDCD"></td>
											</tr>
										</tbody>
										</table>
									</c:if>
									<c:if test="${not empty orderList}">
										<table border="0" cellpadding="0" cellspacing="0" width="807.5">
										<tbody>
											<tr height="20">
												<td colspan="2"><i class="demo-icon icon-calendar-inv"  style="width: 10px;" >
													</i><b>주문내역</b>
												</td>
											</tr>
											<tr height="2">
												<td bgcolor="#A6C745" width="200"></td><td bgcolor="#CDCDCD"></td>
											</tr>
										</tbody>
										</table>
									</c:if>
									<br>
				<!-- <font color="red">* 장바구니 목록은 3일이 지나면 자동으로 삭제됩니다.</font> <br> -->
									<table cellpadding="0" cellspacing="0" border="0" align="center">
									<tbody>
										<tr style="background-color: #00FFFF;">
										    <td><a href="/client/member/myPageWhish.do">My 찜리스트<i class="demo-icon icon-heart-filled"   style="width: 10px;" ></i></a>/</td>
										    <td><a href="/client/member/myPageCart.do">My 장바구니<i class="demo-icon icon-basket"  style="width: 10px;" ></i></a>/</td>
										    <td><a href="/client/member/myPageOrderList.do">My 주문내역<i class="demo-icon icon-calendar-inv"  style="width: 10px;" ></i></a>/</td>
										    <td><a href="#">My 배송정보<i class="demo-icon icon-truck" style="width: 10px;" ></i></a>/</td>
										    <td><a href="/client/member/myPageMy.do">My 정보변경<i class="demo-icon  icon-adult"  style="width: 10px;" ></i></a></td>
										    
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
												<c:if test="${not empty whishList}">
												<b><font>*</font> 찜리스트 총액 : <input type="text" class="total" readonly="readonly" size="15" value="" ></b>
												
												</c:if>
												<c:if test="${not empty cartList}">
												<b><font>*</font> 장바구니 총액 : <input type="text" class="total" readonly="readonly" size="15" value="" ></b>
												
												</c:if>
												<c:if test="${not empty orderList}">
												<b><font>*</font> 주문내역 총액 : <input type="text" class="total" readonly="readonly" size="15" value="" ></b>
												<input type="hidden" class="listType" value="Order">
												</c:if> 
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
			
									<table style="width: 100% ;" border="0" cellpadding="0" cellspacing="0" >
									<tbody>
										<tr>
											<td colspan="9" bgcolor="#CDCDCD" height="2"></td>
										</tr>
										<c:choose>
											<c:when test="${not empty whishList}">	
												<tr height="35" bgcolor="#E8ECED">							
													<td width="33" align="center"><a href="#" class="allCheck"><u>ALL</u></a></td>
													<td align="center" width="36"><b>No</b></td>
													<td align="center" width="155"><b>잡지코드<br>발행사</b></td>
													<td align="center" width="110"><b>잡지명</b></td>
													<td align="center" width="130"><b>잡지주기(개월수)</b></td>
													<td align="center" width="170"><b>정기구독가</b></td>
													<td align="center" width="50"><b>권수</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="center" width="170"><b>합계</b></td>			
												</tr>
												<c:forEach var="vo" items="${whishList}">
													<form class="checkForm"> 
														<tr class="myList trSize" width="807" height="70">
															<td width="33" align="center" class="checkP">
																<input type="checkbox" class="deleteCheck">
																<input type="hidden" class="mg_num" value="${vo.mg_num}">
																<input type="hidden" class="deleteCheckVal" name="mg_num" value="">
																<input type="hidden" class="listType" value="Whish">	
															</td>
															<td width="36" align="center"><input type="text" class="index" readonly="readonly" size="2" value=""></td>
															<td width="155" align="center"><img src="${vo.mg_num}"/></td>
															<td width="110" align="center">${vo.mg_name}</td> 
															<td width="130" align="center">${vo.mg_period}</td>
															<td width="170" align="right">
																<input type="text" class="money" readonly="readonly" style = "text-align:right;" value="${vo.pd_sale}원">	
															</td> 
															<td width="50" align="center" class="eaTd">
																<input type="text"  class="ea" value="${vo.ea}" min="1" maxlength="2" size="2">
																<a href="#" class="eaUpdate">
																	<img src="/resources/images/client/updatebtn.png" border="0">																
																</a>	
															</td> 
															<td width="170" align="right">
																<font color="red">
																	<input type="text" class="sum" readonly="readonly" style = "text-align:right;" value="">
																	<input type="hidden" class="sumNum" readonly="readonly" value="">				
																</font>
															</td>
															<%-- <td><a href="/client/member/memberModify.do?whish="${vo.whish}">삭제</a></td> --%> 
														</tr>
													</form>
												</c:forEach>
											</c:when>
											<c:when test="${not empty cartList}">										
												<tr height="35" bgcolor="#E8ECED">							
													<td width="33" align="center" >
														<a href="#" class="allCheck"><u>ALL</u></a>
													</td>
													<td align="center" width="36"><b>No</b></td>
													<td align="center" width="155"><b>잡지코드<br>발행사</b></td>
													<td align="center" width="110"><b>잡지명</b></td>
													<td align="center" width="130"><b>잡지주기(개월수)</b></td>
													<td align="center" width="170"><b>정기구독가</b></td>
													<td align="center" width="50"><b>권수</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="center" width="170"><b>합계</b></td>			
												</tr>
												<c:forEach var="vo" items="${cartList}">
													<form class="checkForm">
														<tr class="myList trSize" width="807" height="70">
															<td width="33" align="center" class="checkP">
																<input type="checkbox" class="deleteCheck">
																<input type="hidden" class="mg_num" value="${vo.mg_num}">
																<input type="hidden" class="deleteCheckVal"  name="mg_num" value="">
																<input type="hidden" class="listType" value="Cart">
															</td>
															<td width="36" align="center"><input type="text" class="index" readonly="readonly" size="2" value=""></td>
															<td width="155" align="center"><img src="${vo.mg_num}"/></td>
															<td width="110" align="center">${vo.mg_name}</td>
															<td width="130" align="center">${vo.mg_period}</td>
															
															<td width="170" align="center">
																<input type="text" class="money" readonly="readonly" style="text-align:right;" value="${vo.pd_sale}원">
															</td>
															<td width="50" align="center" class="eaTd">
																<input type="text" class="ea" value="${vo.ea}" maxlength="2" size="2">
																<a href="#"  class="eaUpdate"><img src="/resources/images/client/updatebtn.png" border="0"></a>
															</td>
															<td width="170" align="center">
																<font color="red">
																	<input type="text" class="sum" readonly="readonly" style="text-align:right;" value="">
																	<input type="hidden" class="sumNum" readonly="readonly" size="8" value="">
																</font>
															</td>
														</tr>
													</form>
												</c:forEach>
											</c:when>
											<c:when test="${not empty orderList}">											
												<tr height="35" bgcolor="#E8ECED">							
													<td width="33" align="center"></td>
													<td align="center" width="36"><b>No</b></td>
													<td align="center" width="155"><b>상품코드<br>발행사</b></td>
													<td align="center" width="110"><b>처리상태</b></td>
													<td align="center" width="130"><b>개월수</b></td>
													<td align="center" width="170"><b>정기구독가</b></td>
													<td align="center" width="50"><b>권수</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="center" width="170"><b>합계</b></td>			
												</tr>
												<c:forEach var="vo" items="${orderList}">
													<tr class="trSize myList" width="807">		
														<td width="33" align="center"  class="checkP"></td>
														<td width="36" align="center">${vo.order_num}<input type="hidden" class="index" readonly="readonly" size="2" value="">
														</td>
														<td width="155" align="center">
															<input type="hidden" id="pd_num" name="pd_num" value="${vo.pd_num}">
															${vo.mg_name}
														</td>
														<td width="110" align="center">${vo.order_ok}</td>
														<td width="130" align="center">${vo.pd_cost}</td>
														<td width="170" align="center" id="money">
															<input type="text" class="money" readonly="readonly" style="text-align:right;" value="${vo.order_money}원">
														</td>
														<td width="50" align="center" class="eaTd">
															<input type="text" class="ea"  value="${vo.order_ea}" maxlength="2" size="2">			
														</td>
														<td width="170" align="center">
															<font color="red">
																<input type="text" class="sum" readonly="readonly" style="text-align:right;" value="">
																<input type="hidden" class="sumNum" readonly="readonly" size="8" value="">
															</font>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr></tr>
												<tr>
													<td colspan="5" align="center">기록정보가 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>			
										<tr>
											<td colspan="9" bgcolor="#CDCDCD" height="2"></td>
										</tr>
										<c:if test="${not empty cartList or not empty whishList}">
										<tr>
											<table>
											<tbody>
												<tr height="35" >							
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>
													<td width="100"></td>			
												</tr>
												<tr width="807">
													<td align="left" colspan="8">
														<a href="#" class="deleteCheckBtn"><img src="/resources/images/client/WhishANDCartdelete.png"></a>
													</td>
													<td align="right" colspan="2">
														<a href="#" class="sell"><img src="/resources/images/client/order.png"></a>
													</td>
												</tr>
											</tbody>
											</table>																													
										</tr>
										</c:if>
									</tbody>
									</table><br><br>
								</td>
							</tr>
						</tbody>			
						</table>       
					</td>
					<!--==============================  메인내용 부분끝 ================================================-->
				</tr>
			</tbody>
		</table>
		</div>
	<!-- </form> -->
	</div>	
</body>
</html>
