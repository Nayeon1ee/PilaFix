<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>필라픽스</title>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
 
             <div class="d-flex justify-content-center py-4">
             <img src="${pageContext.request.contextPath}/resources/images/logo_sample330c.png" alt="logo330">
              <!--      <a href="index.html" class="logo d-flex align-items-center w-auto"
                style="pointer-events: none;">
                <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block ">Login</span>
                </a> -->
              </div>
              <!-- End Logo -->
              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-4 pb-2">

                    <div style="text-align:center; margin:30px;">효율적인 센터 운영으로 <br>더 나은 서비스를 제공합니다!</div>
                    <!-- <p class="text-center small">아이디와 비밀번호를 입력하여<br> 로그인을 진행해주세요.</p> -->
                  </div>

                  <form class="row g-3 needs-validation" novalidate  action="centerLogin.do" method="post" >

                    <div class="col-12">
                    <img alt="bar" src="${pageContext.request.contextPath}/resources/images/blue_bar.png">
                      <label for="yourUsername" class="form-label" style="margin-left:6px;"><strong>아이디</strong></label>
                      <div class="input-group has-validation">
                        <!-- <span class="input-group-text" id="inputGroupPrepend">@</span> -->
                        <input type="text" name="ctId" class="form-control" id="ctId" required placeholder="아이디를 입력하세요">
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                      </div>
                    </div>

                    <div class="col-12">
                    <img alt="bar" src="${pageContext.request.contextPath}/resources/images/blue_bar.png">
                      <label for="yourPassword" class="form-label" style="margin-left:6px;"><strong>비밀번호</strong></label>
                      <input type="password" name="ctPassword" class="form-control" id="ctPassword" required placeholder="비밀번호를 입력하세요">
                      <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                    </div>

<!--                     <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                      </div>
                    </div> -->
                    <div class="col-12" style="margin-top:40px; margin-bottom:40px">
                      <button class="btn btn-primary w-100" type="submit" style="padding:12px">
                      로그인</button>
                    </div>
<!--                     <div class="col-12">
                      <p class="small mb-0">Don't have account? <a href="pages-register.html">Create an account</a></p>
                    </div> -->
                  </form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
  <!--               <a href="#" style="pointer-events: none;">필라픽스 - 센터</a> -->
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>