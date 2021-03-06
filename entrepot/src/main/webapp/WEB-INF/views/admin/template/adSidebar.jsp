<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>   
      <ul class="sidebar navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/admin/ctrl/adMember/adMemberCtrl.do">
            <i class="fas fa-fw fa-users"></i>
            <span>회원관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/ctrl/adPartner/adPartnerListCtrl.do">
            <i class="fas fa-fw fa-address-card"></i>
            <span>거래처관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/magazine/adMagazine/adMagazineList.do">
            <i class="fas fa-fw fa-book"></i>
            <span>상품관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/order/orderList/getSell.do">
            <i class="fas fa-fw fas fa-shopping-cart"></i>
            <span>구매관리</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-list-alt"></i>
            <span>게시판관리</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="/admin/adBoard/personalBoard/personalBoardList.do">1:1 게시판</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/adBoard/adminBoard/adminBoardList.do">공지사항&amp;이벤트 게시판</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/admin/adBoard/regulations/regulationsList.do">약관</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adChart/adChart.do">
            <i class="fas fa-fw fa-chart-bar"></i>
            <span>통계</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adcost/adCostList.do">
            <i class="fas fa-fw fa-won-sign"></i>
            <span>비용</span></a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fas fa-fw fa-calendar-alt"></i>
            <span>달력</span>
          </a>
        </li> -->
      </ul>
