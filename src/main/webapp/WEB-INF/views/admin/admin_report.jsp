<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Charts / ApexCharts - PilaAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/assets/css/style.css">

<!-- 내가 만든 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_baned_comment.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common_1.css">

<!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
</head>

<body>
	<%@ include file="admin_header_common.jsp" %>
	<!-- ============================================================================================ -->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>신고글 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item">필요 시 작성</li> -->
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">신고글 목록</h5>
							<!-- <p>간략한 설명</p> -->
							<!-- 검색필터 시작 -->
							<div class="search-filter">
								<div class="search-filter-inner">

									<div class="serch-filter-content">
										<div class="search-top">
											<div class="col-md-3">
												<label for="inputState" class="form-label">검색</label> <select
													id="inputState" class="form-select">
													<option selected disabled>전체</option>
													<option>글 제목</option>
													<option>작성자</option>
												</select>
											</div>
											<div class="serch-input">
												<div class="col-md-6">
													<input type="text" class="form-control" id="inputCity"
														placeholder="검색어를 입력해주세요">
												</div>
												<div class="search-btn">
													<button type="submit" class="btn btn-primary search">검색</button>
													<button type="reset" class="btn btn-primary search"
														id="resetButton">초기화</button>
												</div>
											</div>
										</div>

										<div class="search-date">
											<div class="col-md-3">
												<label for="inputState" class="form-label">처리상태</label> <select
													id="inputState2" class="form-select">
													<option selected disabled>전체</option>
													<option>처리완료</option>
													<option>처리대기</option>
												</select>
											</div>
											<div class="date-filter">
												<label for="inputState" class="form-label">기간검색</label>
												<div class="col-sm-12">
													<input type="date" class="form-control-date" id="startDate">
													<span>~</span> <input type="date" class="form-control-date"
														id="endDate">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 검색필터 끝 -->
							<!-- 게시판 시작 -->
							<h5 class="card-title"></h5>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목번호</th>
										<th scope="col">유형</th>
										<th scope="col">작성일</th>
										<th scope="col">신고건수</th>
										<th scope="col">처리상태</th>
										<th scope="col">IP</th>
									</tr>
								</thead>
								<c:if test="${ComplaintsInfoList == null }">
									<tr>
										<td colspan="7">등록된 글이 없습니다.</td>
									</tr>
								</c:if>
								<tbody>
									<c:forEach var="ComplaintsInfo" items="${ComplaintsInfoList }">
										<tr>
											<td>${ComplaintsInfo.cpCode }</td>
											<td><a href="getComplaintsInfo.do?cpTargetPostNumber=${ComplaintsInfo.cpTargetPostNumber }">${ComplaintsInfo.cpTargetPostNumber }</a></td>
											<td>${ComplaintsInfo.cpTargetPostType }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ComplaintsInfo.cpDate }"/></td>
											<td>${ComplaintsInfo.targetWriterMemberCode}</td>
											<td>${ComplaintsInfo.blamerMemberCode }</td>
											<td>${ComplaintsInfo.blamerIp }</td>
											<%-- <td><a href="updateCpInfo.do?cp_code=${cpInfo.cp_code }">수정</a> | <a href="deleteCpInfo.do?cp_code=${cpInfo.cp_code }">삭제</a></td> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 페이징 처리 시작 -->
			
							<!-- 페이징 처리 끝 -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp" %>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>

	<!--내가 만든 JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
</body>

</html>