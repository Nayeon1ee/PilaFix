<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "tT5efP_w58d8uG3tUgjl", // 본인걸로 수정, 띄어쓰기 금지.
        callbackUrl: "http://localhost:8080/pilafix/saveNaverLogin.do", // 아무거나 설정
        // 로그인시 팝업 띄울건지
        isPopup: false,
        callbackHandle: true
    });
    naverLogin.init();
 
    window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {
 
    if (status) {
        /* console.log(naverLogin.user); */
        var birthyear = naverLogin.user.getbirthyear();
        var mobile = naverLogin.user.getmobile();
        var birthday = naverLogin.user.getBirthday();
        var email = naverLogin.user.getEmail();
        var gender = naverLogin.user.getGender();
        var id = naverLogin.user.getId();
        var name = naverLogin.user.getName();
 
        $.ajax({
            type: 'post',
            url: 'saveNaverLogin.do',
            data: {'n_birthyear':birthyear, 'n_birthday':birthday, 'n_email':email, 'n_gender':gender, 'n_id':id, 'n_name':name, 'n_mobile':mobile},
            dataType: 'text',
            success: function(result) {
                if(result=='ok') {
                    console.log('성공')
                   // location.replace("http://localhost:8070/spring/home.do") 
                } else if(result=='no') {
                    console.log('실패')
                    //location.replace("http://localhost:8070/spring/home1.do")
                }
            },
            error: function(result) {
                console.log('오류 발생')
            }
        })
 
    } else {
        console.log("callback 처리에 실패하였습니다.");
    }
    });
});
</script>
</body>
</html>