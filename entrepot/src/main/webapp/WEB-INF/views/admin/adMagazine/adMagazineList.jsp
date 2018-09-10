<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>




	<c:if test="${detailInsertResult != null }">
		<h1 id="showResult">결과 : ${detailInsertResult }</h1>
	</c:if>
	
		<table id="magListTable">

		<thead>
			<tr>
				<th colspan="17">
					<div>
						<input type="text" id="magSearchText" name="magSearch">
						<input type="button" id="magSearch" value="검색">
					</div>
				</th>
			</tr>
			<tr>
				<th>
					<input type="button" value="등록" id="mgInsert">
				</th>
			</tr>
			<tr>
				<th class="uniBtn">All</th>
				<th class="uniBtn">ㄱ</th>
				<th class="uniBtn">ㄴ</th>
				<th class="uniBtn">ㄷ</th>
				<th class="uniBtn">ㄹ</th>
				<th class="uniBtn">ㅁ</th>
				<th class="uniBtn">ㅂ</th>
				<th class="uniBtn">ㅅ</th>
				<th class="uniBtn">ㅇ</th>
				<th class="uniBtn">ㅈ</th>
				<th class="uniBtn">ㅊ</th>
				<th class="uniBtn">ㅋ</th>
				<th class="uniBtn">ㅌ</th>
				<th class="uniBtn">ㅍ</th>
				<th class="uniBtn">ㅎ</th>
				<th class="uniBtn">a-z</th>
				<th class="uniBtn">0-9</th>
			</tr>
		</thead>
		<tbody>
		 	<tr>
		 		<td colspan="17">
			 		<form class="toggleBtn">
				 		<input type="radio" name="searchType" checked="checked"/>최신순&nbsp;&nbsp;&nbsp;
				 		<input type="radio" name="searchType" />이름순
			 		</form>
			 	</td>
		 	</tr>
			<tr>
				<td colspan="17">
					<c:choose>
				         <c:when test="${not empty adMagazineList}">
				            <c:forEach var="msvo" items="${adMagazineList}" varStatus="status">
				               <div class="imagePreview" data-num="${msvo.mg_num}" style="display: inline-block; padding: 5px; margin:10px;">
				                  <a  class="goDetail">
				                     <img class="rimagePreview" src="/uploadStorage/magazineImage/thum/${msvo.pl_path}"/>
				                  </a>
				                  <p class="magText">
					                  ${msvo.mg_name} <br/>
					                  ${msvo.pd_cost}
				                  	</p>
				               </div>
				            </c:forEach>
				         </c:when>
				     </c:choose>
				<td>
			</tr>
		</tbody>
		<tfoot>
		
		</tfoot>
	</table>
</div>
