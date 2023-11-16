<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Login</title>

</head>

<body>
	<!-- 사용자가 클릭할 수 있는 로그인 버튼을 구현
		 이 버튼을 클릭하면 카카오 로그인 프로세스가 시작	-->
    <button onclick="loginWithKakao()">카카오로 로그인</button>


	<!-- REST API키 를 가져와서 넣어줍니다 -->
	<a class="p-2" 
		href="https://kauth.kakao.com/oauth/authorize?client_id=35a67dedd55982379da441c8c23e2904&redirect_uri=http://localhost:8080/pilafix/kakaoLoginTest.do&response_type=code">
		카카오로로그인
	</a>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="//developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK 초기화
        Kakao.init('808b998b181e3330cbfc63d96825339e');
        
        // 로그인 함수
        function loginWithKakao() {
        	Kakao.Auth.login({
                success: function(authObj) {
                    // 서버로 토큰 전송 및 처리
                    console.log(authObj);
                },
                fail: function(err) {
                    alert(JSON.stringify(err));
                }
            });
        }
    </script>
</body>
</html>
