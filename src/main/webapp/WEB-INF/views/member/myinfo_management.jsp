<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<!-- 내 css -->
<link href="${pageContext.request.contextPath}/resources/css/style_myinfo.css" rel="stylesheet">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">

<body>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->
	<main>

		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>manage my information</li>
				</ol>
				<h2>내 정보 관리</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 700px">


				<div id="myPage">
					<div id="userInfo"
						class="d-flex align-items-center justify-content-center mb-2">
						<div id="myInfoLink" class="mr-2"
							style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
							<i class="fas fa-cog mr-1"></i>내 정보 관리
						</div>
						<div class="col-10"></div>
			
					</div>

					<section class="info-box my-3">
						<div class="info-box04">
							<p>이름 : ${myInfo.csName}</p>
						</div>
						<div class="info-box04">
							<p>Email : ${myInfo.csEmailId}</p>
						</div>
						<div class="info-box04">
							<p>성별 : ${myInfo.csGenderMw }</p>
						</div>
						<div class="info-box04">
							<p>휴대폰번호 :
								${myInfo.csPhoneNumber1}-${myInfo.csPhoneNumber2}-${myInfo.csPhoneNumber3}</p>
						</div>

						<div class="info-box04">
							<a href="#" class="password_Change"
								onclick="showCurrentPasswordModal()">비밀번호변경</a>

						</div>

					</section>

					<div class="info-box03 d-flex justify-content-end me-3">
						<a class="btn btn-danger withdraw-button" href="withdrawal.do">회원탈퇴</a>
					</div>


					<!-- End Our Skills Section -->

				</div>

				<!-- 첫 번째 모달: 현재 비밀번호 확인 -->
				<div class="modal fade" id="currentPasswordModal" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="currentPasswordModalLabel">현재
									비밀번호 확인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<input type="password" class="form-control" id="currentPassword"
									name="currentPassword" placeholder="현재 비밀번호">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary"
									onclick="sendCurrentPassword()">다음</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 두 번째 모달: 새 비밀번호 설정 -->
				<div class="modal fade" id="newPasswordModal" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="newPasswordModalLabel">새 비밀번호
									설정</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<input type="password" class="form-control" id="newPassword"
									name="newPassword" placeholder="새 비밀번호"> <input
									type="password" class="form-control" id="confirmPassword"
									name="confirmPassword" placeholder="새 비밀번호 확인">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success"
									onclick="updatePassword()">변경</button>

							</div>
						</div>
					</div>
				</div>



			</div>
		</section>




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