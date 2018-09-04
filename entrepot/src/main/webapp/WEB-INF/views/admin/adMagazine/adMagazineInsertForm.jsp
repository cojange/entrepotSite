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
	<table>
		<tr>
			<td>
				<select></select>
				<select></select>
				<select></select>
			</td>
		</tr>
		<tr>
			<td>
				대상
			</td>
			<td>
				<input type="checkbox" name="mgTarget">기타<input type="text">
			</td>
		</tr>
		<tr>
			<td>
				키워드
			</td>
			<td>
				<input type="checkbox" name="mgKeyword">기타<input type="text">
			</td>
		</tr>
		<tr>
			<td>
				간략소개
			</td>
			<td>
				<textarea cols="50" rows="5"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				목차
			</td>
			<td>
				<textarea cols="50" rows="5"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				제품상세
			</td>
			<td>
				<textarea cols="50" rows="5"></textarea>
			</td>
		</tr>
		<tr>	
			<td>
				썸네일용
			</td>
			<td>
				<input type="file">
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
			                <input id="uploadInputBox" style="display: none" type="file" name="file" id="mulFile" multiple/>
			            </div>
			            
			            <!-- 미리보기 영역 -->
			            <div id="preview" class="content"></div>
			            
			            <!-- multipart 업로드시 영역 -->
			            <form id="uploadForm" style="display: none;"></form>
			        </div>
			        <div class="footer">
			            <button class="submit">등록</button>
			        </div>
			    </div>
			</td>
		</tr>
	</table>
</div>