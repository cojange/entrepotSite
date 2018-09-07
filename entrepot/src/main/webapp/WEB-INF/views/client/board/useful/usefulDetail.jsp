<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
			
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
				//목록버튼 클릭시 처리 이벤트
				$("#usefulList").click(function(){
					location.href="/client/board/useful/usefulList.do?board_no="+${param.board_no}
				})
			})
		</script>
		
	<body>
		<form id="f_data" name="f_data" method="post">
			<input type="hidden" id="ub_no" name="ub_no" value="${detail.ub_no }" />
			<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
		</form>
		<h3>게시판 상세보기</h3>
		<table id="usefulboardBtn">
			<tr>
				<td id="ub1">
					<input type="button" value="목록" id="usefulList"/>
				</td>
			</tr>
		</table>
		<table border="1" style="border-collapse:collapse;">
			<tbody>
				<tr>
					<th class="ac">번호</th>
					<td>${detail.ub_no }</td>
				</tr>
				<tr>
					<th class="ac">유형</th>
					<td>${detail.ub_type }</td>
				</tr>
				<tr>
					<th class="ac">질문</th>
					<td>${detail.ub_query }</td>
				</tr>
				<tr>
					<th class="ac">대답</th>
					<td>${detail.ub_ans }</td>
				</tr>
				<tr>
					<th class="ac">날짜</th>
					<td>${detail.ub_date }</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>