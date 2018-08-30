/* 함수명 : chkData(유효성 체크 대상, 메세지 내용)
 * 출력여역 : alert으로
 * 예시 : if(!chkData($('#keyword'),"검색어를")) return;
 * */
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

/* 함수명 : chkForm(유효성 체크 대상, 메세지 내용)
 * 출력여역 : placeholder 속성을 이용
 * 예시 : if(!chkForm($('#keyword'),"검색어를")) return;
 * */
function chkForm(item, msg){
   var message = "";
   if($(item).val().replace(/\s/g,"")==""){
      message = msg +" 입력해 주세요.";
      item.attr("placeholder", message);
      return false;
   } else {
      return true;
   }
}

/* 함수명 : chkFile(유효성 체크 대상)
 * 셜명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수. */
function chkFile(item){
   /* 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환)
    * jQuery.inArray(찾을 값, 검색 대상의 배열) */
   var ext = item.val().split('.').pop().toLowerCase();
   if(jQuery.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
      alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
      return false;
   }else{
      return true;
   }
}

/* 함수명 : chkText(유효성 체크 대상)
 * 셜명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수. */
function chkText(item){
   /* 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환)
    * jQuery.inArray(찾을 값, 검색 대상의 배열) */
   var ext = item.val().split('.').pop().toLowerCase();
   if(jQuery.inArray(ext, ['pdf']) == -1) {
      alert('pdf 파일만 업로드 할수 있습니다.');
   }
}

/*함수명 : chkExelFile(유효성 체크대상)
 * 설명 : 엑셀 파일 여부를 확인하기 위해 확장자 확인 함수 */
function chkExcelFile(item){
   var ext = item.val().split(".").pop().toLowerCase();
   if(jQuery.inArray(ext,['xls','xlsx'])==-1){
      alert("xls,xlsx형식의 파일만 업로드 할 수 있습니다."+ext);
      return false;
   }else{
      return true;
   }
}

/* formCheck(유효성 체크 대상, 출력 영역, 메세지 내용) */
function formCheck(main, item, msg){
   if(main.val().replace(/\s/g,"")==""){
      item.html(msg+" 입력해 주세요");
      main.val("");
      return false;
   }else{
      return true;
      item.html("");
   }
}

/* 함수명 : getDateFormat(날짜 데이터)
 * 설명 : dataValue의 값을 년-월-일 형식(예시: 2018-01-01)으로 반환. */
function getDateFormat(dateValue){
   var year = dateValue.getFullYear();
   
   var month = dateValue.getMonth()+1;
   month = (month<10) ? "0"+month : month;
   
   var day = dateValue.getDate();
   day = (day<10) ? "0"+day : day;
   
   var result = year+"-"+month+"-"+day;
   return result;
}
/*******/
function getTrimStr (item){
   /*var str = item.replace(/s\g/,"")*/
   var sss = item.trim();
   var str = sss.replace( /(\s*)/g, "");
   return str;
}
/* 배열 : 유효성 체크 시 필요한 정규식으로 배열을 초기화.
 * pattren = [아이디(0),비밀번호(1),핸드폰번호(2),생년월일(3),주민번호앞자리(4),이메일이름(5),도메인(6),
 *             전화번호or팩스번호(7),사업자등록번호(8),사용자이름(9),@를 포함한 email정규식(10), 관리자 id체크(11)]
 * 함수명:inputVerify(배열 인덱스번호,비교할 값,출력영역)
 * */
var pattren = [
      "((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
      "((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})",
      "^\\d{3}-\\d{3,4}-\\d{4}",
      "^(?=.*[0-9]).{6}$",
      "^[1-4]$",
      "((?=.*[a-zA-Z])(?=.*[0-9]).{3,20})",
      "((([a-z\d](([a-z\d-]*[a-z\d])|([ㄱ-힣]))*)\.)+[a-z]{2,})",
      "^\\d{2,3}-\\d{3,4}-\\d{4}",
      "^([0-9]{3})-?([0-9]{2})-?([0-9]{5})",
      "^[가-힣]{2,4}$",
      "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$",
	   "^[0-9a-zA-Z].{6,12}"
      ];

/**입력 형식이 맞지않을때 발생하는메서드
 * 
 * if(!inputVerify(사용할pattren의index,참조할 id,비교할값,힌트메세지,사용하는유저타입))return;
 * 
 * RegExp : 정규표현식을 판단하기위한 객체
 * 
**/
function inputVerify(index,data,printarea,hint,mode) {
   var data_regExp = new RegExp(pattren[index]);
   var match = data_regExp.exec($(data).val());
   console.log("data " + $(data).val());
   console.log("mode" +mode);
   if(match==null){
      if(mode=='member'){      //특정 area에 메세지 뿌리기
         var label=$(data).parents(".form-group").find(".control-label").html();
         console.log("레이블 : "+label);
         $(printarea).html(label+" 의 입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.\n"+hint);
         $(data).val("");
         return false;
      }else if(mode=='admin'){   //alert로 정보 띄워주기
         alert(printarea + " 입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.\n"+hint);
         $(data).val("");
         return false;
      }
   }else{
      if(mode=='member'){
         $(printarea).html("");
      }
      return true;
   }
}