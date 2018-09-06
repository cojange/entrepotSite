<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<div class="container-fluid">
	<table>
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
				<th>All</th>
				<th>ㄱ</th>
				<th>ㄴ</th>
				<th>ㄷ</th>
				<th>ㄹ</th>
				<th>ㅁ</th>
				<th>ㅂ</th>
				<th>ㅅ</th>
				<th>ㅇ</th>
				<th>ㅈ</th>
				<th>ㅊ</th>
				<th>ㅋ</th>
				<th>ㅌ</th>
				<th>ㅍ</th>
				<th>ㅎ</th>
				<th>a-z</th>
				<th>0-9</th>
			</tr>
		</thead>
		<tbody>
		 	<tr>
		 		<td colspan="17">
			 		<form>
				 		<input type="radio" name="searchType" checked="checked"/>최신순&nbsp;
				 		<input type="radio" name="searchType" />이름순
			 		</form>
			 	</td>
		 	</tr>
			<tr>
				<td colspan="17">
					<c:choose>
				         <c:when test="${not empty adMagazineList}">
				            <c:forEach var="msvo" items="${adMagazineList}" varStatus="status">
				               <div class="imagePreview" data-num="${msvo.mg_num}" style="display: inline-block; padding: 20px;">
				               		<p class="magText">
					                  ${msvo.mg_name} / ${msvo.pd_cost}
				                  	</p>
				                  <a  class="goDetail">
				                     <img class="rimagePreview" src="/uploadStorage/magazineImage/thum/${msvo.pl_path}"/>
				                  </a>
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
