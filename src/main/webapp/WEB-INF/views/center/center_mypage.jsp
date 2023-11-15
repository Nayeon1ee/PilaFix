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
	href="${pageContext.request.contextPath }/resources/css/style_center_detail_info.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/style_admin_common.css"
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
			<h1>센터의 마이페이지</h1>
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
							<h5 class="card-title">센터의 상세정보 페이지</h5>
							<p>센터의 상세정보를 조회하고 비밀번호 변경이 가능한 페이지</p>

							<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->


							<p style="magin-top: 1%;"></p>
							<!--  
							<div class="row mb-300" style="width: 122%; margin-top: 1%;">
								<div class="col-sm-10">
									<input type="text" class="form-control" value="센터등록" disabled>
								</div>
							</div>
							-->

							<form name="admin_info">



								<div class="col-120">
									<label for="inputAddress5" class="form-label">아이디</label>
								</div>
								<div class="col-120">
									<input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerEmail }" 
										 style="width: 93%;" disabled>
									<div class="row mb-3"></div>
								</div>


								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이름</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerName }" 
										placeholder="1234 Main St" disabled>
								</div>
								<div class="col-40" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control" id="inputAddress2" value="${centerInfo.businessRegistrationNumber }"
										placeholder="Apartment, studio, or floor" disabled>
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이메일</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerEmail }"
										placeholder="이메일을 입력하세요" disabled>
									<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 번호</label>
									<div class="col-400" style="display: flex;" >
										<select class="project_title" name="type" id="project_title" disabled="disabled">
											<option selected >${centerInfo.ownerPhoneNumber1 }</option>
											<option value="010">010</option>
											<option value="011">011</option>
										</select> <input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerPhoneNumber2 }"
											disabled> <input type="text" class="form-control" value="${centerInfo.ownerPhoneNumber3 }"
											id="inputAddres5s" disabled>
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>
								<div class="col-30" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">센터명</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctName }"
										placeholder="센터명" disabled>
								</div>
								<div class="col-40" >
									<label for="inputAddress5" class="form-label">센터 번호</label>
									<div class="col-400" style="display: flex;" >
										<select disabled >
											<option selected >${centerInfo.ctPhoneNumber1 }</option>
											<option>010</option>
											<option>011</option>
										</select> <input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctPhoneNumber2 }"
											disabled> <input type="text" class="form-control" value="${centerInfo.ctPhoneNumber3 }"
											id="inputAddres5s" disabled>
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>

								<div class="col-6">
									<label for="inputAddress5" class="form-label">센터주소</label>
								</div>
								<div class="col-120">
									<input type="text" class="form-control" id="inputAddres5s"
										placeholder="우편번호" style="width: 42%;" disabled value="${centerInfo.ctAddress1 }">

									<div class="row mb-3"></div>
								</div>
								<div class="col-12">
									<label for="inputAddress5" class="form-label">상세주소 1</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctAddress2 }"
										placeholder="1234 Main St" disabled>
								</div>
								<div class="col-12" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">상세주소 2</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctAddress3 }"
										placeholder="Apartment, studio, or floor" disabled>
								</div>


							</form>
							<!-- End General Form Elements -->




							<h5 class="card-title">비밀번호 변경</h5>
							<p>비밀번호 변경을 원하면 아래 버튼을 클릭하세요.</p>
							<!-- Basic Modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#basicModal">
								비밀번호 변경</button>
							<div class="modal fade" id="basicModal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">비밀번호변경</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<div class="tab-content pt-2">

												<div class="tab-pane fade pt-3 active show"
													id="profile-change-password" role="tabpanel">
													<!-- Change Password Form -->
													<form>

														<div class="row mb-3">
															<label for="currentPassword"
																class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
															<div class="col-md-8 col-lg-9">
																<input name="password" type="password"
																	class="form-control" id="currentPassword">
															</div>
														</div>

														<div class="row mb-3">
															<label for="newPassword"
																class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
															<div class="col-md-8 col-lg-9">
																<input name="newpassword" type="password"
																	class="form-control" id="newPassword">
															</div>
														</div>

														<div class="row mb-3">
															<label for="renewPassword"
																class="col-md-4 col-lg-3 col-form-label">새 비밀번호
																확인</label>
															<div class="col-md-8 col-lg-9">
																<input name="renewpassword" type="password"
																	class="form-control" id="renewPassword">
															</div>
														</div>

														<div class="text-center">
															<button type="submit" class="btn btn-primary">비밀번호변경</button>
														</div>
													</form>
													<!-- End Change Password Form -->

												</div>

											</div>
											<!-- End Bordered Tabs -->







										</div>
										<!--  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div> -->
									</div>
								</div>
							</div>
							<!-- End Basic Modal-->










						</div>







					</div>
				</div>
		</section>

	</main>
	<script type="text/javascript">
	var select_project_title=project_title.options[project_title.selectedIndex].value;
	</script>
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
	<script type="text/javascript">
		function button_remove() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				document.form.submit();
			} else { //취소
				return;
			}
		}

		function button_success() {
			alert("수정 완료 되었습니다.");
			location.href = "admin_info_boardlist";
		}
		
		</body>

		</html>
	