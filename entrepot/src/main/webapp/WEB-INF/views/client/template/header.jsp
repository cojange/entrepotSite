<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>


<script type="text/javascript" src="/resources/include/client/js/jquery-1.12.4.min.js"></script>
<%-- <script type="text/javascript">
</script>

=======
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
			<button value="검색"></button>
		</fieldset>
	</form>
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
          </ul>
	</div><!--/.nav-collapse -->
</div>
	<div id="menu" class="container">
		<ul>
			<li class="current_page_item"><a href="/" accesskey="1" title="">Homepage</a></li>
			<li><a href="/client/list/magazinelist.do?key1=패션학&listkey=1&home=베스트" accesskey="1" title="">게시판</a></li>
			<li><a href="#" accesskey="2" title="">갤러리</a></li>
			<li><a href="/client/member/mChoose.do" accesskey="3" title="">회원가입</a></li>
		</ul>
	</div>
 --%>
<script type="text/javascript">
function errorCodeCheck(){}
	function surchlist() {
		var surch = $("#url").val(); 
    	
        
  		 $("#search").val(surch);
  		 $("#listkey").val(4);
       //상세 페이지로 이동하기위해  form추가(id:detailForm)
       $("#az").attr({
          "method":"get",
          "action":"/client/list/magazinelist.do"
       });
        $("#az").submit();
	}
	$(function() {
		$(".surchbtn").click(function() {
            
			surchlist()
         });
	});
</script>

<div id="header" class="container">
   <div id="logo">
      <h1><a href="/">앙뜨흐뽀</a></h1>
      <p>Design by <a href="/" rel="nofollow">TEMPLATED</a></p>
   </div>

   <form action="surchlist()" autocomplete="off" class="az" id="az" name="az">
   	<input type="hidden" id="listkey" >
   	<input type="hidden" id="search" name ="search"> 
      <fieldset class="url">
         <input id="url" type="text" name="url" required> <label
            for="url"><i class="fa fa-search" aria-hidden="true"></i>
            Search</label>
         <div class="after"></div>
      </fieldset>
      <fieldset class="enter">
         <button  class="surchbtn" value="검색"></button>
      </fieldset>
   </form>
      <!-- <div id="social">
            <ul class="contact">
               <li><a href="#" class=""><span>Twitter</span></a></li>
               <li><a href="#" class="icon icon-facebook"><span></span></a></li>
               <li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
               <li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
               <li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
            </ul>
      </div> -->

   <div class="container" id="social">
      <div class="memberlogin" style="font-size: 10pt;">
         <!-- <a href="javascript:void(window.open('/client/login/login.do','_blank','width=300px, height=350px',))">로그인</a> -->
         <c:if test="${login.m_id != null and login.m_id != ''}">
         <div class="menu"  style="font-size: 10pt;,display: inline-block;">
         <span>[ ${login.m_name} ]님 환영합니다.</span>
         <form class="m_idxForm">
         	<!-- <input type="hidden" value="찜리스트" id="m_idx" name="m_idx"> -->
         </form>
         <br><br>
         <a id="menuDownUp" href="#"></a>
         <span class="menuDown"><i class="icon-th-list">메뉴&nbsp;<span>▼</span><a id="menuDown" href="#"></a></i></span><br>
         <span class="menuUp"><i class="icon-th-list">메뉴&nbsp;<span>▲</span><a id="menuUp" href="#"></a></i></span><br>
         		<div class="loginMenu">
         			<a id="logout" href="#">로그아웃</a><br>
         			<c:if test="${login.mt == '개인'}">
         			<a href="/client/member/myPageWhish.do">마이페이지</a><br>
         			<a href="/client/member/memberModify.do">정보수정</a><br>
         			</c:if>
         			<c:if test="${login.mt == '단체'}">
         			<a href="/client/member/myPageWhish.do">마이페이지</a><p></p>
         			<a href="/client/member/memberModify.do">정보수정</a><br>
         			</c:if>
         		</div>
			 <!--  <input type="button" id="logout" value="로그아웃"><br>
		      <input type="button" id="myPage" value="마이페이지"><br>
		      <input type="button" id="#" value="정보수정(비밀번호변경)"> -->

         </div>
         </c:if>
          <c:if test="${login.m_id == null or login.m_id == ''}">
          <a href="/client/member/login.do" id="logingo">로그인</a>
          <span>/</span>
          <a href="/client/member/mChoose.do" id="joingo">회원가입</a>
          </c:if>
         <!-- <a href="/client/member/login.do" onClick="popct(this.href, '300', '350');return false">로그인</a> -->
      </div>
   </div><!--/.nav-collapse -->
