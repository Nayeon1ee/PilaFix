<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li>login</li>
				</ol>
				<h2>로그인</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">

				<form action="memberLogin.do" method="post" class="row g-3">

					<div class="col-md-7 mx-auto">
						<div class="form-floating">
							<input type="email" class="form-control" name="csEmailId"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
					</div>

					<div class="col-md-7 mx-auto">
						<div class="form-floating">
							<input type="password" class="form-control" name="csPassword"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
						</div>
					</div>

					<div class="text-center col-12 mt-3">
						<input type="submit" class="btn btn-primary" value="로그인"
							style="width: 20%;">
					</div>

				</form>






				<div id="socialLogin"
					style="display: flex; justify-content: center;">
					<p style="margin-top: 20px; text-align: center;">소셜 계정으로 빠른
						로그인하기</p>
				</div>


				<!-- 소설계정 로그인 아이콘영역 -->
				<div id="socialButtons"
					style="display: flex; justify-content: center;">

					<div
						style="width: 150px; height: 40px; background: white; display: inline-block; margin-right: 10px;">
						<a href="[네이버 로그인 링크]"> <img
							src="${pageContext.request.contextPath}/resources/images/naver_login_b.png"
							alt="네이버 로그인"
							style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;">
						</a>
					</div>

					<div
						style="width: 150px; height: 40px; background: white; display: inline-block; margin-right: 10px;">
						<a href="[카카오 로그인 링크]"> <img
							src="${pageContext.request.contextPath}/resources/images/kakao_login_b.png"
							alt="카카오 로그인"
							style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;">
						</a>
					</div>

				</div>




				<div
					style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
					<a href="findpassword.do" class="link-dark"
						style="text-decoration: none; margin-right: 10px;"> 비밀번호 찾기 </a>
					<div class="vr" style="border-left: 2px solid; height: 20px;"></div>
					<a href="selectMeOrTr.do" class="link-body-emphasis"
						style="text-decoration: none; margin-left: 10px;"> 회원가입 </a>
				</div>




				<!-- 로그인 실패 메시지 표시 -->
				<c:if test="${not empty message}">
					<!-- <div class="alert alert-danger" role="alert"> -->
            ${message}
	<!-- </div> -->
				</c:if>


				<script type="text/javascript">
    function validateLoginForm() {
        var email = document.getElementById('csEmailId').value;
        var password = document.getElementById('csPassword').value;
        if (!email || !password) {
            alert('아이디와 비밀번호를 모두 입력해주세요.');
            return false;
        }
        return true;
    }

    //로그인실패
    function loginFailed() {
        alert('아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.');
    }   
    function passwordCertification(){
    	let email = document.getElementById(elementId: '');   	
    }

</script>
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
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>