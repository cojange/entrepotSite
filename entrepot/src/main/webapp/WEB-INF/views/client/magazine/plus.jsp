<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %>  
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
 <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>   
<script type="text/javascript">
$(function() {
	var pd_num = "cos-201808";
	listAll(pd_num);
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
	
	
});
function listAll(pd_num){
	 $("#comment_list").html("");
	 var url="/plus/all/"+pd_num+".do";
	 $.getJSON(url,function(data){
		console.log(data.length);
		$(data).each(function () {
			var pl_num =this.pl_num;
			var pl_star = this.pl_star;
			var pl_date = this.pl_date;
			var pl_product=this.pl_product;
			var pl_parcel = this.pl_product;
			var m_name = this.m_name;
			 addNewItem(pl_num,pl_star,pl_date,pl_product,pl_parcel,m_name);	
		});
	 });
	 
}
function addNewItem(pl_num,pl_star,pl_date,pl_product,pl_parcel,m_name){
    //새로운 글이 추가될 li 태그 객체
    var new_li = $("<li>");
    new_li.attr("data-num",pl_num);
    new_li.addClass("comment_item");
    
    //
    var writer_p =$("<p>");
    writer_p.addClass("writer");
    
    
    //작성자 정보가 지정될 <p> 태그
    var name_span = $("<span>");
    name_span.addClass("name");
    name_span.html(m_name + "님");
    //작성일시
    var date_span = $("<span>");
    date_span.html(" / "+pl_date + " ");
    //별점
    var star_span = $("<span>");
    name_span.addClass("star");
    name_span.html(pl_star + "점");
    
    //수정하기
    var up_input = $("<input>");
    up_input.attr({"type":"button" , "value":"수정하기"});
    up_input.addClass("update_form");
    
    //삭제하기
    var del_input = $("<input>");
    del_input.attr({"type":"button" , "value":"삭제하기"});
    del_input.addClass("delete_btn");
    
    //내용1
    var product_p =$("<p>");
    product_p.addClass("product");
    product_p.html("상품:"+pl_product);
    //내용2
    var parcel_p =$("<p>");
    parcel_p .addClass(" parcel");
    parcel_p.html("택배:"+pl_parcel);
    
    //조립하기
    writer_p.append(name_span).append(date_span).append(star_span).append(up_input).append(del_input);
    new_li.append(writer_p).append(product_p).append(parcel_p);
    $("#comment_list").append(new_li);
 }
</script>

</head>

<body>
	<c:if test="${login.m_id != null}">
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
			</tbody>
		</table>
	</div>
	</c:if>
	<ul id="comment_list">
	    			<!-- 여기에 동적 생성 요소가 들어갑니다 -->
     </ul>
</body>

</html>