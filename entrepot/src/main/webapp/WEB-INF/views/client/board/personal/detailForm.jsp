<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>
		</head>
		<script type="text/javascript">
			$(function(){
				var btnChk = 0;
				//비밀번호 입력 창 숨김
				$("#passwordChk").hide();
				
				//첨부파일 이미지 보여주기
				var file="<c:out value='${detail.file_thumb}'/>";
				if(file!=""){
					$("#fileImage").attr({
						src:"/client/board/uploadStorage/${detail.pb_thumb}",
						width:"450px",
						height:"200px";
					});
				}
				//목록버튼 클릭시 이벤트처리
				$("#personalListBtn").click(function(){
					location.href="/client/board/personal/personalList.do"
				});
				
				//수정버튼 클릭시 이벤트 처리
				$("#updateFormBtn").click(function(){
					$("#passwordChk").show();
					$("#msg").text("작성시 입력한 비밀번호를 입력해주세요").css("color","#000099");
					btnChk = 1;
				});
				//삭제버튼클릭시 처리 이벤트
				$("deleteFromBtn").click(function(){
					$.ajax({
						url:"/client/reply/replyCount.do",
						type:"get",
						data:"pb_no="+$("#pb_no").val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다 관리자에게 문의 하세요");
						},
						success:function(){
							if(resultData == 0){
								$("#passwordChk").show();
							$("#msg").text("작성시 입력한 비밀번호를 입력해주세요").css("color","#000099");
                            btnChk=2;
							}else{
								alert("댓글 존재시 게시물 삭제를 할 수 없습니다.");
							}
						}
					});
				});
				
				//비밀번호 확인 버튼 클릭시 처리 이벤트
				$("#passwordChk").click(function(){
					if($("#pb_password").val().replace(/\s/g,"")==""){
						$("#msg").text("비밀번호를 입력해주세요").css("color","red");
						$("#pb_password").focus();
						return;
					}else{
						$.ajax({
							url:"client/personal/pwdConfirm.do",
							type:"post",
							//data:"pb_no="+$("#pb_no").val()+"&pb_password="+$("#pb_password").val(),//전달할 데이터값(파라미터값)  //$("#f_pwd").serialize()->폼전체 데이터 전송
							data:$("#pb_password").serialize(),
							dataType:"text", //응답받을 데이터 타입
							error:function(){//실행 오류가 발생했을 경우
								alert("시스템 오류입니다,관라자에게 문의하세요");
								},//정상적으로 실행이 됬을 떄
								success:function(resultData){
									var goUrl=""; //이동할 경로를 저장할 변수
									if(resultData=="실패"){
										$("#msg").text("작성시 입력한 비밀번호가 일치 하지 않습니다");
										$("#pb_password").select();
									}else if(resultData=="성공"){//일치할 경우
										$("#msg").text("");
									if(btnChk == 1){
										goUrl="/client/board/personal/updateForm.do"
									}else if(btnChk == 2){
										goUrl="/client/board/personal/deleteForm.do"
									}
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
										}
								}
						})
					}
				});
			});
		</script>
	<body>
		<form id="f_data" name="f_data" method="post">
			<input type="hidden" id="pb_no" name="pb_no" value="${detail.pb_no }" />
		</form>
		<h3>게시판 상세보기</h3>
		<!-- 비밀번호 확인버튼  및 버튼 추가 -->
		<table id="personalBut">
			<tr>
				<td id="pt1">
				<div id="passwordChk">
					<form name="f_password" id="f_password">
						<input type="hidden"name="pb_no" id="pb_no" value=${detalil.pb_no} />
						<label for="pb_password" id="pb_passwrod">비밀번호:</label>
						<input type="text" name="pb_password" id="pb_password" />
						<input type="button" value="확인" id="pwdBtn" />
						<span id="msg"></span>
					</form>
				</div>
				</td>
				<td id="pt2">
					<input type="button" value="수정" id="updateFormBtn" />
					<input type="button" value="삭제" id="deleteFromBtn" />
					<input type="button" value="목록" id="personalListBtn" />
				</td>
			</tr>	
		</table>
		<table border="1" style="border-collapse:collapse;">
			<tbody>
				<tr>
					<td class="ac">게시글 유형</td>
					<td>${detail.pb_type }</td>
					<td class="ac">글제목</td>
					<td colspan="3">${detail.pb_title }</td>
					<td class="ac">글내용</td>
					<td>${detail.pb_content }</td>
					<td class="ac">파일첨부</td>
					<td colspan="3"><img id="fileImage"></td>
					<td class="ac">비밀번호</td>
					<td>${detail.pb_password }</td>
				</tr>	
			</tbody>
		</table>
		<%-- <jsp:include page="reply.jsp" /> --%>
	</body>
</html>