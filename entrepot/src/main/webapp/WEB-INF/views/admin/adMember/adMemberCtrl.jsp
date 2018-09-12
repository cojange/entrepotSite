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
              <div class="btntl">
              	<button type="button" class="btn btn-primary btn-sm btncss" data-toggle="modal" data-target="#adminModal">등록</button>
              	<button type="button" class="btn btn-primary btn-sm btncss" data-toggle="modal" data-target="#confirmModal">삭제</button>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          <!-- Modal Confirm -->
          <div class="modal fade" id="confirmModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">직원 해고</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      </div>
			      <div class="modal-body">
			        <p>정말 직원을 해고 하시겠습니까.</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="adminFire">해고</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->
          
		<!-- Modal -->
		<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="adminModalLabel">관리자 등록</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		          <form id="ad_addForm">
		          	<div class="form-group">
		              <div class="form-label-group">
		                <input type="text" id="id" name="ad_id" class="form-control" placeholder="Id">
		                <label for="id">아이디</label>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="form-row">
		                <div class="col-md-6">
		                  <div class="form-label-group">
		                    <input type="password" id="pw" name="ad_pw" class="form-control" placeholder="Password">
		                    <label for="pw">비밀번호</label>
		                  </div>
		                </div>
		                <div class="col-md-6">
		                  <div class="form-label-group">
		                    <input type="password" id="coPw" class="form-control" placeholder="Password Confirm">
		                    <label for="coPw">비밀번호 확인</label>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="form-row">
		                <div class="col-md-6">
		                  <div class="form-label-group">
		                    <input type="text" id="name" name="ad_name" class="form-control" placeholder="Name">
		                    <label for="name">이름</label>
		                  </div>
		                </div>
		                <div class="col-md-6">
		                  <div class="form-label-group">
		                    <input type="text" id="grade" name="ad_grade" class="form-control" placeholder="Grade">
		                    <label for="grade">직급</label>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="form-label-group">
		                <input type="text" id="tell" name="ad_tell" class="form-control" placeholder="Phone number">
		                <label for="tell">연락처</label>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="form-label-group">
		                <input type="text" id="email" name="ad_email" class="form-control" placeholder="Email address">
		                <label for="email">이메일</label>
		              </div>
		            </div>
		          </form>
		        </div>
		        <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="addAdmin">등록</button>
		      </div>
		      </div>
		      </div>
		     
			</div>
		   </div>