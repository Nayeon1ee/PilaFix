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
  <link href="${pageContext.request.contextPath }/resources/admin/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_info_getboard.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_info.css">

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
			<h1>센터 등록화면</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<p style="magin-top: 1%;"></p>
							<div class="row mb-300" style="width: 122%; margin-top: 1%;">
								<div class="col-sm-10">
									<input type="text" class="form-control" value="센터등록" disabled>
								</div>
							</div>
							<form name="admin_info">
								<div class="col-120">
									<label for="inputAddress5" class="form-label">아이디</label> 
								</div>
								<div class="col-120">
								<input type="text" class="form-control" id="inputAddres5s" placeholder="아이디를 입력하세요" style="width: 93%;">
									<div class="col-sm-100">
										<button type="submit" class="btn btn-primary" >중복확인</button>
									</div>
									<div class="row mb-3">
									
								</div>
								</div>
								<div class="col-120">
									<label for="inputAddress5" class="form-label">비밀번호</label> 
								</div>
								<div class="col-120">
								<input type="text" class="form-control" id="inputAddres5s" placeholder="비밀번호를 입력하세요" style="width: 93%;">
									<div class="col-sm-100">
										<button type="submit" class="btn btn-primary">PW발급</button>
									</div>
									<div class="row mb-3">
									
								</div>
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이름</label> <input
										type="text" class="form-control" id="inputAddres5s"
										placeholder="1234 Main St">
								</div>
								<div class="col-40" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control" id="inputAddress2"
										placeholder="Apartment, studio, or floor">
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이메일</label> <input
										type="text" class="form-control" id="inputAddres5s"
										placeholder="이메일을 입력하세요">
									<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 번호</label>
									<div class="col-400" style="display: flex;">
									<select>
										<option selected>전체</option>
										<option>010</option>
										<option>011</option>
									</select> 
									<input type="text" class="form-control" id="inputAddres5s">
									<input type="text" class="form-control" id="inputAddres5s">
									<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>
								<div class="col-30" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">센터명</label>
									<input type="text" class="form-control" id="inputAddress2"
										placeholder="센터명을 입력하세요">
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label">센터 번호</label>
									<div class="col-400" style="display: flex;">
									<select>
										<option selected>전체</option>
										<option>010</option>
										<option>011</option>
									</select> 
									<input type="text" class="form-control" id="inputAddres5s">
									<input type="text" class="form-control" id="inputAddres5s">
									<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputDate" class="col-sm-2 col-form-label0" style="margin-top: 3%;">계약기간</label>
									<div class="col-sm-10" style="margin-top: 3%;">
										<input type="date" class="form-control" style="float: left; width: 25%;">
										<p style="float: left; font-size: 30px;">~</p>
										<input type="date" class="form-control"
											style="float: left; width: 25%;">
									</div>
								</div>
								<div class="col-6">
									<label for="inputAddress5" class="form-label">센터주소</label> 
								</div>
								<div class="col-120">
								<input type="text" class="form-control" id="inputAddres5s" placeholder="우편번호" style="width: 42%;">
									<div class="col-sm-100">
										<button type="submit" class="btn btn-primary">찾기</button>
									</div>
									<div class="row mb-3">
									
								</div>
								</div>
								<div class="col-12">
									<label for="inputAddress5" class="form-label">상세주소 1</label> <input
										type="text" class="form-control" id="inputAddres5s"
										placeholder="1234 Main St">
								</div>
								<div class="col-12" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">상세주소 2</label>
									<input type="text" class="form-control" id="inputAddress2"
										placeholder="Apartment, studio, or floor">
								</div>
								<div class="row mb-3" style="margin-top: 3%;">
									<label for="inputNumber" class="col-sm-2 col-form-label">사업자등록증
										업로드</label>
									<div class="col-sm-10">
										<input class="form-control" type="file" id="formFile">
									</div>
								</div>
								<div class="row mb-6">
									<div class="col-sm-1000">
										<button type="submit" class="btn btn-primary" onclick="button_event();">등록</button>
										<button type="button" class="btn btn-primary" onclick="location.href='admin_center_management.do'">취소</button>
									</div>
										
								</div>
							</form>
							<!-- End General Form Elements -->
						</div>
					</div>
				</div>
			</div>
		</section>

  </main><!-- End #main -->
 
 
 
    

  <!-- ======= Footer ======= -->
 <%@ include file="admin_footer_common.jsp" %>
 <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>
</body>
<script type="text/javascript">
function button_remove(){
  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
      document.form.submit();
  }else{   //취소
      return;
  }
}

function button_success(){
	alert("수정 완료 되었습니다.");
	location.href="admin_info_boardlist";
}
</script>
</html>