<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
			
			 <!--사용자 js-->
     		 <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
			<script type="text/javascript" src="/resources/include/common/js/common.js"></script>
		
			<link rel="stylesheet" type="text/css" href="/resources/include/client/css/common.css">
			<!-- 합쳐지고 최소화된 최신 CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
			
			<!-- 부가적인 테마 -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
			
			<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		</head>
		<script type="text/javascript">
			$(function(){
				//목록버튼 클릭시 처리이벤트
				$("#cladminboard").click(function(){
					location.href="/client/board/adminboard/adminboardList.do?board_no="+${param.board_no }
				});
			});
		</script>
	<body>
		<form id="f_data" name="f_data" method="post">
			<input type="hidden" id="ab_no" name="ab_no" value="${detail.ab_no }" />
			<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
		</form>
		<h3>게시판 상세보기</h3>
		<table id="cladminboardBtn">
			<tr>
				<td id="ab1">
					<input type="button" value="목록" id="cladminboard"/>
				</td>
			</tr>
		</table>
		<table border="1" style="border-collapse:collapse;">
			<tbody>
				<tr>
					<th class="ac">공지글 유형</th>
					<td>${detail.ab_type }</td>
				</tr>
				<tr>
					<th class="ac">제목</th>
					<td>${detail.ab_title }</td>
				</tr>
				<tr>
					<th class="ac">내용</th>
					<td>${detail.ab_content }</td>
				</tr>
				<tr>
					<th class="ac">날짜</th>
					<td>${detail.ab_date }</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>