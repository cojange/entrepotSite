function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + addZeros(currentDate.getMonth()+1,2) + "-" + addZeros(currentDate.getDate(),2); // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    var day = currentDate.getDay();
    var today;
    
    switch(day){
    case 0:
    	today = "SUN";
    	break;
    case 1:
    	today = "MON";
    	break;
    case 2:
    	today = "TUE";
    	break;
    case 3:
    	today = "WED";
    	break;
    case 4:
    	today = "THU";
    	break;
    case 5:
    	today = "FRI";
    	break;
    case 6:
    	today = "SAT";
    	break;
    }
    	
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    /*if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }*/
    clock.innerHTML = calendar+"("+today+")"+"&nbsp;&nbsp;&nbsp;"+currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:15px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

//sysdate용 (연도 2개짜리)
var today2;
function nowTime2(){
	today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yy = today.getFullYear().toString().substr(-2);
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	return today2 = yy+'-'+mm+'-'+dd;
}

//sysdate용 (연도 4개짜리)
var today1;
function nowTime1(){
	today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear()
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	return today1 = yyyy+'-'+mm+'-'+dd;
}