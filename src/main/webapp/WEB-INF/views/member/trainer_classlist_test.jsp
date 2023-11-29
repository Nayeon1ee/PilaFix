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
	href="${pageContext.request.contextPath}/resources/css/style_classlist.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">


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
					<li>trainer class list</li>
				</ol>
				<h2>강사 수업 관리</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">




				<!-- 검색창 -->
				<div class="container" style="max-width: 900px; margin-right: 0px;">
					<div class="search-filter mx-auto">
						<div class="search-filter-inner">
							<div class="serch-filter-content">
								<div class="row py-2 my-4">
									<div class="col-md-3 me-1">
										<label for="inputState" class="form-label">검색</label> <select
											id="inputState" class="form-select" style="width: 100%;">
											<option selected disabled>전체</option>
											<option>그룹수업</option>
											<option>개인수업</option>
										</select>
									</div>
									<div class="col-md-6 pt-2 mt-4">
										<div class="input-group">
											<input type="text" class="form-control me-2" id="inputCity"
												placeholder="검색어를 입력해주세요">
											<div class="input-group-append">
												<button type="submit" class="btn btn-primary search">검색</button>
												<button type="reset" class="btn btn-primary search"
													id="resetButton">초기화</button>
											</div>
										</div>
									</div>
								</div>



								<div class="row mb-3">
									<div class="col-md-3 me-2">
										<label for="inputState2" class="form-label">처리상태</label> <select
											id="inputState2" class="form-select">
											<option selected disabled>회원상태</option>
											<option>계약회원</option>
											<option>해지회원</option>
											<option>만료회원</option>
										</select>
									</div>
									<div class="col-md-5">
										<div class="input-group mb-3">
											<label for="inputState" class="form-label mb-2">기간검색</label>
											<div class="row">
												<div class="col-sm-6 px-0">
													<div class="input-group">
														<input type="date" class="form-control rounded-start"
															id="startDate">

													</div>
												</div>
												<div class="col-sm-6 pe-2 pr-2">
													<div class="input-group">
														<input type="date" class="form-control rounded-end"
															id="endDate">

													</div>
												</div>
											</div>
										</div>
									</div>


								</div>



							</div>
						</div>
					</div>
				</div>










				<!-- 리스트 시작-->
				

				<!-- 그룹수업 = "getLessonByTrainerG.do" 개인수업 = "getLessonByTrainerP.do" -->
				<table class="table datatable">
					<thead>
						<tr>
							<th scope="col">수업코드</th>
							<th scope="col">그룹/개인</th>
							<th scope="col">수업명</th>
							<th scope="col">수업일자</th>
							<th scope="col">수업시간</th>
							<th scope="col">진행인원</th>
							<th scope="col">상태</th>
							<th scope="col">센터명</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${lessonList == null }">
							<tr>
								<td colspan="5">현재 진행중인 수업이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="lesson" items="${lessonList }">
							<tr>
								<td>${lesson.lsCode}</td>
								<td>${lesson.lsType}</td>
								<td><a href="getTrainerLesson.do?lsCode=${lesson.lsCode}">${lesson.lsName}</a></td>
								<!-- 날짜 형식 변환 -->						
								<td>${lesson.lsDate}</td>
								<!-- 시간 형식 변환 -->
								<td>${fn:substring(lesson.lsTime, 11, 16)}</td> 
								<!-- 예약된 인원/전체 인원 -->
								<td>${lesson.reservedCount}/${lesson.lsCapacity}</td> 
								<!-- 수업시간lsTime이 현재시간 지나면 '수업종료' -->
						        <td>
								<c:set var="correctTime" value="${fn:substring(lesson.lsTime, 11, 19)}" />
							    <!-- lsDate와 시간 부분을 결합하여 완전한 날짜-시간 문자열 생성 -->
							    <c:set var="fullLessonDateTime" value="${lesson.lsDate} ${correctTime}" />
							    <fmt:parseDate value="${fullLessonDateTime}" pattern="yyyy-MM-dd HH:mm:ss" var="lessonDateTime"/>
							    <!-- 현재 시간과 비교 -->
							    <c:choose>
							        <c:when test="${lesson.lsCloseYN eq 'true'}">폐강</c:when>
							        <c:when test="${lessonDateTime lt currentTime}">수업종료</c:when>
							        <c:otherwise>진행중</c:otherwise>
								</c:choose>
						        </td>
								<td>${lesson.lsCenterName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 리스트 끝 -->

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