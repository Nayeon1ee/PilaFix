<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>PILAFIX Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath }/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: PILAFIX
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/PILAFIX-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">

				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url(assets/img/slide/slide-1.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated animate__fadeInDown">
									Welcome to <span>PILAFIX</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">Ut velit est
									quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat
									sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut.
									Similique ea voluptatem. Esse doloremque accusamus repellendus
									deleniti vel. Minus et tempore modi architecto.</p>
								<a href=""
									class="btn-get-started animate__animated animate__fadeInUp">Read
									More</a>
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item"
						style="background-image: url(assets/img/slide/slide-2.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated fanimate__adeInDown">
									Lorem <span>Ipsum Dolor</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">Ut velit est
									quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat
									sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut.
									Similique ea voluptatem. Esse doloremque accusamus repellendus
									deleniti vel. Minus et tempore modi architecto.</p>
								<a href=""
									class="btn-get-started animate__animated animate__fadeInUp">Read
									More</a>
							</div>
						</div>
					</div>

					<!-- Slide 3 -->
					<div class="carousel-item"
						style="background-image: url(assets/img/slide/slide-3.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated animate__fadeInDown">
									Sequi ea <span>Dime Lara</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">Ut velit est
									quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat
									sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut.
									Similique ea voluptatem. Esse doloremque accusamus repellendus
									deleniti vel. Minus et tempore modi architecto.</p>
								<a href=""
									class="btn-get-started animate__animated animate__fadeInUp">Read
									More</a>
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#heroCarousel" role="button"
					data-bs-slide="prev"> <span
					class="carousel-control-prev-icon bi bi-chevron-left"
					aria-hidden="true"></span>
				</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
					data-bs-slide="next"> <span
					class="carousel-control-next-icon bi bi-chevron-right"
					aria-hidden="true"></span>
				</a>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= Featured Section ======= -->
		<section id="featured" class="featured">
			<div class="container">

				<div class="row">
					<div class="col-lg-4">
						<div class="icon-box">
							<i class="bi bi-card-checklist"></i>
							<h3>
								<a href="">Lorem Ipsum</a>
							</h3>
							<p>Voluptatum deleniti atque corrupti quos dolores et quas
								molestias excepturi sint occaecati cupiditate non provident</p>
						</div>
					</div>
					<div class="col-lg-4 mt-4 mt-lg-0">
						<div class="icon-box">
							<i class="bi bi-bar-chart"></i>
							<h3>
								<a href="">Dolor Sitema</a>
							</h3>
							<p>Minim veniam, quis nostrud exercitation ullamco laboris
								nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
						</div>
					</div>
					<div class="col-lg-4 mt-4 mt-lg-0">
						<div class="icon-box">
							<i class="bi bi-binoculars"></i>
							<h3>
								<a href="">Sed ut perspiciatis</a>
							</h3>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur</p>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Featured Section -->

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container">

				<div class="row">
					<div class="col-lg-6">
						<img src="assets/img/about.jpg" class="img-fluid" alt="">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 content">
						<h3>Voluptatem dignissimos provident quasi corporis
							voluptates sit assumenda.</h3>
						<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua.</p>
						<ul>
							<li><i class="bi bi-check-circle"></i> Ullamco laboris nisi
								ut aliquip ex ea commodo consequat.</li>
							<li><i class="bi bi-check-circle"></i> Duis aute irure dolor
								in reprehenderit in voluptate velit.</li>
							<li><i class="bi bi-check-circle"></i> Ullamco laboris nisi
								ut aliquip ex ea commodo consequat. Duis aute irure dolor in
								reprehenderit in voluptate trideta storacalaperda mastiro dolore
								eu fugiat nulla pariatur.</li>
						</ul>
						<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
							Duis aute irure dolor in reprehenderit in voluptate velit esse
							cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum</p>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="row">
					<div class="col-lg-4 col-md-6 d-flex align-items-stretch">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bxl-dribbble"></i>
							</div>
							<h4>
								<a href="">Lorem Ipsum</a>
							</h4>
							<p>Voluptatum deleniti atque corrupti quos dolores et quas
								molestias excepturi</p>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-file"></i>
							</div>
							<h4>
								<a href="">Sed ut perspiciatis</a>
							</h4>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore</p>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div>
							<h4>
								<a href="">Magni Dolores</a>
							</h4>
							<p>Excepteur sint occaecat cupidatat non proident, sunt in
								culpa qui officia</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-world"></i>
							</div>
							<h4>
								<a href="">Nemo Enim</a>
							</h4>
							<p>At vero eos et accusamus et iusto odio dignissimos ducimus
								qui blanditiis</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-slideshow"></i>
							</div>
							<h4>
								<a href="">Dele cardo</a>
							</h4>
							<p>Quis consequatur saepe eligendi voluptatem consequatur
								dolor consequuntur</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-arch"></i>
							</div>
							<h4>
								<a href="">Divera don</a>
							</h4>
							<p>Modi nostrum vel laborum. Porro fugit error sit minus
								sapiente sit aspernatur</p>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Services Section -->

		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients">
			<div class="container">

				<div class="section-title">
					<h2>Clients</h2>
					<p>Magnam dolores commodi suscipit. Necessitatibus eius
						consequatur ex aliquid fuga eum quidem. Sit sint consectetur
						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem
						hic quas.</p>
				</div>

				<div class="clients-slider swiper">
					<div class="swiper-wrapper align-items-center">
						<div class="swiper-slide">
							<img src="assets/img/clients/client-1.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-2.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-3.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-4.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-5.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-6.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-7.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-8.png" class="img-fluid"
								alt="">
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Clients Section -->

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
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/member/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>