</div>
   <div id="menu" class="container">
      <ul>
         <li class="current_page_item"><a href="/" accesskey="1" title="">Homepage</a></li>
         <li  class="san"><a href="#" accesskey="1" title="">베스트게시판</a>
         	<ul>
         		<li>
         		  <a href="/client/list/magazinelist.do?key1=패션&key2=뷰티&key3=헤어&listkey=3&home=베스트&page=1" accesskey="1" title="">패션/뷰티/헤어 </a>
         		 </li>
         		<li>
         		  <a href="/client/list/magazinelist.do?key1=경제&key2=경영&key3=마케팅&listkey=3&home=베스트" accesskey="1" title="">경제/경영/마케팅</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=시사&key2=뉴스&key3=정치&listkey=3&home=베스트" accesskey="1" title="">시사/뉴스/정치</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=독서&key2=논술&key3=영어&listkey=3&home=베스트" accesskey="1" title="">독서/논술/영어</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=과학&key2=자연&key3=수학&listkey=3&home=베스트" accesskey="1" title="">과학/자연/수학</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=요리&key2=식생활&key3=리빙&listkey=3&home=베스트" accesskey="1" title="">요리/식생활/리빙</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=기술&key2=업종&key3=산업&listkey=3&home=베스트" accesskey="1" title="">기술/업종/산업</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=청소년&key2=교육&key3=아동&listkey=3&home=베스트" accesskey="1" title="">청소년/교육/아동</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=문학&key2=예술&key3=음악&listkey=3&home=베스트" accesskey="1" title="">문학/예술/음악</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=모바일&key2=인터넷&key3=it&listkey=3&home=베스트" accesskey="1" title="">모바일/인터넷/it</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=자동차&key2=항공&key3=제품&listkey=3&home=베스트" accesskey="1" title="">자동차/항공/제품</a>
         		 </li>
         		   <li>
         		  <a href="/client/list/magazinelist.do?key1=애니&key2=캐릭터&key3=게임&listkey=3&home=베스트" accesskey="1" title="">애니/캐릭터/게임</a>
         		 </li> 
         		  <li>
         		  <a href="/client/list/magazinelist.do?key1=라이프&key2=건강&key3=스포츠&listkey=3&home=베스트" accesskey="1" title="">라이프/건강/스포츠</a>
         		 </li>
         		 <li>
         		  <a href="/client/list/magazinelist.do?key1=건축&key2=인테리어&listkey=2&home=베스트" accesskey="1" title="">건축/인테리어/</a>
         		 </li>       		              
         	</ul> 
         </li>
         <li class="san"><a href="#" accesskey="2" title="">해외잡지</a>
         	<ul>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=미국&listkey=1&home=해외잡지" accesskey="1" title="미국">미국</a>
         		</li>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=영국&listkey=1&home=해외잡지" accesskey="1" title="영국">영국</a>
         		</li>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=일본&listkey=1&home=해외잡지" accesskey="1" title="일본">일본</a>
         		</li>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=프랑스&listkey=1&home=해외잡지" accesskey="1" title="프랑스">프랑스</a>
         		</li>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=중국&listkey=1&home=해외잡지" accesskey="1" title="중국">중국</a>
         		</li>
         		<li>
         			<a href="/client/list/magazinelist.do?key1=이탈리아&listkey=1&home=해외잡지" accesskey="1" title="이탈리아">이탈리아</a>
         		</li>    
         	</ul>
         </li>
         <li  class="san"><a href="/client/list/magazinelist.do?listkey=5" accesskey="3" title="">이달의부록</a></li>
         <li  class="san"><a href="#" accesskey="4" title="">게시판</a>
         	<ul>
         		<li>
         			 <a href="/client/board/personalListboard.do" accesskey="1" title="">1대1문의 게시판</a>
         		</li>
         		<li>
         			 <a href="/client/board/climgbListboard.do" accesskey="1" title="">포토 게시판</a>
         		</li>
         		<li>
         			<a href="/client/board/adminListboard.do" accesskey="1" title="">공지게시판</a>
         		</li>
         		<li>
         			  <a href="/client/board/eventListboard.do" accesskey="1" title="">이벤트 게시판</a>
         		</li>
         		<li>
         		 <a href="/client/board/userfulListboard.do" accesskey="1" title="">자주묻는 게시판</a>
         		 </li>
         	</ul>
         </li>
      </ul>
   </div>
