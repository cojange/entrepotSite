<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>  </title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     	 	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
    	  
     		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
     		 <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
    	 	 <!-- 모바일 웹 페이지 설정 -->
    		 <link rel="shortcut icon" href="/resources/image/icon.png" />
     	 	<link rel="apple-touch-icon" href="/resources/image/icon.png" />
    		  <!-- 모바일 웹 페이지 설정 종료 -->

    		 <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
    		 <!-- [if lt IE 9] -->
        	 <!-- <script src="/resources/include/js/html5shiv.js"</script> -->
     		 <!-- [endif] -->
     		 <!-- 사용자 cSS-->
     	 
     		 <!--사용자 js-->
     		 <script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
			<script type="text/javascript" src="/resources/include/common/js/common.js"></script>
		
			<link rel="stylesheet" type="text/css" href="/resources/include/client/css/common.css">
			<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		
     	 		<script type="text/javascript">
     	 			$(function(){
     	 				//검색시 키워드와 정보 남기기
     	 				var word="${data.keyword}";
     	 				var value="";
     	 				if(word!=""){
     	 					$("#keyword").val("${data.keyword}");
     	 					$("#keyword").val("${data.search}");
     	 					
     	 					if($("#search").val()!="imgb_content"){
     	 						//:contains는 특정 텍스트를 포함한 요소 반환
     	 						if($("#search").val()=="imgb_title"){
     	 							value="#list tr td.goDetail";
     	 						}else if($("#search").val()=="m_name"){
     	 							value="#list tr td.name";
     	 						}
     	 						$(value+":contains('"+word+"')").each(function(){
     	 						var regex = new RegExp(word,'gi');
     	 						//정규표현식 객체
     	 						$(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"));
     	 					//객체는 "/\g/s"를 반환함
     	 					});
     	 					}
     	 				}
     	 				//제목 클릭시 상세 페이지 이동하기 위한 처리 이벤트
     	 				$(".goDetail").click(function(){
     	 					var imgb_no = $(this).parents("tr").attr("data-num");//parents는 매개변수를 받는거 포함하여 찾음. aprent는 매개변수 부모만 찾음
         	 				$("#imgb_no").val(imgb_no);
     	 					//상세페이지이동하기 위한 form 추가(id:detailForm)
     	 					$("#detailForm").attr({
     	 						"method":"get",
     	 						"action":"/client/board/imgb/imgbDetail.do"
     	 					});
     	 					$("#detailForm").submit();
     	 				});
     	 				
     	 				//글쓰기 버튼 클릭시이벤트 처리
     	 				$("#insertBtn").click(function(){
     	 					location.href="/client/board/imgb/writeForm.do"
     	 				});
     	 				
     	 				//검색 대상이 변경될 때마다 처리 이벤트
     	 				$("#search").change(function(){
     	 					if($("#search").val()=="all"){
     	 						$("#keyword").val("전체 데이터를 조회 합니다");
     	 					}else if($("#search").val()!=="all"){
     	 						$("#keyword").val("");
     	 						$("#keyword").focus();
     	 					}
     	 				});
     	 				//검색 버튼클릭시 처리 이벤트
     	 				$("#searchData").click(function(){
     	 					if($("#search").val()!=="all"){
     	 						if(!chkData($("#keyword"),"검색어를"))return;
     	 					}
     	 					goPage();
     	 				});
     	 			});//최상위 function
     	 			
     	 			function goPage(){
     	 				if($("#search").val()=="all"){
     	 					$("#keyword").val("");
     	 				}
     	 				$("#f_search").attr({
     	 					"method":"get",
     	 					"action":"/client/board/imgb/clImgbInsert.do"
     	 				});
     	 				$("#f_search").submit();
     	 			}
     	 		</script>
	</head>
	<body>
		<div class="container-fluid">
			 <c:if test="${login.m_id != null and login.m_id != ''}">
		         <form id="detailForm" name="detailForm">
					<input type="hidden" name="imgb_no" id="imgb_no"/>
					<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
				</form>
				<h3>게시판 목록</h3>
					<form id="f_search" name="f_search">
						<table summary="검색">
							<colgroup>
							<tr>
								<td id="tac"><span>검색조건</span>
								<select id="search" name="search">
									<option value="all">전체</option>
									<option value="all">제목</option>
									<option value="all">내용</option>
								</select>
								<input type="text" name="keyword" id="keyword"/>
								<input type="button" value="검색" id="searchData" /></td>
							</tr>
						</table>
						<table border="1" class="table table-hover">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty clImgbList }">
								<c:forEach var="imgb" items="${clImgbList }">
									<tr class="tac" data-num="${imgb.imgb_no }">
										<td>${imgb.imgb_no }</td>
										<td class="goDetail">${imgb.imgb_title }</td>
										<td>${imgb.m_name }</td>
										<td>${imgb.imgb_date }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">등록된 게시물이 존재하지않습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
					</form>
				<input type="button" value="글쓰기" id="insertBtn"/>
		         </c:if>
		          <c:if test="${login.m_id == null or login.m_id == ''}">
		          <p>로그인 해주세요</p>
		          </c:if>	
		</div>
	</body>
</html>