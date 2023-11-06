//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        //userid 를 param.
        var ctId =  $("#ctId").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : ctId,
            url : "ctIdCheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    $("#ctId").focus();
                } else {
                    alert("사용가능한 아이디입니다.");
                    $("#ctPassword").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});