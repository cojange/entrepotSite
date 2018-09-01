<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
      <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      <!-- 모바일 웹 페이지 설정 종료 -->
      
      <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
      <!-- [if lt IE 9] -->
      <!-- <script src="../js/html5shiv.js"</script> -->
      <!-- [endif] -->
<link href="/resources/include/client/css/plus.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript">
$(function() {
	var pd_num =${magazine.pd_num};
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
	
	
});
function listAll(){
	 $("#comment_list").html("");
	 var url="/plus/all/"+pb_num+".do";
	 $.getJSON(url,function(data){
		console.log(data.length);
		$(data).each(function () {
			var pl_star 
		})
	 })
}	
</script>

</head>

<body>
	<div class="box">
		<div class="tt">
			<div class="iconbox"></div>
			댓글쓰기
		</div>
		<div class="inputbox">
			<div class="imputbox2">
				<input type="text" name="name" value="" class="input1"> <span>(이름)</span>
				<input type="password" name="pw" value="" class="input1"> <span>(비번)</span>
				<a class="starRev">
 					 <span class="starR on">별1</span>
  					 <span class="starR">별2</span>
  					 <span class="starR">별3</span>
  					 <span class="starR">별4</span>
  					 <span class="starR">별5</span>
  					 
				</a>
				<span>(별점1)</span>
			</div>
		</div>
		<table>
			<tbody>
				<tr>
					<td width="100%">
						<div class="editbox" style="margin-right: 12px">
							<span>상품</span>

							<textarea name="content" id="editFrameContent"
								style="width: 100%; height: 30px; resize: none; border: 1px solid #000040"></textarea>
						</div>
						<div class="editbox" style="margin-right: 12px">
							<span>배달</span>

							<textarea name="content" id="editFrameContent"
								style="width: 100%; height: 30px; resize: none; border: 1px solid #000040"></textarea>
						</div>
					</td>
					<td width="10%">
						<div class="r">
							<span><input type="submit" class="btngray" value="댓글 등록"
								alt="댓글 등록"></span>
						</div>
					</td>
				</tr>
				<ul id="comment_list">
         			<!-- 여기에 동적 생성 요소가 들어갑니다 -->
         		</ul>
			</tbody>
		</table>
	</div>
</body>

</html>