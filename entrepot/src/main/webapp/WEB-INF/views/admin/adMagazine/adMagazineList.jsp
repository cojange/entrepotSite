<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<div class="container-fluid">
	<table>
		<thead>
			<tr>
				<th>
					<ul>
						<li>All</li>
						<li>ㄱ</li>
						<li>ㄴ</li>
						<li>ㄷ</li>
						<li>ㄹ</li>
						<li>ㅁ</li>
						<li>ㅂ</li>
						<li>ㅅ</li>
						<li>ㅇ</li>
						<li>ㅈ</li>
						<li>ㅊ</li>
						<li>ㅋ</li>
						<li>ㅌ</li>
						<li>ㅍ</li>
						<li>ㅎ</li>
						<li>a-z</li>
						<li>0-9</li>
					</ul>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<c:choose>
				         <c:when test="${not empty adMagazineList}">
				            <c:forEach var="room" items="${adMagazineList}" varStatus="status">
				            
				               <div class="imagePreview" data-num="${mgvo.mg_num}">
				                  <label>잡지명 : ${mgvo.mg_name}</label>
				                  <label>원가 : ${mgvo.pd_cost}</label>
				                  <a  class="goDetail">
				                     <img class="rimagePreview" src="/uploadStorage/thum/${mgvo.pl_path}"/>
				                     ${mgvo.pl_path}
				                  </a>
				               </div>
				            </c:forEach>
				         </c:when>
				      </c:choose>
				<td>
			</tr>
		</tbody>
	</table>
</div>
