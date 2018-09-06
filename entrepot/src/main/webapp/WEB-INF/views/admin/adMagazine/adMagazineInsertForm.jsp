<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	#preview img {
	    width: 170px;
	    height: 100px;
	}
	#preview p {
	    text-overflow: ellipsis;
	    overflow: hidden;
	}
	.preview-box {
	    border: 1px dotted skyblue;
	    padding: 5px;
	    border-radius: 2px;
	    margin-bottom: 10px;
	    width:50%;
	}
</style>
<div class="container-fluid">
<form id="addmagine" name ="addmagine">
	<table class="table table-striped table-bordered" style="width:100%">
		
			<thead><tr><td>잡지 등록</td></tr></thead>
			<tr>
			<td>
				<select id="stMcom_name" name="com_name">
				</select>
				<select name="mg_name" id="stMg_name">
				</select>	
			</td>
		</tr>
		<tr>
			<td>
				발간예정일 : <input type="text" id="pd_date" name="pd_date">
			</td>
		</tr>
		<tr>
			<td>
				원가 : <input type="number" id="pd_cost" name="pd_cost">
			</td>
		</tr>
		<tr>
			<td>
				<div>[정가]<input type="number" id="pd_sale" name="pd_sale"> X [할인율]<input type="number" id="pd_rate" name="pd_rate"> = <span id="resultBtn">[판매가]</span><input type='number' id="pd_result"></div>
			</td>
		</tr>
		<tr>
			<td>
				부록 : <input type="text" id="pd_appendix" name="pd_appendix">
			</td>
		</tr>
	</table>
	<input type="button" id="magazineSubmitBtn" value="잡지등록">
</form>
<hr style="width:98%; text-align: center;"/>
<form id="adddetail" name="adddetail">
<input type="hidden" name="mg_name" id="mg_name"/>
	<table>
		<thead><tr><td>상세페이지</td></tr></thead>
		<tr>
			<td>
				대상
			</td>
			<td>
				<c:choose>
					<c:when test="${not empty dt_target }">
						<c:forEach var="target" items="${dt_target }" varStatus="status">
							<input type="checkbox" name="dt_target_submit" value="${target }/">${target }
						</c:forEach>
					</c:when>
				</c:choose>
				<input type="checkbox" class="_chk">기타<input type="text" disabled>
			</td>
		</tr>
		<tr>
			<td>
				키워드
			</td>
			<td>
				<c:choose>
					<c:when test="${not empty dt_keyword }">
						<c:forEach var="keyword" items="${dt_keyword }" varStatus="status">
							<input type="checkbox" name="dt_keyword_submit" value="${keyword }/">${keyword }
						</c:forEach>
					</c:when>
				</c:choose>
				<input type="checkbox" class="_chk">기타<input type="text" disabled>
			</td>
		</tr>
		<tr>
			<td>
				간략소개
			</td>
			<td>
				<textarea cols="50" rows="5" name="dt_brief"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				목차
			</td>
			<td>
				<textarea cols="50" rows="5" name="dt_contents"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				제품상세
			</td>
			<td>
				<textarea cols="50" rows="5" name="dt_detail"></textarea>
			</td>
		</tr>
		<tr>	
			<td>
				원본용
			</td>
			<td>
				<input type="file" name="mainfile">
			</td>
		</tr>
		<tr>
			<td>
				프리뷰용
			</td>
			<td>
				<div class="wrapper">
			        <div class="body">
			            <!-- 첨부 버튼 -->
			            <div id="attach">
			                <label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진 추가</label>
			                <input id="uploadInputBox" style="display: none" type="file" name="prevfile" id="mulFile" multiple/>
			            </div>
			            <!-- 미리보기 영역 -->
			            <div id="preview" class="content"></div>
			        </div>
			        <div class="footer">
			            <button id="detailSubmitBtn">등록</button>
			        </div>
			    </div>
			</td>
		</tr>
	</table>
	 </form>
</div>