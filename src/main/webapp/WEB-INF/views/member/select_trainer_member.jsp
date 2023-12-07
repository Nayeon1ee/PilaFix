<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>강사/회원 선택화면</title>
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

<!-- 내가 넣은 js -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<style>
    #teacherCard {
        width: 350px; /* 넓이를 조절할 수 있는 원하는 값으로 변경하세요 */
        /* 다른 스타일 속성도 필요하다면 여기에 추가하세요 */
    }
    
    #memberCard {
    width: 350px;
    }
</style>

<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>select trainer & member</li>
				</ol>
				<h2>회원 & 강사 선택</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services py-4">
			<div class="container" style="max-width: 1000px">





				<div class="row justify-content-center">
					<!-- 강사 선택 카드 -->
					<div class="col-md-5">
						<div class="icon-box" id="teacherCard">
							<div class="icon">
								<i class="bi bi-person-check"></i>
							</div>
							<h4>
								<label> 강사 </label>
							</h4>
							<p style="font-size: 16px; font-weight: 500;">강사로 가입하시고 싶으시면 강사를 선택하세요.</p>
						</div>
					</div>

					<!-- 회원 선택 카드 -->
					<div class="col-md-5">
						<div class="icon-box" id="memberCard">
							<div class="icon">
								<i class="bi bi-person"></i>
							</div>
							<h4>
								<label> 회원</label>
							</h4>
							<p style="font-size: 16px; font-weight: 500;">회원으로 가입하고 싶으시면 회원을 선택하세요.</p>
						</div>
					</div>
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

<!-- 강사/회원 클릭하면 각자 다른 파라미터값 물고 회원가입화면으로 넘어감 -->
<script>
    $(document).ready(function () {
        // 강사 선택 카드 클릭 이벤트
        $("#teacherCard").click(function () {
            // 리다이렉션
            window.location.href = "getUserRole.do?csRoleCode=TR";
        });

        // 회원 선택 카드 클릭 이벤트
        $("#memberCard").click(function () {
            // 리다이렉션
            window.location.href = "getUserRole.do?csRoleCode=ME";
        });
    });
</script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>

</html>