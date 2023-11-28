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
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_reservation_cancel.css">

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
					<li>Reserved list</li>
				</ol>
				<h2>예약 목록</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">


				<div class="reserv_cancel_list d-flex justify-content-center">
					<div class="reserv_cancel_list d-flex justify-content-center">
						<div class="section_0"
							style="border: border-radius: 5px; margin-bottom: 20px; position: relative; overflow: hidden; width: 700px;">
							<div class="time" id="cancelTime">
								<p class="fw-bold mb-0" style="color: #e44d26;">
									취소 가능한 시간까지 <span id="timeRemaining"></span> 남았어요!
								</p>
							</div>
						</div>
					</div>



					<div class="container" style="max-width: 700px">
						<div class="row">
							<div class="col-md-6 p-0">
								<div class="section1">
									 <div class="card h-100" style="max-width: 347.5px;">
										<div class="card-header">
											<b>내 수강권 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
								<li class="list-group-item mb-1 title-text">XX필라테스 xx점 | 그룹수업</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="remainingSessions">잔여횟수</label>
													<input type="text" class="form-control"
														id="remainingSessions" name="remainingSessions" readonly>
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="expirationDate">만료일</label>
													<input type="text" class="form-control" id="expirationDate"
														name="expirationDate" readonly>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-6 p-0">
								<div class="section2">
									 <div class="card h-100" style="max-width: 347.5px;">
										<div class="card-header">
											<b>내 수강권 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
										<li class="list-group-item mb-1 title-text">XX필라테스 xx점 | 그룹수업</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="remainingSessions">잔여횟수</label>
													<input type="text" class="form-control"
														id="remainingSessions" name="remainingSessions" readonly>
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="expirationDate">만료일</label>
													<input type="text" class="form-control" id="expirationDate"
														name="expirationDate" readonly>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>


						</div>
					</div>
					<div class="section">
						<div class="card">
							<div class="card-header">
								<b>이용정책</b>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="d-flex justify-content-between align-items-center">
										<span class="fw-bold">예약 취소 정책</span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="policy-form">
										<textarea class="form-control" rows="4" readonly>
                        수업 예약의 취소나 변경은 0일 3시간 0분 전까지 가능합니다.
                    </textarea>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<div class="section">

						<div class="d-grid gap-2 justify-content-end me-2">
							<button class="btn btn-primary my-auto" type="button"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="width: 100px;">취소하기</button>
						</div>

					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="highlight-section">
									<p class="highlight-text">
										<span class="highlight-date">10월 21일 오전 10:00에 진행하는</span>
									</p>
									<p class="hightlight-text" style="font-size: 18px;">
										체어&바렐(B) : 다이어트, 체력강화 수업을 취소하시겠습니까?</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary my-auto">예약
									취소</button>
							</div>
						</div>
					</div>
				</div>



				<!-- End #main -->
			</div>
		</section>
	</main>
	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!--  취소 가능한 시간 js -->
	<script>
		// 취소 가능한 날짜 설정 (예: 2023년 12월 31일 23시 59분 59초)
		var cancelDate = new Date('2023-12-31T23:59:59');

		// 시간 간격 계산 함수
		function calculateTimeRemaining() {
			var now = new Date();
			var timeDifference = cancelDate - now;

			// 시간, 분, 초 계산
			var hours = Math.floor(timeDifference / (1000 * 60 * 60));
			var minutes = Math.floor((timeDifference % (1000 * 60 * 60))
					/ (1000 * 60));
			var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

			// 결과를 페이지에 반영
			document.getElementById('timeRemaining').innerHTML = hours + '시간 '
					+ minutes + '분 ' + seconds + '초';
		}

		// 페이지 로드 시 초기화
		calculateTimeRemaining();

		// 1초마다 갱신
		setInterval(calculateTimeRemaining, 1000);
	</script>
	<!--  취소 가능한 시간 스크립트 -->



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