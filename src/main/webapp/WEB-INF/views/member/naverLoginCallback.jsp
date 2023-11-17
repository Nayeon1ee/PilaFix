<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>네이버 로그인 콜백</title>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<!--  
<script type="text/javascript">
    var naver_id_login = new naver_id_login("glOsBPVhLHxSw_eaBO2D", "http://localhost:8080/pilafix/naver/callback.do");
    // 접근 토큰 값 출력
    alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 네이버 개발가이드를 참고하시기 바랍니다.
		alert("핸드폰번호: "+ naver_id_login.getProfileData('mobile'));
		alert("출생년도: "+ naver_id_login.getProfileData('birthyear'));
		//alert("이메일: "+ naver_id_login.getProfileData('email'));
		//alert("아이디 : "+ naver_id_login.getProfileData('id'));
		//alert("성별 :"+ naver_id_login.getProfileData('gender'));
		//alert("이름: "+ naver_id_login.getProfileData('name'));
		//alert("생일: "+ naver_id_login.getProfileData('birthday'));
		
    	var profileData = {
                email: naver_id_login.getProfileData('email'),
                id: naver_id_login.getProfileData('id'),
                birthday: naver_id_login.getProfileData('birthday'),
                gender: naver_id_login.getProfileData('gender'),
                name: naver_id_login.getProfileData('name'),
                birthyear: naver_id_login.getProfileData('birthyear'),
                mobile: naver_id_login.getProfileData('mobile')
            };
    	 $.ajax({
             type: 'POST',
             url: 'naverLogin.do', // Replace with your actual controller endpoint
             contentType: 'application/json',
             data: JSON.stringify(profileData),
             success: function(response) {
                 console.log('Profile data sent to server successfully:', response);
             },
             error: function(error) {
                 console.error('Error sending profile data to server:', error);
             }
         });

    }

</script>
 --> 
 
<script>
var naverLogin = new naver.LoginWithNaverId({
	clientId: "glOsBPVhLHxSw_eaBO2D", // 본인걸로 수정, 띄어쓰기 금지.
	callbackUrl: "http://localhost:8080/pilafix/callback.do", // 아무거나 설정
	isPopup: false,
	callbackHandle: true
});
naverLogin.init();

window.addEventListener('load', function () {
naverLogin.getLoginStatus(function (status) {

if (status) {
	/* console.log(naverLogin.user); */
	var birthyear = naverLogin.user.getBirthyear();
	var birthday = naverLogin.user.getBirthday();
	var email = naverLogin.user.getEmail();
	var gender = naverLogin.user.getGender();
	var name = naverLogin.user.getName();
	var mobile = naverLogin.user.getMobile();
	
	var profileData = {
			birthyear: birthyear,
		    birthday: birthday,
		    email: email,
		    gender: gender,
		    name: name,
		    mobile: mobile
	};

	$.ajax({
        type: 'POST',
        url: 'naverLogin.do', // Replace with your actual controller endpoint
        contentType: 'application/json',
        data: JSON.stringify(profileData),
        success: function(response) {
            console.log('Profile data sent to server successfully:', response);
        },
        error: function(error) {
            console.error('Error sending profile data to server:', error);
        }
    });

} else {
	console.log("callback 처리에 실패하였습니다.");
}
});
});
</script>

</body>
</html>