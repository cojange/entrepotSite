<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

      <a class="navbar-brand mr-1" href="/admin"><span id="adLogo">Entrepot</span> 관리자 페이지</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <!-- <div class="input-group">
          <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-primary" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div> -->
      </form>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
      	 
        <!-- 로그아웃 버튼 -->
	        <c:if test="${adlogin != null}">
	        	<li><label class="adf-cl">현재 접속 중인 아이디 : ${adlogin.ad_id }</label></li>
	        </c:if>
        <li>
        	<div id="clock"></div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-envelope fa-fw"></i>
            <span class="badge badge-danger">9+</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="#">구독 진행 중 잡지 발주</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item no-arrow mx-1">
        
          <a class="nav-link" href="/adLogin/login.do" id="adLogout" role="button" aria-haspopup="true" title="로그아웃" aria-expanded="false">
            <i class="fas fa-sign-out-alt fa-fw"></i>
          </a>
        </li>
        <!-- 클라이언트 홈페이지 이동 버튼 -->
        <li class="nav-item no-arrow">
          <a class="nav-link" href="http://localhost:8080" id="goClient" role="button" aria-haspopup="true" title="앙뜨흐뽀" aria-expanded="false">
            <i class="fas fa-kiss-wink-heart fa-fw"></i>
          </a>
        </li>
      </ul>
			

