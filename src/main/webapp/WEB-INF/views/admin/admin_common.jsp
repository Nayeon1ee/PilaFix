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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_common_2.css">
  
  <!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
  <%@include file="admin_header_common.jsp" %>
      <!-- ============================================================================================ -->
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>커뮤니티 관리</h1>
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
<!-- 검색필터 시작 -->
             <div class="search-filter">
      <div class="search-filter-inner" >
    
     <div class="serch-filter-content">
      <div class="search-top">
              <div class="col-md-3">
                  <label for="inputState" class="form-label">검색</label>
                  <select id="inputState" class="form-select">
                    <option selected disabled>전체</option>
                    <option>글 제목</option>
                    <option>글 작성자</option>
                  </select>
                </div>
           <div class="serch-input">
             <div class="col-md-6">
                  <input type="text" class="form-control" id="inputCity" placeholder="검색어를 입력해주세요">
                </div>
                <div class="search-btn">
                <button type="submit" class="btn btn-primary search">검색</button>
                <button type="reset" class="btn btn-primary search" id="resetButton">초기화</button>
           </div>
            </div>
            </div>
             
             <div class="search-date">
                <div class="date-filter">
                 <label for="inputState" class="form-label">기간검색</label>
                <div class="col-sm-12">
                    <input type="date" class="form-control-date" id="startDate">
                  <span>~</span>
                    <input type="date" class="form-control-date" id="endDate">
                  </div>
                  </div>
                  </div>
                  
                </div>
             </div>
             </div>
<!-- 검색필터 끝 -->
<!-- 게시판 시작 -->
    <h5 class="card-title"></h5>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">글제목</th>
                    <th scope="col">글내용</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">6</th>
                    <td><a href="${pageContext.request.contextPath }/community_detail.jsp" class="admin-alink-color">xx점 후기</a></td>
                    <td>토미강사 추천 어쩌구 저쩌구 어쩌구 저쩌구</td>
                    <td>김xx</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                    <th scope="row">5</th>
                    <td><a href="#" class="admin-alink-color">ss점 후기</a></td>
                    <td>ss강사 비추 가지마셈</td>
                    <td>이ss</td>
                    <td>2014-12-05</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td><a href="#" class="admin-alink-color">한달만에 10kg뺀 썰 푼다</a></td>
                    <td> 어쩌구 저쩌구 효소가 어쩌구</td>
                    <td>신00</td>
                    <td>2011-08-12</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td><a href="#" class="admin-alink-color">넘 힘들다</a></td>
                    <td>집가고 싶다아아아아아아아아</td>
                    <td>구99</td>
                    <td>2012-06-11</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
                    <td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
                    <td>강22</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                    <th scope="row">1</th>
                    <td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
                    <td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
                    <td>강33</td>
                    <td>2011-04-19</td>
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

  <%@include file="admin_footer_common.jsp" %>

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

<!--내가 만든 JS File --> 
  <script src="${pageContext.request.contextPath }/resources/js/common_2.js"></script>
  
</body>

</html>