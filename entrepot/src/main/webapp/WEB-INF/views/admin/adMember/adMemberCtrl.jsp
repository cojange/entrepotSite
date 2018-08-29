<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
  <div class="container-fluid">
  
	
     <!-- 회원 관리 -->
     <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-users"></i>회원 관리
              <!-- member Search keyword -->
              <form id="searchMB" name="searchMB">
              	<select id="mbType" name="mbType">
              	  <option value="total">전체</option>
	              <option value="personal">개인 회원</option>
	              <option value="group">단체 회원</option>
              	</select>
              </form>
              
            </div>
            <div class="card-body" >
              <div class="table-responsive" id="switchDiv">
                <table class="table table-bordered switchTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>회원번호</th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>가입일</th>
                      <th>직업/기관</th>
                      <th>회원타입</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>회원번호</th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>가입일</th>
                      <th>직업/기관</th>
                      <th>회원타입</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
                       <c:when test="${not empty memberList }">
                          <c:forEach var="memberM" items="${memberList }" varStatus="status">
                             <tr class="tac" data-num="${status.count }">
                                <td>${memberM.m_num}</td>
                                <td>${memberM.m_id}</td>
                                <td>${memberM.m_name }</td>
                                <td>${memberM.m_phone }</td>
                                <td>${memberM.m_email }</td>
                                <td>${memberM.m_date }</td>
                                <td>${memberM.m_job}</td>
                                <td>${memberM.mt}</td>
                             </tr>
                          </c:forEach>
                       </c:when>
                       <c:otherwise>
                          <tr>
                             <td colspan="4" class="tac"> 등록된 회원이 존재 하지 않습니다.</td>
                          </tr>
                       </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          
          <div id="example">
          
          </div>
          
    <!-- 관리자 관리 -->
        <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-user-cog"></i>
                 관리자 관리</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="adminTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>순번</th>
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
                      <th>순번</th>
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
                       <c:when test="${not empty adminList }">
                          <c:forEach var="adminM" items="${adminList }" varStatus="status">
                             <tr class="tac" data-num="${status.count }">
                                <td>${status.count}</td>
                                <td>${adminM.ad_name }</td>
                                <td>${adminM.ad_id }</td>
                                <td>${adminM.ad_tell }</td>
                                <td>${adminM.ad_email }</td>
                                <td>${adminM.ad_date }</td>
                                <td>${adminM.ad_grade }</td>
                             </tr>
                          </c:forEach>
                       </c:when>
                       <c:otherwise>
                          <tr>
                             <td colspan="4" class="tac"> 등록된 회원이 존재 하지 않습니다.</td>
                          </tr>
                       </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
              	<input type="button" id="ad-add" value="등록">
              	<input type="button" id="ad-del" value="삭제">
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
</div>