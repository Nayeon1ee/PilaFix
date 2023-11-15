<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Charts / ApexCharts - PilaAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/assets/css/style.css">

<!-- 내가 만든 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_terms.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common_1.css">

<!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
</head>

<body>
	<%@ include file="admin_header_common.jsp"%>
	<!-- ============================================================================================ -->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>이용약관 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">필요 시 작성</li>
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">중제목 작성</h5>
							<p>간략한 설명</p>
							<!-- 검색필터 시작 -->

							<!-- 검색필터 끝 -->
							<div class="terms-btn">
								<span class="terms-reg-btn">
									<button type="button" class="btn btn-primary"
										onclick="location.href='admin_terms_register.do'">약관등록</button>
								</span> <span class="excel-down-btn">
									<button type="button" class="btn btn-success">엑셀다운</button>
								</span>
							</div>
							<!-- 게시판 시작 -->
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">약관명</th>
										<th scope="col">작성일</th>
										<th scope="col">최근 수정일</th>
										<th scope="col">필수여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">5</th>
										<td><a href="admin_terms_detail.do"
											class="admin-alink-color">서비스 이용약관</a></td>
										<td>2023-12-25</td>
										<td>2023-12-25</td>
										<td>필수</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td><a href="admin_terms_detail.do" class="admin-alink-color">개인정보 수집 및
												이용방침</a></td>
										<td>2022-04-01</td>
										<td>2022-10-20</td>
										<td>필수</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td><a href="admin_terms_detail.do" class="admin-alink-color">마케팅 수신동의</a></td>
										<td>2022-03-19</td>
										<td>2022-03-19</td>
										<td>선택</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td><a href="admin_terms_detail.do" class="admin-alink-color">몰루</a></td>
										<td>2021-12-24</td>
										<td>2021-12-24</td>
										<td>선택</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td><a href="admin_terms_detail.do" class="admin-alink-color">어쩌구</a></td>
										<td>2020-03-12</td>
										<td>2020-03-12</td>
										<td>선택</td>
									</tr>
								</tbody>
							</table>

							<!-- 페이징 처리 시작 -->
							
							<!-- 페이징 처리 끝 -->

						</div>
					</div>

				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->




	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp"%>
		<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>

	<!--내가 만든 JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>

</body>

</html>