<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="../image/icon.png">

    <title>로그인</title>
    <script src="/resources/include/client/js/html5shiv.js"></script>
   <!--  <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script> -->
   <script type="text/javascript" src="/resources/include/client/js/sell.js"></script>
    <script type="text/javascript">
    
    </script>
  </head>

  <body>
  	<div id="page" class="container joinform">
  	<!-- <div><img src="/resources/images/pic03.jpg"alt="" /></div> -->
	  <div>
	  	<div class="title"> 
			<h1>결제페이지</h1>
		</div>
    <div class="contentContainer">
    	
		<div class="well">
		    <table border="1">
		    <tbody>
		    	<tr bgcolor="#E8ECED">
		    		<td>No</td>
		    		<td>잡지명</td>
		    		<td>잡지주기</td>
		    		<td align="center">정기구독가</td>
		    		<td align="center">구매권수</td>
		    		<td align="center">합계</td>
		    	</tr>
		    	
		    	<c:choose>
					<c:when test="${not empty whishList}">
						<c:forEach var="vo" items="${whishList}">
							<tr class="tableSize">
								<td width="36" align="center">
									<input type="text" class="index" readonly="readonly" size="2" value="">
									<input type="hidden" id="mg_num" name="mg_num" value="${vo.mg_num}">
									<input type="hidden" id="pd_num" name="pd_num" value="${vo.pd_num}">
									<input type="hidden" id="record_num" name="record_num" value="${vo.record_num}">
									
								</td>
					    		<td>${vo.mg_name}</td>
					    		<td>${vo.mg_period}</td>
					    		<td>
					    			<input type="text" class="money" readonly="readonly"  value="${vo.pd_sale}" style = "text-align:center;">
					    		</td>
					    		<td style="text-align:right;">${vo.ea}권
					    			<input type="hidden" class="ea" readonly="readonly"  size="2" value="${vo.ea}" style = "text-align:center;">
					    		</td>
					    		<td> 
					    			<input type="text" class="sum" readonly="readonly" style = "text-align:center;">
					    			<input type="hidden" class="sumNum" value="">
					    		</td>
					    	</tr>
				    	</c:forEach>
					</c:when>
					<c:when test="${not empty cartList}">
						<c:forEach var="vo" items="${cartList}">
							<tr class="tableSize">
								
								<td width="36" align="center">
								<form class="listForm">
									<input type="text" class="index" readonly="readonly" size="2" value="">
									<input type="hidden" id="mg_num" name="mg_num" value="${vo.mg_num}">
									<input type="hidden" id="pd_num" name="pd_num" value="${vo.pd_num}">
									<input type="hidden" id="record_num" name="record_num" value="${vo.record_num}">
									</form>
								</td>
								
					    		<td>${vo.mg_name}</td>
					    		<td>${vo.mg_period}</td>
					    		<td>
					    			<input type="text" class="money" readonly="readonly"  value="${vo.pd_sale}" style = "text-align:center;">
					    		</td>
					    		<td style="text-align:right;">${vo.ea}권
					    			<input type="hidden" class="ea" readonly="readonly"  size="2" value="${vo.ea}" style = "text-align:center;">
					    		</td>
					    		<td>
					    			<input type="text" class="sum" readonly="readonly" style = "text-align:center;">
					    			<input type="hidden" class="sumNum" value="">
					    		</td>
					    	</tr>
				    	</c:forEach>
					</c:when>
				</c:choose>
		    </tbody>
		    </table>
		    <br>
		   	<form class="paymentForm">
		    <div>
		    	<!-- <input type="button" value="결제하기" id="paymentBtn" class="buttons">
		    	<input type="button" value="결제취소" id="cancelBtn" class="buttons"><br><br> --> 
		    	<div>
		    		<input type="hidden" id="m_num" name="m_num" value="${login.m_num}">
		    		<input type="hidden" id="mt" name="mt" value="${login.mt}">
		    		<span style="background-color: #dddddd;font-size: 12pt; color: red;">
		    			<strong>총수량&nbsp;:&nbsp;<input type="text" id="sumEa" size="5"  readonly="readonly" > </strong>
		    			<input type="hidden" id="sell_ea" name="sell_ea" value="">
		    		</span>
		    		<span style="background-color: #dddddd;font-size: 12pt; color: red;">
		    			<strong>총결제금액&nbsp;:&nbsp;<input type="text" id="total"  readonly="readonly" > </strong>
		    			<input type="hidden" id="sell_money" name="sell_money" value="">
		    		</span>
		    	</div><br><br>
		    	<font style="color: orange;">* 배송받으실주소 및 회원님의 정보입니다.</font>
		    		<c:if test="${login.mt == '개인'}">
			    	<table style="border: solid 1px; padding : 50px 50px; width: 600px;" >
			    	<tbody>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: red;">주문하시는분</span></td>
			    			<td>${member.m_name}</td>
			    		</tr>
			    		<tr>
			    			<td>이메일</td>
			    			<td>${member.m_email}</td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">입금자명</span></td>
			    			<td><input type="text" placeholder="입금자명을입력해주세요" id="bank_name" name="bank_name"></td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">입금은행</span></td>
			    			<td><input type="text" placeholder="입금은행을입력해주세요" id="bank" name="bank"></td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">쿠폰여부</span></td>
			    			<td>
			    				<select id="coupon_no" name="coupon_no">
			    					<option value=${member.coupon_no } data-discount=${member.coupon_discount }>${member.coupon_no }</option>
			    				</select>
			    			</td>
			    		</tr>

			    		
			    	</tbody>
			    	</table>
			    	</c:if>
			    	<c:if test="${login.mt == '단체'}">
			    	<table style="border: solid 1px; padding: 0px 0px;">
			    	<tbody>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">주문회사명</span></td>
			    			<td>${gmember.m_name}</td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">담당자분 이메일</span></td>
			    			<td>${gmember.char_email}</td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">입금자명</span></td>
			    			<td><input type="text" placeholder="입금자명을입력해주세요" id="bank_name" name="bank_name" value="조범구"></td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">입금은행</span></td>
			    			<td><input type="text" placeholder="입금은행을입력해주세요" id="bank" name="bank" value="신한"></td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">주소</span></td>
			    			<td>${gmember.m_address}</td>
			    		</tr>
			    		<tr>
			    			<td><span style="background-color: #dddddd;font-size: 12pt; color: blue;">쿠폰여부</span></td>
			    			<td><select id="coupon_no" name="coupon_no"><option value="cp_level_1">1단계</option></select></td>
			    		</tr>
			    	</tbody>
			    	</table>
			    	</c:if>    
		    	<br><br> 
		    	<div class="well" style=" padding-left: 0px; margin-left: -20px;" >
		    		<a id="paymentBtn" class="buttons">결제하기</a>
		    		<a id="cancelBtn" class="buttons">결제취소</a>	
		    	</div>		    	 		    	
		    </div>
		    </form>
		</div>
	  </div>
    </div> <!-- /container -->
    </div>
  </body>
</html>
