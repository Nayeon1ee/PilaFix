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

<!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
</head>

<body>
	<%@ include file="admin_header_common.jsp" %>
	<!-- ============================================================================================ -->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>FAQ 수정</h1>
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

							<!-- Multi Columns Form -->
							<form class="row g-3">
								<div class="col-md-2">
									<label class="form-label">글번호</label> <input type="text"
										readonly disabled class="form-control" value="1">
								</div>
								<div class="col-md-2">
									<label class="form-label">구분</label> <input type="text"
										readonly disabled class="form-control" value="김xx">
								</div>
								<div class="col-md-4">
									<label class="form-label">작성일</label> <input type="text"
										readonly disabled class="form-control" value="2022-12-25">
								</div>
								<div class="col-md-4">
									<label class="form-label">최근 수정일</label> <input type="text"
										readonly disabled class="form-control" value="2023-01-01">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 제목</label> <input type="text"
										class="form-control" value="xx점 토미 강사 추천">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 내용</label>
									<textarea class="form-control" style="height: 300px;">xx점 토미강사 추천 굳굳</textarea>
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-primary" onclick="location.href='admin_FAQ.do'">수정</button>
									<button type="button" class="btn btn-secondary" onclick="location.href='admin_FAQ_detail.do'">취소</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->

						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- 삭제 모달 -->
		<div class="modal fade" id="basicModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">확인 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->





	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp" %>
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

</body>

</html>