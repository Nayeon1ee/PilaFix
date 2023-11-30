<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>

<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_reservation_cancel.css">

<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>Reserved list</li>
				</ol>
				<h2>예약 목록</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">


				<div class="reserv_cancel_list d-flex justify-content-center">
					<div class="reserv_cancel_list d-flex justify-content-center">
						<div class="section_0"
							style="border: border-radius: 5px; margin-bottom: 20px; position: relative; overflow: hidden; width: 700px;">
							<div class="time" id="cancelTime">
								<p class="fw-bold mb-0" style="color: #e44d26;">
									취소 가능한 시간까지 <span id="timeRemaining"></span> 남았어요!
								</p>
							</div>
						</div>
					</div>



					<div class="container" style="max-width: 700px">
						<div class="row">
							<div class="col-md-6 p-0">
								<div class="section1">
									 <div class="card h-100" style="max-width: 347.5px;">
										<div class="card-header">
											<b>내 예약 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item mb-2">${cancelInfo.lesson.centerName} | ${cancelInfo.lesson.lsType }수업</li>
											<li class="list-group-item mb-2">${cancelInfo.lesson.lsName}</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="remainingSessions">예약일자</label>
													<input type="text" class="form-control" id="remainingSessions" name="remainingSessions" value="${cancelInfo.lesson.lsDate}" readonly>
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="expirationDate">예약시간</label>
													<input type="text" class="form-control" id="expirationDate" value="${cancelInfo.lesson.lsTime} ~ ${cancelInfo.lesson.lsEndTime}"name="expirationDate" readonly>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-6 p-0">
								<div class="section2">
									 <div class="card h-100" style="max-width: 347.5px;">
										<div class="card-header">
											<b>내 수강권 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
										<li class="list-group-item mb-1 title-text">${cancelInfo.lesson.centerName} | ${cancelInfo.lesson.lsType }수업</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="remainingSessions">잔여횟수</label>
													<input type="text" class="form-control" id="remainingSessions" name="remainingSessions" value="${cancelInfo.ticket.ticketRemainingCount }" readonly>
												</div>
											</li>
											<li class="list-group-item">
												<div class="input-group">
													<label class="input-group-text" for="expirationDate">만료일</label>
													<input type="text" class="form-control" id="expirationDate" value="${cancelInfo.ticket.ticketExpiryDate }"	name="expirationDate" readonly>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>


						</div>
					</div>
					<div class="section">
						<div class="card">
							<div class="card-header">
								<b>이용정책</b>
							</div>
							<ul class="list-group list-group-flush">
								<c:forEach var="guide" items="${cancelInfo.reservGuideList}">
									<li class="list-group-item">
										<div class="d-flex justify-content-between align-items-center">
											<span class="fw-bold">${guide.ugName}</span>
										</div>
									</li>
									<li class="list-group-item">
										<div class="policy-form">
											<textarea class="form-control" rows="4" readonly>${guide.ugContent}</textarea>
										</div>
									</li>
								
						        </c:forEach>
								
								
							</ul>
						</div>
					</div>

					<div class="section">

						<div class="d-grid gap-2 justify-content-end me-2">
							<button class="btn btn-primary my-auto" type="button"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="width: 100px;">취소하기</button>
						</div>

					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="highlight-section">
									<p class="highlight-text">
										<span class="highlight-date">${cancelInfo.lesson.lsDate} ${cancelInfo.lesson.lsTime }에 진행하는</span>
									</p>
									<p class="hightlight-text" style="font-size: 18px;">
										${cancelInfo.lesson.lsName } 수업을 취소하시겠습니까?</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary my-auto" onclick="cancelReservation('${cancelInfo.reservation.rsCode}', '${cancelInfo.lesson.lsCode}', ${cancelInfo.lesson.centerCode})">취소하기</button>

							</div>
						</div>
					</div>
				</div>



				<!-- End #main -->
			</div>
		</section>
	</main>
	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!--  취소 가능한 시간 js -->
	<script>
	<!--  취소 가능한 날짜 계산 함수 -->
    function calculateCancellationDate(lessonDate) {
        // 예약 시간에서 24시간을 빼서 하루 전까지만 취소 가능하도록 설정
        var cancelDate = new Date(lessonDate);
        cancelDate.setHours(cancelDate.getHours() - 3);

        return cancelDate;
    }

    // 시간 간격 계산 함수
    function calculateTimeRemaining() {
        // 취소 가능한 날짜 계산
        var lessonDate = new Date('${cancelInfo.lesson.lessonDatetime}'); // 서버에서 받은 lesson 정보를 사용
        console.log(lessonDate);
        var now = new Date();

        // 당일 취소 불가인 경우
        if (lessonDate.getDate() === now.getDate() && lessonDate.getMonth() === now.getMonth() && lessonDate.getFullYear() === now.getFullYear()) {
            document.getElementById('timeRemaining').innerHTML = '당일 취소는 불가능합니다.';
            return;
        }

        var cancelDate = calculateCancellationDate(lessonDate);

        // 당일 취소가 아닌 경우에만 남은 시간 계산
        if (now < cancelDate) {
            var timeDifference = cancelDate - now;

            // 시간, 분, 초 계산
            var hours = Math.floor(timeDifference / (1000 * 60 * 60));
            var minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

            // 결과를 페이지에 반영
            document.getElementById('timeRemaining').innerHTML = hours + '시간 ' + minutes + '분 ' + seconds + '초';
        } else {
            document.getElementById('timeRemaining').innerHTML = '취소 가능한 시간이 지났습니다.';
        }
    }

    // 페이지 로드 시 초기화
    calculateTimeRemaining();

    // 1초마다 갱신
    setInterval(calculateTimeRemaining, 1000);
        
    <!-- 예약 취소 -->
	function cancelReservation(rsCode, lsCode, centerCode) {
	    console.log("cancelReservation 호출 ");
		console.log("예약 번호: ");
		console.log(rsCode);
		console.log("수업 코드: ");
		console.log(lsCode);
		console.log("센터 코드: ");
		console.log(centerCode);
		
	    var data = {
	    	rsCode: rsCode,
	    	lsCode: lsCode,
	    	centerCode: centerCode
			};
	     	
	        $.ajax({
	            type : "Post",
	            url : "cancelReservation.do", 
	            data : data,
	            success : function(response) {
	                
	                if(response){
   	                console.log("cancelReservation() 호출 성공");
	              		// 추후 내스케줄 확인으로 이동
	   	            alert("취소가 완료되었습니다. ");
	   	            window.location.href = 'schedule.do';
	                }
	            },
	            error : function (xhr, status, error) {
	                console.error("Ajax 요청 실패");
	                console.error("상태 코드: ", xhr.status);
	                console.error("에러 메시지: ", error);
	            }
	        });

	    }
	</script>
	<!--  취소 가능한 시간 스크립트 -->



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