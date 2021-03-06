<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
			//검색 시 키워드와 정보 남기기
			var word="${data.keyword}";
			var value="";
			if(word!=""){
				$("#keyword").val("${data.keyword}");
				$("#search").val("${data.search}");
				
				if($("#search").val()!="ub_ans"){
					if($("#search").val()=="ub_query"){
						value="#list tr td.goDetail";
					}else if($("#search").val()=="ad_id"){
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
				var ub_no = $(this).parents("tr").attr("data-num");
				$("#ub_no").val(ub_no);
				$("#detailForm").attr({
					"method":"get",
					"action":"/client/board/useful/usefulDetail.do"
				});
				$("#detailForm").submit();
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
				"action":"/client/board/useful/usefulList.do"
			});
			$("#f_search").submit();
		}
		</script>
	<body>
		<div class="container-fluid">
		         <form id="detailForm" name="detailForm">
					<input type="hidden" name="ub_no" id="ub_no"/>
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
						<th>글유형</th>
						<th>글질문</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty usefulList }">
								<c:forEach var="ub" items="${usefulList }">
									<tr class="tac" data-num="${ub.ub_no }">
										<td>${ub.ub_no }</td>
										<td>${ub.ub_type }</td>
										<td class="goDetail">${ub.ub_query }</td>
										<td>${ub.ad_id }</td>
										<td>${ub.ub_date }</td>
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
		</div>
	</body>
</html>