function json2html () {
   var table, ul;
   // json render to table
  function table (json) {
	var ret = "";
	if(json.length<=0){
		return ret;
	}
	ret = "<table><thead><tr>";
	for (var k in json[0]) {
		ret = ret +'<th>' + k + '</th>';
	}
	ret = ret + '</thead></tr><tbody>';
	for (var i = 0, L = json.length; i < L; i++) {
		ret = ret + '<tr>';
		for (var k in json[i]){
			ret = ret + '<td>' + (json[i][k] === null ? "&nbsp;" : json[i][k]) + '</td>';
		}
		ret = ret +'</tr>';
	}
	return ret +'</tbody></table>';
  };
   // json render to ul
 function ul (json) {
	var ret = "";
	if(json.length<=0)
		return ret;
	ret = "<ul>";
	for (var i = 0, L = json.length; i < L; i++) {
		for (var k in json[i]) {
				ret = ret + '<li>' + (json[i][k] === null ? "&nbsp;" : json[i][k]) + '</li>';
				break;
		}
	}
	return ret +'</ul>'
  };
//  JSON2HTML = {table : table,ul : ul };
  
};