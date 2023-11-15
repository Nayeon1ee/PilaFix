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
      <h1>센터 상세화면</h1>
      <!-- <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
             <p style="magin-top: 1%;"></p>
				<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="센터프로필" disabled>
					</div>
					</div>
				<div class="col-400">
						<label for="inputAddress5" class="form-label">센터명</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="02-0000-0000">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">주소</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="서울특별시 종로구 ">
				</div>
					<div class="col-40000">
						<label for="inputAddress5" class="form-label">센터번호</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="xxx 종로점">
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">계약일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="2023-01-01 ">
					
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">만료일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="2024-01-01 ">
					
					</div>
					<div class="col-40000">
						<label for="inputAddress5" class="form-label">아이디</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="20230001">
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">회원상태</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="계약회원 ">
					
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">만료여부</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="Y ">
					</div>
					<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="프로필정보" disabled>
					</div>
					</div>
					<div class="col-400">
						<label for="inputAddress5" class="form-label">대표자 이름</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="홍길동">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">대표자 이메일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="naver.com ">
					</div>
					<div class="col-400">
						<label for="inputAddress5" class="form-label">대표자 번호</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="010-xxxx-xxxx">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">사업자 등록번호</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="110-2023-0044 ">
					</div>
               </div>
               <div class="selectson">
	               <button type="button" class="btn btn-link">계약해지</button>
				   <button type="button" class="btn btn-link">비밀번호초기화</button>
			   </div>
               <div class="row mb-6">
					<div class="col-sm-1000">
						<button type="submit" class="btn btn-primary" onclick="button_remove();">삭제</button>
						<button type="submit" class="btn btn-primary" onclick="location href='admin_center_management.do'">취소</button>
					</div>
			   </div>
			   <div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control0" value="문자발송이력" disabled>
					</div>
				</div>
			   <table class="table datatable">
													<thead>
														<tr>
															<th scope="col">번호</th>
															<th scope="col" class="contentcol">내용</th>
															<th scope="col">수신인</th>
															<th scope="col">발송일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">2</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">3</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">4</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">6</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
													</tbody>
												</table>
												<!-- End Table with stripped rows -->
												
					</div>
	          </div>
	        </div>
	     
	    </section><div class="pagetitle">
      <h1>센터 상세화면</h1>
      <!-- <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li>기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
             <p style="magin-top: 1%;"></p>
				<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="센터프로필" disabled>
					</div>
					</div>
				<div class="col-400">
						<label for="inputAddress5" class="form-label">센터이름</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="02-0000-0000">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">주소</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="서울특별시 종로구 ">
				</div>
					<div class="col-40000">
						<label for="inputAddress5" class="form-label">센터번호</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="xxx 종로점">
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">계약일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="2023-01-01 ">
					
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">만료일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="2024-01-01 ">
					
					</div>
					<div class="col-40000">
						<label for="inputAddress5" class="form-label">아이디</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="20230001">
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">회원상태</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="계약회원 ">
					
					</div>
					<div class="col-40000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">만료여부</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="Y ">
					</div>
					<div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control" value="프로필정보" disabled>
					</div>
					</div>
					<div class="col-400">
						<label for="inputAddress5" class="form-label">대표자 이름</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="홍길동">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">대표자 이메일</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="naver.com ">
					</div>
					<div class="col-400">
						<label for="inputAddress5" class="form-label">대표자 번호</label> 
						<input type="text" class="form-control" id="inputAddres5s" placeholder="010-xxxx-xxxx">
					</div>
					<div class="col-4000" style="margin-top: 1%;">
						<label for="inputAddress2" class="form-label">사업자 등록번호</label>
						<input type="text" class="form-control" id="inputAddress2" placeholder="110-2023-0044 ">
					</div>
               </div>
               <div class="selectson">
	               <button type="button" class="btn btn-link">계약해지</button>
				   <button type="button" class="btn btn-link">비밀번호초기화</button>
			   </div>
               <div class="row mb-6">
					<div class="col-sm-1000">
						<button type="submit" class="btn btn-primary" onclick="button_remove();">삭제</button>
						<button type="submit" class="btn btn-primary" onclick="location.href='admin_center_management.do'">취소</button>
					</div>
			   </div>
			   <div class="row mb-300" style="width: 122%; margin-top: 1%;">
					<div class="col-sm-10">
						<input type="text" class="form-control0" value="문자발송이력" disabled>
					</div>
				</div>
			   <table class="table datatable">
													<thead>
														<tr>
															<th scope="col">번호</th>
															<th scope="col" class="contentcol">내용</th>
															<th scope="col">수신인</th>
															<th scope="col">발송일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">2</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">3</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">4</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
														<tr>
															<th scope="row">6</th>
															<td>그룹 수업 6:1 [체어&바렐]수업이 2023.10.20(수요일) 오전 10:00에 예약되었습니다</td>
															<td>Designer</td>
															<td>2023-05-25</td>
														</tr>
													</tbody>
												</table>
												<!-- End Table with stripped rows -->
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
  }else{   //
      return;
  }
}

function button_success(){
	alert("수정 완료 되었습니다.");
	location.href="admin_center_management.do";
}
</script>
</html>