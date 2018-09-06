<%@page import="java.net.URLDecoder"%>
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
      
<%--  <%
 	String cp=request.getContextPath();
 	request.setCharacterEncoding("UTF-8");
 	
 	
 	Cookie[] ck=request.getCookies();
 %>      --%>
<script type="text/javascript" link="/resources/include/client/js/jquery-1.12.4.min.js"></script>


</head>
<body class="sideview">

		<div class="floating">
			<div><a href="/client/board/adminboard/adminboardList.do"><img src="/resources/images/produt/images.png"  width="120"></a></div>
			<div><a href="/client/board/personal/personalList.do"><img src="/resources/images/produt/images2.png" width="120"></a></div>
			<%-- <div >

				<div  class="recTit">최근본상품 <span id=recentCnt></span></div>
			
			<ul style="border-right:1px solid #d0d7e9; border-left:1px solid #d0d7e9; border-top:1px solid #d0d7e9; border-bottom:1px solid #d0d7e9; margin:0px; padding:0px"">
			<%if(ck != null){
				for( int i=0 ; i<3; i++){
					if(URLDecoder.decode(ck[i].getName(), "UTF-8").indexOf("상품") != -1){%>
						<li style=" margin:0;list-style:none;"><small style="width: 110px"><%= URLDecoder.decode(ck[i].getName(), "UTF-8")%></small><br>
							<img src="<%=ck[i].getValue()%>" width="30px">
						</li>
							
							
				<%	}
				}
			}	%>
			</ul>    <!-- 본 상품이 뿌려질 부분  -->

		</div> --%>

		</div>



	
</body>
</html>			