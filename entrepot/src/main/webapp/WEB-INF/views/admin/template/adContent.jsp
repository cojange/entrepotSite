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
            <li class="breadcrumb-item">
              <a href="/admin/kakaopayImpl">kakaopay</a>
            </li>
            <li class="breadcrumb-item">
              <a href="/admin/kakaoexample">kakaopay2</a>
            </li>
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
   
          

          <!-- Icon Cards-->
          <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                  </div>
                  <div class="mr-5">26 New Messages!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-list"></i>
                  </div>
                  <div class="mr-5">11 New Tasks!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5">123 New Orders!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-life-ring"></i>
                  </div>
                  <div class="mr-5">13 New Tickets!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
          </div>

          <!-- Area Chart Example-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-chart-area"></i>
              		지난 7일 통계</div>
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
                  <table id ="magazineDataTable" class="table table-bordered" width="100%" cellspacing="0">
                  	
                  </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          
		</div>
