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
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_FAQ.css">

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
					<li><a href="main.do">Home</a></li>
					<li>faq</li>
				</ol>
				<h2>FAQ</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 700px">

				<div id="userInfo"
					class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>

					<section class="section002 py-3 my-3">
						<nav class="navbar navbar-expand-lg py-1 my-1">
							<div class="container-fluid">
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse"
									id="navbarSupportedContent">
									<ul class="navbar-nav me-auto mb-2 mb-lg-0">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-bs-toggle="dropdown" aria-expanded="false"
											style="font-size: 16px";>검색 </a>
											<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
												<li><a class="dropdown-item" href="#">제목</a></li>
												<hr class="dropdown-divider">
												<li><a class="dropdown-item" href="#">글내용</a></li>
												<hr class="dropdown-divider">
												<li><a class="dropdown-item" href="#">제목+글내용</a></li>
											</ul></li>
									</ul>
									<form action="search" method="post" class="d-flex">
										<div class="input-group">
											<input type="search" name="search" class="form-control"
												placeholder="검색" aria-label="검색">
											<button type="submit" class="btn btn-outline-primary">검색</button>
										</div>
									</form>
								</div>
							</div>
						</nav>
					</section>

					<div id="searchResults" style="display: none;">

						<!-- 여기에 검색 결과가 표시 -->

					</div>

					<div>
						<p class="total-faq-count">전체 00건</p>
						<hr>
					</div>



					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
									aria-expanded="true" aria-controls="inquiryCollapse">
									<div class="inquiry-item">
										<div class="inquiry-details">
											<div class="inquiry-title">
												<strong>Q</strong> 질문입니다.
											</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="inquiryCollapse"
								class="accordion-collapse collapse show"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>A</strong> <br> 답변입니다.
								</div>
							</div>
						</div>

						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#inquiryCollapse2"
									aria-expanded="true" aria-controls="inquiryCollapse2">
									<div class="inquiry-item">
										<div class="inquiry-details">
											<div class="inquiry-title">
												<strong>Q</strong> 질문입니다.
											</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="inquiryCollapse2"
								class="accordion-collapse collapse show"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>A</strong> <br> 답변입니다.
								</div>
							</div>
						</div>


						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#inquiryCollapse3"
									aria-expanded="true" aria-controls="inquiryCollapse3">
									<div class="inquiry-item">
										<div class="inquiry-details">
											<div class="inquiry-title">
												<strong>Q</strong> 질문입니다.
											</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="inquiryCollapse3"
								class="accordion-collapse collapse show"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>A</strong> <br> 답변입니다.
								</div>
							</div>
						</div>


						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#inquiryCollapse4"
									aria-expanded="true" aria-controls="inquiryCollapse4">
									<div class="inquiry-item">
										<div class="inquiry-details">
											<div class="inquiry-title">
												<strong>Q</strong> 질문입니다.
											</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="inquiryCollapse4"
								class="accordion-collapse collapse show"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>A</strong> <br> 답변입니다.
								</div>
							</div>
						</div>

					</div>



				</div>


				<!-- End Our Skills Section -->
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
		src="${pageContext.request.contextPath}/resources/js/quiry_FAQ.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js_bootstrap_common.js"></script>

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