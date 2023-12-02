<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_withdraw.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<title>회원탈퇴</title>
</head>

<body>


	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main>
				<div id="myPage">
					<div class="withdraw-container">
						<p>탈퇴하시려면 비밀번호를 입력하세요.</p>

						<div class="input-container">
							<label for="password">비밀번호 :</label> 
							<input type="password" id="password" name=>
						</div>
						<button class="withdraw-button">탈퇴하기</button>
						<p class="error-message" id="error-message"></p>
					</div>

					<script>
						document
								.querySelector('.withdraw-button')
								.addEventListener(
										'click',
										function() {
											var passwordInput = document
													.getElementById('password');

											// 비밀번호 검사 (일단 비밀번호 password1)
											if (passwordInput.value !== "password1") {
												alert("올바른 비밀번호가 아닙니다.");
											} else {
												var confirmation = confirm("김영우 회원님, 정말로 탈퇴하시겠습니까?");
												if (confirmation) {
													// 탈퇴 로직 추가
													alert("탈퇴가 완료되었습니다.");
												}
											}
										});
					</script>
					
					
			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>



</body>
</html>