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
	<!-- 약관동의  리스트 -->		
	<div class="container-fluid" >
		<div class="card mb-3" id="adMagazine">
            <div class="card-header">
            	<i class="fas fa-table"></i>
            	약관동의 리스트      	
            </div>   
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>          
                      <th>약관이름</th>           
                      <th>회원ID</th>
                      <th>회원명</th>
                      <th>동의날짜</th>
                      <th>회원타입</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>번호</th>          
                      <th>약관이름</th>           
                      <th>회원ID</th>
                      <th>회원명</th>
                      <th>동의날짜</th>
                      <th>회원타입</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
						<c:when test="${not empty regAgreeList}">
							<c:forEach var="regAgree" items="${regAgreeList}" varStatus="status">
								<tr class="tac" data-num="${status.count}">
									<td>${status.count}</td>
									<td>${regAgree.reg_type}</td>
									<td>${regAgree.m_id}</td>
									<td>${regAgree.m_name}</td>									
									<td>${regAgree.ag_date}</td>
									<td>${regAgree.mt}</td>
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
        
         <br/>
         <hr/>
                  
        <div class="container-fluid">
         <!-- 약관 리스트 -->
		<div class="card mb-3"  id="adCourier">
            <div class="card-header">
              <i class="fas fa-table"></i>
              	약관 리스트
            </div>
            <div class="card-body">
              	<form id="regWriteForm">
	                <table class="table table-bordered" id="regBoard" width="100%" cellspacing="0">
	               	 <colgroup>
							<col width="7%" />
							<col width="23%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="12%" />
							<col width="25%" />
						</colgroup>
	                  <thead>
	                    <tr>
	                      <th>번호</th>
	                      <th>약관 유형</th>                     
	                      <th>등록일</th>
	                      <th>수정일</th>
	                      <th>공개일</th>
	                      <th>비공개전환일</th>
	                      <th>파일명</th>
	                    </tr>
	                  </thead>
	                  <tfoot>
	                    <tr>
	                      <th>번호</th>
	                      <th>약관 유형</th>                     
	                      <th>등록일</th>
	                      <th>수정일</th>
	                      <th>공개일</th>
	                      <th>비공개전환일</th>                      
	                      <th>파일명</th>
	                    </tr>
	                  </tfoot>
	                  <tbody id="factory_table">                  	
	                     <c:choose>
							<c:when test="${not empty regList}">
								<c:forEach var="reg" items="${regList}" varStatus="status">
									<tr class="tac" data-num="${status.count}">
										<td>${status.count}</td>
										<td>${reg.reg_type}</td>
										<td>${reg.reg_date}</td>
										<td>${reg.reg_update}</td>
										<td>${reg.reg_open}</td>
										<td>${reg.reg_close}</td>									
										<td>${reg.reg_file}</td>
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
              		<input type="button" value="등록" id="addData"/>
					<input type="button" value="수정"/>
                </div>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
	</body>
</html>