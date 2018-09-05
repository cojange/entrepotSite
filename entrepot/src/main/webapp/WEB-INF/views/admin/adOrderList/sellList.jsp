<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
  <div class="container-fluid">
     <!-- 회원 관리 -->
     <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-users"></i>판매 관리
            </div>
            <div class="card-body" >
            <form id="searchDate" name="searchDate">
            		<input type="radio" value="0" id="recent0" name="monthkey" checked="checked"><label for="recent0">전체</label>
	              	<input type="radio" value="3" id="recent3" name="monthkey"><label for="recent3">최근 3일</label>
	              	<input type="radio" value="7" id="recent7" name="monthkey"><label for="recent7">최근 1주</label>
	              	<input type="radio" value="30" id="recent30" name="monthkey"><label for="recent30">최근 1달</label>
	              	<input type="radio" id="etcDate" value=0 name="monthkey"><label for="etcDate"> 기타</label>
	           </form>
	           <form id="anotherDate"  name="anotherDate">
	           		<div>
	              		<input type="date" name=sDate class="anotherValue"/>&nbsp;~&nbsp;<input type="date" name="eDate" class="anotherValue"/>
	              		<input type="button" id="submitAnother" value="검색">
	              	</div>
	           </form>
              <div class="table-responsive" id="switchDiv">
              
                <table class="table table-bordered orderList" width="100%" cellspacing="0">
             
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
                       <c:when test="${not empty sellList }">
                          <c:forEach var="sellList" items="${sellList }" varStatus="status">
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
          
        <!-- 주문 관리 -->
   
       <div class="card mb-3">
        <div class="card-body" >
       		<div class="card-header">
              <i class="fas fa-users"></i>발주 관리
         	</div>
         	<form id="kindOrder" name="kindOrder">
		         <select id="selectkey" name="keyword">
		         	<option value="all">전체</option>
		         	<option value="주문">주문</option>
		         	<option value="판매">판매</option>
		         	<option value="교환">교환</option>
		         	<option value="환불">환불</option>
		         </select>
         	</form>
        <div class="table-responsive" id="switchDiv2">
            <table class="table table-striped" id="orderProductTable">
              <thead>
              	<tr>
              		<td>품번</td>
              		<td>품명</td>
              		<td>거래처</td>
              		<td>담당자</td>
              		<td>연락처</td>
              		<td>email</td>
              		<td>총 수량</td>
              		<td>총 금액</td>
              		<td>비 고</td>
              	</tr>
              </thead>
              <tbody>
              	<c:choose>
                       <c:when test="${not empty orderProduct }">
                          <c:forEach var="orderP" items="${orderProduct }" varStatus="status">
                             <tr class="tac deteilOrder" data-num="${status.count }">
                                <td>${orderP.pd_num}</td>
                                <td>${orderP.mg_name}</td>
                                <td>${orderP.mcom_name }</td>
                                <td>${orderP.char_manager }</td>
                                <td>${orderP.char_tel }</td>
                                <td>${orderP.char_email }</td>
                                <td>${orderP.total_ea}</td>
                                <td>${orderP.total_cost}</td>
                                <td>${orderP.memo }</td>
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
         <button type="button" id="refundChangeBtn" class="btn btn-primary btn-sm" disabled="disabled" data-toggle="modal" data-target="#orderWaitModal">교환 환불처리</button>
         <button type="button" id="orderConfirmBtn" class="btn btn-primary btn-sm" disabled="disabled" data-toggle="modal" data-target="#orderConfirmModal">발주 확인처리</button>
         <button type="button" id="orderChangeBtn" class="btn btn-primary btn-sm" disabled="disabled" data-toggle="modal" data-target=".bs-orderChange-modal-sm">상태 변경</button>
       </div>
     </div>
     
     <!-- 교환 환불 모달 -->
     <div class="modal fade bs-orderWaitModal-modal-lg" id="orderWaitModal" tabindex="-1" role="dialog" aria-labelledby="orderWaitModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="orderWaitModalLabel">교환/환불 처리</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		      	<div id="refundChangeDiv">
		      	</div>
		      	<button type="button" class="cancelReq" disabled="disabled">요청 삭제</button>
		      	<button type="button" class="submitRC">일괄 처리</button>
		      </div>
		     </div>
		    </div>
		   </div>
		<!-- 주문 모달 -->
		<div class="modal fade bs-orderConfirm-modal-lg" id="orderConfirmModal" tabindex="-1" role="dialog" aria-labelledby="orderConfirmModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h6 class="modal-title" id="orderConfirmModalLabel">발주 처리</h6>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		      	<div id="orderConfirmDiv">
		      	</div>
		      	<button type="button" class="submitToghter">일괄 처리</button>
		      </div>
		     </div>
		    </div>
		   </div>
		  <!-- 주문상태변경 -->
		<div class="modal fade bs-orderChange-modal-sm" tabindex="-1" role="dialog" aria-labelledby="orderChangeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		    <div class="modal-header">
		        <h5 class="modal-title" id="orderChangeModalLabel">사용자정의 처리</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div style="text-align: center; margin-top: 13px; margin-bottom: 5px;">
		    	<form id="orderChangeFrm" name="orderChangeFrm">
		    		<input type="text" maxlength="4" id="orderkey" name="keyword">
		    		<input type="button" value="수정" id="submitUserOrder">
		    	</form>
		    	</div>
		    </div>
		    
		  </div>
		</div>
 </div>