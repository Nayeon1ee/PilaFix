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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />



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
					<li>personal class schedule</li>
				</ol>
				<h2>개인 수업 스케줄</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">




				<!-- Top Bar Section -->

<section class="top_bar py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="mb-0 h5">
                    <!-- 날짜와 시간 표시 -->
                    <strong class="text-primary" style="display: inline-block; margin-right: 10px;">${lesson.lsDate}</strong>
                    <span class="text-muted" style="display: inline-block;">${fn:substring(lesson.lsTime, 11, 16)}</span>
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Explanation Section -->

				<!-- 수업 상세 정보 -->
				<section class="explanation text-center py-5">
				    <div class="container">
				        <p class="h3 mb-0">${lessonDetail.lsName}</p> <!-- 수업 제목 -->
				        <p class="lead">${lessonDetail.lsContent}</p> <!-- 수업 설명 -->
				    </div>
				</section>
				
				
<!-- Status Section -->
<section class="status pb-3 mt-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-4">
                <div class="image text-center">
                    <i class="bi bi-person fs-1"></i>
                </div>
            </div>
        <div class="col-md-4">

<div class="private_status text-center">
<c:choose>
<c:when test="${not empty lessonDetail.reservedMembers}">
	<c:forEach var="member"
		items="${lessonDetail.reservedMembers}" varStatus="status">
		<div class="col-md-2">
			<div class="member-check text-center">
				<input type="checkbox" class="btn-check"
					id="btn-check-${status.index}" name="selectedMemberCodes"
					value="${member.csMemberCode}" autocomplete="off">
				<label class="btn" for="btn-check-${status.index}">
					<i class="bi bi-person-circle"></i>
					<p class="h6 mb-0">${member.csName}</p>
				</label>
			</div>
		</div>
	</c:forEach>
</c:when>
<c:otherwise>
	<div class="col-md-12 text-center">
		<p>현재 예약한 회원이 없습니다.</p>
	</div>
</c:otherwise>
</c:choose>
</div>
<!-- 
				<div class="private_status text-center">
                    <p class="h6 mb-0">회원 이름: 홍길동</p>
                    <p class="h6 mb-0">전화번호: 010-1234-5678</p>
                </div>
                
 -->                
            </div>
            <div class="col-md-4">
                <div class="button2 text-center">
                    <!-- 예약 취소 -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cancelModal">예약 취소</button>
                    <!-- 출석 처리 -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#attendanceModal">출석 처리</button>
                </div>
            </div>
        </div>
    </div>
</section>




<!-- Previous Class Section 
<section class="board_list pb-3 mt-4">
    <div class="container">
        <h3 class="mb-3">이전 수업</h3>
        <table class="table datatable">
            <thead>
                <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">수업명</th>
                    <th scope="col">수업기간</th>
                    <th scope="col">수업유형</th>
                    <th scope="col">강사명</th>
                    <th scope="col">지점명</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">2</th>
                    <td><a href="#" class="admin-alink-color">척뿌 필라테스</a></td>
                    <td>2023.11.21 ~ 2024.02.21</td>
                    <td>그룹</td>
                    <td>홍길동</td>
                    <td>xx점 xx테스</td>
                </tr>
                <tr>
                    <th scope="row">1</th>
                    <td><a href="#" class="admin-alink-color">척뿌 필라테스</a></td>
                    <td>2023.11.21 ~ 2024.02.21</td>
                    <td>개인</td>
                    <td>강사명</td>
                    <td>xx점 xx테스</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>-->

<!-- Buttons Section -->

    <div class="container">
      <div class="d-flex justify-content-start">
					<button type="button" class="btn btn-primary ms-3"
						onclick="location.href='getTrainerLessonList.do'">목록</button>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap)common.js"></script>


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