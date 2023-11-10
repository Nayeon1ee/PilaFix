<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센터 연동 요청 화면</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<h1>센터 연동요청</h1>

<input type="text" id=searchKeyword name="searchKeyword" />
 <input type="button" id="searchCt" value="검색" />
 <br><br>
 <!--  검색 누르기 전까지는 이 화면이었다가 검색 누르면 바껴야함
	<c:if test="" >
		<p>이렇게 검색해보세요!</p>
		<p>센터명</p>
		<p>바디코디 필라테스</p><br>

		<p>센터 주소</p>
		<p>부산 부산진구 중앙대로 650</p><br>

		<p>센터명 + 센터주소</p>
		<p>바디코디 필라테스 부천점</p>
	</c:if>
	
-->
		<div id="insertCenterList"></div>
	<!--  
	//####################################################
	<table border="1">
	<tr>
		<td>척뿌 필라테스</td>
	</tr>
	<tr>
		<td>서울시 서초구 서초동 00빌딩 4층</td>
	</tr>
	<tr>
		<td><input type="button" value="연동 신청"></td>
	</tr>
</table>
//###################################################
-->
<script type="text/javascript">
$(function(){
    $("#searchCt").click(function(){
    
    	var searchKeyword = $('#searchKeyword').val();
        console.log(searchKeyword);
    	
        $.ajax({
            type:'get', //post 형식으로 controller 에 보내기위함!!
            url:"searchCt.do?searchKeyword="+searchKeyword, // 컨트롤러로 가는 mapping 입력
            //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
           // data: {"searchKeyword":searchKeyword}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                //console.log("리스트 잘 가져왔나 확인용"+data);
                var str = "";
                data.forEach(function(item){
					str='<table border="1">'
					str+='<tr>'
					str += "<td>"+item.ctName+"</td>";
					str+="</tr>"
					str +='<tr>'
					str+="<td>"+item.ctAddress+"</td>";
					str+="</tr>"
					str +='<tr>'
					str+='<td><input type="button" value="연동 신청"></td>';
					str+="</tr>"
					str+="</table>"
					str+="<br>"
					$('#insertCenterList').append(str);
        		})				 
         },
            error : function(error){alert(error);}
        });
        
    });
    
});
</script>
</body>
</html>