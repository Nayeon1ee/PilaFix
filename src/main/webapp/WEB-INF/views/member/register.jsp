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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_registration.css" />


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
			<div class="container" style="max-width:1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>register</li>
				</ol>
				<h2>회원가입</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">
				<div class="mb-3 row" style="margin-top: 10%;">
					<label for="staticEmail" class="col-sm-2 col-form-label"
						style="margin-left: 1%; border-left: 2px solid; border-color: #9B67FF;">회원가입</label>
				</div>
				<form class="row g-3">
					<div class="col-auto" style="width: 100px;">
						<label for="staticEmail2" class="visually-hidden">이메일 아이디</label>
						<input type="text" readonly class="form-control-plaintext"
							id="staticEmail2" value="이메일 아이디"
							style="width: 130%; padding: revert-layer;">
					</div>

					<div class="col-auto" style="width: 21%;">
						<label for="inputPassword2" class="visually-hidden">Password</label>
						<input type="email" class="form-control" id="inputEmail"
							placeholder="이메일 입력"
							style="width: 220%; margin-left: 28%; border: 0px;">
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3"
							style="width: 90px; margin-left: 230px; font-size: 14px;">중복
							확인</button>
					</div>

					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3"
							style="width: 90px; font-size: 14px;">인증 요청</button>
					</div>
					<!--  영역 -->
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">영역</label> <input type="text"
							class="form-control" id="inputAddress"
							placeholder="--------영역--------"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<!-- 영역 -->
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">비밀번호</label> <input type="text"
							class="form-control" id="inputAddress"
							placeholder="영문, 숫자 포함 8글자 이상 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">비밀번호 확인</label> <input
							type="text" class="form-control" id="inputAddress"
							placeholder="영문, 숫자 포함 8글자 이상 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">이름</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="이름 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">휴대전화 번호</label> <input
							type="text" class="form-control" id="inputAddress"
							placeholder="휴대전화 번호 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					
						<div class="col-12"
							style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
							<label for="inputAddress" class="form-label"
								style="float: left; width: 20%;">생년월일</label> <input type="text"
								class="form-control" id="inputAddress" placeholder="4자리 입력"
								style="float: left; width: 30%; border: 0px; padding-top: 0px;">
						</div>

						<div class="col-12"
							style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
							<label for="inputAddress" class="form-label"
								style="float: left; width: 21%;">성별</label> <input
								class="form-check-input" type="radio" name="flexRadioDefault"
								id="flexRadioDefault1"> <label class="form-check-label"
								for="flexRadioDefault1">남자</label> <input
								class="form-check-input" type="radio" name="flexRadioDefault"
								id="flexRadioDefault2" checked="checked"> <label
								class="form-check-labe2" for="flexRadioDefault2">여자</label>
						</div>
					

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault">전체 동의합니다.</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckChecked" checked> <label
							class="form-check-label" for="flexCheckChecked">[필수] 개인정보
							수집 및 이용동의</label>
						<textarea class="form-control" rows="4" placeholder="이용약관 내용"></textarea>
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-primary"
							style="width: 100%; margin-top: 3%;">회원가입</button>
					</div>
				</form>

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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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