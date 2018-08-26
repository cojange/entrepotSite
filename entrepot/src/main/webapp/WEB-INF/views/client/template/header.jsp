<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
</script>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">앙뜨흐뽀</a></h1>
				<p>Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a></p>
			</div>

		<form action="#" autocomplete="off" class="az">
			<fieldset class="url">
				<input id="url" type="text" name="url" required> <label
					for="url"><i class="fa fa-search" aria-hidden="true"></i>
					Search</label>
				<div class="after"></div>
			</fieldset>
			<fieldset class="enter">
				<button></button>
			</fieldset>
		</form>
		<div id="social">
				<ul class="contact">
					<li><a href="#" class=""><span>Twitter</span></a></li>
					<li><a href="#" class="icon icon-facebook"><span></span></a></li>
					<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
					<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
					<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
				</ul>
		</div>
<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/client/js/header.js"></script>
<div class="container">
		<div class="memberlogin" style="font-size: 10pt;">
			<!-- <a href="javascript:void(window.open('/client/login/login.do', '_blank','width=300px, height=350px',))">로그인</a> -->
			<c:if test="${login.m_id != null and login.m_id != ''}">
			<div  style="font-size: 10pt;,display: inline-block;">
			<span>[ ${login.m_name} ]님 환영합니다!!!</span>          
			<input type="button" id="logout" value="로그아웃"><span>/</span>
			<input type="button" id="myPage" value="마이페이지"><span>/</span>
			<a href="/client/member/modify.do">정보수정(비밀번호변경)</a>
			<!-- <a href="/client/member/delete.do">회원탈퇴</a> -->
			</div>
			</c:if>
			 <c:if test="${login.m_id == null or login.m_id == ''}">
			 <a href="/client/member/login.do">로그인</a>
			 <span>/</span>
			 <a href="/client/member/mChoose.do">회원가입</a>
			 </c:if>
			<!-- <a href="/client/member/login.do" onClick="popct(this.href, '300', '350');return false">로그인</a> -->
			
			

		</div>

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">앙뜨흐뽀</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
            <li><a href="/client/list/magazinelist.do?key=여성&listkey=target&homename=베스트" >게시판</a></li>
            <li><a href="#">갤러리</a></li>
            <li><a href="/client/member/mChoose.do">회원가입</a></li>
            
            <li></li>

           <!--  <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li> -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>

		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="#" accesskey="1" title="">Homepage</a></li>
				<li><a href="/client/list/magazinelist.do?key1=패션학&listkey=1&home=베스트" accesskey="1" title="">Services</a></li>
				<li><a href="#" accesskey="2" title="">Our Clients</a></li>
				<li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="#" accesskey="4" title="">Careers</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>
