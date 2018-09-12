$(function() {
	var sum = 0;//정기구독가*권수
	var total = 0;//(정기구독가*권수)*주문종류
	var totalAll = 0;//(정기구독가*권수*잡지발행달/잡지발행일수)*주문종류
	var sumEa=0;//총권수
	var sumNum=0;//합계를계산할변수
	var sumallNum=0;//총합계를계산할변수
	//var arr=[];
	var moneyList=[];
	for (var i = 0; i < $(".tableSize").size(); i++) {
		console.log("tableSize : " + $(".tableSize").size());
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
		pd_cost=$("#pd_cost").val();
		pd_costInt=parseInt(pd_cost);	
		sumall = sum*pd_costInt;
		moneyList[i] = sum;
		console.log("sum : " + sum);
		console.log("moneyList : "+ moneyList);
		money = comma(money);
		$(".money:eq("+i+")").val(money+"원");
		$(".sumNum:eq("+i+")").val(sum);	
		$(".sumAllNum:eq("+i+")").val(sumall);
		
		
		sum = comma(sum);
		sumall = comma(sumall);
		$(".sum:eq("+i+")").val(sum+"원");
		$(".sumAll:eq("+i+")").val(sumall+"원");
		//합계의합계	
		sumNumIndex=$(".sumNum:eq("+i+")").val();
		sumNum = parseInt(sumNumIndex);
		sumallNumIndex=$(".sumAllNum:eq("+i+")").val();
		sumallNum=parseInt(sumallNumIndex);
		total=Math.ceil((total+sumNum)*(1-($("#coupon_no").find("option:selected").attr("data-discount")*0.01)));
		totalAll=Math.ceil((totalAll+sumallNum)*(1-($("#coupon_no").find("option:selected").attr("data-discount")*0.01)));
		
		console.log("total : "+ total);
		//갯수의합계
		sumEa=sumEa+ea;
		console.log("sumEa : "+ sumEa);
	}
	$("#sumEa").val(sumEa+"권");
	$("#sell_ea").val(sumEa);//총수량 (post로받을값)
	$("#sell_money").val(totalAll);//총금액 (post로받을값)
	total = comma(total);
	totalAll = comma(totalAll);
	$("#total").val(total+"원"); 
	$("#totalAll").val(totalAll+"원");
	//결제버튼 클릭시
	$("#paymentBtn").click(function() {
		console.log("ㅇ?");
		if(!formCheck($("#bank_name"),$(".error:eq(0)"),"입금자명을"))return;
		else if(!inputVerify(9,"#bank_name",".error:eq(0)","","member"))return;
		else if(!formCheck($("#bank"),$(".error:eq(1)"),"입금은행을"))return;
		else if(!inputVerify(9,"#bank",".error:eq(1)","","member"))return;
		else{
			var message = confirm("결제를 진행 하시겠습니까?");
			if(message == true){
				for (var i = 0; i < $(".tableSize").size(); i++) {
					$("input[name='order_moneyList']").val(moneyList[i]);
				}
				$("#paymentForm").attr({
					"method":"post",
					"action":"/client/member/payment.do"
			});
			 $("#paymentForm").submit();
			}
			return false;
		}	
	});
	//결제취소시
	$("#cancelBtn").click(function() {
		var message = confirm("결제를 취소 하시겠습니까?");
		if(message == true){
			location.href="/client/member/myPageWhish.do";
		}
	});
});