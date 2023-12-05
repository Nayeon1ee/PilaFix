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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_withdraw.css">
<body>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->
	<main>

		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="myPage.do">마이페이지</a></li>
					<li>withdrawal</li>
				</ol>
				<h2>회원탈퇴</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 700px">


				<div id="myPage" class="container">
					<div class="withdraw-container border rounded p-4 pb-2 mt-5">
						<p class="h5">탈퇴하시려면 비밀번호를 입력하세요.</p>
						
						<div class="row my-3">
							<label for="password" class="col-sm-2 col-form-label text-end">비밀번호
								:</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="password"
									name="password">
							</div>
						</div>
					<p class="error-message mt-2" id="error-message"></p>
					</div>
						<div class="text-end mt-3">
							<button class="btn btn-danger withdraw-button me-2">탈퇴하기</button>
						</div>
				</div>



			</div>

		</section>

	</main>
<!-- 탈퇴 확인 모달 -->
<div class="modal fade" id="confirmWithdrawalModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">회원 탈퇴 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                계속 진행하시면 회원정보가 사라집니다. 정말 탈퇴하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" onclick="confirmWithdrawal()">확인</button>
            </div>
        </div>
    </div>
</div>	
	
	
	
<script>
function confirmWithdrawal() {
    var password = $('#password').val();
    if (password === '') {
        alert('비밀번호를 입력하세요.');
        return;
    }

    // AJAX 요청을 통해 비밀번호 일치 여부 확인
    $.ajax({
        url: 'checkPassword.do',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ currentPassword: password }),
        success: function(response) {
            // 비밀번호가 일치할 경우 회원 탈퇴 처리
            if (response.status === 'success') {
                proceedWithWithdrawal(password); // 회원 탈퇴 진행
            } else {
                // 비밀번호 불일치 시 오류 메시지 표시
                $('#error-message').text('비밀번호가 일치하지 않습니다.');
            }
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            alert('비밀번호 확인 중 오류가 발생했습니다.');
        }
    });
}

function proceedWithWithdrawal(password) {
    // AJAX 요청을 통해 실제 회원 탈퇴 처리
    $.ajax({
        url: 'withdrawal.do',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ password: password }),
        success: function(response) {
            $('#confirmWithdrawalModal').modal('hide'); // 모달 숨기기
            if (response.status === 'success') {
                alert('성공적으로 탈퇴되었습니다.');
                window.location.href = 'memberLogin.do'; // 로그인 페이지로 리다이렉트
            } else {
                // 오류 메시지 표시
                $('#error-message').text(response.message);
            }
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            alert('탈퇴 처리 중 오류가 발생했습니다.');
        }
    });
}

</script>

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