<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 <%@ include file="/WEB-INF/views/common/common.jspf" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
    <link href="/resources/include/client/css/joinform.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round" rel="stylesheet" />
  	<link href="/resources/include/client/css/default.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/list.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/resources/include/client/css/quick.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/css/content.css" rel="stylesheet" type="text/css" media="all" />
  	<link href="/resources/include/client/font/fonts.css" rel="stylesheet" type="text/css" media="all" />
  	<link rel="styleSheet" href="/resources/include/client/css/normalize.css"  type="text/css" media="all"/>
  	<link rel="styleSheet" href="/resources/include/client/css/loginform.css"  type="text/css" media="all"/>
  	<link rel="styleSheet" href="/resources/include/client/css/fontello-619e3562/css/animation.css"  type="text/css" media="all"/>
	<link rel="stylesheet" href="/resources/include/client/css/fontello-619e3562/css/fontello-embedded.css">
<script type = "text/javascript" src="/resources/include/common/js/common.js"></script>
    <script src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/client/dist/assets/js/ie-emulation-modes-warning.js"></script> 
    <script src="/resources/include/client//js/login.js"></script>
    <script src="/resources/include/client//js/header.js"></script>
    <script src="/resources/include/client/js/html5shiv.js"></script>
    <link href="/resources/include/client/css/slide.css" rel="stylesheet" type="text/css" media="all" />
    
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script type="text/javascript">
var slideIndex = 1;
var slideIndexsim = 1;
$(function() {	
		showSlides(slideIndex);
		showSlides2();
		$(".goDetail").click(function() {
            
			var mg_num = $(this).parents("tr").attr("data-num");  
        	var listkey= $(this).parents("tr").attr("data-key");
		
       		 $("#mg_num").val(mg_num);
			 $("#listkey").val(listkey);			
            //상세 페이지로 이동하기위해  form추가(id:detailForm)
             $("#detailForm").attr({
               "method":"get",
               "action":"/client/ditail/magazineDetail.do"
            });
             $("#detailForm").submit(); 
         });
		$(".abgoditail").click(function() {
            
			var ab_no = $(this).parents("tr").attr("data-num");  
        	
		
       		 $("#ab_no").val(ab_no);			
            //상세 페이지로 이동하기위해  form추가(id:detailForm)
             $("#detailForm").attr({
               "method":"get",
               "action":"/board/adminboard/adminboardDetail.do "
            });
             $("#detailForm").submit(); 
         });
		
});
function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}


	function showSlides2() {
	    var i;
	    var slides = document.getElementsByClassName("mySlides2");
	    for (i = 0; i < slides.length; i++) {
	       slides[i].style.display = "none";  
	    }
	    slideIndexsim++;
	    if (slideIndexsim > slides.length) {slideIndexsim = 1}    
	   
	    slides[slideIndexsim-1].style.display = "block";  
	    setTimeout(showSlides2, 2000); // Change image every 2 seconds
	}
	function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  if (n > slides.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";  
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";  
		  dots[slideIndex-1].className += " active";
		}
	
	function jlist(){ 
        var url="/client/list/jlist.do";
        $.getJSON(url,function(data){
           console.log(data.length);
/*              replyCnt = data.length; */
           $(data).each(function(){
              	var ab_type= this.ab_type;
              	var ab_title= this.ab_title;
              	var ab_no = this.ab_no;
        	   addNewItem(ab_type,ab_title,ab_no);
           });
        }).fail(function(){
           alert("댓글 목록을 불러오는데 실패하였습니다");
        });
     }
	function addNewItem(ab_type,ab_title,ab_no){
		var new_tr = $("tr");
		new_tr.addClass("jtr");
		new_tr.attr("data-num",ab_no)
		
		var new_td = $("td");
		new_td.addClass("jtd");
		
		var new_span= $("span");
		new_span.addClass("jspn");
		new_span.html("["+ab_type+"]"+ab_title);
		
		new_tr.append(new_td).append(new_span);
		$("#jlist").append(new_tr);
	}
