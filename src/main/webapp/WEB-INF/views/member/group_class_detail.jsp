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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.15.0/font/bootstrap-icons.css">
</head>
<!-- 내 css -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />

<style>
    .btn-check:checked + .btn {
        background-color: #9b56e9;
        color: #fff;
        border-color: #9b56e9;
    }

    .btn-check:focus + .btn {
        box-shadow: 0 0 0 0.25rem rgba(155, 86, 233, 0.25);
    }

    .btn-check:checked:hover + .btn {
        background-color: #8338ec;
        border-color: #8338ec;
    }
</style>
    
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
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>Group Class Schedule</li>
				</ol>
				<h2>그룹 수업 스케줄</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">





				<section class="top_bar py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="mb-0 h5">
                    <strong class="text-primary" style="display: inline-block; margin-right: 10px;">11. 22  오늘</strong>
                    <span class="text-muted" style="display: inline-block;">오후 16:00 ~ 오후 16:50</span>
                </p>
            </div>
        </div>
    </div>
</section>

				<section class="explanation text-center py-5">
					<div class="container">
						<p class="h3 mb-0">그룹수업</p>
						<p class="lead">척추가 뽀개지는 필라테스 / 그룹레슨 / 정원 6명</p>
					</div>
				</section>


				<section class="status py-5">
					<div class="container">
						<div class="row gy-4">
							<div class="col-md-4">
								<div class="card h-100 border-primary">
									<div class="card-body text-center">
										<p class="mb-0 fs-6">
											<span class="text-primary"><i class="bi bi-calendar"></i></span>
											예약 : 6
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card h-100 border-success">
									<div class="card-body text-center">
										<p class="mb-0 fs-6">
											<span class="text-success"><i
												class="bi bi-check-circle"></i></span> 출석 : 6
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card h-100 border-warning">
									<div class="card-body text-center">
										<p class="mb-0 fs-6">
											<span class="text-warning"><i class="bi bi-x-circle"></i></span>
											결석 : 0
										</p>
									</div>
								</div>
							</div>
						</div>


					</div>
				</section>


				<section class="member_list py-4 my-3">
					<div class="container">
						<div class="row">
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-1"
										autocomplete="off"> <label class="btn"
										for="btn-check-1"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">김영우</p>
									</label>
								</div>
							</div>
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-2"
										autocomplete="off"> <label class="btn"
										for="btn-check-2"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">이나연</p>
									</label>
								</div>
							</div>
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-3"
										autocomplete="off"> <label class="btn"
										for="btn-check-3"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">김수미</p>
									</label>
								</div>
							</div>
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-4"
										autocomplete="off"> <label class="btn"
										for="btn-check-4"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">민은주</p>
									</label>
								</div>
							</div>
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-5"
										autocomplete="off"> <label class="btn"
										for="btn-check-5"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">주민승</p>
									</label>
								</div>
							</div>
							<div class="col-md-2">
								<div class="member-check text-center">
									<input type="checkbox" class="btn-check" id="btn-check-6"
										autocomplete="off"> <label class="btn"
										for="btn-check-6"> <i class="bi bi-person-circle"></i>
										<p class="mt-2">송하민</p>
									</label>
								</div>
							</div>
						</div>
					</div>
				</section>


				<div class="container text-center"></div>

				<div class="d-flex justify-content-start">
					<button type="button" class="btn btn-primary ms-3"
						onclick="location.href='#'">목록</button>
				</div>


				<!-- 수업에 참여한 인원이 없을 경우 -->
				<!--  <section class="member_none text-center py-5 bg-light">
					<div class="container">
						<p class="lead mb-0">현재 수업에 참여한 사람이 없습니다.</p>
					</div>
				</section> -->
				<!-- 수업에 참여한 인원이 없을 경우 -->




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
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap)common.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
	<script src="assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>

</html>