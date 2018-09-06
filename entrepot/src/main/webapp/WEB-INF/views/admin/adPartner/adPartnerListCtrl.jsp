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
      	<link rel="shortcut icon" href="/resources/images/admin/adLog.ico" />
      	<link rel="apple-touch-icon" href="/resources/images/admin/adLog.ico"  />
      	<!-- 모바일 웹 페이지 설정 종료 -->
      
      	<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
      	<!-- [if lt IE 9] -->
      	<!-- <script src="/resources/include/js/html5shiv.js"</script> -->
      	<!-- [endif] -->
 	
      	
	</head>
	<body>
	<!-- 잡지거래처 리스트 -->		
	<div class="container-fluid" >
		<div class="card mb-3" id="adMagazine">
            <div class="card-header">
            	<i class="fas fa-table"></i> 
            	잡지 거래처           	
            </div>   
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>거래처명</th>                     
                      <th>담당자 이름</th>
                      <th>담당자 연락처</th>
                      <th>담당자 email</th>
                      <th>거래시작일</th>
                      <th>거래종료일</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">사업자번호</th>
                      <th style="display: none;">대표이름</th>
                      <th style="display: none;">대표번호</th>
                      <th style="display: none;">거래처주소</th>
                      <th style="display: none;">담당자fax</th>
                      <th style="display: none;">회계부이름</th>
                      <th style="display: none;">회계부번호</th>
                      <th style="display: none;">회계부이메일</th>
                      <th style="display: none;">회계부fax</th>
                      <th style="display: none;">입금은행</th>
                      <th style="display: none;">예금주</th>
                      <th style="display: none;">계좌번호</th>
                      <th style="display: none;">환불주소우편번호</th>
                      <th style="display: none;">환불주소</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>거래처명</th>                     
                      <th>담당자 이름</th>
                      <th>담당자 연락처</th>
                      <th>담당자 email</th>
                      <th>거래시작일</th>
                      <th>거래종료일</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">사업자번호</th>
                      <th style="display: none;">대표이름</th>
                      <th style="display: none;">대표번호</th>
                      <th style="display: none;">거래처주소</th>
                      <th style="display: none;">담당자fax</th>
                      <th style="display: none;">회계부이름</th>
                      <th style="display: none;">회계부번호</th>
                      <th style="display: none;">회계부이메일</th>
                      <th style="display: none;">회계부fax</th>
                      <th style="display: none;">입금은행</th>
                      <th style="display: none;">예금주</th>
                      <th style="display: none;">계좌번호</th>
                      <th style="display: none;">환불주소우편번호</th>
                      <th style="display: none;">환불주소</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
						<c:when test="${not empty magPartnerList}">
							<c:forEach var="magPartner" items="${magPartnerList}" varStatus="status">
								<tr class="tac" data-num="${status.count}">
									<td>${magPartner.com_name}</td>
									<td>${magPartner.char_manager}</td>
									<td>${magPartner.char_tel}</td>
									<td>${magPartner.char_email}</td>
									<td>${magPartner.startdate}</td>
									<td>${magPartner.enddate}</td>
									<td>${magPartner.mcom_date}</td>
									<td>${magPartner.mcom_update}</td>
									<td style="display: none;">${magPartner.com_no}</td>
			                        <td style="display: none;">${magPartner.mcom_name}</td>
			                        <td style="display: none;">${magPartner.mcom_tel}</td>
			                        <td style="display: none;">${magPartner.mcom_add}</td>
			                        <td style="display: none;">${magPartner.char_fax}</td>
			                        <td style="display: none;">${magPartner.acc_manager}</td>
			                        <td style="display: none;">${magPartner.acc_tel}</td>
			                        <td style="display: none;">${magPartner.acc_email}</td>
			                        <td style="display: none;">${magPartner.acc_fax}</td>
			                        <td style="display: none;">${magPartner.bacc_bank}</td>
			                        <td style="display: none;">${magPartner.bacc_name}</td>
			                        <td style="display: none;">${magPartner.bacc_accno}</td>
			                        <td style="display: none;">${magPartner.rzip_code}</td>
			                        <td style="display: none;">${magPartner.raddress}</td>
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
                <div>
	                 <!-- Button trigger modal -->
					 <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#magazineModal">
					  등록
					 </button>
					 <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#magazineDetailModal" id="mgDetailBtn">
					  상세보기
					 </button>
				</div>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          </div>
        
         <br/>
         <hr/>
         
        <div class="container-fluid">
         <!-- 택배거래처 리스트 -->
		<div class="card mb-3"  id="adCourier">
            <div class="card-header">
              <i class="fas fa-table"></i>
              	택배 거래처
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="adminTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>택배사명</th>
                      <th>계약지역</th>                     
                      <th>담당자 이름</th>
                      <th>담당자 연락처</th>
                      <th>건수</th> 
                      <th>건당할인요금</th>
                      <th>거래시작일</th>
                      <th>거래종료일</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">사업자번호</th>
	                  <th style="display: none;">회사연락처</th>
	                  <th style="display: none;">회사fax</th>
	                  <th style="display: none;">회사email</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>택배사명</th>
                      <th>계약지역</th>                                           
                      <th>담당자 이름</th>
                      <th>담당자 연락처</th>
                      <th>건수</th> 
                      <th>건당할인요금</th>
                      <th>거래시작일</th>
                      <th>거래종료일</th>
                      <th>등록일</th>
                      <th>수정일</th>
                      <th style="display: none;">사업자번호</th>
	                  <th style="display: none;">회사연락처</th>
	                  <th style="display: none;">회사fax</th>
	                  <th style="display: none;">회사email</th>
                    </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
						<c:when test="${not empty couPartnerList}">
							<c:forEach var="couPartner" items="${couPartnerList}" varStatus="status">
								<tr class="tac" data-num="${status.count}">
									<td>${couPartner.couacc_name}</td>
									<td>${couPartner.couacc_area}</td>
									<td>${couPartner.char_manager}</td>
									<td>${couPartner.char_tel}</td>
									<td>${couPartner.couacc_cnt}</td>
									<td>${couPartner.couacc_cost}</td>
									<td>${couPartner.startdate}</td>
									<td>${couPartner.enddate}</td>
									<td>${couPartner.couacc_date}</td>
									<td>${couPartner.couacc_update}</td>	
									<td style="display: none;">${couPartner.com_no}</td>
			                        <td style="display: none;">${couPartner.couacc_tel}</td>
			                        <td style="display: none;">${couPartner.couacc_fax}</td>
			                        <td style="display: none;">${couPartner.couacc_email}</td>								
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
                <div>
	                <!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#courierModal">
					  등록
					</button>
					<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#courierDetailModal" id="couDetailBtn">
					  상세보기
					</button>
				</div>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
         </div>
         
