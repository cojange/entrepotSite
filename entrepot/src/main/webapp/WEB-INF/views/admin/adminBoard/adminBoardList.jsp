<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
      
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
     	<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
      	<!-- 모바일 웹 페이지 설정 -->
      	<link rel="shortcut icon" href="/resources/images/common/icon.png" />
      	<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
      	<!-- 모바일 웹 페이지 설정 종료 -->
      
      	<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
      	<!-- [if lt IE 9] -->
      	<!-- <script src="/resources/include/js/html5shiv.js"</script> -->
      	<!-- [endif] -->
	</head>
	<body>
	<!-- 공지사항 & 이벤트 공지사항 리스트 -->		
	<div class="container-fluid" >
		<div class="card mb-3" id="adMagazine">
            <div class="card-header">
            	<i class="fas fa-table"></i>
            	공지사항&이벤트 게시글 리스트
            </div>   
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th style="display: none;">내용</th>
                      <th style="display: none;">글번호</th>
                      <th>번호</th>
                      <th>게시 유형</th>          
                      <th>게시글 유형</th>           
                      <th>제목</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th>작성자 아이디</th>
                      <th style="display: none;">팝업 이미지</th>
                      <th style="display: none;">게시글 이미지</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th style="display: none;">내용</th>
                      <th style="display: none;">글번호</th>
                      <th>번호</th>
                      <th>게시 유형</th>          
                      <th>게시글 유형</th>           
                      <th>제목</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th>작성자 아이디</th>
                      <th style="display: none;">팝업 이미지</th>
                      <th style="display: none;">게시글 이미지</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
						<c:when test="${not empty adminBoardList}">
							<c:forEach var="advo" items="${adminBoardList}" varStatus="status">
								<tr class="tac" data-num="${advo.ab_no}">
									<td style="display: none;">${advo.ab_content}</td>
									<td style="display: none;">${advo.ab_no}</td>
									<td>${status.count}</td>
									<td>${advo.ab_pre}</td>
									<td>${advo.ab_type}</td>
									<td>${advo.ab_title}</td>									
									<td>${advo.ab_date}</td>
							 		<td>${advo.ab_update}</td>
									<td>${advo.ad_id}</td>
									<td style="display: none;">${advo.file_thumb}</td>
									<td style="display: none;">${advo.ab_file}</td>
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
                <input type="button" id="upAb" value="수정"/>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          
          <!-- 입력창 / 쿠폰리스트 -->
          <div id="pbRight">
          
	        <!-- 공지사항 or 이벤트 입력 -->
	        <div>
	        	<form id="adBoardForm">
	        		<table style="width: 600px;">
	        			<colgroup>
	        				<col width="10%">
	        				<col width="30%">
	        				<col width="70%">
	        			</colgroup>
	        			<tr id="abToday">	        				
	        			</tr>
	        			<tr>
	        				<td colspan="2">글유형  : 
	        					<select id="ab_type" name="ab_type">
	        						<option value="공지사항">공지사항</option>
	        						<option value="이벤트">이벤트</option>
	        					</select>
	        				</td>
	        				<td>제목 : <input type="text" id="ab_title" name="ab_title"></td>
	        			</tr>
	        			<tr>
	        				<td colspan="1" style="vertical-align: middle;">
	        					내용 : 
	        				</td>
	        				<td colspan="2">
	        					<textarea rows="5" cols="50" id="ab_content" name="ab_content"></textarea>
	        				</td>
	        			</tr>
	        			<tr>
	        				<td colspan="3">
	        					첨부파일(팝업) : <input type="file" id="file1" name="file1"> 
	        				</td>
	        			</tr>
	        			<tr>
	        				<td colspan="3">
	        					첨부파일(게시글) : <input type="file" id="file2" name="file2"> 
	        				</td>
	        			</tr>
	        			<tr>
	        				<td colspan="2">게시유형  : 
	        					<select id="ab_pre" name="ab_pre">
	        						<option value="일반">일반</option>
	        						<option value="팝업">팝업</option>
	        						<option value="상단고정">상단고정</option>
	        					</select>
	        				</td>
	        				<td>아이디 : <input type="text" id="ad_id" name="ad_id"></td>
	        			</tr>
	        			<tfoot>
	        				<tr>
	        					<td colspan="3">
	        						<input type="button" id="abSaveBtn" value="등록">
	        						<input type="button" class="abResetBtn" value="초기화">
	        					</td>
	        				</tr>
	        			</tfoot>
	        		</table>
	        	</form>
	        </div>
          
	        <!-- 공지사항 & 이벤트 공지사항 리스트 -->		
			<div class="card mb-3" id="adMagazine">
	            <div class="card-header">
	            	<i class="fas fa-table"></i>
	            	쿠폰 리스트
	            </div>   
	            <div class="card-body">
	              <div class="table-responsive" style="overflow-x: hidden;">
	              <form id="couponForm">
	                <table class="table table-bordered" id="couponTable" width="100%" cellspacing="0">
	                <colgroup>
						<col width="7%" />
						<col width="10%" />
						<col width="15%" />
						<col width="11%" />
						<col width="15%" />
						<col width="15%" />
						<col width="17%" />
					</colgroup>
	                  <thead>
	                    <tr>
	                      <th>번호</th>
	                      <th>쿠폰코드</th>          
	                      <th>유형</th>           
	                      <th>할인율</th>
	                      <th>등록일</th>
	                      <th>수정일</th>
	                      <th>설명</th>
	                      <th>활성여부</th>
	                    </tr>
	                  </thead>
	                  <tfoot>
	                   <tr>
	                      <th>번호</th>
	                      <th>쿠폰코드</th>          
	                      <th>유형</th>           
	                      <th>할인율</th>
	                      <th>등록일</th>
	                      <th>수정일</th>
	                      <th>설명</th>
	                      <th>활성여부</th>
	                    </tr>
	                  </tfoot>
	                  <tbody id="coupon_table">
	                     <c:choose>
							<c:when test="${not empty couponList}">
								<c:forEach var="cvo" items="${couponList}" varStatus="status">
									<tr class="tac">
										<td>${status.count}</td>
										<td>${cvo.coupon_no}</td>
										<td>${cvo.coupon_type}</td>
										<td>${cvo.coupon_discount}%</td>									
										<td>${cvo.coupon_date}</td>
								 		<td>${cvo.coupon_update}</td>
										<td>${cvo.coupon_memo}</td>
										<td><c:if test="${cvo.coupon_use=='false'}">비활성</c:if>
										<c:if test="${cvo.coupon_use=='true'}">활성</c:if></td>									
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
	                </form>
	                 <div style="text-align: right;">
	              		<input type="button" value="등록" id="addCou"/>
						<input type="button" value="수정" id="upCou"/>
	                </div>
	              </div>
	            </div>
	            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
	          </div>
	        </div>
       </div>
	</body>
</html>