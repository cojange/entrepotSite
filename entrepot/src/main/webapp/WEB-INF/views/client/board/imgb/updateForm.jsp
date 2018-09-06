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
            var value = "${update.imgb_img1}";
            if(value!=""){
               var img = $("<br /><img>");  /* 동적 태그 생성 */
               $('#imgView').hover(function(){  /* hover는 매개변수(function) 두개를 가지고 있음 */
                  img.attr({
                     src:"/client/board/uploadStorage/${update.imgb_img1}",
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
            $("#climgbList").click(function(){
               location.href="/client/board/imgb/clImgbList.do";
            });
            
            /* 수정 버튼 클릭시 처리 이벤트 */
            $("#climgbUpdate").click(function(){
               //입력값 체크
               if(!chkData($('#imgb_title'),"제목을")) return;
               else if(!chkData($('#imgb_content'),"작성할 내용을")) return;
               else{
                  $("#f_writeForm").attr({
                     "method":"post",
                     "action":"/client/board/imgb/clImgbUpdate.do"
                  });
                  $("#f_writeForm").submit();
               }
            });
            
            /* 첨부파일 이미지 보여주기 위한 속성 추가 */
            var file = "<c:out value='${update.imgb_img1}' />";
            if(file!=""){
               $("#file").attr({
                   src:"/uploadStorage/board/${updateData.imgb_img1}",
                   width:"450px",
                   height:"200px"
               });
            }
         });
		</script>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3> 글 수정</h3></div>
			
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
					<input type="hidden" id="imgb_no" name="imgb_no" value="${update.imgb_no }">
					<input type="hidden" id=imgb_img1 name="imgb_img1" value="${update.imgb_img1 }" >
					<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
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
                        	<td>${update.imgb_no}</td>
                        	<td class="ac">작성일</td>
                        	<td>${update.imgb_date}</td>
						</tr>
						<tr>
							<th class="ac">작성자</th>
							<td>${update.m_name }</td>
						</tr>
						<tr>
							<th class="ac">제목</th>
							<td colspan="3"><input type="text" value="${update.imgb_title }" name="imgb_title" id="imgb_title" />
						</tr>
						<tr>
							<th class="ac">내용</th>
							<td colspan="3"><textarea rows="10" cols="50" name="imgb_content" id="imgb_content">${update.imgb_content}</textarea>
						</tr>
						<tr>
							<th class="ac">첨부파일</th>
							<td colspan="3"><input type="file" name="file" id="file" /><span id="imgView">기존 이미지 파일명:${update.imgb_img1 }<span id="imgArea"></span></span></td>
						</tr>
						<tr>
							<th class="ac">비밀번호</th>
							<td colspan="3"><input type="password" name="imgb_pwd" id="imgb_pwd" /></td>
						</tr>
					</tbody>
					</table>
				</form>
			</div>
			<div class="contentBtn">
				<input type="button" value="수정" id="climgbUpdate" />
				<input type="button" value="목록" id="climgbList" />
			</div>
		</div>
	</body>
</html>