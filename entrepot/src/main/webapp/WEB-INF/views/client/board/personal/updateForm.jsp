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
            var value = "${update.pb_img1}";
            if(value!=""){
               var img = $("<br /><img>");  /* 동적 태그 생성 */
               $('#imgView').hover(function(){  /* hover는 매개변수(function) 두개를 가지고 있음 */
                  img.attr({
                     src:"/client/board/uploadStorage/${update.pb_img1}",
                     width:"400px",
                     height:"180px"
                  });
                  img.addClass("imgViewData");
                  $('#imgArea').append(img);
               }, function(){
                  img.remove();
               });
            }else{
               $('#imgView').hide();
            }
            
            /* 목록 버튼 클릭시 처리 이벤트 */
            $("#personalList").click(function(){
               location.href="/client/board/personal/personalList.do";
            });
            
            /* 수정 버튼 클릭시 처리 이벤트 */
            $("#personalUpdate").click(function(){
               //입력값 체크
               if(!chkData($('#pb_title'),"제목을")) return;
               else if(!chkData($('#pb_content'),"작성할 내용을")) return;
               else{
                  $("#f_writeForm").attr({
                     "method":"POST",
                     "action":"/client/board/personal/personalUpdate.do"
                  });
                  $("#f_writeForm").submit();
               }
            });
            
            /* 첨부파일 이미지 보여주기 위한 속성 추가 */
            var file = "<c:out value='${update.pb_img1}' />";
            if(file!=""){
               $("#file").attr({
                   src:"/uploadStorage/board/${updateData.pb_img1}",
                   width:"450px",
                   height:"200px"
               });
            }
         });
		</script>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>게시판 글 수정</h3></div>
			
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
					<input type="hidden" id="pb_no" name="pb_no" value="${update.pb_no }">
					<input type="hidden" id=pb_img1 name="pb_img1" value="${update.pb_img1 }" >
					<input type="hidden" id="board_no" name="board_no" value="${update.board_no }">
					<table border="1" style="border-collapse:collapse;">
						<colgroup>
						<col width="17%"/>
						<col width="33%"/>
						<col width="17%"/>
						<col width="33%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="ac">글번호</td>
                        	<td>${update.pb_no}</td>
                        	<td class="ac">작성일</td>
                        	<td>${update.pb_date}</td>
						</tr>
						<tr>
							<th class="ac">작성자</th>
							<td>${update.m_name }</td>
						</tr>
						<tr>
							<th class="ac">제목</th>
							<td colspan="3"><input type="text" value="${update.pb_title }" name="pb_title" id="pb_title" />
						</tr>
						<tr>
							<th class="ac">내용</th>
							<td colspan="3"><textarea rows="10" cols="50" name="pb_content" id="pb_content">${update.pb_content}</textarea>
						</tr>
						<tr>
							<th class="ac">첨부파일</th>
							<td colspan="3"><input type="file" name="file" id="file" /><img alt="/resources/images/client/베컴.JPG" src=""><span id="imgView">기존 이미지 파일명:${update.pb_img1 }<span id="imgArea"></span></span></td>
						</tr>
						<tr>
							<th class="ac">비밀번호</th>
							<td colspan="3"><input type="password" name="pb_pwd" id="pb_pwd" /></td>
						</tr>
					</tbody>
					</table>
				</form>
			</div>
			<div class="contentBtn">
				<input type="button" value="수정" id="personalUpdate" />
				<input type="button" value="목록" id="personalList" />
			</div>
		</div>
	</body>
</html>