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
			<h1>신고글 정보</h1>
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
							<h5 class="card-title">신고글 상세정보</h5>
							<!-- <p>간략한 설명</p> -->

							<!-- Multi Columns Form -->
							<form class="row g-3">
								<div class="col-md-2">
									<label class="form-label">글번호</label> 
									<input type="text" readonly disabled class="form-control" value="${ComplaintsInfo.cpCode }">
								</div>
								<div class="col-md-5">
									<label class="form-label">작성자</label> 
									<input type="text" readonly disabled class="form-control" value="김xx">
								</div>
								<div class="col-md-5">
									<label class="form-label">작성일</label> 
									<input type="text" readonly disabled class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ComplaintsInfo.cpDate }"/>'>
								</div>
								<div class="col-md-12">
									<label class="form-label">글 제목</label> <input type="text"
										readonly disabled class="form-control" value="xx점 토미 강사 추천">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 내용</label>
									<textarea readonly disabled class="form-control"
										style="height: 300px;">xx점 토미강사 추천 굳굳</textarea>
								</div>
								<div class="baned-info">신고 정보</div>
								<div class="col-md-5">
									<label class="form-label">신고사유</label> <input type="text"
										readonly disabled class="form-control" value="[욕설/혐오/차별적 표현]">
								</div>
								<div class="col-md-3">
									<label class="form-label">신고자</label> <input type="text"
										readonly disabled class="form-control" value="사오정">
								</div>
								<div class="col-md-4">
									<label class="form-label">신고자 이메일</label> <input type="text"
										readonly disabled class="form-control" value="sa@naver.com">
								</div>
								<div class="col-md-5">
									<label class="form-label">신고사유</label> <input type="text"
										readonly disabled class="form-control" value="[스팸/홍보/도배글]">
								</div>
								<div class="col-md-3">
									<label class="form-label">신고자</label> <input type="text"
										readonly disabled class="form-control" value="가나다">
								</div>
								<div class="col-md-4">
									<label class="form-label">신고자 이메일</label> <input type="text"
										readonly disabled class="form-control" value="ga@naver.com">
								</div>
								<div class="text-center">
									<div class="text-center">
										<div class="btn-toolbar justify-content-end d-flex"
											role="toolbar">
											<div class="btn-group me-2">
												<button type="button" class="btn btn-secondary"
													onclick="location.href='admin_report.do'">취소</button>
											</div>
											<div class="btn-group me-3">
												<button type="button" class="btn btn-danger"
													data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- End Multi Columns Form -->

						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- 삭제 버튼 모달 -->
		<div class="modal fade" id="basicModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">확인 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href=‘admin_report.do’”="">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->

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

	<!-- 커뮤니티 상세페이지에서 커뮤니티 게시판 전체 목록으로 나가기-->
	<script>
function goBack() {
  window.history.back();
}
</script>
</body>

</html>