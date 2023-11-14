<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_passwordchange.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/script_passwordchange.js"></script>
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
					
<form action="/updatePassword.do" method="post">

					<div class="password-change-container">
					<div class="input-container">
						<label for="current-password">현재 비밀번호:</label>
						<div class="password-input">
							<input type="password" name="csPassword" id="current-password" placeholder="현재 비밀번호를 입력하세요">
							<button onclick="checkCurrentPasswordMatch()">확인</button>
						</div>
						<div id="current-password-match-message" class="password-match-message"></div>
					</div>
					
					<hr class="line">
					<div class="input-container">
						<label for="new-password">새 비밀번호:</label> 
						<input type="password" name="newPassword" id="new-password" placeholder="새 비밀번호를 입력하세요">
					</div>
					
					<hr class="line">
					<div class="input-container">
						<label for="confirm-password">새 비밀번호 확인:</label>
						<div class="password-input">
							<input type="password" id="confirm-password" placeholder="새 비밀번호를 다시 입력해주세요">
							<button onclick="checkNewPasswordMatch()">확인</button>
						</div>
						<div id="confirm-password-match-message" class="password-match-message"></div>
					</div>
					</div>


				
				<!-- 비밀번호 변경 버튼 -->
            <div class="change-password-button">
                <button type="submit" class="btn btn-primary">비밀번호 변경</button>
            </div>

    </form>
    </div>
</main>

			<area2>
			<p>area2</p>
			</area2>
		
		
		</section>

	</div>
	
	</body>
	</html>