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
						<h5 class="card-title">게시글 수정</h5>
						<p>개인 정보가 포함되지 않도록 유의하시고, 아래와 같은 규정에 따라 삭제될 수 있습니다.</p>

						<form class="row g-3" action="updateMemberCommunity.do" method="post">
						<input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
						
							<div class="col-md-2">
								<label class="form-label"> 번호</label>
								<input type="text" readonly disabled class="form-control" name="memberCmNumber" value="${memberCommunity.memberCmNumber }">
							</div>
							<div class="col-md-5">
								<label class="form-label">작성자</label>
								<input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCsName }">
							</div>
							<div class="col-md-5">
								<label class="form-label">작성일</label>
								<input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCmRegdate }">
							</div>
							<div class="col-md-12">
								<label class="form-label">글 제목</label>
								<input type="text" class="form-control" name="memberCmTitle" value="${memberCommunity.memberCmTitle }">
							</div>
							<div class="col-md-12">
								<label class="form-label">글 내용</label>
								<textarea class="form-control" style="height: 300px;" name="memberCmContent">${memberCommunity.memberCmContent }</textarea>
							</div>

							<div class="text-center">
								<div class="btn-toolbar justify-content-end d-flex" role="toolbar">
									<div class="me-auto ms-3">
										<button type="button" class="btn btn-secondary" onclick="location.href='communityPage.do'">목록</button>
									</div>
									<div class="btn-group me-2">
										<input type="submit" class="btn btn-primary" value="수정">
									</div>
								</div>
							</div>
						</form>
						<!-- Multi Columns Form -->
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
		<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>	
</body>

</html>