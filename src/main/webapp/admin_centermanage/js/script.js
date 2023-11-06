function idCheck(id){
	if(id == ""){
		document.insertCenter.ctId.focus();
	}else{
		url="idCheck.jsp?id=" + id;
		
		window.open(url,"post","width=300,height=150"); 
	}
}