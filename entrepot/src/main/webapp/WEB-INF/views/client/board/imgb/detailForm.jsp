<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
		</head>
			<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
			<script type="text/javascript">
				$(fucntion(){
					var btnChk=0;
					//비밀번호 창 숨기기
					$("imgbChk").hide();
					
					//첨부파일 이미지 보이기
					var file="<c:out value='${detail.file_thumb}'/>";
					if(file!=""){
						$("#fileImage").attr({
							scr:"/client/board/imgb/uploadStorage/${detail.file_thumb}";
							width:"450px",
							height:"200px"
						});
					}
					//목록버튼 클릭시 처리이벤트
					$("#imgbListBtn").click(function(){
						$("#imgbChk").show();
						$("#msg").text("작성시 입력한 비밀번호를 입력해주세요").css("color","#000099");
						btnChk = 1;
					});
					//삭제버튼 클릭시 처리 이벤트
					$("#deleteFromBtn").click(function(){
						$.ajax({
							url:"/client/board/imgbreply/replycount.do",
							type:"get",
							data:"imgb_no="+$("#imgb_no").val(),
							dataType:"text",
							error:function(){
								alert("시스템 오류입니다 관리자에게 문의하세요");
							},
							success:function(){
								if(resultData == 0){
									$("#imgbChk").show();
								$("#msg").text("작성시 입력한 비밀번호를 입력해주세요").css("color","#000099");
								btnChk = 2;
								}else{
									alert("댓글 존재시 게시물 삭제를 할 수 없습니다");
								}
							}
						});
					});
					//비밀번호 확인 버튼 클릭시 처리 이벤트
					$("imgbChk").click(function(){
						if($("imgb_pwd").val().replace(/\s/g,"")==""){
							$("#msg").text("비밀번호를 입력해주세요").css("color","#000099");
							$("#imgb_pwd").focus();
							return;
						}else{
							$.ajax({
								url:"client/board/imgb/pwdConfirm.do",
								type:"post",
								dadta:$("#imgb_pwd").serialize(),
								dataType:"text",
								error:function(){
									alert("시스템오류입니다. 관리자에게문의하세요");
								},
								success:function(resultData){
									var goUrl="";
									if(resultData=="실패"){
										$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.");
										$("#imgb_pwd").select();
									}else if(resultData=="성공"){
										$("#msg").text("");
										if(btnChk == 1){
											goUrl="/client/board/imgb/updateForm.do"
										}else if(btnChk==2){
											goUrl="/client/board/imgb/deleteForm.do"
										}
										$("#f_data").attr("action",goUrl);
										$("f_dara").submit();
									}
								}
							})
						}
					});
				});
			</script>
	<body>
		<form id="f_data" name="f_data" method="post">
			<input type="hidden" id="imgb_no" name="imgb_no" value="${detail.imgb_no }" />
		</form>
		<h3>게시판 상세보기</h3>
		<!-- 비밀번호 확인 버튼 및 버튼 추가 -->
		<table id="imgbBut">
			<tr>
				<td id="imgb1">
				<div id="imgbChk">
					<form name="f_password" id="f_password">
						<label for="imgb_password" id="imgb_password">비밀번호:</label>
						<input type="text" name="imgb_password" id="imgb_password" />
						<input type="button" value="확인" id="imgbOk" />
						<span ld="msg"></span>
					</form>
				</div>
				</td>
				<td id="imgb2">
					<input type="button" value="수정" id="updateFormBtn" />
					<input type="button" value="삭제" id="deleteFromBtn" />
					<input type="button" value="목록" id="imgbListBtn" />
				</td>
			</tr>
		</table>
		<table border="1" style="border-collapse:collapse;">
			<tbody>
				<tr>
					<td class="ac">게시번호</td>
					<td>${detail.imgb_no }</td>
					<td class="ac">게시제목</td>
					<td>${detail.imgb_title }</td>
					<td class="ac">글내용</td>
					<td>${detail.imgb_content }</td>
					<td class="ac">파일첨부</td>
					<td colspan="3"><img id="fileImage"></td>
					<td class="ac">비밀번호</td>
					<td>${detail.imgb_pwd }</td>
				</tr>
			</tbody>
		</table>
		<%-- <jsp:include page="reply.jsp"/> --%>
	</body>
</html>