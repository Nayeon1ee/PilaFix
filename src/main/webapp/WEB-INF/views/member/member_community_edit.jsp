<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Blog - Eterna Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

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

<!-- =======================================================
  * Template Name: Eterna
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
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

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="index.html">Home</a></li>
					<li>Community</li>
				</ol>
				<h2>커뮤니티</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog pt-2">
			<div class="container mx-auto" style="max-width: 1000px;">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">글 수정</h5>
						<p>개인 정보가 포함되지 않도록 유의하시고, 아래와 같은 규정에 따라 삭제될 수 있습니다.</p>

						<form class="row g-3">
							<div class="col-md-2">
								<label class="form-label"> 번호</label> <input type="text"
									readonly disabled class="form-control" value="1">
							</div>
							<div class="col-md-5">
								<label class="form-label">작성자</label> <input type="text"
									readonly disabled class="form-control" value="홍길동">
							</div>
							<div class="col-md-5">
								<label class="form-label">작성일</label> <input type="text"
									readonly disabled class="form-control" value="2023-01-01">
							</div>
							<div class="col-md-12">
								<label class="form-label">글 제목</label> <input type="text"
									class="form-control" value="글 제목 수정~~~~~~~~~~~~~~~">
							</div>
							<div class="col-md-12">
								<label class="form-label">글 내용</label>
								<textarea class="form-control" style="height: 300px;">글 내용 수정~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            </textarea>
							</div>




							<div class="text-center">

								<div class="btn-toolbar justify-content-end d-flex"
									role="toolbar">
									<div class="me-auto ms-3">
										<button type="button" class="btn btn-secondary"
											onclick="location.href='member_community.do'">목록</button>
									</div>

									<div class="btn-group me-2">
										<button type="button" class="btn btn-primary"
											onclick="location.href='#'">수정</button>
									</div>
									<div class="btn-group me-3">
										<button type="button" class="btn btn-danger"
											data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
									</div>
								</div>
							</div>
						</form>
						<!-- Multi Columns Form -->


						<!--  삭제 버튼 모달 -->
						<div class="modal fade" id="basicModal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">확인 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary"
											onclick="location href='member_community.do'">확인</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 삭제 버튼 모달 끝 -->
						<!-- End Multi Columns Form -->


					
					</div>
				</div>

			</div>
		</section>
		<!-- End Blog Section -->

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