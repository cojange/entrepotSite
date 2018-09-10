<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<script type="text/javascript">
			$(function(){
				//검색 시 키워드와 정보 남기기
				var word="${data.keyword}";
				var value="";
				if(word!=""){
					$("#keyword").val("${data.keyword}");
					$("#search").val("${data.search}");
					
					if($("#search").val()!="pb_content"){
						if($("#search").val()=="pb_title"){
							value="#list tr td.goDetail";
						}else if($("#search").val()=="m_name"){
							value="#list tr td.name";
						}
						 $(value+":contains('"+word+"')").each(function(){
							 var regex = new RegExp(word,'gi');
	           				 //정규표현식 객체
	           				 $(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"));
	           				 //객체는 "/\s/g"를 반환한다.
						 });
					}
				}
				//제목 클릭시  상세페이지로 이동하기 위한 처리 이벤트
				$(".goDetail").click(function(){
					var pb_no = $(this).parents("tr").attr("data-num");
					$("#pb_no").val(pb_no);
					$("#detailForm").attr({
						"method":"get",
						"action":"/client/board/personal/personalDetail.do"
					});
					$("#detailForm").submit();
				});
				
				//글쓰기버튼 처리 이벤트
				$("#insertBtn").click(function(){
					location.href="/client/boarad/personal/writeForm.do?board_no=1"
				});
				
				//검색 대상 변경 될 때마다 처리 이벤트
				$("#search").change(function(){
					if($("#search").val()=="all"){
						$("#keyword").val("");//전체 데이터조회하는 텍스트
					}else if($("#search").val()!="all"){
						$("#keyword").val("");
						$("#search").focus();
					}
				});
				//검색버튼 클릭시 처리 이벤트
				$("#searchData").click(function(){
					if($("#search").val()!="all"){
						if(!chkData($("#keyword"),"검색어를"))return;
					}
					goPage();
				});
			});
			
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/client/board/personal/personalList.do"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
		
	<body>
		<div class="container-fluid">
			 <c:if test="${login.m_id != null and login.m_id != ''}">
		         <form id="detailForm" name="detailForm">
					<input type="hidden" name="pb_no" id="pb_no"/>
					<input type="hidden" name="board_no" id="board_no"  value="${param.board_no }"/>
				</form>
				<h3>목록</h3>
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
						<th>글유형</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty personalList }">
								<c:forEach var="pb" items="${personalList }">
									<tr class="tac" data-num="${pb.pb_no }">
										<td>${pb.pb_no }</td>
										<td>${pb.pb_type }</td>
										<td class="goDetail">${pb.pb_title }</td>
										<td>${pb.m_name }</td>
										<td>${pb.pb_date }</td>
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