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
	href="${pageContext.request.contextPath}/resources/css/style_classlist.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">


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
					<li>trainer class list</li>
				</ol>
				<h2>강사 수업 관리</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">




				<!-- 검색창 -->
				<div class="container" style="max-width: 900px; margin-right: 0px;">
					<div class="search-filter mx-auto">
						<div class="search-filter-inner">
							<div class="serch-filter-content">
								<div class="row py-2 my-4">
									<div class="col-md-3 me-1">
										<label for="inputState" class="form-label">검색</label> <select
											id="inputState" class="form-select" style="width: 100%;">
											<option selected disabled>전체</option>
											<option>그룹수업</option>
											<option>개인수업</option>
										</select>
									</div>
									<div class="col-md-6 pt-2 mt-4">
										<div class="input-group">
											<input type="text" class="form-control me-2" id="inputCity"
												placeholder="검색어를 입력해주세요">
											<div class="input-group-append">
												<button type="submit" class="btn btn-primary search">검색</button>
												<button type="reset" class="btn btn-primary search"
													id="resetButton">초기화</button>
											</div>
										</div>
									</div>
								</div>



								<div class="row mb-3">
									<div class="col-md-3 me-2">
										<label for="inputState2" class="form-label">처리상태</label> <select
											id="inputState2" class="form-select">
											<option selected disabled>회원상태</option>
											<option>계약회원</option>
											<option>해지회원</option>
											<option>만료회원</option>
										</select>
									</div>
									<div class="col-md-5">
										<div class="input-group mb-3">
											<label for="inputState" class="form-label mb-2">기간검색</label>
											<div class="row">
												<div class="col-sm-6 px-0">
													<div class="input-group">
														<input type="date" class="form-control rounded-start"
															id="startDate">

													</div>
												</div>
												<div class="col-sm-6 pe-2 pr-2">
													<div class="input-group">
														<input type="date" class="form-control rounded-end"
															id="endDate">

													</div>
												</div>
											</div>
										</div>
									</div>


								</div>



							</div>
						</div>
					</div>
				</div>










				<!-- 리스트 -->
				<table class="table datatable">
					<thead>
						<tr>
							<th scope="col">NO.</th>
							<th scope="col">수업내용명</th>
							<th scope="col">수업기간</th>
							<th scope="col">진행인원</th>
							<th scope="col">상태</th>
							<th scope="col">지점명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">5</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">그룹수업 ~~</a></td>
							<td>2023.11.21 ~ 2024.02.21</td>
							<td>1/6</td>
							<td>폐강</td>
							<td>xx점 xx테스</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">개인수업 ~~</a></td>
							<td>2023.11.21 ~ 2024.02.21</td>
							<td>1/1</td>
							<td>폐강</td>
							<td>xx점 xx테스</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">그룹수업 ~~</a></td>
							<td>2023.11.21 ~ 2024.02.21</td>
							<td>1/6</td>
							<td>폐강</td>
							<td>xx점 xx테스</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">개인수업 ~~</a></td>
							<td>2023.11.21 ~ 2024.02.21</td>
							<td>1/1</td>
							<td>폐강</td>
							<td>xx점 xx테스</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">그룹수업 ~~</a></td>
							<td>2023.11.21 ~ 2024.02.21</td>
							<td>1/6</td>
							<td>폐강</td>
							<td>xx점 xx테스</td>
						</tr>
					</tbody>
				</table>
				<!-- 리스트 끝 -->










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