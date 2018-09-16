  function pbReply (subElements) {
	var ret = "";
	if(subElements.length<=0){
		return ret;
	}
	
	nowTime2()
	
	var column = ['게시글번호','번호','내용','아이디','등록일'];
		ret = "<table cellpadding='5' cellspacing='0' border='0'><tr>";
		//컬럼 생성하기
		var clist="";
		clist +='<td style="display:none">'+column[0]+'</td>';
		for (var i=1; i< column.length; i++){
			clist +='<td>'+column[i]+'</td>';
		}
		clist+="</tr>"
		ret+=clist;
		
		//데이터 주입
		var dlist="";
		for(var i=0; i<subElements.length; i++){
			dlist+="<tr><td class='pbReply' style='display:none;'>" + subElements[i].pb_no +"</td><td>" + (i+1) +"</td><td>"+subElements[i].pbre_content+"</td><td>"+subElements[i].writer+"</td><td>"+subElements[i].pbre_date+"</td></tr>";
		}
		dlist+='<tr><td>-</td><td><textarea rows="2" cols="50" class="pbre_content" name="pbre_content"></textarea></td>';
		dlist+='<td><input type="text" class="writer" name="writer"></td>';
		dlist+='<td>'+today2+'</td>';
		dlist+='</tr></table><input type="button" id="savePbReply" value="등록">';
		
		ret += dlist;
		return ret;
  };