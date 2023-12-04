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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<!-- 내 css -->
<style>
.container {
	margin: auto;
	padding: 20px;
}

.form-label {
	display: block;
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 18px;
	color: #333;
}

.form-control {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: none;
	font-size: 16px;
}

.btn-primary {
	max-width: 180px;
	width: 100%;
	padding: 15px;
	font-size: 18px;
	border-radius: 5px;
	border: none;
	background-color: #9B67FF;
	color: white;
}

.btn-primary:hover {
	background-color: #8757E5;
}

.info-text {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 30px;
	font-size: 14px;
	color: #666;
}
</style>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/style_findpassword.css"
	rel="stylesheet">
</head>

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
	<main>
		<div class="container" style="max-width: 600px; margin-top: 50px;">
			<h2 class="text-center" style="margin-bottom: 30px;">비밀번호찾기</h2>
			<p class="text-center">가입 당시 입력한 이메일을 통해 본인 인증 후</p>
			<p class="text-center" style="margin-bottom: 30px;">비밀번호를 재설정하여
				주시기 바랍니다.</p>

			<form action="sendAuthNumber.do" method="post">
				<div class="mb-3">
					<label for="nameInput" class="form-label">이름</label> <input
						type="text" name="csName" class="form-control" id="nameInput"
						placeholder="이름을 입력하세요." required>
				</div>
				<div class="mb-3">
					<label for="emailInput" class="form-label">이메일</label> <input
						type="email" name="csEmailId" class="form-control" id="emailInput"
						placeholder="이메일을 입력하세요." required>
				</div>
				<div class="mb-3 text-center">
					<button type="submit" class="btn btn-primary mx-auto">인증
						요청</button>
				</div>
			</form>

			<form action="checkAuthNumber.do" method="post">
				<div class="mb-3">
					<label for="verificationInput" class="form-label">인증번호</label> <input
						type="text" class="form-control" name="authNumber"
						id="verificationInput" placeholder="인증번호 6자리를 입력하세요." required>
				</div>
				<p class="mb-2 text-center" style="margin-bottom: 30px;">인증이 확인된 후
					비밀번호를 변경해주세요.</p>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mx-auto"
						id="findPwCheckAuthNum-btn">확인</button>
						
						<button type="button" class="btn btn-primary ms-2" id="findPwNext-btn"
					class="password_Change" onclick="showNewPasswordModal()">비밀번호
					변경하기</button>
				</div>

			</form>

			


			<!-- 두 번째 모달: 새 비밀번호 설정 -->
			<div class="modal fade" id="newPasswordModal" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="newPasswordModalLabel">새 비밀번호 설정</h5>
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
	</main>

	<script>
		$(document).ready(function() {
			// 인증번호 요청 AJAX 처리
			$('form[action="sendAuthNumber.do"]').submit(function(e) {
				e.preventDefault(); // 폼 기본 제출 동작 중단
				var name = $('#nameInput').val();
				var email = $('#emailInput').val();
				$.ajax({
					url : 'sendAuthNumber.do',
					type : 'post',
					data : {
						csName : name,
						csEmailId : email
					},
					success : function(response) {
						alert('인증번호가 발송되었습니다.');
						// 페이지에 인증번호 발송 사실을 알리는 메시지 표시 가능
					},
					error : function(xhr, status, error) {
						alert('인증번호 발송에 실패했습니다.');
					}
				});
			});

			// 인증번호 확인 AJAX 처리
			$('#findPwCheckAuthNum-btn').click(function(e) {
				e.preventDefault();
				var authNumber = $('#verificationInput').val();
				var csEmailId = $('#emailInput').val(); // csEmailId 값을 입력 필드에서 가져옴

				$.ajax({
					url : 'checkAuthNumber.do',
					type : 'post',
					data : {
						authNumber : authNumber,
						csEmailId : csEmailId
					},
					success : function(data) {
						if (data.valid) {
							alert('인증에 성공했습니다.');
							isAuthSuccess = true; // 인증 성공 상태 변경
						} else {
							alert('인증번호가 올바르지 않습니다.');
						}
					},
					error : function() {
						alert('인증번호 확인에 실패했습니다.');
					}
				});
			});

			// '다음' 버튼 이벤트 핸들러
			$('#findPwNext-btn').click(function() {
				if (isAuthSuccess) {
					showNewPasswordModal(); // 모달 창을 표시하는 함수 호출
				} else {
					alert('먼저 인증을 완료해야 합니다.');
				}
			});

		});

		function showNewPasswordModal() {
			$('#newPasswordModal').modal('show'); // 모달 창 표시
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