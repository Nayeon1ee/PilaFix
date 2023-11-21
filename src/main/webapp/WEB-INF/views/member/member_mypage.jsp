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
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_memberpage.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-qzj+YDlIk69ua5vUHwOs5J8HKAO1f7f1Z48fqA+0EdA+7W6f9X+MPeJ6XWN4KZET"
	crossorigin="anonymous">

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

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>mypage</li>
				</ol>
				<h2>마이페이지</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services py-4">
			<div class="container" style="max-width: 1000px">


				<div id="myPage" class="text-center">

					<div id="userInfo"
					class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>

					<section
						class="my-passes container mt-5 d-flex justify-content-center"
						style="max-width: 700px;">
						<div class="text-center">
							<h3>나의 수강권 현황</h3>
							<div class="pass-box row">
								<div
									class="individual-pass col-lg-6 col-md-8 d-flex align-items-stretch mt-4 mt-md-2">
									<div class="icon-box mx-auto">
										<div class="icon">
											<i class="bx bx-file"></i>
										</div>
										<p>[지점이름] 개인수강권</p>
										<p>기간: 2023.10.17~2023.12.08</p>
										<p>수강권내역: 사용중</p>
										<p>잔여일수: 126일 남음 / 총 150일</p>
										<p>잔여횟수: 34회 남음 / 총 60회</p>
										<p>사용가능지점: 1지점</p>
									</div>
								</div>

								<div
									class="individual-pass col-lg-6 col-md-8 d-flex align-items-stretch mt-4 mt-md-2">
									<div class="icon-box mx-auto">
										<div class="icon">
											<i class="bx bx-file"></i>
										</div>
										<p>[지점이름] 그룹수강권</p>
										<p>기간: 2023.10.17~2023.12.08</p>
										<p>수강권내역: 사용중</p>
										<p>잔여일수: 126일 남음 / 총 150일</p>
										<p>잔여횟수: 34회 남음 / 총 60회</p>
										<p>사용가능지점: 1지점</p>
									</div>
								</div>
							</div>
						</div>
					</section>


					<section class="icon-list text-center py-3 mx-auto"
						style="max-width: 700px;">
						<div class="icon-grid">
							<div class="icon-row row">
								<div class="icon-item col-md-4">
									<a href="member_notice.do"> <i class="bi bi-megaphone"></i>
										<p>공지사항</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="paymentHistory.do"> <i class="bi bi-cash-coin"></i>
										<p>결제내역</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="center_linkmanagement.do"> <i class="bi bi-gear"></i>
										<p>연동센터관리</p>
									</a>
								</div>
							</div>
							<div class="icon-row row">
								<div class="icon-item col-md-4">
									<a href="FAQ.do"> <i class="bi bi-question"></i>
										<p>FAQ</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="inquiry.do"> <i class="bi bi-chat"></i>
										<p>문의사항</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="member_terms.do"> <i class="bi bi-file-earmark-text"></i>
										<p>약관 및 정책</p>
									</a>
								</div>
							</div>
						</div>
					</section>



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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

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