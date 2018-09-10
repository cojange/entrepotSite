<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/common/common.jspf" %>
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
			
			<link rel="stylesheet"  type="text/css" href="/resources/include/client/css/board.css">
			
			<script type="text/javascript">
			$(function(){
				//저장버튼 클릭시 처리 이벤트
				$("#personalInsertBtn").click(function(){
					//유효성 체크
					if(!chkData($("#pb_type"),"게시글 유형을"))return;
					else if(!chkData($("#pb_title"),"게시글 제목을"))return;
					else if(!chkData($("#pb_content"),"게시글 내용을"))return;
					else if(!chkData($("#pb_pwd"),"비밀번호를"))return;
					else{
						$("#f_writeForm").attr({
							"method":"POST",
							"action":"/client/board/personal/personalInsert.do"
						});
						$("#f_writeForm").submit();
					}
				});
				
				//목록버튼 클릭시 처리이벤트
				$("#personalListBtn").click(function(){
					location.href="/client/board/personal/personalList.do"
				});
			}); //최상위 클래스
		</script>
	</head>
	<body>
	<div class="contentContainer">
		<h3>게시판 글 작성</h3>
			<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
			<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
				<table border="1" style="border-collapse:collapse;">
					<tr>
						<th class="ac">글유형</th>
						<td><input type="text" name="pb_type" id="pb_type" /></td>
					</tr>
					<tr>
						<th class="ac">글제목</th>
						<td><input type="text" name="pb_title" id="pb_title"/></td>
					</tr>
					<tr>
						<th class="ac">글내용</th>
						<td><input type="text" name="pb_content" id="pb_content"/></td>
					</tr>
					<tr>
						<th class="ac">파일첨부</th>
						<td><input type="file" name="file" id="file" /></td>
					</tr>
					<tr>
						<th class="ac">작성자</th>
						<td>${login.m_name}</td>
					</tr>
					<tr>
						<th class="ac">비밀번호</th>
						<td><input type="password" name="pb_pwd" id="pb_pwd" /></td>
					</tr>
				</table>
			<div class="contentBtn">
				<input type="button" value="저장" class="but" id="personalInsertBtn" />
				<input type="button" value="목록" class="but" id="personalListBtn" />
			</div>
			</form>
		</div>
	</body>
</html>