</script>
</head>
<body>
<div id="wrapper">
		<div id="header-wrapper" style="position:relative;z-index:2;">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="page" class="container" style="position:relative;z-index:1;">
			<form id="detailForm">
			<input type="hidden" id="mg_num" name="mg_num">
			<input type="hidden" id="listkey" name="listkey"> 
			<input type="hidden" id="ab_no" name="ab_no">
			<div class="slideshow-container">
				<div class="mySlides2 fade">
					<div class="numbertext">1 / 3</div>
					<img src="/resources/images/produt/banner_big_ng_traveller_201805.jpg"  style="width: 100%">
					<div class="text"></div>
				</div>

				<div class="mySlides2 fade">
					<div class="numbertext">2 / 3</div>
					<img src="/resources/images/produt/banner_maxq_201805.jpg" style="width: 100%">
					<div class="text"></div>
				</div>

				<div class="mySlides2 fade">
					<div class="numbertext">3 / 3</div>
					<img src="/resources/images/produt/banner_onestop_designhouse_2018.jpg" style="width: 100%">
					<div class="text"></div>
				</div>
			</div>
	
			
			<br>
			<br>
			<br>
			<br>
			<img src="/resources/images/produt/index_title_bestchice.png"  style="width: 500px;"> 
		  <div align="center" style="border:1px solid; padding:10px; border-radius: 10px;">	 
          <table border="0" cellpadding="5" cellspacing="0" style="width:1000px">
          	<tbody>
          		<c:choose>
          			<c:when test="${not empty bastlist}">
          				<c:forEach  var="list" items="${bastlist}" varStatus="san">
          					<c:if test="${san.count eq 1 }">
          					 	<tr>
          					</c:if>
          					<c:if test="${san.count eq 6} ">
          						<tr>           	
          					</c:if>
          							
				                    <td valign="top" align="center" width="200px">
									<!-- 표지이미지 -->
									  <table border="0" cellspacing="0" cellpadding="3" class="table" bordercolor="#EBEBEB" bordercolordark="#FFFFFF">
								  		<tbody>
								  			<tr data-num="${list.mg_num}" data-key ="${list.listkey}">								  			
												<td align="center" bgcolor="#FFFFFF" class="goDetail" >
													<font color="blue">
														<img src="/uploadStorage/magazineImage/thum/${list.pl_path}" width="100" height="120" border="0" >
													</font>
												</td>
								  			</tr>
								  			
								  		</tbody>
								  	</table>
								  	<label ><font size="5"
														style="font: 맑은 고딕, 나눔고딕, 굴림, verdana; color: #3399CC; FONT-WEIGHT: bold; line-height: 20px;">
															${list.mg_name}</font> </label>
									  <!-- 년월일 -->
									<table border="0" cellspacing="0" cellpadding="0">
									 	 <tbody>
									 	 	<tr>
									 	 		<td rowspan="3">
									 	 			<img src="/resources/images/produt/best_circle${san.count}.gif" >
									 	 		</td>
									 	 		<td height="20px"><label><font size="1" style="font: 맑은 고딕, 나눔고딕, 굴림, verdana; color:#FE9A2E ; FONT-WEIGHT: bold; line-height: 20px;">${list.dt_keyword}</font></label></td>
									 	 	</tr>
									 	 	<tr>
									 	 		<td style="vertical-align:top;"><label><font>${list.pd_salecost}</font></label></td>
									 	 	</tr>
									 	 	
									  	</tbody>
									  </table>
					            	</td>
							<c:if test="${san.count eq 5 }">
								</tr>
								<tr>            
            						<td height="5"></td>	
            					</tr>
							</c:if>
							<c:if test="${san.end }">
								</tr>
								<tr>            
            						<td height="5"></td>	
            					</tr>
							</c:if>
							                  	
            	
            				
            		</c:forEach>
            	</c:when>
           	</c:choose>
            	
            	
          	</tbody>
          
          </table>
						
	</div>
				<br> <br> <br> <br>
					
	<div style="border:1px solid; padding:10px; border-radius: 10px;">
	<h1 style=" font-family: 'Nanum Pen Script', cursive;">이달의 부록 잡지! </h1>	
		<span></span>
		<table>
			<tr >
				<c:choose>
					<c:when test="${not empty aplist }">
							<c:forEach var="list" items="${aplist}" varStatus="can">
									<c:if test="${can.count eq 1 }">
										<td>
											<ul style="list-style:none;">
									</c:if>	
									<c:if test="${can.count eq 4 }">
										<td>
											<ul style="list-style:none;"  >
									</c:if>
									<c:if test="${can.count eq 7 }">
										<td>
											<ul style="list-style:none;">
									</c:if>
												<lili style=" margin:0;">
													<table>
														<tr data-num="${list.mg_num}" data-key ="${list.listkey}">
															<td class="goDetail">
																<img src="/uploadStorage/magazineImage/thum/ ${list.pl_path}" width="80px" height="100px">  
															</td>
															<td>
																<div>
																	<img src="/resources/images/produt/best/best_circle${can.count}.gif">
																 	<span style="font: 맑은 고딕, 나눔고딕, 굴림, verdana; color: #3399CC;" >${list.mg_name}</span><br>
																 	<span>${list.pd_appendix }</span><br>
																 	 <font	color="#6B6B6B"><strike> ${list.pd_sale } 원</strike>-></font>
																 	 <font color="#FF6633"><b> ${list.pd_salecost}</b></font>
																 	 <font color="#0066CC">(${list.pd_rate}%할인)	</font>	 	
																 </div>
															</td>
														</tr>
													</table>
												</li>
									<c:if test="${can.count eq 3 }">
											</ul>
										</td>
									</c:if>	
									<c:if test="${can.count eq 6 }">
											</ul>
										</td>
									</c:if>
									<c:if test="${can.last}">
											</ul>
										</td>
									</c:if>
							</c:forEach>
						</c:when>
				</c:choose>
			</tr>
		</table>
	</div>			
		<br> <br> <br> <br>		
	<div style="border:1px solid; padding:10px; border-radius: 10px;">
	<h1 style=" font-family: 'Nanum Pen Script', cursive;">확인해주세요 ! </h1>
		<table align="center">
			<tbody>
				<tr height="5"><td>&nbsp;</td></tr>
				<tr>
					<td>
						<table align="center" border="0" cellpadding=	"0" cellspacing="0" style="width: 1200px;">
							<tbody>
								<tr>
									<td valign="top" width="400px">
										<table align="center" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="/resources/images/produt/notice_nm_01_01.jpg">
												</td>
											</tr>
											<tr>
												<td>
												<table class="jlist">	
													<c:choose>
														<c:when test="${not empty jlist }">
															<c:forEach  var="list" items="${jlist}" varStatus="can">
																	<tr data-num="${list.ab_no}">
																		<td class="abgoditail">
																			<span>[${list.ab_type}] ${list.ab_title }</span>
																		</td>
																	</tr>								
															</c:forEach>
														</c:when>
													</c:choose>		
												</table>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top" width="400px">
										<table align="center" border ="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="/resources/images/produt/notice_nm_01_02.jpg">
												</td>
											</tr>
											<tr>
												<td>
													<table class="elist">
														<c:choose>
															<c:when test="${not empty elist }">
																<c:forEach var="list" items="${elist}" varStatus="can">
																	<tr data-num="${list.ab_no}">
																		<td class="abgoditail">
																			<span>[${list.ab_type}] ${list.ab_title }</span>
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
														</c:choose>	
													</table>	
												</td>
											</tr>	
										</table>
									</td>
									<td valign="top" width="400px" style="padding-left: 20px">
										<img src="/resources/images/produt/notice_nm_01_03.jpg">
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
		<br> <br> <br> <br>
	 <div>
	 	<img src="/resources/images/produt/titlebar_nice_tip.gif" style="width: 1100px; height: 70px">
				<div class="slideshow-container">
					<c:choose>
          				<c:when test="${not empty fotolist}">
          					<c:forEach  var="foto" items="${fotolist}" varStatus="san">
								<c:if test="${san.count eq 1}">
									<div class="mySlides fade">	
								</c:if>
								<c:if test="${san.count eq 5 }">
									<div class="mySlides fade">	
								</c:if>
								<c:if test="${san.count eq 9 }">
									<div class="mySlides fade">	
								</c:if>
							<ul style="margin: 15px 0px 0px; padding: 0px; position: relative; left: 0px;">
								<li style="margin: 0px; padding: 0px; list-style: none; float: left; width: 250px; height: 300px; text-align: left;">
									 <img src="/uploadStorage/board/imgb/${foto.imgb_thumb}"  style="margin: 0px; padding: 0px; width: 240px; height: 230px; border: 0px;">
							
									<br>
									<table border="0" cellpadding="0" cellspacing="0" width="97%" align="center">
										<tbody>
											<tr height="10">
												<td></td>
											</tr>
											<tr valign="top">
												<td><font color="#445084" style="FONT: 10pt 나눔고딕, verdana; line-HEIGHT: 20px;">${foto.imgb_title} </font></td>
											</tr>
											<tr height="32">
												<td><font color="#888888" style="FONT: 9pt 나눔고딕, verdana; line-HEIGHT: 17px;">${foto.imgb_cnt}</font></td>
											</tr>
										</tbody>
									</table>
								</li>
							</ul>	
					<c:if test="${san.count eq 12}">
						</div>
					</c:if>	
					<c:if test="${san.count eq 4 }">
						</div>
					</c:if>
					<c:if test= "${san.count eq 8 }">
						</div>
					</c:if>	
						</c:forEach>
					</c:when>
				</c:choose>		
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
				</div>
				<div style="text-align: center; vertical-align:top;">
					<span class="dot" onclick="currentSlide(1)"></span> 
					<span class="dot" onclick="currentSlide(2)"></span>
				    <span class="dot" onclick="currentSlide(3)"></span>
				</div>
	</div>			
	</form>
</div>
</div>
<div>
	<tiles:insertAttribute name="quick"/>
</div> 
<div id="footer">
	<tiles:insertAttribute name="footer"/>
</div>
</body>
</html>
