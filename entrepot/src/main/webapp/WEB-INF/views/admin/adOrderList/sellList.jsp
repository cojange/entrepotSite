<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
  <div class="container-fluid">
     <!-- 회원 관리 -->
     <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-users"></i>회원 관리
            </div>
            <div class="card-body" >
              <div class="table-responsive" id="switchDiv">
                <table class="table table-bordered" id="orderList" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>주문번호</th>
                      <th>총 수량</th>
                      <th>총 금액</th>
                      <th>주문 회원</th>
                      <th>회원 타입</th>
                      <th>판매 일자</th>
                      <th>완료 일자</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>주문번호</th>
                      <th>총 수량</th>
                      <th>총 금액</th>
                      <th>주문 회원</th>
                      <th>회원 타입</th>
                      <th>판매 일자</th>
                      <th>완료 일자</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
                       <c:when test="${not empty sellList }">
                          <c:forEach var="sellList" items="${sellList }" varStatus="status">
                             <tr class="tac" data-num="${status.count }">
                                <td>${sellList.order_num}</td>
                                <td>${sellList.sell_ea}</td>
                                <td>${sellList.sell_money }</td>
                                <td>${sellList.m_num }</td>
                                <td>${sellList.mt }</td>
                                <td>${sellList.sell_date }</td>
                                <td>${sellList.enddate}</td>
                             </tr>
                          </c:forEach>
                       </c:when>
                       <c:otherwise>
                          <tr>
                             <td colspan="4" class="tac"> 거래 내역이 없습니다.</td>
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