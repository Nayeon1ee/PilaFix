<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

</head>
<!-- 내 css -->




<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">contact@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						5589 55488 55</span></i>
			</div>
			<div class="social-links d-none d-md-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->



		<section class="info-box">
			<div class="info-box04">
				<p>이름 : ${memberInfo.csName}</p>
			</div>
			<div class="info-box04">
				<p>Email : ${memberInfo.csEmailId}</p>
			</div>
			<div class="info-box04">
				<p>성별 : ${memberInfo.csGenderMw }</p>
			</div>
			<div class="info-box04">
				<p>휴대폰번호 : ${memberInfo.csPhoneNumber1 }-${memberInfo.csPhoneNumber2 }-${memberInfo.csPhoneNumber3 }</p>
			</div>
			<div class="info-box04">
				<p>
					<!-- <a class="password_Change" href="checkCurrentPassword.do">비밀번호변경▶</a> -->
					<a href="#" class="password_Change" onclick="showCurrentPasswordModal()">비밀번호변경▶</a>
					<form action="logout.do" method="post">
						<button type="submit">로그아웃</button>
					</form>	
				</p>
			</div>
		</section>

		<div class="info-box04" style="text-align: center;">
			<a class="withdraw_button" href="withdraw.jsp">회원탈퇴</a>
		</div>

		<!-- 첫 번째 모달: 현재 비밀번호 확인 -->
		<div class="modal fade" id="currentPasswordModal" tabindex="-1"
			role="dialog" aria-labelledby="currentPasswordModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="currentPasswordModalLabel">현재
							비밀번호 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<input type="password" class="form-control" id="currentPassword"
							name="currentPassword" placeholder="현재 비밀번호">
						<button type="submit" class="btn btn-primary"
							onclick="sendCurrentPassword()">다음</button>

					</div>

					
					<div class="info-box04" style="text-align: center;">
						<a class="withdraw_button" href="ticketPage.do">수강권구매</a>
					</div>
					
			</main>

				</div>
			</div>
		</div>


		<!-- 두 번째 모달: 새 비밀번호 설정 -->
		<div class="modal fade" id="newPasswordModal" tabindex="-1"
			role="dialog" aria-labelledby="newPasswordModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="newPasswordModalLabel">새 비밀번호 설정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<input type="password" class="form-control" id="newPassword"
							name="newPassword" placeholder="새 비밀번호"> <input
							type="password" class="form-control" id="confirmPassword"
							name="confirmPassword" placeholder="새 비밀번호 확인">
						<button type="submit" class="btn btn-success"
							onclick="updatePassword()">변경</button>

					</div>
				</div>
			</div>
		</div>


</main>
		<script>
			function showCurrentPasswordModal() {
				$('#currentPasswordModal').modal('show');
			}

			function sendCurrentPassword() {
				var currentPassword = $('#currentPassword').val();
				// AJAX 요청을 통해 현재 비밀번호 확인
				$.ajax({
					url : 'checkPassword.do',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify({
						currentPassword : currentPassword
					}),
					success : function(response) {
						// 비밀번호가 일치하면 다음 모달을 표시
						$('#currentPasswordModal').modal('hide');
						$('#newPasswordModal').modal('show');
					},
					error : function(xhr, status, error) {
						// 오류 메시지 표시
						alert("현재 비밀번호가 일치하지 않습니다.");
					}
				});
			}

			function updatePassword() {
				// 새 비밀번호를 서버에 전송하여 업데이트
				var newPassword = $('#newPassword').val();
				var confirmPassword = $('#confirmPassword').val();

				if (newPassword !== confirmPassword) {
					alert("새 비밀번호가 일치하지 않습니다.");
					return;
				}

				// AJAX 요청을 통해 비밀번호 변경
				$.ajax({
					url : 'updatePassword.do',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify({
						newPassword : newPassword
					}),
					success : function(response) {
						// 비밀번호 변경 성공 메시지 표시
						alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
						$('#newPasswordModal').modal('hide');
						window.location.href = 'memberLogin.do';
					},
					error : function(xhr, status, error) {
						// 오류 메시지 표시
						alert("비밀번호 변경에 실패했습니다.");
					}
				});
			}
		</script>


	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	
	
	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>