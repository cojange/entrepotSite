<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
		<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/common/js/common.js"></script>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/client/css/common.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<script type="text/javascript">
			$(function(){
				var btnChk=0;
				//비밀번호 창 숨김
				$("#climgbChk").hide();
				
				//첨부파일 이미지 보여주기
				var file="<c:out value='${detail.imgb_img1}'/>";
				if(file!=""){
					$("#fileImage").attr({
						src:"/client/board/uploadStorage/${detail.imgb_img1}",
						width:"450px",
						height:"200px"
					});
				}
				//목록버튼 클릭시 처리 이벤트
				$("#clImgbList").click(function(){
					location.href="/client/board/imgb/clImgbList.do?board_no="+${param.board_no }
				});
				
				//수정버튼 클릭시 처리이벤트
				$("#updateFormBtn").click(function(){
					goUrl="/client/board/imgb/updateForm.do"
					
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
					btnChk=1;
				});
				//삭제버튼 클릭시 처리 이벤트
				$("#deleteFromBtn").click(function(){
					$.ajax({
						url:"/client/board/imgb/imgreply/replyCount.do",
						type:"get",
						data:"imgb_no="+$("#imgb_no").val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류 입니다 관리자에게 문의 하세요");
						},
						success:function(){
							if(resultData==0){
								$("#climgbChk").show();
								$("#msg").text("작성시 입력한 비밀번호를 입력해주세요").css("color","#000099");
								btnChk=2;
							}else{
								alert("댓글이 존재시 게시물을 삭제 할 수 없습니다.");
							}
						}
					});
				});
				
				//비밀번호 확인 버튼 클릭시 처리 이벤트
				$("#climgbBut").click(function(){
					if($("#img_pwd").val().replace(/\s/g,"")==""){
						$("#msg").text("비밀번호를 입력해주세요").css("color","red");
						$("img_pwd").focus();
						return;
					}else{
						$.ajax({
							url:"/client/board/imgb/pwdConfirm.do",
							type:"post",
							data:$("#imgb_pwd").serialize(),
							dataType:"text",
							error:function(){
								alert("시스템 오류입니다 관리자에게 문의 하세요");
							},
							success:function(resultData){
								var goUrl="";
								if(resultData=="실패"){
									$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다");
									$("#imgb_pwd").select();
								}else if(resultData=="성공"){
									$("#msg").text("");
								if(btnChk==1){
									goUrl="/client/board/imgb/updateForm.do"
								}else if(btnChk==2){
									goUrl="/client/boarad/imgb/deleteForm.do"
								}
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
									}
							}
						});
					}
				});
			});
		</script>
		<body>
			<form id="f_data" name="f_data" method="post">
			<input type="hidden" id="imgb_no" name="imgb_no" value="${detail.imgb_no }" />
			</form>
				<h3>게시판 상세보기</h3>
					<!-- 비밀번호 확인버튼  및 버튼 추가 -->
					<table id="climgbBut">
						<tr>
							<td id="pt1">
								<div id="climgbChk">
									<form name="f_pwd" id="f_pwd">
									<input type="hidden" name="imgb_no" id="imgb_no"value=${detalil.imgb_no } /> 
									<label for="img_pwd"id="img_pwd">비밀번호:</label> 
									<input type="text"name="imgb_pwd" id="imgb_pwd" /> 
									<input type="button"value="확인" id="pwdBtn" />
									<span id="msg"></span>
									</form>
								</div>
							</td>
						<td id="pt2">
							<input type="button" value="수정" id="updateFormBtn" />
							<input type="button" value="삭제" id="deleteFromBtn" /> 
							<input type="button" value="목록" id="clImgbList" />
						</td>
						</tr>
					</table>
					<table border="1" style="border-collapse: collapse;">
					<tbody>
						<tr>
							<th class="ac">제목</th>
							<td>${clidetail.imgb_title }</td>
						</tr>
						<tr>
							<th class="ac">내용</th>
							<td>${clidetail.imgb_content }</td>
						</tr>
						<tr>
							<th class="ac">파일 첨부</th>
							<td colspan="3"><img id="fileImage"></td>
						</tr>
						<tr>
							<th class="ac">비밀번호</th>
							<td>${clidetail.imgb_pwd }</td>
						</tr>
					</tbody>
				</table>
				<%-- <jsp:include page="replyList.jsp" /> --%>
		</body>
</html>