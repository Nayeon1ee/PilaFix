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
	href="${pageContext.request.contextPath }/resources/css/style_admin_info_getboard.css">
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
	<%@ include file="admin_header_common.jsp"%>
	<!-- ============================================================================================ -->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>센터 관리</h1>
			<nav>
				<ol class="breadcrumb">
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
							<!-- 검색 -->
							<div class="search-filter">
								<div class="search-filter-inner">
									<div class="serch-filter-content">
										<div class="search-top">
											<div class="col-md-3">
												<label for="inputState" class="form-label">검색</label> <select
													id="inputState" class="form-select">
													<option selected disabled>전체</option>
													<option>번호</option>
													<option>센터명</option>
													<option>아이디</option>
													<option>대표자명</option>
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
													<option selected disabled>회원상태</option>
													<option>계약회원</option>
													<option>해지회원</option>
													<option>만료회원</option>
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
							<!-- 검색끝 -->
							<!-- <section class="search_menu search-filter">
								<div class="search_con">
									<div class="search">
										<div>
											<p>검색 조건:</p>
											<select>
												<option selected>전체</option>
												<option>번호</option>
												<option>센터명</option>
												<option>아이디</option>
												<option>대표자명</option>
											</select> <input type="text" class="input_box" name="find_box" /> <input
												type="submit" value="search" class="btn btn-primary" /> <input
												type="reset" value="초기화" class="btn btn-primary">
										</div>
									</div>

									<div class="datesearch">
										<div class="search">
											<div>
												<p>회원 상태:</p>
												<select>
													<option selected>전체</option>
													<option>계약회원</option>
													<option>해지회원</option>
													<option>만료회원</option>
												</select>
											</div>
										</div>
										<div class="search">
											<form action="url" method="post">
												<p>기간 검색:</p>
												<label for="date"></label><input class="date_select"
													type="date" id="start_date" /> ~ <label for="date"></label><input
													class="date_select" type="date" id="end_date" />
											</form>
										</div>
									</div>
								</div>
							</section> -->
							<div class="d-flex justify-content-end">
								<button type="button" class="btn btn-primary mt-3"
									onclick="location.href='admin_center_management_regist.do'">
									센터등록</button>
							</div>
						</div>


						<div class="row">
							<div class="col-lg-12">

								<div class="card">
									<div class="card-body">

										<!-- Table with stripped rows -->
										<table class="table datatable">
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">센터명</th>
													<th scope="col">아이디</th>
													<th scope="col">대표자이름</th>
													<th scope="col">계약일자</th>
													<th scope="col">회원상태</th>
													<th scope="col">만료여부</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">1</th>
													<td><a href=admin_center_management.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
												<tr>
													<th scope="row">2</th>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
												<tr>
													<th scope="row">2</th>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
												<tr>
													<th scope="row">3</th>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
												<tr>
													<th scope="row">4</th>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
												<tr>
													<th scope="row">6</th>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">A</a></td>
													<td><a href=admin_center_management_detail.do
														class="admin-alink-color">010-1111-2222</a></td>
													<td>Designer</td>
													<td>2023-05-25</td>
													<td>계약회원</td>
													<td>Y</td>
												</tr>
											</tbody>
										</table>
										<!-- End Table with stripped rows -->
									</div>
								</div>
							</div>
						</div>
		</section>
		</div>
		</div>

		</div>
		</div>
		</section>

	</main>
	<!-- End #main -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>




	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp"%>
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
</body>
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
</script>
</html>