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
	href="${pageContext.request.contextPath}/resources/css/style_memberpage.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">


<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->
	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="mainPage.do">Home</a></li>
					<li>mypage</li>
				</ol>
				<h2>마이페이지</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services py-4">
			<div class="container" style="max-width: 900px">

				<div id="myPage" class="text-center">


					<div id="userInfo" class="d-flex align-items-center mb-2">
						<div id="myInfoLink" class="ps-4 ms-5"
    style="font-size: 18px; color: #9b56e9; font-weight: bold; margin-left: 40px;">
    <a href="myInfoManage.do"><i class="fas fa-cog mr-1"></i> 내 정보 관리 </a>
</div>


					</div>

					<section
						class="my-passes container mt-5 d-flex justify-content-center"
						style="max-width: 720px; width: 100%;">
						<div class="text-center" style="width: 650px;">
							<h3 class="mt-3">나의 수강권 현황</h3>
							<div class="pass-box row">
								<div class="individual-pass col-lg-12 d-flex align-items-stretch mt-4 mt-md-2">
									<div class="icon-box px-1 mx-1">
										<div class="icon">
											<i class="bx bx-file"></i>
										</div>
										<c:choose>
											<c:when test="${empty personalTicket.ticketNamePersonal1}">
												<p>보유한 개인 수강권이 없습니다</p>
											</c:when>
											<c:otherwise>
												<p>${personalTicket.ticketNamePersonal1}</p>
												<p>${personalTicket.ticketStartDatePersonal1}~
													${personalTicket.ticketExpiryDatePersonal1}</p>
												<p>${personalTicket.ticketExpiryYnPersonal1 ? '만료' : '사용중' }</p>
												<p>잔여횟수:
													${personalTicket.ticketRemainingCountPersonal1}회 남음 / 총
													${personalTicket.ticketUsageCountPersonal1}회</p>
												<p>사용가능지점: ${personalTicket.centerNamePersonal1}</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="individual-pass col-lg-12 d-flex align-items-stretch mt-4 mt-md-2">
        <div class="icon-box mx-auto">
            <div class="icon">
                <i class="bx bx-file"></i>
										</div>
										<c:choose>
											<c:when test="${empty groupTicket.ticketNameGroup1}">
												<p>보유한 그룹 수강권이 없습니다</p>
											</c:when>
											<c:otherwise>
												<p>${groupTicket.ticketNameGroup1}</p>
												<p>${groupTicket.ticketStartDateGroup1}~
													${groupTicket.ticketExpiryDateGroup1}</p>
												<p>${groupTicket.ticketExpiryYnGroup1 ? '만료' : '사용중' }</p>
												<p>잔여횟수: ${groupTicket.ticketRemainingCountGroup1}회 남음 /
													총 ${groupTicket.ticketUsageCountGroup1}회</p>
												<p>사용가능지점: ${groupTicket.centerNameGroup1}</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</section>


					<section class="icon-list text-center py-3 mx-auto"
						style="max-width: 700px;">
						<div class="icon-grid">
							<div class="icon-row row">
								<div class="icon-item col-md-4">
									<a href="myNoticePage.do"> <i class="bi bi-megaphone"></i>
										<p>공지사항</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="getPaymentHistory.do"> <i class="bi bi-cash-coin"></i>
										<p>결제내역</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="myConnectedCenter.do"> <i class="bi bi-gear"></i>
										<p>연동센터관리</p>
									</a>
								</div>
							</div>
							<div class="icon-row row">
								<div class="icon-item col-md-4">
									<a href="myFAQpage.do"> <i class="bi bi-question"></i>
										<p>FAQ</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="questionPage.do"> <i class="bi bi-chat"></i>
										<p>문의사항</p>
									</a>
								</div>
								<div class="icon-item col-md-4">
									<a href="myTermsPage.do"> <i
										class="bi bi-file-earmark-text"></i>
										<p>약관 및 정책</p>
									</a>
								</div>
							</div>
						</div>
					</section>
				</div>
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