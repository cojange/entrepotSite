$(function() {
	var sum = 0;
	
	for (var i = 0; i < 4; i++) {
		$(".index:eq("+i+")").val(i+1);
		eaIndex=$(".ea:eq("+i+")").val();
		moneyIndex=$(".money:eq("+i+")").val();
		ea = parseInt(eaIndex);
		money = parseInt(moneyIndex);
		//console.log(ea);
		//console.log(money);
		sum = money*ea;
		$(".sum:eq("+i+")").val(sum+"원");
	}
	
	$(".eaUpdate").click(function() {
		var thisEa = $(this).parents(".eaTd").find(".ea").val();
		console.log("수정할 개수"+thisEa);
		$(this).parents(".eaTd").find(".ea").val(thisEa);
		
	});
	
});