<!-- magazine Modal --------------------------------------------------------->
	<div class="modal fade bs-example-modal-lg" id="magazineModal" tabindex="-1" role="dialog" aria-labelledby="magazineModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">	       	
	        <h4 class="modal-title" id="magazineModalLabel">잡지 거래처 등록</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	        <form id="magazineInsertForm" name="magazineInsertForm">
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mcom_date" name="mcom_date" class="form-control" placeholder="거래처 정보 등록일" required="required" autofocus="autofocus">
	                    <label for="mcom_date">거래처 정보 등록일</label>
	                  </div>
	                </div>
	                ~
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="mcom_update" name="mcom_update" class="form-control" placeholder="거래처 정보 수정일" required="required" autofocus="autofocus" disabled="disabled">
	                    <label for="mcom_update">거래처 정보 수정일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="mStartdate" name="startdate" class="form-control" placeholder="거래 시작일" required="required" autofocus="autofocus">
	                    <label for="mStartdate">거래 시작일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="mEnddate" name="enddate" class="form-control" placeholder="거래 종료일" required="required" autofocus="autofocus">
	                    <label for="mEnddate">거래 종료일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	               <input type="text" id="mCom_name" name="com_name" class="form-control" placeholder="회사명" required="required" autofocus="autofocus">
	               <label for="mCom_name">회사명</label>
	              </div>
	            </div>
	            <div class="form-group">
	             <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mcom_name" name="mcom_name" class="form-control" placeholder="대표명" required="required" autofocus="autofocus">
	                    <label for="mcom_name">대표명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mcom_tel" name="mcom_tel" class="form-control" placeholder="대표 연락처" required="required" autofocus="autofocus">
	                    <label for="mcom_tel">대표 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	                <input type="text" id="com_no" name="com_no" class="form-control" placeholder="사업자번호" required="required">
	                <label for="com_no">사업자번호</label>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	                <input type="text" id="mcom_add" name="mcom_add" class="form-control" placeholder="주소" required="required">
	                <label for="mcom_add">주소</label>
	              </div>
	            </div>
	             <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_manager" name="char_manager" class="form-control" placeholder="담당자 이름" required="required" autofocus="autofocus">
	                    <label for="char_manager">담당자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="mChar_tel" name="char_tel" class="form-control" placeholder="담당자 연락처" required="required" autofocus="autofocus">
	                    <label for="mChar_tel">담당자 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_email" name="char_email" class="form-control" placeholder="담당자 이메일" required="required" autofocus="autofocus">
	                    <label for="char_email">담당자 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="char_fax" name="char_fax" class="form-control" placeholder="담당자 Fax" required="required" autofocus="autofocus">
	                    <label for="char_fax">담당자 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_manager" name="acc_manager" class="form-control" placeholder="회계부 이름" required="required" autofocus="autofocus">
	                    <label for="acc_manager">회계부 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_tel" name="acc_tel" class="form-control" placeholder="회계부 연락처" required="required" autofocus="autofocus">
	                    <label for="acc_tel">회계부 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_email" name="acc_email" class="form-control" placeholder="회계부 이메일" required="required" autofocus="autofocus">
	                    <label for="acc_email">회계부 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="acc_fax" name="acc_fax" class="form-control" placeholder="회계부 Fax" required="required" autofocus="autofocus">
	                    <label for="acc_fax">회계부 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="rzip_code" name="rzip_code" class="form-control" placeholder="환불 우편번호" required="required" autofocus="autofocus">
	                    <label for="rzip_code">환불 우편번호</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="raddress" name="raddress" class="form-control" placeholder="환불 주소" required="required" autofocus="autofocus">
	                    <label for="raddress">환불 주소</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	             <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_bank" name="bacc_bank" class="form-control" placeholder="입금 은행명" required="required" autofocus="autofocus">
	                    <label for="bacc_bank">입금 은행명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_name" name="bacc_name" class="form-control" placeholder="예금주" required="required" autofocus="autofocus">
	                    <label for="bacc_name">예금주</label>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="bacc_accno" name="bacc_accno" class="form-control" placeholder="계좌번호" required="required" autofocus="autofocus">
	                    <label for="bacc_accno">계좌번호</label>
	                  </div>
	                </div>
	              </div>
	             </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="magInsertBtn">등록</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="magDel">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- courier Modal --------------------------------------------------------->
	<div class="modal fade bs-example-modal-lg" id="courierModal" tabindex="-1" role="dialog" aria-labelledby="courierModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">	       	
	        <h4 class="modal-title" id="courierModalLabel">택배 거래처 등록</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	        <form id="courierInsertForm" name="courierInsertForm">
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_date" name="couacc_date" class="form-control" placeholder="거래처 정보 등록일" required="required" autofocus="autofocus">
	                    <label for="couacc_date">거래처 정보 등록일</label>
	                  </div>
	                </div>
	                ~
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="couacc_update" name="couacc_update" class="form-control" placeholder="거래처 정보 수정일" required="required" autofocus="autofocus" disabled="disabled">
	                    <label for="couacc_update">거래처 정보 수정일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	           <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="cStartdate" name="startdate" class="form-control" placeholder="거래 시작일" required="required" autofocus="autofocus">
	                    <label for="cSstartdate">거래 시작일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="date" id="cEnddate" name="enddate" class="form-control" placeholder="거래 종료일" required="required" autofocus="autofocus">
	                    <label for="cEnddate">거래 종료일</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_area" name="couacc_area" class="form-control" placeholder="거래 계약지역" required="required" autofocus="autofocus">
	                    <label for="couacc_area">거래 계약지역</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_cnt" name="couacc_cnt" class="form-control" placeholder="거래건수" required="required" autofocus="autofocus">
	                    <label for="couacc_cnt">거래건수</label>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_cost" name="couacc_cost" class="form-control" placeholder="건당 할인요금" required="required" autofocus="autofocus">
	                    <label for="couacc_cost">건당 할인요금</label>
	                  </div>
	               </div>
	            </div>
	            <div class="form-group">
	              <div class="form-label-group">
	                <input type="text" id="cCom_no" name="com_no" class="form-control" placeholder="사업자번호" required="required">
	                <label for="cCom_no">사업자번호</label>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_name" name="couacc_name" class="form-control" placeholder="회사명" required="required" autofocus="autofocus">
	               		<label for="couacc_name">회사명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_tel" name="couacc_tel" class="form-control" placeholder="회사 연락처" required="required" autofocus="autofocus">
	                    <label for="couacc_tel">회사 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_email" name="couacc_email" class="form-control" placeholder="회사 이메일" required="required">
	                    <label for="couacc_email">회사 이메일</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="couacc_fax" name="couacc_fax" class="form-control" placeholder="회사 Fax" required="required">
	                    <label for="couacc_fax">회사 Fax</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <div class="form-row">
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="cChar_manager" name="char_manager" class="form-control" placeholder="담당자 이름" required="required">
	                	<label for="cChar_manager">담당자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-label-group">
	                    <input type="text" id="cChar_tel" name="char_tel" class="form-control" placeholder="담당자 연락처" required="required">
	               		<label for="cChar_tel">담당자 연락처</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </form>
	      </div>
	      <div class="modal-footer">
	 	    <button type="button" class="btn btn-primary" id="couInsertForm">등록</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="couDel">닫기</button>    
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- magUpdate Modal --------------------------------------------------------->
	<div class="modal fade bs-example-modal-lg" id="magazineDetailModal" tabindex="-1" role="dialog" aria-labelledby="magDetailModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">	       	
	        <h4 class="modal-title" id="magDetailModalLabel">잡지 거래처 정보 및 수정</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body" id="mgContent">
	    		
	      </div>
	      <div class="modal-footer">
	     	<button type="button" class="btn btn-primary mgUpdateForm magazineUpBtn">수정</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="couDel">닫기</button>	        
	      </div>
	    </div>
	  </div>
	</div>
	</body>
</html>
<!-- couUpdate Modal --------------------------------------------------------->
	<div class="modal fade bs-example-modal-lg" id="courierDetailModal" tabindex="-1" role="dialog" aria-labelledby="couDetailModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">	       	
	        <h4 class="modal-title" id="couDetailModalLabel">택배 거래처 정보</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body" id="couContent">
	    		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="couDel">닫기</button>	        
	      </div>
	    </div>
	  </div>
	</div>
	</body>
</html>