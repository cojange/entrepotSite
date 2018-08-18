
/* 함수명 : chkData(유효성 체크 대상,메세지 내용)
			출력영역:alert으로
			예시: if(!chkData($('#keyword'),"검색어를"))return;*/
function chkData(item, msg){
   if($(item).val().replace(/\s/g,"")==""){
      alert(msg+" 입력해 주세요.");
      $(item).val("");
      $(item).focus();
      return false;
   } else {
      return true;
   }
}
/* formCheck(유효성 체크 대상, 메세지 내용) */
function formCheck(main,item,msg) {
	if(main.val().replace(/\s/g,"")==""){
		item.html(msg+" 입력해 주세요");
		main.val("");
		return false;
	}else{
		return true;
	}
}

/*함수명 : chkFile(파일명)
 * 설명: 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.*/
function chkFile(file) {
	/*
	 * 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1로 반환)
	jQuery.inArray(찾을 값, 검색 대상의 배열)
	*/
	var ext = file.val().split(".").pop().toLowerCase();
	if(jQuery.inArray(ext,['gif','png','jpg','jpeg']) == -1){
		alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		return false;
	}else{
		return true;
	}
	/*if(file.val().replace(/\s/g,"")==""){
		alert(msg+"입력해 주세요.");
		file.val("");
		file.focus();
		return false;
	}else{
		return true;
	}*/
}

/* 함수명 : checkForm(유효성 체크 대상, 메세지 내용)
 * 출력영역: placeholder 속성을 이용.
 * 예시 : if(!chkSubmit ($('#keyword'),"검색어를")) return;
 */

function checkForm(item,msg) {
	var message = "";
	if(otem.val().replace(/\s/g,""=="")){
		message = msg + " 입력해 주세요.";
		item.attr("placeholder",message);
		return false;
	}else{
		return true;
	}
}

/*함수명 :  getDateFormat(날짜데이터)
 *설명 : dataValue의 ㄱ밧을 년-월-일-형식(예시:2018-01-01)으로 반환.*
 */
function getDateFormat(dateValue) {
	var year = dateValue.getFullYear();
	
	var month = dateValue.getMonth()+1;
	month = (month<10) ? "0"+month : month;
	
	var day = dateValue.getDate(); 
	day = (day<10) ? "0"+day : day;
	
	var result = year+"-"+month+"-"+day;
	return result;
	
	

}