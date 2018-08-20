<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
    <!-- 관리자 관리 -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              	관리자 관리</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>이름</th>
                      <th>아이디</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>입사일</th>
                      <th>직급</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>이름</th>
                      <th>아이디</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>입사일</th>
                      <th>직급</th>
                    </tr>
                  </tfoot>
                  <tbody>
	                  <c:choose>
		              	<c:when test="${not empty memberList }">
		              		<c:forEach var="board" items="${memberList }" varStatus="status">
		              			<tr class="tac" data-num="${member.idx }">
		              				<%--<td>${status.count}</td> --%>
		              				<%--반복에 따라 순서(index) 나 카운트(count)를 가져 올 수 잇다. --%>
		              				<td class="goDetail tal">${member.userId }</td>
		              				<td>${member.userName }</td>
		              				<td>${member.email }</td>
		              				<td>${member.phone }</td>
		              				<td>${member.joinDate }</td>
		              			</tr>
		              		</c:forEach>
		              	</c:when>
		              	<c:otherwise>
		              		<tr>
		              			<td colspan="4" class="tac"> 등록된 회원이 존재 하지 않습니다.</td>
		              		</tr>
		              	</c:otherwise>
	              	</c:choose>
	                    <tr>
	                      <td>Donna Snider</td>
	                      <td>Customer Support</td>
	                      <td>New York</td>
	                      <td>27</td>
	                      <td>2011/01/25</td>
	                      <td>$112,000</td>
	                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>