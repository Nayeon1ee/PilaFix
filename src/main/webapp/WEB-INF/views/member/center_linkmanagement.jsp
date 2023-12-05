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
<link href="assets/img/apple-touchf-icon.png" rel="apple-touch-icon">

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
					<li><a href="myPage.do">마이페이지</a></li>
					<li>Link Center Management</li>
				</ol>
				<h2>연동 센터 관리</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">

				<!-- 				<div id="userInfo" class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div> -->


				<div class="container">

					<c:choose>
						<c:when test="${empty centerList}">
							<!-- 연동된 센터가 없을 때 출력할 메시지 -->
							<p>연동된 센터가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${centerList}" var="center">
								<div class="card mt-3">
									<div class="card-body">
										<h5 class="card-title">그룹수업</h5>

										<p class="card-text mt-3">
											<strong>센터 정보:</strong> ${center.ctName}
										</p>

										<!-- 해제 버튼을 눌렀을 때 모달 띄우기 -->
										<div class="d-flex justify-content-end">
											<button type="button" class="btn btn-secondary me-2"
												data-bs-toggle="modal"
												data-bs-target="#disconnectModal${center.ctCode}">
												연동해제</button>
										</div>

										<!-- 연동센터 해제 모달 -->
										<div class="modal fade" id="disconnectModal${center.ctCode}"
											tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">연동센터 해제</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p>센터 정보: ${center.ctName}</p>
														<p>정말로 연동 해제하시겠습니까?</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary"
															data-center-code="${center.ctCode}"
															onclick="disconnectCenter(this)">확인</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>


					<%-- <c:forEach items="${centerList}" var="center">
    <div class="card mt-3">
        <div class="card-body">
            <h5 class="card-title">그룹수업</h5>

            <p class="card-text mt-3">
                <strong>센터 정보:</strong> ${center.ctName} - ${center.ctCode}
            </p>
            
            <form action="disconnectCenter.do" method="post">
                <input type="hidden" name="selectedCenterCode" value="${center.ctCode}">
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-danger">연동 해제</button>
                </div>
            </form>
        </div>
    </div>
</c:forEach> --%>



					<div class="container py-3 my-2">
						<div class="row">
							<div class="col-12">
								<div class="d-flex justify-content-end">
									<a href="ct.do" class="btn btn-success btn-lg"
										style="background-color: #9b56e9; border-color: #9b56e9; font-size: 16px;">
										센터 연동 추가하기 </a>
								</div>
							</div>
						</div>
					</div>

				</div>


				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>

	<!-- End #main -->



	<!-- 모달의 확인 누르면 연동센터 해제 진행 -->
	<script>
function disconnectCenter(buttonElement) {
    var selectedCenterCode = buttonElement.getAttribute('data-center-code');

    fetch('disconnectCenter.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'selectedCenterCode=' + encodeURIComponent(selectedCenterCode)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        window.location.href = 'myConnectedCenter.do'; // 연동센터 목록 페이지로 리다이렉트
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
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