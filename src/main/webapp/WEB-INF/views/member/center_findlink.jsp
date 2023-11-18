<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Contact - PILAFIX Bootstrap Template</title>
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
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: PILAFIX
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/PILAFIX-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<!--  내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_centeraddress.css" />

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
			<div class="container">

				<ol>
					<li><a href="index.html">Home</a></li>
					<li>Contact</li>
				</ol>
				<h2>연동 센터 찾기</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">

				<div class="row">

					<div class="col-lg-6 ">
						<iframe class="mb-4 mb-lg-0"
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.4716320815546!2d126.977977!3d37.566308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9f35c221e244880!2z7ISc7Jq47Iug7ZaJ7Ja0!5e0!3m2!1sen!2skr!4v1636915423844!5m2!1sen!2skr"
							frameborder="0" style="border: 0; width: 100%; height: 384px;"
							allowfullscreen></iframe>
					</div>

					<div class="col-lg-6">
						<form action="forms/contact.php" method="post" role="form"
							class="php-email-form">
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="staticEmail" class="col-sm-4 col-form-label">연동
										센터 찾기</label>
								</div>
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<label for="basic-url" class="form-label">홍길동님, 원하는 센터를
										검색하세요!</label>
								</div>
							</div>
							<div class="form-group mt-3">
								<span class="input-group-text" id="basic-addon3">/</span><input
									type="text" class="form-control" id="basic-url"
									aria-describedby="basic-addon3 basic-addon4"
									placeholder="센터명, 주소를 입력">
							</div>
							<br> <br> <br>

							<div class="form-group mt-3">
								<div class="text-center" id="basic-addon4">이렇게 검색해 보세요!</div>
							</div>

							<div class="my-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div>
							<div class="text-center">
								<button type="submit">검색</button>
							</div>
						</form>
					</div>

				</div>


				<div class="row">
					<div class="col-lg-6">
						<div class="info-box mb-4">
							<i class="bx bx-map"></i>
							<h3>[종로점] 필라테스</h3>
							<p>(서울시 종로구 낙원동 xx빌딩 x층)</p>
							<br>
							<a href="#" class="btn btn-primary">연동신청</a>
						</div>
					</div>


					<div class="col-lg-6">
						<div class="info-box mb-4">
							<i class="bx bx-map"></i>
							<h3>[종로점] 필라테스</h3>
							<p>(서울시 종로구 낙원동 xx빌딩 x층)</p>
							<br>
							<a href="#" class="btn btn-primary">연동신청</a>
						</div>
					</div>
				</div>
		</section>

		<!-- End Contact Section -->

	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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