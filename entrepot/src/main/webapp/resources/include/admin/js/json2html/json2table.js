
function json2Table(jsonElements, columns, tClass,trClass,tableId){
	
	var ret = "";
	if(jsonElements.length<=0){
		return ret;
	}
	var tid =""
	if(tableId != ""){
		tid="id='"+tableId+"'";
	}
	
	ret = "<table class='table "+tClass+"' "+tid+"><thead><tr>";
	var clist = "";
	for(var i=0; i<columns.length;i++){
		clist+="<th>"+columns[i]+"</th>";
	}
	clist+="</tr>";
	ret+=clist+"</thead><tbody>";
	var dlist="";
	for(var i=0; i<jsonElements.length;i++){
		dlist+="<tr class='"+trClass+"'>";
		if(columns[0]=='check'){
			dlist+="<td><input type='checkbox' class='chkbox'></td>";
		}
			$.each(jsonElements[i],function(k,v){
				dlist+="<td>"+v+"</td>";
			})
		dlist+="</tr>";
	}
	ret+=dlist+"</tbody></table>";
	return ret;
	
}