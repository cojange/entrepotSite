function addNewDatatable(column,target){
	
	//새테이블 태그생성
	var n_table = $("<table>");
	n_table.attr({
		"width" : "100%",
		"cellspacing" : "0"
	});
	n_table.addClass("table table-bordered switchTable");
	/*
	//thead 만들기
	var n_thead_elements = "<thead><tr>";
	
	for(var i=0;i<column;i++){
		n_thead_elements =+ "<th>" + column[i] + "</th>";
	}
	
	while(true){
		var i =0;
		n_thead_elements +="<th>" +column[i]+"</th>";
		i++;
		if(i==column.length){
			break;
		}
		console.log(column[i]);
	}
	
	n_thead_elements +="</tr></thead>";
	
	console.log(n_thead_elements);
	
	//tfoot 만들기
	var n_tfoot_elements = "<tfoot><tr>";
	
	for(var i=0;i<column; i++){
		n_tfoot_elements =+ "<th>" + column[i] +"</th>";
	}
	
	n_tfoot_elements += "</tr></tfoot>";
	
	n_table.html(n_thead_elements+n_tfoot_elements);
	
	target.html(n_table);
	
	console.log(target.html());*/
	
	
	
	//thead 추가
	var n_thead = $("<thead>");
	//tr추가
	var n_tr1 = $("<tr>");
	var n_tr2 = $("<tr>");
	var n_tfoot = $("<tfoot>");
	
	/*n_thead.append(n_tr);
	n_tfoot.append(n_tr);
	
	for(var i=0;i<column.length;i++){
		console.log(column[i]);
		n_th.html(column[i]);
		n_thead.append(n_th);
		n_tfoot.append(n_th);
	};*/

	var col1= $("<th>");
	col1.html(column[0]);
	var col2=$("<th>");
	col2.html(column[1]);
	var col3=$("<th>");
	col3.html(column[2]);
	var col4=$("<th>");
	col4.html(column[3]);
	var col5=$("<th>");
	col5.html(column[4]);
	var col6=$("<th>");
	col6.html(column[5]);
	var col7=$("<th>");
	col7.html(column[6]);
	var col8=$("<th>");
	col8.html(column[7]);
	
	n_tr1.append(col1).append(col2).append(col3).append(col4).append(col5).append(col6).append(col7).append(col8);
	n_thead.append(n_tr1);
	
	var coll1= $("<th>");
	coll1.html(column[0]);
	var coll2=$("<th>");
	coll2.html(column[1]);
	var coll3=$("<th>");
	coll3.html(column[2]);
	var coll4=$("<th>");
	coll4.html(column[3]);
	var coll5=$("<th>");
	coll5.html(column[4]);
	var coll6=$("<th>");
	coll6.html(column[5]);
	var coll7=$("<th>");
	coll7.html(column[6]);
	var coll8=$("<th>");
	coll8.html(column[7]);
	
	n_tr2.append(coll1).append(coll2).append(coll3).append(coll4).append(coll5).append(coll6).append(coll7).append(coll8);
	n_tfoot.append(n_tr2);
	
	n_table.append(n_thead).append(n_tfoot);
	target.append(n_table);
	
	console.log(target.html());
}