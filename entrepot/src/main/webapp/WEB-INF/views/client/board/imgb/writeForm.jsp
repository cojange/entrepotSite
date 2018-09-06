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
				//저장버튼 클릭시 처리 이벤트
				$("#imgbBtn").click(function(){
					//입력값체크
					if(!chkData($("#imgb_title"),"제목을"))return;
					else if(!chkData($("#imgb_content"),"내용을"))return;
					else{
						$("#f_writeForm").attr({
							"method":"post",
							"action":"/client/board/imgb/clImgbInsert.do"
						});
						$("#f_writeForm").submit();
					}
				});
				
				
				//목록버튼 처리 이벤트
				$("#imgbList").click(function(){
					location.href="/client/board/imgb/clImgbList.do"
				});
			});//최상위 클래스
		</script>
	<body>
		<div class="contentContainer">
			<h3>게시판 글 작성</h3>
			<form id="f_writeForm" method="post" enctype="multipart/form-data">
				<table border="1" style="border-collapse:collapse;">
					<tr>
						<td class="ac">제목</td>
						<td><input type="text" name="imgb_title" id="imgb_title" /></td>
					</tr>
					<tr>
						<td class="ac">내용</td>
						<td><input type="text" name="imgb_content" id="imgb_content" /></td>
					</tr>
					<tr>
						<td class="ac">파일첨부</td>
						<td><input type="file" name="file" id="file" /></td>
					</tr>
					<tr>
						<td class="ac">작성자</td>
						<td>${login.m_name}</td>
					</tr>
					<tr>
						<td class="ac">비밀번호</td>
						<td><input type="password" name="imgb_pwd" id="imgb_pwd" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="contentBtn">
			<input type="button" value="저장" id="imgbBtn" />
			<input type="button" value="목록" id="imgbList" />
		</div>
	</body>
</html>