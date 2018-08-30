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
</head>

<body>
	<<div class="container-fluid">
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
            										<img src="${magazine.pl_path}" width="350" height="450" border="0">
				
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
																		<font color="#0066CC">(${magazine.pd_rate} }%↓)</font>
																		</font>
													              </td>
													        </tr>
															<tr height="8"><td> </td></tr>
															<tr>
																<td colspan="2"> </td>
															</tr>													
													        <tr><td height="10" colspan="4"></td></tr>
            												<tr>
              													<td colspan="4">
               														 <table>
                 														<tbody>
                 															<tr>
                 																<a href="#">
                 																	<img src="/resources/images/ditail/btn_purchase_co.gif">
                 																</a>
                 															 </tr> 
																	  	    <tr> 
																	  	    	<td>
																		 			<a href="#">
                 																	<img src="/resources/images/ditail/btn_cart_co.gif">
                 																	</a>
                 																	<a href="#">
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
					<img src="${free.pl_path}" width="700" border="0" >
					<br>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	<br>
	<br>	
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
	<!-- <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	   <tbody><tr><td align="right"><br><br><font color="#a8a8a8">* 표지를 클릭하시면 내지를 보실 수 있습니다.</font>&nbsp;&nbsp;&nbsp;<br></font></td></tr>
      <tr>
        <td width="96%">
         
		  
		  ------------------------------ 표지리스트 시작 ----------------------------------
		  
		  
          <table border="0" cellpadding="5" cellspacing="0">
          	<tbody>
          		<tr>
                    <td valign="top" align="center">
					표지이미지
					  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  		<tbody>
				  			<tr>
								<td align="center" bgcolor="#FFFFFF">
									<font color="blue">
										<img src="../../data_book/1599-0001/1599-0001_2018_8_0_Y_20180718033048.jpg" width="240" height="325" border="0">
									</font>
								</td>
				  			</tr>
				  		</tbody>
				  	</table>
					  년월일
					  <table border="0" cellspacing="0" cellpadding="0">
					 	 <tbody>
					 	 	<tr>
					 	 		<td height="10" align="center" />
					 	 	</tr>
					  	</tbody>
					  </table>
	              </td>
                  <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

			<font color="blue">
						<img src="../../data_book/1599-0001/1599-0001_2018_7_0_Y_20180619062108.jpg" width="240" height="325" border="0"></font><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_7_0_Y_20180619062108.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 07월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=44178&b_yy=2018&b_mm=07&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=43519&amp;b_yy=2018&amp;b_mm=06&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_6_0_Y_20180517054513.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_6_0_Y_20180517054513.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 06월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=43519&b_yy=2018&b_mm=06&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
            </tr><tr><td height="5"></td></tr><tr>            <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=43186&amp;b_yy=2018&amp;b_mm=05&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_5_0_Y_20180425115328.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_5_0_Y_20180425115328.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 05월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=43186&b_yy=2018&b_mm=05&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=42820&amp;b_yy=2018&amp;b_mm=04&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_4_0_Y_20180320013512.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_4_0_Y_20180320013512.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 04월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=42820&b_yy=2018&b_mm=04&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=42079&amp;b_yy=2018&amp;b_mm=03&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_3_0_Y_20180219010601.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_3_0_Y_20180219010601.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 03월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=42079&b_yy=2018&b_mm=03&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
            </tr><tr><td height="5"></td></tr><tr>            <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=41187&amp;b_yy=2018&amp;b_mm=02&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_2_0_Y_20180118010446.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_2_0_Y_20180118010446.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 02월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=41187&b_yy=2018&b_mm=02&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=40387&amp;b_yy=2018&amp;b_mm=01&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2018_1_0_Y_20171219100100.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2018_1_0_Y_20171219100100.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2018년 01월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=40387&b_yy=2018&b_mm=01&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=38939&amp;b_yy=2017&amp;b_mm=12&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2017_12_0_Y_20171121110738.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2017_12_0_Y_20171121110738.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2017년 12월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=38939&b_yy=2017&b_mm=12&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
            </tr><tr><td height="5"></td></tr><tr>            <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=37859&amp;b_yy=2017&amp;b_mm=11&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2017_11_0_Y_20171027035820.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2017_11_0_Y_20171027035820.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2017년 11월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=37859&b_yy=2017&b_mm=11&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=37448&amp;b_yy=2017&amp;b_mm=10&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2017_10_0_Y_20170926013933.JPG" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2017_10_0_Y_20170926013933.JPG" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2017년 10월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=37448&b_yy=2017&b_mm=10&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
                        <td valign="top" align="center">
				표지이미지
				  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
				  <tbody><tr>
					<td align="center" bgcolor="#FFFFFF">

				<a href="sub05_01_view.php?m_idx=46&amp;idx_num=13798&amp;npage=1&amp;smenu=&amp;search=&amp;mode=sub_view&amp;gubun=&amp;file_dir=sub05_01_&amp;p_idx=36646&amp;b_yy=2017&amp;b_mm=09&amp;b_nn=0&amp;mode=sub_view&amp;#e"><font color="blue">
						
						
						<img src="../../data_book/1599-0001/1599-0001_2017_9_0_Y_20170822095153.jpg" width="240" height="325" border="0"></font></a><font color="blue">

				  

						<A HREF="javascript:alert('내지이미지가 없습니다.');"><img src="../../data_book/jmnb/1599-0001/1599-0001_2017_9_0_Y_20170822095153.jpg" width="240" border=0 /></A>
				  
					</font></td>
				  </tr>
				  </tbody></table>

				  년월일
				  <table border="0" cellspacing="0" cellpadding="0">
				  <tbody><tr><td height="10" align="center"></td></tr>

				  해외정간물인 경우만 년월호 주석처리 - 2014.8.14
				  <tr><td align=center> 2017년 09월호 </td></tr>

				
					<tr><td align=center><a href="sub05_01_view.php?m_idx=46&idx_num=13798&npage=1&smenu=&search=&mode=sub_view&gubun=&file_dir=sub05_01_&p_idx=36646&b_yy=2017&b_mm=09&#aa">[크게 보기]</A></td></tr>

				


				  </tbody></table>
            </td>
            </tr><tr><td height="5"></td></tr><tr>          </tr>
          </tbody></table>

		------------------------------ 표지리스트 끝 ----------------------------------


        </td>
	</tr>
	</tbody></table> -->
</div>
</div>	
</body>
</html>