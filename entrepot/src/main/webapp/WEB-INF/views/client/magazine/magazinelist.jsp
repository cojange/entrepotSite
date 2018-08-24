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
  
     <!--   <link href="/resources/include/client/css/ditail-1-col-portfolio.css" rel="stylesheet"> -->
    
  
   

	  
      <!-- Page Heading -->
    </head>
    <body>  
      <h1 class="my-4">${mvo.homename}
        <small>>> ${mvo.key}</small>
      </h1>
    <table>  
      
    <tr>
    <td width="130" valign="top" align="center">
    <td width="10"></td>
    <td>  
	<table width="90%" border="0" cellpadding="0" cellspacing="10px" align="center" >
		 <c:choose>
     		 <c:when test="${not empty magazienlist}">
     		 	<c:forEach var="list" items="${magazienlist}" varStatus="status">
     		 		
     		
     	
		<tr height="100" bgcolor="#FFFFFF" style="margin-top:50px;">	
		<td height="250" width="80" align="center"
			style="word-break: break-all; font: 9pt 나눔고딕; line-height: 180%;" >
			<!-- <td align=center width=50 style="word-break:break-all;font:9pt 나눔고딕;line-height:180%;"><b>1위</b>&nbsp;</td> -->


			<p align="center">

				<img src="" border="0"> <br>
			</p>
		</td>
		<td width="200"
			style="word-break: break-all; font: 9pt 나눔고딕; line-height: 180%;">
			<a href="#"> <!-- 작은이미지만 보일 경우 
			      <img src="../../data_book/2092-9625/s_2092-9625_2018_9_0_Y_20180817021056.jpg" width="200" height="270" border=0 /> -->
				<!-- 먼저 작은이미지를 보이고, 없으면 큰 이미지를 보이게 할 경우 --> <img src="${list.pl_path}" width="200"
				height="270" border="0">
		</a>
		</td>
		<td width="30"></td>
		<!-- 간격넓히기 -->
		<td style="word-break: break-all; font: 9pt 나눔고딕; line-height: 180%;">
			<table cellspacing="0" cellpadding="0" border="0" width="500">
				<tbody>
					<tr>
						<td width="542" colspan="2">
							<p>
								<a href="#"> <font size="3"
									style="font: 맑은 고딕, 나눔고딕, 굴림, verdana; color: #3399CC; FONT-WEIGHT: bold; line-height: 20px;">
										"${list.mg_name}"</font>
								</a> <label>월간</label> <label>부록</label>

								<!-- 	<img src="../../img/nation_01.gif" border="0"> -->
							</p>
						</td>
					</tr>

					<tr height="40">
						<td colspan="2" width="542">"${list.com_name}" &nbsp;<font
							color="#CDCDCD">|</font>&nbsp; 국가 <font color="#CDCDCD">|</font>&nbsp;${list.mg_period} &nbsp;<font color="#CDCDCD">|</font>&nbsp;<br> <br>정기구독가 <font color="#3399CC">[12개월]</font>&nbsp;&nbsp; <font
							color="#6B6B6B"><strike> ${list.pd_sale } 원</strike> → </font> <font
							color="#FF6633"><b> ${list.pd_salecost}</b></font> 원 <font color="#0066CC">
								(${list.pd_rate}% 할인) </font><br> <br>
						</td>
					</tr>
					<tr valign="top">
						<td>
							<table cellspacing="3" cellpadding="3" border="0" width="100%">
								<tbody>
									<tr>
										<td width="56"><label>유형</label></td>
										<td width="345">잡지</td>

									</tr>
									<tr>
										<td width="56"><label>출간일</label></td>
										<td width="345">${list.pd_date}</td>
									</tr>
									<tr>
										<td width="56"><label>대상</label></td>
										<td width="345">${list.dt_terget}</td>
									</tr>
									<tr>
										<td width="56"><label>키워드</label></td>
										<td width="345"> ${list.dt_keyword}</td>
									</tr>


									<tr>
										<td width="56"><label>간략소개</label></td>
										<td width="345">${list.dt_brief}</td>
									</tr>


								</tbody>
							</table>

						</td>

						<td align="right">
							<table width="80" cellspacing="0"
								style="border-collapse: collapse;">
								<tbody>
									<tr valign="top">
										<td width="80"
											style="border-width: 1; border-color: black; border-style: none;">
											<!-- <td width="80" style="border-width:1; border-color:black; border-style:none;"> -->
											<!-- <p align="center">

															<img src='../../images/best_circle1.gif' border='0'>

							 --> <!--<A HREF="sub05_01_writeOk.php?p_idx=13649"><img src="../../images/sub/subscrib_confirm.gif" border=0 alt="구독신청"></A>-->


											<input type="button" value="장바구니" id="btnjang"/> <br> 
											<input type="button" value="찜 버튼" id="btnjim"/>
											<input type="button" value="구매하기" id="btnsale"/> <!-- <A HREF="javascript:go_zzim('13649');"><img src="../../images/btn_mybook.gif" border=0></A> -->

										</td>
									</tr>
								</tbody>
							</table> &nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>
	
	<tr>
	 <td colspan="11" align="center" bgcolor="#FFFFFF">
	 	<img  src="/resources/images/lin_icon.jpg"> 
	 	
	 </td>
	</tr>			
	</c:forEach>
	</c:when>	
	</c:choose> 
</table>
</td>
</tr>
</table>
</body>
</html>