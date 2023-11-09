/**
 * 
 */

$(function() {
    //"idCheck" 버튼을 클릭했을 때 
    $("#idCheck").click(function(){
			console.log("idOverlap 호출")
			console.log("아이디 입력 값 : "+insertMember.csEmailId.value)
		$.ajax({
			type :"post",/* 전송 방식 */
			url :"idCheck.do", /* 컨트롤러 사용할 때. 내가 보낼 데이터의 주소. */
			data : {"csEmailId" : insertMember.csEmailId.value},
			/* JSON형식 안에 JSON 형식으로 표현한 데이터. 
            "파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능
			data :{	"id" : joinForm.id.value, 
			"id1" : joinForm.password.value}, 이렇게도 사용 가능.					
			*/
			dataType : "text",	
            //정상적인 통신을 했다면 function은 백엔드 단에서 데이터를 처리.
			success : function(data){	
				if(data=="1"){
					alert("이 아이디는 사용 가능합니다.");
				}else{	//ajax가 제대로 안됐을 때 .
					alert("이 아이디는 사용  불가능합니다.");
				}
			},
			error : function(){
				alert("아이디 중복 확인 ajax 실행 실패");
			}
		});
	   });
	});


