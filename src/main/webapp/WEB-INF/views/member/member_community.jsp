<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Blog - Eterna Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

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

<!-- =======================================================
  * Template Name: Eterna
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">contact@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						5589 55488 55</span></i>
			</div>
			<div class="social-links d-none d-md-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="index.html">Home</a></li>
					<li>Community</li>
				</ol>
				<h2>커뮤니티</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			<div class="container mx-auto" style="max-width: 1000px;">




				<div class="row justify-content-center my-3">
					<div class="col-md-12 my-3">
						<div class="text-center">
							<h2 class="mb-4">자유게시판 작성</h2>
						</div>
						<div class="mt-3">
							<div class="alert alert-info border-0" role="alert">
								<strong>안내:</strong> 자유롭게 의견을 게시하는 공간입니다. 개인 정보가 포함되지 않도록 유의하시고,
								아래와 같은 규정에 따라 삭제될 수 있습니다.
							</div>
							<ul class="list-group border-0">
								<li class="list-group-item border-0">특정인, 단체 등을 비방하거나 명예
									훼손의 우려가 있는 경우</li>
								<li class="list-group-item border-0">유사내용 반복게재, 연습성, 오류,
									장난성의 글이나 정치적 목적이나 성향이 있는 경우</li>
								<li class="list-group-item border-0">영리목적의 상업성 광고, 저작권을 침해할
									수 있는 내용이나 욕설, 음란물 등 불건전 내용</li>
								<li class="list-group-item border-0">국가안전이나 보안에 위배되는 경우 및
									기타 해당 게시판의 취지와 부합하지 않을 경우</li>
							</ul>
						</div>
					</div>
				</div>





				<section class="section002 pb-1 mb-1">
					<nav class="navbar navbar-expand-lg">
						<div class="container-fluid">
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-bs-toggle="dropdown" aria-expanded="false"
										style="font-size: 16px;">검색 </a>
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="#">제목</a></li>
											<hr class="dropdown-divider">
											<li><a class="dropdown-item" href="#">글내용</a></li>
											<hr class="dropdown-divider">
											<li><a class="dropdown-item" href="#">제목+글내용</a></li>
										</ul></li>
								</ul>
								<form action="search" method="post" class="d-flex">
									<div class="input-group">
										<input type="search" name="search" class="form-control"
											placeholder="검색" aria-label="검색">
										<button type="submit" class="btn btn-outline-primary">검색</button>
									</div>
								</form>
							</div>
						</div>
					</nav>
				</section>


				
				<!-- 리스트 -->
				<table class="table datatable">
					<thead>
						<tr>
							<th scope="col">NO.</th>
							<th scope="col">글제목</th>
							<th scope="col">글내용</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">11</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">xx점 후기</a></td>
							<td>토미강사 추천 어쩌구 저쩌구 어쩌구 저쩌구</td>
							<td>김xx</td>
							<td>2016-05-25</td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ss점 후기</a></td>
							<td>ss강사 비추 가지마셈</td>
							<td>이ss</td>
							<td>2014-12-05</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">한달만에 10kg뺀 썰 푼다</a></td>
							<td>인스타 공구 어쩌구 저쩌구 효소가 어쩌구</td>
							<td>신00</td>
							<td>2011-08-12</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">너모 힘들다</a></td>
							<td>집가고 싶다아아아아아아아아아아</td>
							<td>구99</td>
							<td>2012-06-11</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
							<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
							<td>강22</td>
							<td>2011-04-19</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td><a href="member_community_detail.do"
								class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
							<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
							<td>강33</td>
							<td>2011-04-19</td>
						</tr>
					</tbody>
				</table>
				<!-- 리스트 끝 -->

				<div class="d-flex justify-content-between">
					<!-- 페이징 처리 -->
					<div class="blog-pagination me-3">
						<ul class="justify-content-start">
							<li><a href="#">1</a></li>
							<li class="active"><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
					</div>
					<!--  페이징 처리 끝 -->

					<!-- 글 등록 버튼 -->
					<div class="text-end me-3">
						<a href="member_community_register.do" class="btn btn-primary">
							<i class="bi bi-pencil"></i> 글 등록
						</a>
					</div>

					<!-- 페이징 처리 js -->
					<script>
						document
								.addEventListener(
										"DOMContentLoaded",
										function() {
											var itemsPerPage = 10; // 페이지당 아이템 개수 설정
											var currentPage = 1; // 현재 페이지 설정

											showItems(currentPage, itemsPerPage);

											var paginationContainer = document
													.querySelector(".blog-pagination");
											var pageLinks = paginationContainer
													.querySelectorAll("ul li a");

											pageLinks
													.forEach(function(link) {
														link
																.addEventListener(
																		"click",
																		function(
																				event) {
																			event
																					.preventDefault();

																			// 클릭한 페이지로 현재 페이지 업데이트
																			currentPage = parseInt(link.textContent);

																			showItems(
																					currentPage,
																					itemsPerPage);

																			pageLinks
																					.forEach(function(
																							l) {
																						l.parentElement.classList
																								.remove("active");
																					});
																			link.parentElement.classList
																					.add("active");
																		});
													});
										});

						function showItems(page, itemsPerPage) {
							var items = document
									.querySelectorAll(".datatable tbody tr");

							items.forEach(function(item) {
								item.style.display = "none";
							});

							var startIndex = (page - 1) * itemsPerPage;
							var endIndex = startIndex + itemsPerPage;

							for (var i = startIndex; i < endIndex; i++) {
								if (items[i]) {
									items[i].style.display = "table-row";
								}
							}
						}
					</script>
					<!-- 페이징 처리 js -->

				</div>



			</div>
		</section>
		<!-- End Blog Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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

	<!--  내 js -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>


	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>
</body>

</html>