<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<!-- 공지사항 & 이벤트 공지사항 리스트 -->		
	<div class="container-fluid" >
		<div class="card mb-3" id="adMagazine">
            <div class="card-header">
            	<i class="fas fa-table"></i>
            	1:1 게시판 리스트
            </div>   
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>번호</th>
                      <th>유형</th>                     
                      <th>제목</th>                     
                      <th>작성자 아이디</th>
                      <th>작성자 이름</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">내용</th>
                      <th style="display: none;">사진1</th>
                      <th style="display: none;">사진2</th>
                      <th style="display: none;">사진3</th>
                      <th style="display: none;">글번호</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th>번호</th>
                      <th>유형</th>                     
                      <th>제목</th>                     
                      <th>작성자 아이디</th>
                      <th>작성자 이름</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">내용</th>
                      <th style="display: none;">사진1</th>
                      <th style="display: none;">사진2</th>
                      <th style="display: none;">사진3</th>
                      <th style="display: none;">글번호</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
						<c:when test="${not empty personalBoardList}">
							<c:forEach var="PersonalBo" items="${personalBoardList}" varStatus="status">
								<tr role = "row" class="tac" data-num="${PersonalBo.pb_no}">
									<td class="details-control"><i class="fas fa-plus-circle red"></i></td>
									<td>${status.count}</td>
									<td>${PersonalBo.pb_type}</td>
									<td>${PersonalBo.pb_title}</td>
									<td>${PersonalBo.m_num}</td>									
									<td>${PersonalBo.m_name}</td>
							 		<td>${PersonalBo.pb_date}</td>
									<td>${PersonalBo.pb_date}</td>
									<td style="display: none;">${PersonalBo.pb_content}</td>
									<td style="display: none;">${PersonalBo.pb_img1}</td>
									<td style="display: none;">${PersonalBo.pb_img2}</td>
									<td style="display: none;">${PersonalBo.pb_img3}</td>
									<td style="display: none;">${PersonalBo.pb_no}</td>
								</tr>
							</c:forEach>
						</c:when> 
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
      </div>
	