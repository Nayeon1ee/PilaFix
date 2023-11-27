<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- fullcalender -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

</script>


</head>

<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_myschedule.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_insert_calendar.css">

<!-- 달력 -->



<!--  달력 -->

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">contact@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						5589 55488 55</span></i>
			</div>
			<div class="social-links d-none d-md-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>Check schedule</li>
				</ol>
				<h2>스케줄 확인</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">

				<!-- 7:3 비율 잡기 위한 컨테이너 -->
				<div class="container d-flex justify-content-center p-0 m-0">
					<div class="row">
					<div id='calendar'></div>

<!--  
						<!-- 첫 번째 컬럼 (7:3) 
						<table class="Calendar py-0 my-0">
							<thead>
								<tr>
									<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
									<td colspan="5"><span id="calYear"></span>년 <span
										id="calMonth"></span>월</td>
									<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
								</tr>
								<tr>
									<td>일</td>
									<td>월</td>
									<td>화</td>
									<td>수</td>
									<td>목</td>
									<td>금</td>
									<td>토</td>
								</tr>
							</thead>
							<tbody>
								<!-- 달력 내용 
							</tbody>
						</table>
-->


					</div>
					<!-- 7:3 비율 컨테이너 닫기 -->


					<!-- 두 번째 컬럼 (7:3) -->
					<div class="col-md-5 content1 ms-4">
						<div class="content border rounded p-3"
							style="min-height: 600px; max-height: 600px; overflow-y: auto;">


							<div class="card rounded">
								<div class="card-header bg-white" style="height: 100px;">
									<font style="font-weight: bold;">당월 출석 현황</font><br> <br>
									<ul id="nav5" class="nav justify-content-around">
										<li class="nav-item"><a class="nav-link active"
											style="color: #0070c0; text-weight: bold; text-decoration: none;">예약</a></li>
										<li class="nav-item"><a class="nav-link"
											style="color: #14761d; text-weight: bold; text-decoration: none;">출석</a></li>
										<li class="nav-item"><a class="nav-link"
											style="color: #ff6600; text-weight: bold; text-decoration: none;">결석</a></li>
									</ul>
								</div>
							</div>

							<div class="card-header-con py-1 mt-1 custom-rounded">
								<div class="btn-group d-flex py-1" role="group"
									aria-label="Basic radio toggle button group">
									<input type="button" class="btn-check" name="options" id="option1" autocomplete="off" checked> 
									<labelclass="btn btn-outline-primary1" for="option1" onclick="changeColor('gray-bar')">전체</label> 
										<input type="button" class="btn-check" name="options" id="reservation" autocomplete="off"> 
										<label class="btn btn-outline-primary2" for="option2" onclick="changeColor('blue-bar')">예약</label> 
										<input type="button" class="btn-check" name="options" id="option3" autocomplete="off"> 
										<label class="btn btn-outline-primary3" for="option3" onclick="changeColor('green-bar')">출석</label> 
										<input type="button" class="btn-check" name="options" id="option4" autocomplete="off"> 
										<label class="btn btn-outline-primary4" for="option4" onclick="changeColor('orange-bar')">결석</label>
								</div>
							</div>




							<!-- 카드1 -->
							<div class="card" style="border-radius: 0;">
								<div class="card-header bg-white">10.23 월요일</div>
								<div class="card-body">
									<!-- 취소 정보 표시 -->
									<div class="mt-3" style="margin:0">
										<small class="text-muted">예약 &nbsp; 오전 12:00 ~ 12:50 </small>
										<div class="d-flex w-100 justify-content-between">
											<h5 class="my-auto" style="color: black;">체어&바렐(A): 체형교정</h5>
											<button type="button"
												class="btn btn-outline-primary btn-reservation">예약하기</button>
										</div>
										<small class="text-muted">홍길동 강사</small><br> <small
											class="text-muted">이브 필라테스 xx점</small>
									</div>
								</div>
							</div>
							<!-- 카드 2 -->
							<div class="card" style="border-radius: 0;">
								<div class="card-header bg-white">10.23 월요일</div>
								<div class="card-body">
								
									<!-- 취소 정보 표시 -->
									<div class="mt-3" style="margin:0">
										<small class="text-muted">예약 &nbsp; 오전 12:00 ~ 12:50 </small>
										<div class="d-flex w-100 justify-content-between">
											<h5 class="my-auto" style="color: black;">체어&바렐(A): 체형교정</h5>
											<button type="button"
												class="btn btn-outline-primary btn-reservation">예약하기</button>
										</div>
										<small class="text-muted">홍길동 강사</small><br> <small
											class="text-muted">이브 필라테스 xx점</small>
									</div>
								</div>
							</div>



						</div>
					</div>
				
				</div>



				<!-- 내용 -->


				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


	<script>
		function changeColor(colorClass) {
			var colorChangingBar = document
					.getElementById('color-changing-bar');
			colorChangingBar.classList.remove('gray-bar', 'blue-bar',
					'green-bar', 'orange-bar');
			colorChangingBar.classList.add(colorClass);
		}
	</script>
	
	<script type="text/javascript">
	 $("#reservation").click(function() {
         // AJAX 요청
         $.ajax({
             type: "POST",
             url: "getReservList.do",
             success: function(response) {
                 // 요청이 성공할 경우 실행할 코드
                 console.log("AJAX 요청 성공", response);
             },
             error: function(error) {
                 // 요청이 실패할 경우 실행할 코드
                 console.error("AJAX 요청 실패", error);
             }
         });
     });
	</script>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>