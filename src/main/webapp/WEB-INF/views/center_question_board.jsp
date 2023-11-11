<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_center_question_board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common_2.css">

<!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
</head>

<body>
	
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">PilaAdmin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a>
						</li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>Kevin Anderson</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="#"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link "
				href="center_detail_info"> <i class="bi bi-grid"></i> <span>내
						정보</span>
			</a></li>
			<!-- End Dashboard Nav -->
			<!-- 통계 예정  -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_CTS_management"> <i class="bi bi-person"></i><span>[센터]회원
						목록 조회</span>
			</a></li>
			<!-- End 회원관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_teacher_info"> <i class="bi bi-journal-text"></i><span>[센터]강사
						목록 조회</span>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">

				</ul></li>

			<!-- End 강사관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_class_management"> <i
					class="bi bi-layout-text-window-reverse"></i><span>[센터]수업 전체
						일정 조회</span>
			</a></li>
			<!-- End 수업관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_ticket_management"> <i class="bi bi-gem"></i><span>[센터]수강권
						관리</span>
			</a></li>
			<!-- End 수강권관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_notice_board"> <i class="bi bi-question-circle"></i><span>[센터]공지사항관리</span>
			</a></li>
			<!-- End 공지사항관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_send_notice_list"> <i class="bi bi-card-list"></i>
					<span>[센터]알림 발송 이력 관리</span>
			</a></li>
			<!-- End [센터]알림 발송 이력 관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_send_sms_list"> <i class="bi bi-envelope"></i> <span>[센터]문자
						발송 이력 관리</span>
			</a></li>
			<!-- End 문자 발송이력 관리 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="center_question_board"> <i class="bi bi-envelope"></i> <span>[센터]문의사항</span>
			</a></li>

			<!-- End [센터]문의사항 Nav -->
			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i>
					<span>Login</span>
			</a></li>
			<!-- End Login Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->
	<!-- ============================================================================================ -->
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의 사항</h1>
		</div>
		<!-- 검색시작 -->
		<div class="search-filter">
			<div class="search-filter-inner">

				<div class="serch-filter-content">
					<div class="search-top">
						<div class="col-md-3">
							<label for="inputState" class="form-label">검색</label> <select
								id="inputState" class="form-select">
								<option selected disabled>전체</option>
								<option>글 번호</option>
								<option>문의제목</option>
								<option>작성자</option>
								<option>문의일시</option>
								<option>문의상태</option>
								<option></option>
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
		<!-- <section class="search_menu search-filter">
			<div class="search_con">
				<div class="search">
					<div>
						<p>검색 조건:</p>
						<select>
							<option selected>전체</option>
							<option>이름</option>
							<option>수업명</option>
						</select> <input type="text" class="input_box" name="find_box" /> <input
							type="submit" value="search" class="btn btn-primary" /> <input
							type="reset" value="초기화" class="btn btn-primary">
					</div>
				</div>

				<div class="datesearch">
					<div class="search">
						<div>
							<p>수업 유형:</p>
							<select>
								<option selected>전체</option>
								<option>그룹</option>
								<option>개인</option>
							</select>
						</div>
					</div>
					<div class="search">
						<form action="url" method="post">
							<p>기간 검색:</p>
							<label for="date"></label><input class="date_select" type="date"
								id="start_date" /> ~ <label for="date"></label><input
								class="date_select" type="date" id="end_date" />
						</form>
					</div>
				</div>
			</div>
		</section> -->
		<!-- 검색끝 -->
		<div class="row mb-3">
			<label for="inputDate" class="col-sm-2 col-form-label">전체
				1,152건</label>
		</div>
		<!-- End Page Title -->

		<section class="section" style="margin-top: 10%;">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">

							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의제목</th>
										<th scope="col">작성자</th>
										<th scope="col">문의일시</th>
										<th scope="col">문의상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td><a href="#">Brandon Jacob</a></td>
										<td>Designer</td>
										<td>2016-05-25</td>
										<td><button type="submit"
												onclick="location.href='center_questionR' "
												class="btn btn-primary mb-3"
												style="font-size: 10px; background: red; border-color: red;">답변대기</button></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td><a href="#">Bridie Kessler</a></td>
										<td>Developer</td>
										<td>2014-12-05</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td><a href="#">Ashleigh Langosh</a></td>
										<td>Finance</td>
										<td>2011-08-12</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td><a href="#">Angus Grady</a></td>
										<td>HR</td>
										<td>2012-06-11</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td><a href="#">Raheem Lehner</a></td>
										<td>Dynamic Division Officer</td>
										<td>2011-04-19</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
							<div class="admin-screen-paging">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">이전</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">다음</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_2.js"></script>
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>PilaAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://PilaFixmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/ -->
			<a href="https://PilaFixmade.com/">PilaFixmade</a>
		</div>
	</footer>
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
		src="${pageContext.request.contextPath }/resources/admindatatable-info/assets/vendor/quill/quill.min.js"></script>
	<%-- <script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script> --%>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>

</body>

</html>