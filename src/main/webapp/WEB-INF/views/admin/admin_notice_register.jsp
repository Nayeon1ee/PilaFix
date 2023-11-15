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
<link href="${pageContext.request.contextPath }/resources/css/style_admin_notice_board_register.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/style_admin_common.css" rel="stylesheet">
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
      <h1>공지사항관리</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li><!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">공지사항 등록페이지</h5>
              <p>웹관리자가 공지사항을 등록할 수 있는 페이지입니다.</p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->

				<!-- Multi Columns Form -->
				<form class="row g-3" id="registrationForm000">
				    <div class="col-md-5">
				        <label class="form-label">작성자</label>
				        <input type="text" class="form-control" value="">
				    </div>
				    <div class="col-md-5">
				        <label class="form-label">작성일자</label>
				        <input type="text" class="form-control" value="">
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">제목</label>
				        <input type="text" class="form-control" id="titleInput000" value="" />
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">내용</label>
				        <textarea class="form-control" id="contentInput000" style="height: 300px"></textarea>
				    </div>
				    
				<div class="col-sm-10">
				  <div class="form-check form-check-inline radiobtn000">
				    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked="">
				    <label class="form-check-label" for="gridRadios1">
				      공개
				    </label>
				  </div>
				  <div class="form-check form-check-inline radiobtn001">
				    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
				    <label class="form-check-label" for="gridRadios2">
				      비공개
				    </label>
				  </div>
				</div>
				    
				    
				    
				    <div class="text-center">
				        <button class="btn btn-secondary btn_registration_000" id="registrationButton000">등록</button>
				        <button type="reset" class="btn btn-secondary" onclick="goBack()">취소</button>
				    </div>
				</form><!-- End Multi Columns Form -->
				             	
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

</html>