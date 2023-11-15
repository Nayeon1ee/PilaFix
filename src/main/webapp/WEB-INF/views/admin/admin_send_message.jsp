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

  <link href="${pageContext.request.contextPath }/resources/css/style_admin_send_sms_detail.css" rel="stylesheet">
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
      <h1>문자발송이력관리</h1>
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
              <h5 class="card-title">전체 센터의 문자 발송이력 상세</h5>
              <p>전체 센터의 문자 발송이력 상세 페이지입니다.</p>


             	<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->
             	 
            <!-- Multi Columns Form -->
              <form class="row g-3">
              	<div class="col-md-4">
                  <label class="form-label">수신인</label>
                  <input type="text" readonly class="form-control" value="홍길동" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">수신자 번호</label>
                  <input type="text" readonly class="form-control" value="010-1111-1111" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">발송일자</label>
                  <input type="text" readonly class="form-control" value="2023.04.08" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">발송코드</label>
                  <input type="text" readonly class="form-control" value="010408" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">상태</label>
                  <input type="text" readonly class="form-control" value="성공" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">비고</label>
                  <input type="text" readonly class="form-control" value="2023.04.08" disabled>
                </div>
                
		
                <div class="col-md-12">
                	<label class="form-label">발송 내용</label>
                	 <textarea readonly class="form-control" style="height: 300px;" disabled>
예약완료내용</textarea>
                </div>
                <div class="text-center">
                  <button type="button" class="btn btn-secondary" onclick="location.href='admin_send_message_list.do'">목록</button>
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