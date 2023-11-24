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
	href="${pageContext.request.contextPath}/resources/css/style_insert_calendar.css">

<!-- 달력 -->



<!--  달력 -->

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
					<li>Reserved list group</li>
				</ol>
				<h2>예약 목록 그룹</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">


				<!-- 7:3 비율 잡기 위한 컨테이너 -->
				<div class="container d-flex justify-content-center p-0 m-0">
					<div class="row">

						<!-- 첫 번째 컬럼 (7:3) -->

						<table class="Calendar">
							<thead>
								<tr>
									<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
									<td colspan="5"><span id="calYear"></span>년 <span
										id="calMonth"></span>월</td>
									<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
								</tr>
								<tr>
									<td>일</td>
									<td>월</td>
									<td>화</td>
									<td>수</td>
									<td>목</td>
									<td>금</td>
									<td>토</td>
								</tr>
							</thead>
							<tbody>
								<!-- 달력 내용 -->
							</tbody>
						</table>



					</div>
					<!-- 7:3 비율 컨테이너 닫기 -->


					<!-- 두 번째 컬럼 (7:3) -->
					<div class="col-md-5 content1 ms-4">
						<div class='content' style="max-height: 500px; overflow-y: auto;">

							<!-- 센터 셀렉트 박스 -->
							<div class="custom-select-wrapper text-center mt-3">
								<select class="form-select p-1" id="categorySelect">
									<option value="all" selected>센터 선택</option>
									<option value="individual">xx점</option>
									<option value="group">xx점</option>
								</select>
							</div>


							<div class="tab-buttons text-center">
								<ul class="nav nav-tabs justify-content-center mt-3"
									id="pills-tab" role="tablist">
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link px-auto" id="pills-individual-tab"
										data-toggle="pill" href="#pills-individual" role="tab"
										aria-controls="pills-individual" aria-selected="false">개인</a>
									</li>
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link active" id="pills-group-tab"
										data-toggle="pill" href="#pills-group" role="tab"
										aria-controls="pills-group" aria-selected="true">그룹</a></li>
								</ul>
							</div>

							<!-- 탭 전환 시 변경될 데이터 -->
							<div class="tab-content">

								<div class="tab-pane fade" id="pills-individual" role="tabpanel"
									aria-labelledby="pills-individual-tab">

									<!-- 개인 탭에 대한 내용 -->
									<div class="content-filter">
										<div
											class="form-check form-switch d-flex justify-content-between align-items-center">
											<div>
												<input class="form-check-input" type="checkbox"
													id="flexSwitchCheckDefault"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													style="color: black;"> 예약 가능 </label>
											</div>
											<div>
												<button class="btn btn-secondary refresh"
													onclick="window.location.reload()"
													style="background-color: white; color: #333; border: 1px solid white;">
													<i class="bi bi-arrow-clockwise"></i> 새로고침
												</button>
											</div>
										</div>
									</div>

									<div class="content-filter">
										<div
											class="form-check form-switch d-flex justify-content-between align-items-center">
											<div>
												<label class="form-check-label time-label"
													for="flexSwitchCheckDefault2"> <span
													class="badge bg-primary">10:00 - 10:50</span>

												</label>
											</div>
											<div>
												<button class="btn btn-primary reserve-btn">
													<i class="bi bi-calendar-plus"></i> 예약하기
												</button>
											</div>
										</div>
									</div>

								</div>
								<div class="tab-pane fade" id="pills-group" role="tabpanel"
									aria-labelledby="pills-group-tab">

									<!-- 그룹 탭에 대한 내용 -->

									<div class="content-filter">
										<div
											class="form-check form-switch d-flex justify-content-between align-items-center">
											<div>
												<input class="form-check-input" type="checkbox"
													id="flexSwitchCheckDefault"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													style="color: black;"> 예약 가능 </label>
											</div>
											<div>
												<button class="btn btn-secondary refresh"
													onclick="window.location.reload()"
													style="background-color: white; color: #333; border: 1px solid white;">
													<i class="bi bi-arrow-clockwise"></i> 새로고침
												</button>
											</div>
										</div>
									</div>

									<div class="list-group">
										<a href="#"
											class="list-group-item list-group-item-action active">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">오전 09:00 ~ 09:50</h5>
												<small></small>
											</div>
											<p class="mb-1">콤비리포머(A): 재활, 스트레칭</p>
											<p class="mb-1">###강사</p> <small class="text-muted">#명
												남음</small><small class="text-muted">정원 #명</small>
										</a> <a href="#" class="list-group-item list-group-item-action">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">오전 10:00 ~ 10:50</h5>
												<small></small>
											</div>
											<p class="mb-1">체어&바렐(A): 체형교정</p>
											<p class="mb-1">###강사</p> <small class="text-muted">#명
												남음</small><small class="text-muted">정원 #명</small>
										</a> <a href="#" class="list-group-item list-group-item-action">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">오전 11:00 ~ 11:50</h5>
												<button type="button" class="btn btn-outline-primary"
													data-bs-toggle="modal" data-bs-target="#staticBackdrop">예약하기</button>
											</div>
											<p class="mb-1">체어&바렐(A): 체형교정</p>
											<p class="mb-1">###강사</p> <small class="text-muted">#명
												남음</small><small class="text-muted">정원 #명</small>
										</a> <a href="#" class="list-group-item list-group-item-action">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">오전 12:00 ~ 12:50</h5>
												<button type="button" class="btn btn-outline-primary"
													disabled="disabled">● 예약완료</button>
											</div>
											<p class="mb-1">체어&바렐(A): 체형교정</p>
											<p class="mb-1">###강사</p> <small class="text-muted">#명
												남음</small><small class="text-muted">정원 #명</small>
										</a>
									</div>

								</div>
							</div>

						</div>








						<!--  3비율 컨테이너 닫기 -->
					</div>
				</div>
			</div>
			<!--  3비율 컨테이너 닫기 -->


			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<!-- model-lg는 모달 크기 조절 -->
					<div class="modal-dialog modal-dialog-scrollable">
						<!-- 모달 내 스크롤 가능토록 -->
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">예약 상세
									페이지</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<div class="card" style="width: 100%;">
									<div class="card-header">
										<b>수업 정보 확인</b>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">XX필라테스 xx점 | 그룹수업</li>
										<li class="list-group-item"><h5 style="">체어&바렐(B) :
												다이어트, 체력강화</h5></li>
										<li class="list-group-item"><img alt="bar"
											src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
											강사명 :</li>
										<li class="list-group-item"><img alt="bar"
											src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
											예약날짜 :</li>
										<li class="list-group-item"><img alt="bar"
											src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
											예약시간 :</li>
									</ul>
								</div>

								<div class="card" style="width: 100%;">
									<div class="card-header">
										<b>내 수강권 정보 확인</b>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">XX필라테스 xx점 | 그룹수업</li>
										<li class="list-group-item"><img alt="bar"
											src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
											잔여횟수 :</li>
										<li class="list-group-item"><img alt="bar"
											src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
											만료일 :</li>
									</ul>
								</div>

								<div class="card" style="width: 100%;">
									<div class="card-header">
										<b>이용정책</b>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><b>예약 취소 정책</b></li>
										<li class="list-group-item">수업 예약의 취소나 변경은 <font
											class="highlight_r">0일 3시간 0분 전까지</font> 가능합니다.
										</li>
										<li class="list-group-item"><b>결석 처리 정책</b></li>
										<li class="list-group-item">무단 결석이나 취소 가능 기간 내 예약을 취소하지
											못한 경우 <font class="highlight_r">사용 횟수만큼 잔여 횟수가 자동 차감</font>됩니다.
										</li>
									</ul>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="flexCheckDefault"> <label class="form-check-label"
										for="flexCheckDefault"> 이용 정책을 전부 확인하였습니다. 이에 동의합니다.</label>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">예약하기</button>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 모달  -->


			<!-- 내용 -->


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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

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