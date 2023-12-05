<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="${pageContext.request.contextPath}/resources/css/style_membernotice_detail.css">

<body>



	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="mainPge.do">Home</a></li>
					<li>notice</li>
				</ol>
				<h2>공지사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">


				<section class="section pb-1">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">공지사항 상세</h5>
							
									<!-- Multi Columns Form -->
									<form class="row g-3" id="registrationForm000">
									
<c:choose>
<c:when test="${type == 'center'}">
										<div class="col-md-4">
											<label class="form-label">센터명</label> <input type="text" readonly disabled class="form-control"
												value="${centerNotice.ctName }">
										</div>
										<div class="col-md-4">
											<label class="form-label">작성일자</label> <input type="text"
												readonly disabled class="form-control"
												value="<fmt:formatDate pattern='yyyy-MM-dd' value='${centerNotice.regDate }'/>">
										</div>
										<div class="col-md-4">
											<label class="form-label">조회수</label> <input type="text" readonly disabled class="form-control"
												value="${centerNotice.cnt }">
										</div>										
										<div class="col-md-12">
											<label class="form-label">제목</label> <input type="text" class="form-control" id="titleInput000"
												value="${centerNotice.title }" disabled>
										</div>										
										<div class="col-md-12">
											<label class="form-label">내용</label>
											<textarea class="form-control" id="contentInput000" style="height: 300px" disabled>${centerNotice.content }</textarea>
										</div>
			
										<div class="text-center">
											<div class="btn-toolbar justify-content-end d-flex" role="toolbar">
												<div class="me-auto ms-3">
													<button type="button" class="btn btn-secondary" onclick="location.href='myNoticePage.do'">목록</button>
												</div>
											</div>
										</div>
</c:when>										
<c:when test="${type == 'pilafix'}">										
<div class="col-md-4">
	<label class="form-label"></label> <input type="text" readonly disabled class="form-control"
		value="필라픽스 공지사항">
</div>
<div class="col-md-4">
	<label class="form-label">작성일자</label> <input type="text" readonly disabled class="form-control"
		value="<fmt:formatDate pattern='yyyy-MM-dd' value='${webNotice.regDate }'/>">
</div>
<div class="col-md-4">
	<label class="form-label">조회수</label> <input type="text" readonly disabled class="form-control"
		value="${webNotice.cnt }">
</div>										
<div class="col-md-12">
	<label class="form-label">제목</label> <input type="text" class="form-control" id="titleInput000"
		value="${webNotice.title }" disabled>
</div>										
<div class="col-md-12">
	<label class="form-label">내용</label>
	<textarea class="form-control" id="contentInput000" style="height: 300px" disabled>${webNotice.content }</textarea>
</div>

<div class="text-center">
	<div class="btn-toolbar justify-content-end d-flex" role="toolbar">
		<div class="me-auto ms-3">
			<button type="button" class="btn btn-secondary" onclick="location.href='myNoticePage.do'">목록</button>
		</div>
	</div>
</div>										
</c:when>
</c:choose>										
									</form>
									<!-- End Multi Columns Form -->
								</div>
							</div>
						</div>
				</div>
	</section>
	<!-- End #main -->
	



	<!-- End Our Skills Section -->
	
	</div>
	</section>
	</main>
	

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->



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
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>