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
	<table style="width:100%">
		<tr>
			<td>
				<select name="mg_num" id="stMg_num">
				</select>
				<select id="stMcom_name" name="mcom_name">
				</select>
				<input type="text" name="term" id="mgTerm">		
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
</form>
<hr style="width:98%; text-align: center;"/>
<form id="adddetail" name="adddetail">
	<table>
	
		<tr>
			<td>
				<select name="mg_num" id="stMg_num"></select>
				<select id="stMcom_name"></select>
				<select name="term" id="mgTerm">		
				</select>
			</td>
		</tr>
		<tr>
			<td>
				대상
			</td>
			<td>
				<input type="checkbox" name="dt_target" value="기타">기타<input type="text">
			</td>
		</tr>
		<tr>
			<td>
				키워드
			</td>
			<td>
				<input type="checkbox" name="dt_keyword">기타<input type="text">
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
				<input type="file" name="mainFile">
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
			                <input id="uploadInputBox" style="display: none" type="file" name="prevFile" id="mulFile" multiple/>
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