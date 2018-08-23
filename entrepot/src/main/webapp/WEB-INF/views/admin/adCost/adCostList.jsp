<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
  <div class="container-fluid">
  	 <div class="row">
  	 <c:choose>
  	 	<c:when test="${not empty cardList }">
  	 		<c:forEach var="cardData" items="${cardList }" varStatus="status">
  	 			<div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                  </div>
                  <div class="mr-5">${cardData.cardName}</div>
                </div>
                <a class="card-footer text-white clearfix small z-1 viewExcel" href="${status.count }">
                  <span class="float-left">${cardData.ad_id }</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            	<form id="loadExcel${status.count }" name="loadExcel">
            		<input type="hidden" name="cost_file" value="${cardData.cost_file }"/>
            		<input type="hidden" name="ad_id" value="${cardData.ad_id}"/>
            	</form>
            </div>
  	 		</c:forEach>
  	 	</c:when>
  	 	<c:otherwise>
  	 		<div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                  </div>
                  <div class="mr-5">지출 내역 없음</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">지출 내역 엑셀파일을 업로드 해주세요.</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
  	 	</c:otherwise>
  	 </c:choose>
            
          </div>
          
          <%--템플릿 다운 --%>
          	<div class="ad-left">
          		<input type="button" value="템플릿" id="templateDown"/>
          	</div>
          <%--템플릿 다운 --%>
         <%--엑셀 업로드 --%>
         <div class="ad-right">
         <form id="cost_ExcelFile" name="cost_ExcelFile" enctype="multipart/form-data">
         	<input type="file" name="file" id="excelCost"/>
         	<input type="button" value="업로드" id="uploadBtn"/>
         </form>
         </div>
         
          <%--엑셀 업로드 --%>
          
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-users"></i>
                 회원 관리</div>
            <div class="card-body">
              <div class="table-responsive" id="memberList">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>순번</th>
                      <th>일자</th>
                      <th>거래처</th>
                      <th>비용</th>
                      <th>비고</th>
                      <th>관리자</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>순번</th>
                      <th>일자</th>
                      <th>거래처</th>
                      <th>비용</th>
                      <th>비고</th>
                      <th>관리자</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
                       <c:when test="${not empty costTable }">
                          <c:forEach var="costList" items="${costTable }" varStatus="status">
                             <tr class="tac" data-num="${status.count }">
                                <td>${status.count}</td>
                                <td>${costList.costDate }</td>
                                <td>${costList.company }</td>
                                <td>${costList.cost }</td>
                                <td>${costList.memo }</td>
                                <td>${costList.manager }</td>
                             </tr>
                          </c:forEach>
                       </c:when>
                       <c:otherwise>
                          <tr>
                             <td>0</td>
                                <td>.</td>
                                <td>.</td>
                                <td>.</td>
                                <td>.</td>
                                <td>.</td>
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