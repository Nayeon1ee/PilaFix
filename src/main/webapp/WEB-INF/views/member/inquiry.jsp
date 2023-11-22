<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_manager_inquiry.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css">


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
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>inquiry</li>
				</ol>
				<h2>문의사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">



				<div id="userInfo"
					class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>

					<div class="inquiry">
						<div class="inquiry-header mb-3">
							<button class="inquiry-button my-2" style="font-size: 18px;">센터문의하기</button>

						</div>

						<div class="inquiry-history">
							<h2>나의 문의 내역</h2>
							<hr>

							<div class="accordion mt-4" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">페이지를 탈퇴하고 싶습니다.</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>답변완료</p>
												</div>

											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> 페이지를 탈퇴하고 싶습니다.
										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> 아래 안내된 경로를 통해 서비스를 탈퇴할 수
											있습니다. 단, 7일 안에 동일한 카카오계정으로 카카오페이지 서비스에 재가입 할 수 없으며, 탈퇴시 구매한
											모든 콘텐츠에 대한 권리를 잃게 되므로 유의하시기 바랍니다. <br>- 앱 메인 홈> 우상단 메뉴>
											닉네임> 서비스 탈퇴
										</div>
									</div>

								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">알림은 어떻게 해제할 수 있나요?</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>답변완료</p>
												</div>

											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> 차단한 댓글을 다시 보고싶어요.

										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> 검토중
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">알림은 어떻게 해제할 수 있나요?</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>검토중</p>
												</div>
											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> 알림은 어떻게 해제할 수 있나요?
										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> 아래 안내된 경로의 화면에서 알림 설정을 변경할 수
											있습니다. - ​앱 메인 홈> 우상단 메뉴> 설정> 알람 설정
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- End Our Skills Section -->
				</div>
		</section>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script
		src="${pageContext.request.contextPath}/resources/js/quiry_inquiry.js"></script>
	<script
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