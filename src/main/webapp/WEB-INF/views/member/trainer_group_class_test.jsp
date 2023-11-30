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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.15.0/font/bootstrap-icons.css">
</head>
<!-- 내 css -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />

<style>
    .btn-check:checked + .btn {
        background-color: #9b56e9;
        color: #fff;
        border-color: #9b56e9;
    }

    .btn-check:focus + .btn {
        box-shadow: 0 0 0 0.25rem rgba(155, 86, 233, 0.25);
    }

    .btn-check:checked:hover + .btn {
        background-color: #8338ec;
        border-color: #8338ec;
    }
</style>
    
<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common_tr.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>Group Class Schedule</li>
				</ol>
				<h2>그룹 수업 스케줄</h2>
				
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">


				<!-- 수업 상세 정보 -->
				<section class="explanation text-center py-5">
				    <div class="container">
				    <p class="h3 mb-0">
				    <strong class="text-primary" >
                        ${lessonDetail.lsName}
                    </strong></p>
                    <br>

				    <p class="lead">${lessonDetail.lsContent} <br> 부가적인 수업설명들이 추가된다. </p> <!-- 수업 설명 -->

				    <!-- 수업시간 --> 
					<span  style="display: inline-block;">
                        ${lessonDetail.lsDate} 
                    </span>
                    <c:set var="hour" value="${fn:substring(lessonDetail.lsTime, 11, 13)}" /> <!-- 시간 추출 -->
                    <c:choose>
                        <c:when test="${hour lt 12}"> <!-- 오전 확인 -->
                            오전
                        </c:when>
                        <c:otherwise>
                            오후
                        </c:otherwise>
                    </c:choose>
                    <span  style="display: inline-block;">
                        ${fn:substring(lessonDetail.lsTime, 11, 16)}
                    </span>
				    </div>
				</section>


<!-- 출석 통계 -->
<div class="status py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4 text-center">예약: ${lessonDetail.reservedCount}</div>
            <div class="col-md-4 text-center">출석: ${lessonDetail.attendedCount}</div>
            <div class="col-md-4 text-center">결석: ${lessonDetail.absentCount}</div>
        </div>
    </div>
</div>

<!-- 수업 예약한 회원 목록 -->
<section class="member_list py-4 my-3">
    <div class="container">
        <form id="form" method="post" action="updateAttendG.do">
            <input type="hidden" name="lessonCode" value="${lessonDetail.lsCode}">

            <div class="row justify-content-center">
                <c:forEach var="member" items="${lessonDetail.reservedMembers}" varStatus="status">
                    <div class="col-md-2">
                        <div class="member-check text-center">
                            <input type="checkbox" class="btn-check" id="btn-check-${status.index}" name="selectedMemberCodes" value="${member.csMemberCode}" autocomplete="off">
                            <label class="btn" for="btn-check-${status.index}">
                                <i class="bi bi-person-circle"></i>
                                <p>${member.csName}</p>
                            </label>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-flex justify-content-center mt-4">
                <button type="submit" class="btn btn-primary" id="attendanceButton">출석처리</button>
                <button type="button" class="btn btn-primary ms-2" onclick="location.href='getTrainerLessonList.do'">목록</button>
            </div>
        </form>
    </div>
</section>


<!-- 참고해보려고 한거 https://devfootprint.tistory.com/58 -->
<!-- 
<div class="container">
    <div class="d-flex justify-content-center">
        <form action="updateAttendG.do" method="post" class="me-2">
        <button type="submit" class="btn btn-primary" id="attendanceButton">출석처리</button>  
        <button type="button" class="btn btn-primary" onclick="location.href='getTrainerLessonList.do'">목록</button>
    </div>
</div>
 -->

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
<!-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script> -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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