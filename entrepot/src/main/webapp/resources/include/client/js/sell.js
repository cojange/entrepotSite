$(function() {
	var sum = 0;
	var total = 0;
	var sumEa=0;
	var sumNum=0;
	var arr=[];
	for (var i = 0; i <= $(".tableSize").size(); i++) {
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
		console.log("sum : " + sum);
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
		//갯수의합계
		sumEa=sumEa+ea;
		console.log("sumEa : "+ sumEa);
	}
	$("#sumEa").val(sumEa+"권");
	total = comma(total);
	$("#total").val(total+"원");
});