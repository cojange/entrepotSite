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
		    <tbody  class="tableSize">
		    	<tr bgcolor="#E8ECED">
		    		<td>No</td>
		    		<td>잡지명</td>
		    		<td>잡지주기</td>
		    		<td align="right">정기구독가</td>
		    		<td align="right">구매권수</td>
		    		<td align="right">합계</td>
		    	</tr>
		    	<c:choose>
					<c:when test="${not empty whishList}">
						<c:forEach var="vo" items="${whishList}">
							<tr>
								<td width="36" align="center">
									<input type="text" class="index" readonly="readonly" size="2" value="">
								</td>
					    		<td>${vo.mg_name}</td>
					    		<td>${vo.mg_period}</td>
					    		<td>
					    			<input type="text" class="money" readonly="readonly"  value="${vo.pd_sale}" style = "text-align:right;">
					    		</td>
					    		<td style="text-align:right;">${vo.ea}권
					    			<input type="hidden" class="ea" readonly="readonly"  size="2" value="${vo.ea}" style = "text-align:right;">
					    		</td>
					    		<td> 
					    			<input type="text" class="sum" readonly="readonly" style = "text-align:right;">
					    			<input type="hidden" class="sumNum" value="">
					    		</td>
					    	</tr>
				    	</c:forEach>
					</c:when>
					<c:when test="${not empty cartList}">
						<c:forEach var="vo" items="${cartList}">
							<tr>
								<td width="36" align="center">
									<input type="text" class="index" readonly="readonly" size="2" value="">
								</td>
					    		<td>${vo.mg_name}</td>
					    		<td>${vo.mg_period}</td>
					    		<td>
					    			<input type="text" class="money" readonly="readonly"  value="${vo.pd_sale}" style = "text-align:right;">
					    		</td>
					    		<td style="text-align:right;">${vo.ea}권
					    			<input type="hidden" class="ea" readonly="readonly"  size="2" value="${vo.ea}">
					    		</td>
					    		<td>
					    			<input type="text" class="sum" readonly="readonly" style = "text-align:right;">
					    			<input type="hidden" class="sumNum" value="">
					    		</td>
					    	</tr>
				    	</c:forEach>
					</c:when>
				</c:choose>
		    	
		    </tbody>
		    </table>
		    <br>
		    <form>
		    <div>	   
		    	<input type="button" value="결제하기" id="paymentBtn">
		    	<input type="button" value="결제취소" id="cancelBtn"><br><br>
		    	<div>
		    		<span style="background-color: #dddddd;font-size: 12pt; color: red;">
		    			<strong>총수량&nbsp;:&nbsp;<input type="text" id="sumEa" size="5"> </strong> 
		    		</span>
		    		<span style="background-color: #dddddd;font-size: 12pt; color: red;">
		    			<strong>총결제금액&nbsp;:&nbsp;<input type="text" id="total"> </strong>
		    		</span>
		    	</div>		    	 		    	
		    </div>
		    </form>
		</div>
	  </div>
    </div> <!-- /container -->
    </div>
  </body>
</html>
