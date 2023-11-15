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

  <link href="${pageContext.request.contextPath }/resources/css/style_admin_send_sms_list.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/style_admin_common.css" rel="stylesheet">
  
     <link href="${pageContext.request.contextPath }/resources/css/style_admin_common_2.css" rel="stylesheet">

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
              <h5 class="card-title">센터의 전체 문자 발송이력 리스트</h5>
              <p>센터의 전체 문자 발송이력 리스트 페이지입니다.</p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->
             	 
             	 
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
                    <option></option>
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



              <!-- Table with stripped rows -->
              <table class="table datatable">
              
              
              
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">발신센터</th>
                    <th scope="col">발송일자</th>
                    <th scope="col">상태</th>
                    <th scope="col">비고</th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <td>0418</td>
                    <td><a href=admin_send_message.do class="admin-alink-color">이브 필라테스 삼송점</a></td>
                    <td>2023.04.08</td>
                    <td>성공</td>
                    <td>2023.04.08</td>
                  </tr>
                  <tr>
                    <td>0417</td>
                    <td><a href=admin_send_message.do class="admin-alink-color">룩스 필라테스 종로점</a></td>
                    <td>2023.04.08</td>
                    <td>실패</td>
                    <td>실패사유</td>
                  </tr>                          
                </tbody>
              </table>
              <!-- End Table with stripped rows -->             	 
             	 
             	 
             	 
             	 
             	 

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
  <script src="${pageContext.request.contextPath}/resources/js/admin_common_2.js"></script>  
</body>

</html>