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

  <link href="${pageContext.request.contextPath }/resources/css/style_admin_CTS_info.css" rel="stylesheet">
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
      <h1>고객관리</h1>
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
              <h5 class="card-title">회원관리</h5>
              <p>웹 관리자가 회원 상세페이지를 볼 수 있는 페이지입니다.</p>


             	<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->
   <!-- Multi Columns Form -->
              <form class="row g-3">
              	<div class="col-md-4">
                  <label class="form-label">이름</label>
                  <input type="text" readonly class="form-control" value="홍길동" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">이메일아이디</label>
                  <input type="text" readonly class="form-control" value="hong@naver.com" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">전화번호</label>
                  <input type="text" readonly class="form-control" value="010-1111-1111" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">생년월일</label>
                  <input type="text" readonly class="form-control" value="2000.04.08" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">성별</label>
                  <input type="text" readonly class="form-control" value="여자" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">회원가입일</label>
                  <input type="text" readonly class="form-control" value="2023.01.08" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">회원상태</label>
                  <input type="text" readonly class="form-control" value="일반회원" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">가입유형</label>
                  <input type="text" readonly class="form-control" value="카카오" disabled>
                </div>
                <div class="col-md-4">
                  <label class="form-label">현재연동센터</label>
                  <input type="text" readonly class="form-control" value="000필라테스 00점" disabled>
                </div>
                
                
              </form><!-- End Multi Columns Form -->

             <br>
             <br>
            
		<div class="card card_box_shadow">
            <div class="card-body">
              <h5 class="card-title">수강권 결제내역</h5>
              <p>회원이 최근에 결제한 수강권내역입니다.</p>
	
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">수강권명</th>
                    <th scope="col">센터명</th>
                    <th scope="col">결제일</th>
                    <th scope="col">결제수단</th>
                    <th scope="col">결제금액</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>002</td>
                    <td>6:1그룹 필라테스 24회권(3개월)</td>
                    <td>00필라테스00점</td>
                    <td>2023.04.08</td>
                    <td>카드결제</td>
                    <td>500,000</td>
                  </tr>

                  <tr>
                    <td>001</td>
                    <td>6:1그룹 필라테스 24회권(3개월)</td>
                    <td>00필라테스00점</td>
                    <td>2023.04.08</td>
                    <td>카카오페이</td>
                    <td>500,000</td>
                  </tr>   
                </tbody>
              </table>
              <!-- End Table with stripped rows -->
              
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
		<div class="card card_box_shadow">
            <div class="card-body">
              <h5 class="card-title">연동센터이력</h5>
              <p>회원이 연동한 센터들이 보여집니다.</p>
	
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">센터명</th>
                    <th scope="col">주소</th>
                  </tr>
                </thead>
                
                <tbody>
                  <tr>
                    <td>002</td>
                    <td>00필라테스00점</td>
                    <td>경기도 고양시 덕양구 000로 00번지</td>
                  </tr>

                  <tr>
                    <td>001</td>
                    <td>00필라테스00점</td>
                    <td>경기도 고양시 덕양구 000로 00번지</td>
                  </tr>
                  
                </tbody>
              </table>
              <!-- End Table with stripped rows -->
              
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
             	<div class="text-left">
                  <button class="btn btn-secondary" onclick="location.href='admin_membership.do'">목록</button>
                </div>
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