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


<link
	href="${pageContext.request.contextPath }/resources/css/center_teacher_info.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="stylesheet">


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
				class="d-none d-lg-block">PilaFix</span>
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
				</a>
				<!-- End Notification Icon -->

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

					</ul>
					<!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a>
				<!-- End Messages Icon -->

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

					</ul>
					<!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
				</a>
				<!-- End Profile Iamge Icon -->

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

					</ul>
					<!-- End Profile Dropdown Items --></li>
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
			<h1>강사관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">필요 시 작성</li>
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
							<h5 class="card-title">강사 상세 정보</h5>
							<p>강사의 상세정보 페이지입니다.</p>

							<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->


							<div class="row">
								<div class="col-xl-4">

									<div class="card card_box_shadow">
										<div
											class="card-body profile-card pt-4 d-flex flex-column align-items-center">

											<img src="#" alt="logo" class="rounded-circle rounded-logo">

											<h5>홍길동</h5>
											<h5>1992.01.08 (만 00세)</h5>
											<div class="social-links mt-2">
												<table class="CTS_information00">
													<tr>
														<td class="CTS_information01">회원번호</td>
														<td>010408</td>
													</tr>
													<tr>
														<td class="CTS_information01">연락처</td>
														<td>010-1234-5678</td>
													</tr>
													<tr>
														<td class="CTS_information01">이메일</td>
														<td>choi@naver.com</td>
													</tr>
													<tr>
														<td class="CTS_information01">회원등록일</td>
														<td>2023.01.08</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

								</div>

								<div class="col-xl-8">

									<div class="card card_box_shadow">
										<div class="card-body pt-3">
											<!-- Bordered Tabs -->
											<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">

												<li class="nav-item" role="presentation">
													<button class="nav-link active" data-bs-toggle="tab"
														data-bs-target="#profile-overview" aria-selected="true"
														role="tab">수업 진행 현황</button>
												</li>

											</ul>

											<div class="tab-pane fade show active profile-overview"
												id="profile-overview" role="tabpanel">
												<h5 class="card-title st_session_pass_p">전월 개인 수업 현황</h5>
												<div class="row">
													<div class="col-lg-3 col-md-4 label">기준일자</div>
													<div class="col-lg-9 col-md-8">2023.10.01~2023.10.31</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수업건수</div>
													<div class="col-lg-9 col-md-8">8건</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">비고</div>
													<div class="col-lg-9 col-md-8">폐강 1건</div>
												</div>



												<hr class="st_session_pass_hr">


												<h5 class="card-title st_session_pass">전월 그룹 수업 현황</h5>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기준일자</div>
													<div class="col-lg-9 col-md-8">2023.10.01~2023.10.31</div>
												</div>
												<div class="row">
													<div class="col-lg-3 col-md-4 label">수업건수</div>
													<div class="col-lg-9 col-md-8">8건</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">비고</div>
													<div class="col-lg-9 col-md-8">-</div>
												</div>


											</div>




										</div>
										<!-- End Bordered Tabs -->

									</div>
								</div>

							</div>



							<hr>


							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">개인 수업</h5>
									<p>강사가 진행하고있는 개인수업 내역입니다.</p>

									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일자</th>
												<th scope="col">수업시작시간</th>
												<th scope="col">수업종료시간</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 07:00</td>
												<td>오후 08:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 06:00</td>
												<td>오후 07:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 05:00</td>
												<td>오후 06:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 04:00</td>
												<td>오후 05:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 03:00</td>
												<td>오후 04:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->
									<!-- 페이징 처리 시작 -->
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
									<!-- 페이징 처리 끝 -->



								</div>
							</div>



							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">그룹 수업</h5>
									<p>강사가 진행하고있는 그룹수업 내역입니다.</p>

									<!--검색창
			
			 -->
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일자</th>
												<th scope="col">수업시작시간</th>
												<th scope="col">수업종료시간</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 07:00</td>
												<td>오후 08:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 06:00</td>
												<td>오후 07:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 05:00</td>
												<td>오후 06:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 04:00</td>
												<td>오후 05:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 03:00</td>
												<td>오후 04:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->


									<!-- 페이징 처리 시작 -->
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
									<!-- 페이징 처리 끝 -->
								</div>
							</div>



							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">전체 수업 내역</h5>
									<p>강사가 현재까지 센터에서 진행한 전체 수업의 내역입니다.</p>
									<p>
										전체 <span id="totalRequests">0</span>건
									</p>
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업시작일자</th>
												<th scope="col">수업종료일자</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->

									<!-- 페이징 처리 시작 -->
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
									<!-- 페이징 처리 끝 -->
								</div>
							</div>













						</div>
					</div>







				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

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
	<script
		src="${pageContext.request.contextPath}/resources/js/center_teacher_info.js"></script>

</body>

</html>