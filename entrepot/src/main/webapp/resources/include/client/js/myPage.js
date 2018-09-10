$(function() {
	var sum = 0;
	var total = 0;
	var sumEa=0;
	var sumNum=0;
	var arr=[];
	//불러오는 값만큼 반복
	for (var i = 0; i < $(".trSize").size(); i++) {
		console.log($(".trSize").size());
		//인덱스
		$(".index:eq("+i+")").val(i+1);
		//수량
		eaIndex=$(".ea:eq("+i+")").val();
		ea = parseInt(eaIndex);
		//금액
		moneyIndex=$(".money:eq("+i+")").val();
		money = parseInt(moneyIndex);
		//console.log(ea);
		//console.log(money);
		//합계
		sum = money*ea;
		money = comma(money);
		$(".money:eq("+i+")").val(money+"원");
		$(".sumNum:eq("+i+")").val(sum); 
		sum = comma(sum);
		$(".sum:eq("+i+")").val(sum+"원");
		
		//합계의합계	
		sumNumIndex=$(".sumNum:eq("+i+")").val();
		sumNum = parseInt(sumNumIndex);
		total=total+sumNum;
		console.log("total : "+ total);
		//권수의합계
		sumEa=sumEa+ea;
		console.log("sumEa : "+ sumEa);
		//잡지종류갯수를 
		arr[i]=$(".index:eq("+i+")").val();
		console.log("arr["+i+"] : "+arr[i]);
		
	}
	
	var max = Math.max.apply(null, arr);
	
	//numberWithCommas(total);
	total = comma(total);
	//console.log(total);
	
	$(".total").val(total+"원"+"("+max+"종"+sumEa+"권)");
	
	//장바구니/찜수량 수정 
	$(".eaUpdate").click(function() {
		var thisEa = $(this).parents(".eaTd").find(".ea").val();
		console.log("수정할 개수 : "+thisEa);
		$(this).parents(".eaTd").find(".ea").val(thisEa);		
	});
	
	//선택삭제 버튼 클릭시 이벤트
	$(".deleteCheckBtn").click(function() {
			//딜리트 체크박스 체크여부확인
		var deleteCheck = document.getElementsByClassName('deleteCheck');
			//아무것도 체크되어있지않을때
			if($(deleteCheck).is(":checked")==false){
				alert("체크하셔야합니다");
				return;
			}
			var message = confirm("정말로 삭제 하시겠습니까?");
			//메세지띄운후 확인버튼눌렀을때 true 아닐때 false
			if(message == true){	
				 var checkedValue = null; 
				 var inputElements = document.getElementsByClassName('deleteCheck'); 
				
				 for(var i=0; i < $(".trSize").size(); ++i){ 
					 if(inputElements[i].checked){
						 var mg_num =$(".mg_num:eq("+i+")").val();
						 console.log("엠쥐언더바넘:"+mg_num);
						 $(".deleteCheckVal:eq("+i+")").val(mg_num);
						 //찜리스트 삭제
						 if($(".listType").val()=="Whish"){
							 console.log("찜삭제발동");
							 $(".checkForm:eq("+i+")").attr({
									"method":"post",
									"action":"/client/member/deleteWhish.do"
								});
							 $(".checkForm:eq("+i+")").submit();
						//장바구니 삭제
						 }else if($(".listType").val()=="Cart"){
							 console.log("장바구니삭제발동");
							 $(".checkForm:eq("+i+")").attr({
									"method":"post",
									"action":"/client/member/deleteCart.do"
						      });
							$(".checkForm:eq("+i+")").submit();
						 }
						 /*alert("You Picked Sound");*/						 
					 }else{
						 /*alert("none");*/
					 }
				 }				 
				//alert("삭제되었습니다");
			/*location.href="/client/member/logout.do";*/
			}else{
			$("input[class=deleteCheck]").prop("checked",false);	
			alert("취소되었습니다");
			return false;
			}		 
	});
	
	/*var allCheck = document.getElementsByClassName('deleteCheck'); */
	/*$(allCheck).ready(function() {*/
		//all체크 클릭이벤트
		$(".allCheck").click(function() {		
			var deleteCheck = document.getElementsByClassName('deleteCheck');
			//아무것도 체크되어있지않을때
			if($(deleteCheck).is(":checked")==false){		
				$("input[class=deleteCheck]").prop("checked",true);
			}else{
				$("input[class=deleteCheck]").prop("checked",false);
			} 
		});
		//구매버튼 클릭시
		$(".sell").click(function() {
			if($(".listType").val()=="Whish"){
				
				location.href="/client/member/sellWhish.do";
			}else if($(".listType").val()=="Cart"){
				location.href="/client/member/sellCart.do";
			}		
		});
	/*});*/
	
	
	
	
	
	
	
});
/*function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}*/
/***********************************
 * 받아온 숫자를 콤마가들어가있는 형태로 변환시키는 메서드
 * len : num 문자열의 길이
 * point : num의 길이를 3등분한 나머지
 * *********************************
 * @param num : 변환할 숫자
 * @returns str : 변환한 값을 담은 변수 
 ***********************************/
function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point).trim();
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}

/**********************************************
 * *아래에 comma()메소드를 통해 변환되어 반환되는 형태를 필요한 값에넣음 
 * *********************************************
 * @param val 검사할변수(숫자형태) 문자인숫자도상관없음
 * **//*
function inputNumberFormat(input) {
	console.log("inputNumberFormat실행"+input);
	input = comma(uncomma(input));
} 
*//**********************************************
 * *아래에 uncomma()메소드를 통해 검사한 문자열을 변환
 * *********************************************
 * @param str
 * @returns 변환
 * **//*
function comma(str) { 
	console.log("comma실행"+str);
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 
*//***********************************
 * 받아온 숫자를 문자열로변환해서 정규식검사
 * 상단에있는 inputNumberFormat()메소드에서 사용
 * *********************************
 * @param str
 * @returns 정규식검사
 ***********************************//*
function uncomma(str) {
	console.log("uncomma실행"+str);
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}*/

