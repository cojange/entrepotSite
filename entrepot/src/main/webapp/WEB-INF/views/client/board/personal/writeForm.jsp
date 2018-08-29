<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
		</head>
		<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/client/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				//저장버튼 클릭시 처리 이벤트
				$("#personalInsertBtn").click(function(){
					//유효성 체크
					if(!chkData($("#pb_type"),"게시글 유형을"))return;
					else if(!chkData($("#pb_title"),"게시글 제목을"))return;
					else if(!chkData($("#pb_content"),"게시글 내용을"))return;
					else if(!chkData($("#pb_thumb"),"게시글 파일을"))return;
					else if(!chkData($("#pb_name"),"게시글 작성자"))return;
					else if(!chkData($("#pb_password"),"비밀번호를"))return;
					else{
						$("#f_writeForm").attr({
							"method":"POST",
							"action":"/board/personal/personalInsert.do"
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
	<body>
	<div class="contentContainer">
		<h3>게시판 글 작성</h3>
		<form id="f_wrtieForm" method="post" enctype="multpart/form-data">
			<table border="1" style="border-collapse:collapse;">
				<tr>
					<td class="ac">글유형</td>
					<td><input type="text" name="pb_type" id="pb_type" /></td>
				</tr>
				<tr>
					<td class="ac">글제목</td>
					<td><input type="text" name="pb_title" id="pb_title"/></td>
				</tr>
				<tr>
					<td class="ac">글내용</td>
					<td><input type="text" name="pb_content" id="pb_content"/></td>
				</tr>
				<tr>
					<td class="ac">파일첨부</td>
					<td><input type="file" name="pb_thumb" id="pb_thumb" /></td>
				</tr>
				<tr>
					<td class="ac">작성자</td>
					<td><input type="text" name="pb_name" id="pb_name" /></td>
				</tr>
				<tr>
					<td class="ac">비밀번호</td>
					<td><input type="password" name="pb_password" id="pb_password" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="contentBtn">
		<input type="button" value="저장" class="but" id="personalInsertBtn" />
		<input type="button" value="목록" class="but" id="personalListBtn" />
	</div>
	</body>
</html>