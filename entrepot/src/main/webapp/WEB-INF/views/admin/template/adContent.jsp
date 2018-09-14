<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!-- chart.js -->
		<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
		<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
		<script type="text/javascript" src="https://www.amcharts.com/lib/3/themes/dark.js"></script>
<!-- chart.js -->
        <div class="container-fluid">
          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item active">Overview</li>
          </ol>
          
          <!-- crawler 카드 슬라이드스 -->
          <h1 class="text-center mb-3">알라딘 사이트 기준 베스트 리스트</h1>
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <div class="carousel-inner row w-100 mx-auto">
		      
		      <c:choose>
		      	<c:when test="${not empty booklist }">
		      		 <c:forEach var="i" begin="0" end="10" varStatus="status">
		      		 	<c:if test="${i==0}">
		      		 		<div class="carousel-item col-md-4 active">
		      		 		<div class="card">
					          <img class="card-img-top img-fluid" src="${bookimg.get(i)}" alt="Card image cap">
					          <div class="card-body">
					            <h4 class="card-title">best 1.</h4>
					            <p class="card-text">${booklist.get(i) }</p>
					            <p class="card-text"><small class="text-muted">${update }</small></p>
					          </div>
		        			</div>
		     		 	</div>
		      		 	</c:if>
		      		 	<c:if test="${i>0 }">
		      		 		<div class="carousel-item col-md-4">
		      		 		<div class="card">
					          <img class="card-img-top img-fluid" src="${bookimg.get(i)}" alt="Card image cap">
					          <div class="card-body">
					            <h4 class="card-title"></h4>
					            <p class="card-text">${booklist.get(i) }</p>
					            <p class="card-text"><small class="text-muted">${update }</small></p>
					          </div>
		        			</div>
		     		 	</div>
		      		 	</c:if>
		      		</c:forEach>

		      	</c:when>
		      </c:choose>
		    </div>
		    
		    
		    </div><!-- slides -->
   
          <!-- Area Chart Example-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-chart-area"></i>
              		지난 7일 통계(보라:전체주문, 네모:주문, 선:환불,교환)</div>
            <div class="card-body">
              <div id="odSellRC" style="width: 100%; height: 400px; background-color: #282828;" ></div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>

          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
             	 주문 기록</div>
            <div class="card-body">
              <div class="table-responsive">
              	<p>잡지검색기능추가</p>
                  	<table class="table table-bordered" id="magazineDataTable" width="100%" cellspacing="0">
             
                  <thead>
                    <tr>
                      <th></th>
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
                      <th></th>
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
                       <c:when test="${not empty sellDt }">
                          <c:forEach var="sellList" items="${sellDt }" varStatus="status">
                             <tr class="tac" data-num="${status.count }">
                             	<td class="details-control"><i class="fas fa-plus-circle red"></i></td>
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
