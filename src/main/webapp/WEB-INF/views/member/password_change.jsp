<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_passwordchange.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>비밀번호변경</title>
</head>
<body>

	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main>
				<div id="myPage">
					<h3>
						<a href="memberPage.jsp">마이페이지</a> > 내정보관리 > 비밀번호변경
					</h3>
					
<form id="passwordChangeForm" action="updatePassword.do" method="post" onsubmit="return checkNewPasswordMatch();">

					<div class="password-change-container">
					<div class="input-container">
						<label for="current-password">현재 비밀번호:</label>
						<div class="password-input">
							<input type="password" name="currentPassword" id="current-password" placeholder="현재 비밀번호를 입력하세요">
							<button type="button" onclick="checkCurrentPasswordMatch()">확인</button>
						</div>
						<div id="current-password-match-message" class="password-match-message"></div>
					</div>
					
					
					<hr class="line">
				    <div class="input-container">
				        <label for="new-password">새 비밀번호:</label> 
				        <input type="password" name="newPassword" id="new-password" required placeholder="새 비밀번호를 입력하세요">
				    </div>
				    <hr class="line">
				    <div class="input-container">
				        <label for="confirm-password">새 비밀번호 확인:</label>
				        <div class="password-input">
				        	<input type="password" id="confirm-password" required placeholder="새 비밀번호를 다시 입력해주세요">
				        	<button type="button" onclick="checkNewPasswordMatch()">확인</button>
				        </div>
				        <div id="confirm-password-match-message" class="password-match-message"></div>
				    </div>
				    <hr class="line">
					
					
				    <!-- 비밀번호 변경 버튼 -->
				    <div class="change-password-button">
				        <button type="submit" class="btn btn-primary">비밀번호 변경</button>
				    </div>
					</div>
    </form>
    </div>
</main>

			<area2>
			<p>area2</p>
			</area2>
		
		
		</section>

	</div>
	
	<!-- 
	<script>
	
	//현재 비밀번호랑 입력받은 비밀번호 비교
	function checkCurrentPasswordMatch() {
	    var currentPasswordInput = document.getElementById('current-password');
	    var passwordMatchMessage = document.getElementById('current-password-match-message');
	    var currentPassword = currentPasswordInput.value;

	    // AJAX 요청을 준비합니다.
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "verifyCurrentPassword.do", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                var response = JSON.parse(xhr.responseText);
	                if (response.passwordMatch) {
	                    passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
	                    passwordMatchMessage.style.color = "green";
	                } else {
	                    passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
	                    passwordMatchMessage.style.color = "red";
	                }
	            } else {
	                passwordMatchMessage.textContent = "비밀번호 검증에 실패했습니다.";
	                passwordMatchMessage.style.color = "red";
	            }
	        }
	    };
	    var data = "currentPassword=" + encodeURIComponent(currentPassword);
	    xhr.send(data);
	}
	
	
	// 새 비밀번호 체크
	function checkNewPasswordMatch() {
	    var newPasswordInput = document.getElementById('new-password');
	    var confirmPasswordInput = document.getElementById('confirm-password');
	    var passwordMatchMessage = document.getElementById('confirm-password-match-message');

	    var newPassword = newPasswordInput.value;
	    var confirmPassword = confirmPasswordInput.value;

	    if (newPassword === confirmPassword) {
	        passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
	        passwordMatchMessage.style.color = "green";
	        return true; // 폼 제출 계속
	    } else {
	        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
	        passwordMatchMessage.style.color = "red";
	        return false; // 폼 제출 중단
	    }
	}
	</script>
	 -->
	 
	 
	 
	</body>
	</html>