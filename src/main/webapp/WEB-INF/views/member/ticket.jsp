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
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_ticket.css">




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
					<li>ticket</li>
				</ol>
				<h2>수강권 신청</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">


				<!-- 7비율 잡기 위한 컨테이너 -->
				<div class="container">
					<div class="row">
						<div class="col-md-7 ticket">
							<!-- 7비율 잡기 위한 컨테이너 -->



							<!-- 버튼 부분 -->
							<div class="tab-buttons">
								<ul class="nav nav-pills" id="pills-tab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="pills-all-tab"
											data-bs-toggle="pill" href="#pills-all" role="tab"
											aria-controls="pills-all" aria-selected="true">전체</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-individual-tab"
											data-bs-toggle="pill" href="#pills-individual" role="tab"
											aria-controls="pills-individual" aria-selected="false">개인</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-group-tab"
											data-bs-toggle="pill" href="#pills-group" role="tab"
											aria-controls="pills-group" aria-selected="false">그룹</button>
									</li>
								</ul>
							</div>




							<div class="tab-pane fade show active" id="pills-all"
								role="tabpanel" aria-labelledby="pills-all-tab">
								<!-- 예시 티켓 -->
								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
										</div>
										<p class="mb-1">척추가 맞춰지는 필라테스</p>
										<div>
											<table>
												<td>
												<tr>2023.10.10~2024.01.01
												</tr>
												<tr>
													<span
														style="font-weight: bold; text-align: right; display: block;">
														650,000원 </span>
												</tr>
												</td>
											</table>
										</div>
									</a>
								</div>

								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
										</div>
										<p class="mb-1">척추가 맞춰지는 필라테스</p>
										<div>
											<table>
												<td>
												<tr>2023.10.10~2024.01.01
												</tr>
												<tr>
													<span
														style="font-weight: bold; text-align: right; display: block;">
														650,000원 </span>
												</tr>
												</td>
											</table>
										</div>
									</a>
								</div>
								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
										</div>
										<p class="mb-1">척추가 맞춰지는 필라테스</p>
										<div>
											<table>
												<td>
												<tr>2023.10.10~2024.01.01
												</tr>
												<tr>
													<span
														style="font-weight: bold; text-align: right; display: block;">
														650,000원 </span>
												</tr>
												</td>
											</table>
										</div>
									</a>
								</div>
								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
										</div>
										<p class="mb-1">척추가 맞춰지는 필라테스</p>
										<div>
											<table>
												<td>
												<tr>2023.10.10~2024.01.01
												</tr>
												<tr>
													<span
														style="font-weight: bold; text-align: right; display: block;">
														650,000원 </span>
												</tr>
												</td>
											</table>
										</div>
									</a>
								</div>
							</div>

							<!--  개인 티켓 목록 -->
							<div class="tab-pane fade" id="pills-individual" role="tabpanel"
								aria-labelledby="pills-individual-tab">
								<!-- 추가 수강권... 데이터 넣기~ -->

								<div class="list-group-ticket" id="list-item">
									<a href="#" class="list-group-item list-group-item-action">
										<!-- 개인 티켓 예시 --> <!-- 내용은 전체 티켓과 동일하게 추가하거나 수정 -->
									</a>
								</div>
							</div>
							<!--  개인 티켓 목록 -->

							<!-- 3비율 잡기 위한 컨테이너-->
						</div>

						<div class="col-md-5 content1 h-100">
							<button type="button" id="clickButton"
								class="btn btn-lg btn-block">
								<div class="card-body text-center">
									<h5 class="card-title mb-4">관심 가는 수강권을 클릭해보세요!</h5>
									<canvas id="coloredCanvas" width="100" height="100"></canvas>
									<span class="ms-2">클릭!</span>
								</div>
							</button>
						</div>


					</div>
				</div>

				<!--  아래 컨테이너 영역 -->
				<div class="col-md-5 content1 h-100 ">
					<div class="row">
						<div class="col-md-12">
							<div class="payment-history p-3">
								<div class="ticket-item border rounded p-3">
									<div class="ticket-status mb-3">
										<h4 class="mb-0">척추가 뿌셔지는 필라테스</h4>
									</div>
									<div class="ticket-details">
										<div class="ticket-description mb-2">
											<strong>수업 유형:</strong> 그룹 레슨
										</div>
										<div class="class-details">
											<div class="class-type mb-2">
												<strong>수업 횟수:</strong> 36회 (3개월)
											</div>
											<div class="class-duration mb-2">
												<strong>사용 기간:</strong> 2023.11.17 오전 11:08
											</div>
											<div class="class-amount mb-1">
												<strong>금액:</strong> 533,500원
											</div>
										</div>
									</div>
									<div class="ticket-button my-3 ms-auto me-2">
										<a href="#" class="btn btn-primary">결제하기</a>
									</div>
									<!-- 두 번째 티켓 영역 -->
									<div class="ticket-details">
										<div class="ticket-description mb-2">
											<strong>수업 유형:</strong> 그룹 레슨
										</div>
										<div class="class-details">
											<div class="class-type mb-2">
												<strong>수업 횟수:</strong> 36회 (3개월)
											</div>
											<div class="class-duration mb-2">
												<strong>사용 기간:</strong> 2023.11.17 오전 11:08
											</div>
											<div class="class-amount mb-1">
												<strong>금액:</strong> 533,500원
											</div>
										</div>
									</div>
									<div class="ticket-button my-3 ms-auto me-2">
										<a href="#" class="btn btn-primary">결제하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  아래 컨테이너 영역 -->
				
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
	<!--  이미지 색 바꾸기 위한 js -->
	<script>
		const canvas = document.getElementById('coloredCanvas');
		const ctx = canvas.getContext('2d');
		const image = new Image();
		image.src = '${pageContext.request.contextPath}/resources/images/finger_click.png';

		image.onload = function() {

			ctx.drawImage(image, 0, 0, canvas.width, canvas.height);

			ctx.globalCompositeOperation = 'source-atop';
			ctx.fillStyle = '#946CEE';
			ctx.fillRect(0, 0, canvas.width, canvas.height);

			ctx.globalCompositeOperation = 'source-over';
		};

		const button = document.getElementById('clickButton');
		button.addEventListener('click', function() {

		});
	</script>
	<!--  이미지 색 바꾸기 위한 js -->
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

</body>

</html>