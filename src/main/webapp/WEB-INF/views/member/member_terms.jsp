<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_member_terms.css">
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
					<li>Terms of Use and Policies</li>
				</ol>
				<h2>이용약관 및 정책</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">


				<div class="card mt-3">
					<div class="card-body">
						 <strong class="card-title" style="font-weight: bold; font-size: 20px; color: #333;">약관 및 정책</strong>
        <p class="card-text">
            서비스 이용에 동의하는 약관과 정책을 확인하세요.<br>
            이용 약관과 정책에 대한 요약을 제공합니다.
        </p>
					</div>
				</div>

<div class="accordion" id="accordionExample">
    <c:choose>
        <c:when test="${empty termsList}">
            <p>아직 등록된 글이 없습니다.</p>
        </c:when>
        <c:otherwise>
            <c:forEach items="${termsList}" var="terms">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button"
                                data-bs-toggle="collapse" data-bs-target="#faqCollapse${terms.tmCode}"
                                aria-expanded="true" aria-controls="faqCollapse${terms.tmCode}">
                            <div class="inquiry-item">
                                <div class="inquiry-details">
                                    <div class="inquiry-title">
                                    ${terms.tmName}
                                    </div>
                                </div>
                            </div>
                        </button>
                    </h2>
                    <div id="faqCollapse${terms.tmCode}"
                            class="accordion-collapse collapse"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                        
                        <div class="output-text" style="text-align:left; white-space: pre-line; ">   
                            ${terms.tmDetail}
                        </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>









				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->


	<!-- 내 js -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    var accordionButtons = document.querySelectorAll('.accordion-button');

    accordionButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            console.log('Button clicked!');

            // 현재 버튼의 아코디언 바디에 색상 적용
            var accordionBody = this.closest('.reply-item').querySelector('.reply-body');
            accordionBody.style.backgroundColor = this.classList.contains('collapsed') ? 'rgba(241, 243, 244, 0.5)' : '#fff';

            // 클릭한 버튼이 이미 열린 상태라면 닫음
            if (!this.classList.contains('collapsed')) {
                this.classList.add('collapsed');
                accordionBody.style.backgroundColor = '#F5F5F5';
            } else {
                // 클릭 시 다른 아코디언 버튼들을 닫음
                accordionButtons.forEach(function (otherButton) {
                    if (otherButton !== button) {
                        otherButton.classList.add('collapsed');
                        var otherAccordionBody = otherButton.closest('.reply-item').querySelector('.reply-body');
                        otherAccordionBody.style.backgroundColor = 'rgba(241, 243, 244, 0.5)';
                    }
                });

                // 현재 버튼 열기
                this.classList.remove('collapsed');
                accordionBody.style.backgroundColor = 'rgba(241, 243, 244, 0.5)';
            }
        });
    });
});
</script>


</body>

</html>