<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${pageContext.request.contextPath}/resources/css/style_reservation_details.css">

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
					<li>Reserved list</li>
				</ol>
				<h2>예약 목록</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1000px;">


				<!-- 7:3 비율 잡기 위한 컨테이너 -->
				<div class="container d-flex justify-content-center p-0 m-0">
					<div class="row">

						<!-- 첫 번째 컬럼 (7:3) -->

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
								<!-- 달력 내용 -->
							</tbody>
						</table>



					</div>
					<!-- 7:3 비율 컨테이너 닫기 -->


					<!-- 두 번째 컬럼 (7:3) -->
					<div class="col-md-5 content1 ms-4">
						<div class="content border rounded p-3"
							style="min-height: 600px; max-height: 600px; overflow-y: auto;">

							<!-- 셀렉트 박스 - 연동된 센터의 목록 -->
							<div class="custom-select-wrapper text-center mt-3">
							    <select class="form-select p-1" id="centerSelect" onchange="getLessonInfoByCenter()">
							        <c:choose>
							            <c:when test="${empty connCenterList}">
							                <!-- 첫 번째 옵션을 기본으로 선택하도록 selected 속성 추가 -->
							                <option selected>연동센터 없음</option>
							            </c:when>
							            <c:otherwise>
							                <c:forEach var="center" items="${connCenterList}" varStatus="loop">
							                    <option value="${center.ctCode}" <c:if test="${loop.index eq 0}">selected</c:if>>센터코드: ${center.ctCode}&센터이름: ${center.ctName}</option>
							                </c:forEach>
							            </c:otherwise>
							        </c:choose>
							    </select>
							</div>

							<div class="tab-buttons text-center">
							    <ul class="nav nav-tabs justify-content-center mt-3" id="pills-tab" role="tablist">
							        <li class="nav-item flex-grow-1" role="presentation">
							            <a class="nav-link active show" id="pills-group-tab" data-toggle="pill" href="#pills-group" role="tab" aria-controls="pills-group" aria-selected="true">그룹</a>
							        </li>
							        <li class="nav-item flex-grow-1" role="presentation">
							            <a class="nav-link px-auto active show" id="pills-individual-tab" data-toggle="pill" href="#pills-individual" role="tab" aria-controls="pills-individual" aria-selected="false">개인</a>
							        </li>
							    </ul>
							</div>

							<!-- 탭 전환 시 변경될 데이터 -->
							<div class="tab-content">

								<!--  그룹 탭  -->
								<div class="tab-pane fade active show" id="pills-group" role="tabpanel"	aria-labelledby="pills-group-tab">

									<!-- 그룹 탭에 대한 내용 -->
									<div class="content-filter">
										<div class="form-check form-switch d-flex justify-content-between align-items-center">
											<div>
												<input class="form-check-input" type="checkbox"
													id="flexSwitchCheckDefault"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													style="color: black;"> 예약 가능 </label>
											</div>
											<div>
												<button class="btn btn-secondary refresh"
													onclick="window.location.reload()"
													style="background-color: white; color: #333; border: 1px solid white;">
													<i class="bi bi-arrow-clockwise"></i> 새로고침
												</button>
											</div>
										</div>


									</div>

									<!-- 셀렉트박스에서 선택한 센터의 수강권 정보를 업데이트할 부분 -->
									<div id="lessonListContainer">
										<!-- 페이지 첫 로딩 시에 띄워주고 ajax 요청 시 초기화하여 내용 재생성 -->
										<c:if test="${empty lessonList }">
											<p>
												개설된 수업이 없습니다.<br> 센터에 문의하시기 바랍니다
											</p>
										</c:if>

										<div class="list-group">
											<c:forEach var="item" items="${lessonList}">
												<a class="list-group-item list-group-item-action">
													<p class="mb-1">${item.lsTime }~ ${item.lsEndTime }</p>
													<div class="d-flex w-100 justify-content-between">
														<h5 class="mb-1">${ item.lsName }</h5>
													</div>
													<p class="mb-1">${item.trainerMemberName}</p> <small
													class="text-muted">${item.lsCapacity - item.lsCurrentApplicants }명
														남음</small> | <small class="text-muted">정원
														${item.lsCapacity }명</small> <!-- 버튼 상태 달라져야 함 -->
													<div class="mymodal">
														<button type="button" class="btn btn-outline-primary"
															data-bs-toggle="modal" data-bs-target="#reservModal"
															onclick="getReservationInfo('${item.lsCode}', '${item.centerCode }')">예약하기</button>
													</div>

												</a>
											</c:forEach>
										</div>
									</div>
								</div>
								
								<!-- 개인 탭  -->
								<div class="tab-pane fade" id="pills-individual" role="tabpanel" aria-labelledby="pills-individual-tab">
								
								<!-- 개인 탭에 대한 내용 -->
									<div class="content-filter mt-1">
										<div class="form-check form-switch d-flex justify-content-between align-items-center">
											<div>
												<input class="form-check-input" type="checkbox"
													id="flexSwitchCheckDefault"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													style="color: black;"> 예약 가능 </label>
											</div>
											<div>
												<button class="btn btn-secondary refresh"
													onclick="window.location.reload()"
													style="background-color: white; color: #333; border: 1px solid white;">
													<i class="bi bi-arrow-clockwise"></i> 새로고침
												</button>
											</div>
										</div>
									</div>

									<div class="content-filter py-2 my-4">
										<div
											class="time-slot d-flex justify-content-around align-items-center">
											<div class="time-info">
												<label class="form-check-label time-label"
													for="flexSwitchCheckDefault2">
													<div class="time-check text-center">
														<input type="checkbox" class="btn-check" id="btn-check-2"
															autocomplete="off"> <label class="btn"
															for="btn-check-2"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
															<p class="mt-2">10:00 - 10:50</p>
														</label>
													</div>
												</label>
											</div>
											<!--여기다가 복사 -->
											<label class="form-check-label time-label"
												for="flexSwitchCheckDefault3">
												<div class="time-check text-center">
													<input type="checkbox" class="btn-check" id="btn-check-3"
														autocomplete="off"> <label class="btn"
														for="btn-check-3"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
														<p class="mt-2">11:00 - 11:50</p>
													</label>
												</div>
											</label> <label class="form-check-label time-label"
												for="flexSwitchCheckDefault4">
												<div class="time-check text-center">
													<input type="checkbox" class="btn-check" id="btn-check-4"
														autocomplete="off"> <label class="btn"
														for="btn-check-4"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
														<p class="mt-2">12:00 - 12:50</p>
													</label>
												</div>
											</label>


										</div>
									</div>

									<div class="content-filter py-2 my-4">
										<div
											class="time-slot d-flex justify-content-around align-items-center">
											<div class="time-info">
												<label class="form-check-label time-label"
													for="flexSwitchCheckDefault5">
													<div class="time-check text-center">
														<input type="checkbox" class="btn-check" id="btn-check-5"
															autocomplete="off"> <label class="btn"
															for="btn-check-5"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
															<p class="mt-2">10:00 - 10:50</p>
														</label>
													</div>
												</label>
											</div>

											<label class="form-check-label time-label"
												for="flexSwitchCheckDefault6">
												<div class="time-check text-center">
													<input type="checkbox" class="btn-check" id="btn-check-6"
														autocomplete="off"> <label class="btn"
														for="btn-check-6"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
														<p class="mt-2">11:00 - 11:50</p>
													</label>
												</div>
											</label> <label class="form-check-label time-label"
												for="flexSwitchCheckDefault7">
												<div class="time-check text-center">
													<input type="checkbox" class="btn-check" id="btn-check-7"
														autocomplete="off"> <label class="btn"
														for="btn-check-7"> <i class="bi bi-clock"></i> <!-- Bootstrap clock icon -->
														<p class="mt-2">12:00 - 12:50</p>
													</label>
												</div>
											</label>



										</div>
									</div>
									<!-- 예약 버튼 -->
									<div class="reservation-btn d-flex justify-content-end">
										<button class="btn btn-primary" onclick="reserveTime()">
											<i class="bi bi-calendar-plus"></i> 예약하기
										</button>
									</div>

								</div>

								<!-- 개인 탭은 아직 미작업  -->

								

							</div>




							<!--  3비율 컨테이너 닫기 -->
						</div>
					</div>
				</div>
				<!--  3비율 컨테이너 닫기 -->


				<!-- Modal -->
				<div class="modal fade" id="reservModal" data-bs-backdrop="static"
					data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<!-- model-lg는 모달 크기 조절 -->
						<div class="modal-dialog modal-dialog-scrollable">
							<!-- 모달 내 스크롤 가능토록 -->
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">예약
										상세 페이지</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<!-- 수업 정보 조회 -->
									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>수업 정보 확인</b>
										</div>
										<div class="lesson-info">
											<ul class="list-group list-group-flush">
												<li class="list-group-item"><span id="centerName"></span>
													| <span id="lessonType"></span></li>
												<li class="list-group-item"><h5>
														<span id="lessonName"></span>
													</h5></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													강사명 :<span id="trainerName"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													예약일자 :<span id="lsDate"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													예약시간 :<span id="lsTime"></span> ~ <span id="lsEndTime"></span></li>
											</ul>
										</div>
									</div>

									<!-- 내 수강권 정보 조회 -->
									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>내 수강권 정보 확인</b>
										</div>
										<div class="ticket-info">
											<ul class="list-group list-group-flush">
												<li class="list-group-item"><span id="ticketName"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													잔여횟수 :<span id="remainingCount"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													만료일 :<span id="expirationDate"></span></li>
											</ul>
										</div>
									</div>

									<!-- 이용정책 조회  -->
									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>이용정책</b>
										</div>
										<div class="userguide-info">
											<ul class="list-group list-group-flush">
												<div id="userguideContainer">
													<!-- 여기에 받아온 이용정책 들어감 -->
												</div>
											</ul>
										</div>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> 
										<label class="form-check-label" for="flexCheckDefault"> 이용 정책을 전부 확인하였습니다. 이에 동의합니다.</label>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"  onclick="makeReservation()">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝 -->

				<!-- 내용 -->


				<!-- End Our Skills Section -->
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
		src="${pageContext.request.contextPath}/resources/js/test_calendar.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

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

	<script>
	var reservationData = {};

		<!-- 페이지 로딩 시 -->
		$(document).ready(function() {
			//탭 설정 기본 group으로 설정 (추후 회원이 가진 수강권이 그룹이면 그룹 먼저, 개인이면 개인 먼저 뜰 수 있도록 )
		    $('#pills-individual-tab').removeClass('active show');
		});
		
		<!-- 탭 전환될 때마다 호출  -->
		$('#pills-individual-tab, #pills-group-tab').on('click', function() {
	        getLessonInfoByCenter();
	    });

		<!-- 센터 선택 시, 날짜 선택 시, 그룹/개인 선택 시 해당 센터의 수업 목록 조회 -->
		function getLessonInfoByCenter() {
			var selectedCenterCode = document.getElementById("centerSelect").value;
			console.log("선택한 지점 코드 : " + selectedCenterCode);
			console.log("선택한 날짜 : " + selectedDate);
			
		    // 만약 선택한 날짜가 있으면 data에 추가
		    var data = {
		        ctCode: selectedCenterCode,
		    };

		    if (selectedDate) {
		        data.selectedDate = selectedDate;
		    }
		    
			// 그룹/개인 탭 여부 확인 및 추가
			var selectedTab = $('#pills-tab .nav-link.active').attr('id');
		    var lessonType = (selectedTab === 'pills-group-tab') ? 'G' : 'P';
		    console.log(lessonType);

		    data.lessonType = lessonType;
		    
			
			// Ajax 요청
			$.ajax({
						type : "Post",
						url : "getLessonList.do", // 적절한 URL로 변경
						data : data,
						success : function(lessonList) {
							// 성공 시 아래에 정보 업데이트
							console.log("getLessonInfoByCenter 값 가져옴")
					        console.log("Ajax 요청 성공");
					        console.log("수업 목록: ", lessonList);
					        
							
					        var str = "";
					        // lessonListContainer라는 아이디 가진 영역의 기존 내용을 지움
					        $('#lessonListContainer').html('');
							
							if (lessonList.length < 1) {
								str = '<p>개설된 수업이 없습니다.<br> 센터에 문의하시기 바랍니다</p>'
								$('#lessonListContainer').append(str);
							} else {
								lessonList.forEach(function (item) {
								    str = '<div class="list-group-item" id="' + item.lsCode + '">';
								    str += '<h5 class="mb-1" style="font-weight: bold;">' + item.lsName + '</h5>';
								    str += '<div>';
								    str += '<table>';
								    str += '<td>';
								    str += '<tr>' + item.lsTime + '~' + item.lsEndTime+ '</tr>';
								    str += '<tr>';
								    str += item.trainerMemberCode + ' 강사 | 신청인원 ' + item.lsCurrentApplicants + '명 | 정원 ' + item.lsCapacity + '명';
								    str += '</tr>';
								    str += '</td>';
								    str += '</table>';
								    str += '<div class="mymodal">'
								    str += '<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#reservModal" onclick="getReservationInfo(\'' + item.lsCode + '\', \'' + item.centerCode + '\')">예약하기</button>';
								    str += '</div>'
								    str += '</div>';
								    str += '</div>';
								    // lessonListContainer라는 아이디를 가진 영역에 위의 내용 삽입해줌
								     $('#lessonListContainer').append(str);
								});

							}
						},
						error : function (xhr, status, error) {
					        console.error("Ajax 요청 실패");
					        console.error("상태 코드: ", xhr.status);
					        console.error("에러 메시지: ", error);
						}
					});
		}
		
	<!-- 예약하기 버튼 클릭 시 수업 정보, 수강권 정보, 이용정책 Map으로 받아옴 -->
	function getReservationInfo(lsCode, ctCode) {

	    // 예약 정보 다시 가져오기
	    $.ajax({
	        type: "GET",
	        url: "getMyTicketInfo.do",
	        data: {
	            lsCode: lsCode, //수업코드 
	            ctCode: ctCode // 센터코드 
	        },
	        success: function (data) {
	            // 성공 시 아래에 정보 업데이트
	            console.log("getReservationInfo 값 가져옴");
	            
	            if (data && data.lessonDetail != undefined && data.myTicket != undefined) {
	                var lessonDetail = data.lessonDetail;
	                var myTicket = data.myTicket;
	                var reservGuideList = data.reservGuideList;

	                
	                console.log("getReservationInfo.do 성공");
	                console.log(lessonDetail);
	                console.log(myTicket);
	                console.log(reservGuideList.ugName);

	                // 수업 내용 조회 
	                $('#centerName').text(lessonDetail.ctName);
	                $('#lessonType').text(lessonDetail.lsType);
	                $('#lessonName').text(lessonDetail.lsName);
	                $('#trainerName').text(lessonDetail.trainerMemberName);
	                $('#lsDate').text(lessonDetail.lsDate);
	                $('#lsTime').text(lessonDetail.lsTime);
	                $('#lsEndTime').text(lessonDetail.lsEndTime);

	                // 수강권 내역 조회
	                $('#ticketName').text(myTicket.ticketNameGroup1);
	                $('#remainingCount').text(myTicket.ticketRemainingCountGroup1);
	                $('#expirationDate').text(myTicket.ticketExpiryDateGroup1);

	                // 이용정책 조회 및 추가
	                var userguideContainer = $('#userguideContainer');
					userguideContainer.empty();

					if (data.reservGuideList.length > 0) {
					    data.reservGuideList.forEach(function (reservGuide) {
					        var listItem = $('<li class="list-group-item"></li>');
					        listItem.append('<b>' + reservGuide.ugName + '</b>');
					        listItem.append('<span>' + reservGuide.ugContent + '</span>');
					        userguideContainer.append(listItem);
					    });
					} else {
					    userguideContainer.append('<li class="list-group-item">이용정책이 없습니다.</li>');
					}
					
					reservationData = {
		                    ctCode: ctCode, // 선택한 센터
		                    ticketCode: myTicket.ticketCodeGroup1, // 수강권 코드
		                    lsCode: lsCode // 수업코드  
		            };
					
	            } else {
	                console.error("서버 응답 데이터가 비어있거나 유효하지 않습니다.");
	            }
	        },
	        error: function () {
	            console.error("getMyTicketInfo.do 호출 시 Ajax 요청 실패 ");
	        }
	    });
	}

	
	<!-- 동의 체크박스에 체크 하면 버튼 색상 바뀌는 것으로 (동의 체크 안 한채로 버튼 누르면 동의 하라고 떠야 함)-->
	function makeReservation() {
	    console.log("makeReservation 호출 ");

	    // 동의 체크 여부 확인
	    var agreementCheckbox = document.getElementById("flexCheckDefault");

	    if (agreementCheckbox.checked) {
	        console.log("체크박스 동의 ");
	        
	     	// reservationData에 저장된 데이터 사용
	        console.log(reservationData);
	     	
	        var data = {
				ctCode: reservationData.ctCode,
				ticketCode: reservationData.ticketCode,
				lsCode: reservationData.lsCode
			};
	     	
	        $.ajax({
	            type : "Post",
	            url : "makeReservation.do", // 적절한 URL로 변경
	            data : data,
	            success : function(lessonList) {
	                // 성공 시 아래에 정보 업데이트
	                console.log("makeReservation 값 가져옴");
	                console.log("Ajax 요청 성공");
	            },
	            error : function (xhr, status, error) {
	                console.error("Ajax 요청 실패");
	                console.error("상태 코드: ", xhr.status);
	                console.error("에러 메시지: ", error);
	            }
	        });

	    } else {
	        // 동의하지 않은 경우 알림 메시지 표시
	        console.log("체크박스 동의하지 않음");
	    }
	}
	
</script>
		
		
	</script>
</body>

</html>