<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">

<body style="margin-top: 10%; margin-left: 30%; margin-right: 30%;">



	<form action="memberLogin.do" method="post" >
	
	
	<div class="form-floating mb-3">
		<input type="email" class="form-control" name="csEmailId" id="floatingInput" placeholder="name@example.com"> 
		<label for="floatingInput">Email address</label>
	</div>
	<div class="form-floating">
		<input type="password" class="form-control" name="csPassword" id="floatingPassword" placeholder="Password"> 
		<label for="floatingPassword">Password</label>
	</div>
	
	
	<input type="submit" class="btn btn-primary" value="로그인" style="width: 100%; margin-top: 3%;">
	</form>
	
	
			
			
<div id="socialLogin" style="display: flex; justify-content: center;">
    <p style="margin-top: 20px; text-align: center;">소셜 계정으로 빠른 로그인하기</p>
</div>


<!-- 소설계정 로그인 아이콘영역 -->
<div id="socialButtons" style="display: flex; justify-content: center;">
    <div style="width: 100px; height: 100px; background:gray; display: inline-block; margin: 5px;"></div> <!-- 네이버 -->
    <div style="width: 100px; height: 100px; background:gray; display: inline-block; margin: 5px;"></div> <!-- 카카오 -->
    <div style="width: 100px; height: 100px; background:gray; display: inline-block; margin: 5px;"></div> <!-- 구글 -->
</div>
			

			
<div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
    <a href="findpassword.do" class="link-dark" style="text-decoration: none; margin-right: 10px;">
        비밀번호 찾기
    </a>
    <div class="vr" style="border-left: 2px solid; height: 20px;"></div>
    <a href="register.do" class="link-body-emphasis" style="text-decoration: none; margin-left: 10px;">
        회원가입
    </a>
</div>
	
	
	<!-- 로그인 실패 메시지 표시 -->
    <c:if test="${not empty message}">
        <!-- <div class="alert alert-danger" role="alert"> -->
            ${message}
        <!-- </div> -->
    </c:if>
    
    
    <script type="text/javascript">
    function validateLoginForm() {
        var email = document.getElementById('csEmailId').value;
        var password = document.getElementById('csPassword').value;
        if (!email || !password) {
            alert('아이디와 비밀번호를 모두 입력해주세요.');
            return false;
        }
        return true;
    }

    //로그인실패
    function loginFailed() {
        alert('아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.');
    }   
    function passwordCertification(){
    	let email = document.getElementById(elementId: '');   	
    }
    
    
    </script>
	
	
</body>
</html>