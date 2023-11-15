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

<!-- 내가 만든 css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_admin_common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_FAQ.css">
  
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
      <h1>FAQ 관리</h1>
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
              <h5 class="card-title">중제목 작성</h5>
              <p>간략한 설명</p>


             	<div class="container-FAQ">
<div class="FAQ-reg">
<button type="button" onclick="location.href='admin_FAQ_register.do'" class="btn btn-primary left-align">FAQ등록</button>
</div>
<div class="searchfilter-size">
<select class="form-select right-align" aria-label="Default select example" id="filterSelect">
  <option selected>전체</option>
  <option value="1">강사</option>
  <option value="2">회원</option>
  <option value="3">공통</option>
</select>
<form class="d-flex right-align">
        <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">search</button>
      </form>
</div>
</div>

             	<!-- 게시판 시작 -->
    <h5 class="card-title"></h5>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">구분</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">5</th>
                    <td>강사</td>
                    <td><a href="admin_FAQ_detail.do" class="admin-alink-color">출결처리가 되지않아요</a></td>
                    <td>2023-10-23</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td>회원</td>
                    <td><a href="admin_FAQ_detail.do" class="admin-alink-color">내 이용권을 확인하고 싶어요</a></td>
                    <td>2023-06-30</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>강사</td>
                    <td><a href="admin_FAQ_detail.do" class="admin-alink-color">오늘 수업 일정으로 확인하고 싶어요</a></td>
                    <td>2022-03-15</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>공통</td>
                    <td><a href="admin_FAQ_detail.do" class="admin-alink-color">연동된 센터를 확인하고 싶어요</a></td>
                    <td>2021-08-19</td>
                  </tr>
                  <tr>
                    <th scope="row">1</th>
                    <td>공통</td>
                    <td><a href="admin_FAQ_detail.do" class="admin-alink-color">회원 탈퇴는 어떻게 하나요?</a></td>
                    <td>2020-02-24</td>
                  </tr>
                </tbody>
              </table>   
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