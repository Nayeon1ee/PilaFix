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
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_reservation_details.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_insert_calendar.css">


<body>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>Reserved list</li>
				</ol>
				<h2>예약 목록</h2>
				
				<h6>자신의 운동 수준과 목표에 맞는 수업을 선택하여 예약하세요!</h6>
				<h6>수업 시작 <b>3시간 전까지</b> 예약이 가능합니다. 이 시간 이후에는 예약이 불가능하오니 미리 계획하여 참여 부탁드립니다.</h6>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 1100px;">


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
							style="min-height: 648px; max-height: 648px; overflow-y: auto;">

							<!-- 셀렉트 박스 - 연동된 센터의 목록 -->
							<div class="custom-select-wrapper text-center mt-3">
								<select class="form-select p-1" id="centerSelect"
									onchange="getLessonInfoByCenter()">
									<c:choose>
										<c:when test="${empty connCenterList}">
											<!-- 첫 번째 옵션을 기본으로 선택하도록 selected 속성 추가 -->
											<option selected>연동센터 없음</option>
										</c:when>
										<c:otherwise>
											<c:forEach var="center" items="${connCenterList}"
												varStatus="loop">
												<option value="${center.ctCode}"
													<c:if test="${loop.index eq 0}">selected</c:if>>센터코드:
													${center.ctCode}&센터이름: ${center.ctName}</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</select>
							</div>

							<div class="tab-buttons text-center">
								<ul class="nav nav-tabs justify-content-center mt-3"
									id="pills-tab" role="tablist">
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link active show" id="pills-group-tab"
										data-toggle="pill" href="#pills-group" role="tab"
										aria-controls="pills-group" aria-selected="true">그룹</a></li>
									<li class="nav-item flex-grow-1" role="presentation"><a
										class="nav-link px-auto active show" id="pills-individual-tab"
										data-toggle="pill" href="#pills-individual" role="tab"
										aria-controls="pills-individual" aria-selected="false">개인</a>
									</li>
								</ul>
							</div>

							<!-- 탭 전환 시 변경될 데이터 -->
							<div class="tab-content">

								<!--  그룹 탭  -->
								<div class="tab-pane fade active show" id="pills-group"
									role="tabpanel" aria-labelledby="pills-group-tab">

									<!-- 그룹 탭에 대한 내용 -->
									<div class="content-filter">
										<div
											class="form-check form-switch d-flex justify-content-between align-items-center">
											<div style="display: flex; align-items: center;">
												<input class="form-check-input" type="checkbox"
													id="flexSwitchCheckDefault"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													style="color: black; display: inline-block; margin-left: 5px;">예약
													가능</label>
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
									<div id="lessonListContainerForGroup">
										<!-- 페이지 첫 로딩 시에 띄워주고 ajax 요청 시 초기화하여 내용 재생성 -->
										<c:if test="${empty lessonList }">
											<p>
												개설된 수업이 없습니다.<br> 센터에 문의하시기 바랍니다
											</p>
										</c:if>

										<div class="list-group">
											<c:forEach var="item" items="${lessonList}">
												<a class="list-group-item list-group-item-action">
													<p class="mb-1" style="color:#841dff;">${item.lsTime }~${item.lsEndTime }</p>
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
								<div class="tab-pane fade" id="pills-individual" role="tabpanel"
									aria-labelledby="pills-individual-tab">

									<!-- 개인 탭에 대한 내용 -->
									<div class="content-filter mt-1">
										<div
											class="form-check form-switch d-flex justify-content-between align-items-center">
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
								
									<div id="lessonListContainerForPersonal">
										<div class="list-group">
											<c:forEach var="item" items="${lessonList}">
												<a class="list-group-item list-group-item-action">
													<p class="mb-1">${item.lsTime }~${item.lsEndTime }</p>
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
													강사명 : <span id="trainerName"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													예약일자 : <span id="lsDate"></span></li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													예약시간 : <span id="lsTime"></span> ~ <span id="lsEndTime"></span></li>
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
													잔여횟수 : <span id="remainingCount"></span> 회</li>
												<li class="list-group-item"><img alt="bar"
													src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
													만료일 : <span id="expirationDate"></span></li>
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
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault">
											이용 정책을 전부 확인하였습니다. 이에 동의합니다.</label>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										onclick="makeReservation()">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 예약 완료 Modal -->
				<div class="modal fade" id="reservationSuccessModal"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">예약 완료</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body text-center">
								<img class="img-fluid mb-3"
									src="${pageContext.request.contextPath}/resources/images/success.png"
									alt="Success Image" style="max-width: 100%;">
								<p>
									<span class="highlight-text" style="font-size: 1.3em">예약이 성공적으로 완료되었습니다.</span>
								</p>
								<p>
									<a href="schedule.do" class="btn btn-primary">내 스케줄 확인하러 가기</a>
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='reservPage.do'">닫기</button>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 기 예약건 존재로 인한 예약 불가 모달  -->
				<div class="modal fade" id="alreadyReserveModal" tabindex="-1"
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
									<p class="hightlight-text" style="font-size: 18px;">
										<b>이미 예약이 완료된 수업입니다!</b>
										<br><br>
										<a href="schedule.do">내스케줄 확인하러가기</a>
									</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

							</div>
						</div>
					</div>
				</div>
				<!-- 수강권 미소유로 인한 예약 불가 모달  -->
				<div class="modal fade" id="noTicketModal" tabindex="-1"
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
									<p class="hightlight-text" style="font-size: 18px;">
										<b>해당 수업 예약에 사용할 수강권이 존재하지 않습니다!</b><br>
										수강권 구매 후 이용하여 주시기 바랍니다.<br><br>
										<a href="ticketPage.do">수강권 구매하러가기</a>
									</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

							</div>
						</div>
					</div>
				</div>
				
				<!-- 모달 끝 -->

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
	<!-- 모달이 닫힌 후에 modal-backdrop을 수동으로 제거 -->
	$(document).ready(function() {
        $('#reservationSuccessModal').on('hidden.bs.modal', function (e) {
            $('.modal-backdrop').remove();
        });
    });
	
		var selectedTab = "pills-group-tab"; // 기본 선택 탭
		var reservationData = {};
		
		<!-- 페이지 로딩 시 -->

		$(document).ready(function() {
			
		    selectedTab = ${selectedTab};
		    console.log(selectedTab);
		    if (selectedTab === 1) {
		        $('#pills-individual-tab').addClass('active show');
		        selectedTab = "pills-individual-tab";
		    }else{
			    $('#pills-group-tab').addClass('active show');
			    selectedTab = "pills-group-tab"; 
		    }
		    getLessonInfoByCenter();
		});
		
		<!-- 탭 전환될 때마다 호출  -->
		$('#pills-individual-tab, #pills-group-tab').on('click', function() {
		    selectedTab = $(this).attr('id');
		    getLessonInfoByCenter();
		});
		
		<!-- 센터 선택 때마다 호출  -->
		$('#centerSelect').on('change', function() {
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
			var lessonType = (selectedTab === 'pills-group-tab') ? '그룹' : '개인';
		    console.log(lessonType);

		    data.lessonType = lessonType;
		    
			
			// Ajax 요청
			$.ajax({
						type : "Post",
						url : "getLessonList.do",
						data : data,
						success : function(lessonList) {
							// 성공 시 아래에 정보 업데이트
							console.log("getLessonInfoByCenter 값 가져옴")
					        console.log("Ajax 요청 성공");
					        console.log("수업 목록: ", lessonList);
					        
							
					        var gstr = ""; //그룹 탭 내용
					        var pstr ="";  //개인 탭 내용
					        
					        // 아래 아이디 가진 영역의 기존 내용을 지움
					        $('#lessonListContainerForGroup').html('');
					        $('#lessonListContainerForPersonal').html('');
					        
							if (lessonList.length < 1) {
								str = '<div class="no-lessons-message">' +
					                    '<p class="message-text">현재 개설된 수업이 없습니다.</p>' +
					                    '<p class="message-text">더 많은 정보는 센터에 문의해주세요.</p>' +
					            		'</div>';
								$('#lessonListContainerForGroup').append(str);
								$('#lessonListContainerForPersonal').append(str);
								
							} else {
				                if (lessonType === '그룹') {
				                    lessonList.forEach(function (item) {
				                    	gstr = '<div class="list-group">';
				                    	gstr += '<a class="list-group-item list-group-item-action">';
				                    	gstr += '<p class="mb-1" style="color:#841dff;">'+ item.lsTime +'~'+ item.lsEndTime +'</p>';
				                    	gstr += '<div class="d-flex w-100 justify-content-between">';
									    gstr += '<h5 class="mb-1"><b>'+ item.lsName +'</b></h5>';
									    gstr += '</div>';
									    gstr += '<p class="mb-1">' + item.trainerMemberName +'</p>';
									    gstr += '<small class="text-muted"><font style="color:red; font-weight:bold;">'+ (item.lsCapacity - item.lsCurrentApplicants)+'</font>명 남음</small> | ';
									    gstr += '<small class="text-muted"> 정원 '+ item.lsCapacity +'명</small>';
									    

							            // 예약 시간 item.lessonDatetime과 현재 날짜 비교해서 시간이 지났다면 버튼 안 보여야 함
							            var lessonDatetime = new Date(item.lessonDatetime); // 예약 시간을 Date 객체로 변환
							            var currentDate = new Date(); // 현재 시간을 Date 객체로 얻기
							            
							        	// 현재 시간에서 3시간 전의 시간을 계산
							            var threeHoursAgo = new Date();
							            threeHoursAgo.setHours(currentDate.getHours()+3);

							            if (lessonDatetime <= threeHoursAgo) { // 현재 시간 기준 3시간 전 수업 예약 불가
							                gstr += '<div class="mymodal" style="display: none;">';
							            }else if (item.lsCurrentApplicants === item.lsCapacity) {// 현재 신청 인원이 정원과 같으면 버튼이 보이지 않아야 함
							                gstr += '<div class="mymodal" style="display: none;">';
							            }else if(item.lsCloseYN){// 폐강여부가 true면 버튼 X
							            	 gstr += '<div class="mymodal" style="display: none;">';
							            }else {
							            	// 시간이 지나지 않았으면 예약하기 버튼 표시
							                gstr += '<div class="mymodal">';
							                
							                gstr += '<button type="button" class="btn btn-primary"  onclick="checkReservation(\'' + item.lsCode + '\', \'' + item.centerCode + '\')">예약하기</button>';
							                //gstr += '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservModal" onclick="getReservationInfo(\'' + item.lsCode + '\', \'' + item.centerCode + '\')">예약하기</button>';
							                
							            }

							            gstr += '</div>';
							            gstr += '</a>';
							            gstr += '</div>';

							            // lessonListContainer라는 아이디를 가진 영역에 위의 내용 삽입해줌
							            $('#lessonListContainerForGroup').append(gstr);
				                    });
				                } else {
				                	 //$('#lessonListContainerForPersonal').append('<p> 개인탭 테스트 </p>');
				                	 
				                	 //lessonList.forEach(function (item) {
				                		// pstr += '<p> 개인탭 테스트 </p>';
				                		 //$('#lessonListContainerForPersonal').append(pstr);
				                	 //});
				                	 
				                	// lessonListContainerForPersonal 영역을 지우기
				                	 $('#lessonListContainerForPersonal').empty();

				                	 // 새로운 내용 추가
				                	 $('#lessonListContainerForPersonal').append('<p> 개인탭 테스트 </p>');

				                	 
				                	

				                }

							}
						},
						error : function (xhr, status, error) {
					        console.error("Ajax 요청 실패");
					        console.error("상태 코드: ", xhr.status);
					        console.error("에러 메시지: ", error);
						}
					});
		}
		
	<!-- 현재 사용자 예약 가능 여부를 불러옴 -->
	function checkReservation(lsCode, centerCode) {
		
	    $.ajax({
	        url: 'checkReservation.do',
	        method: 'POST',
	        data: { 
	        	lsCode: lsCode,
	        	centerCode : centerCode
	        	}, 
	        success: function(response) {
	        	
	        	console.log("예약 가능 여부 체크 ");
	        	if(response.checkTicket === 0){ //수강권 미소유
	        		$('#noTicketModal').modal('show');
	        	}else if(response.checkReservation !== 0){ // 이미 예약 했다면 
	        		$('#alreadyReserveModal').modal('show');
	        	}else{
	        		getReservationInfo(lsCode, centerCode);
	        	}
	        	
	        },
	        error: function(error) {
	            console.error('AJAX 요청 시 에러', error);
	            return false;
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
	                var date = new Date(lessonDetail.lsDate);
	                var formattedDate = date.toLocaleDateString(); //날짜 형식 
	                $('#lsDate').text(formattedDate);
	                $('#lsTime').text(lessonDetail.lsTime);
	                $('#lsEndTime').text(lessonDetail.lsEndTime);

	                // 수강권 내역 조회
	                $('#ticketName').text(myTicket.ticketNameGroup1);
	                $('#remainingCount').text(myTicket.ticketRemainingCountGroup1);
	                var date = new Date(myTicket.ticketExpiryDateGroup1);
	                var formattedDate = date.toLocaleDateString(); //날짜 형식 
	                $('#expirationDate').text(formattedDate);

	                // 이용정책 조회 및 추가
	                var userguideContainer = $('#userguideContainer');
					userguideContainer.empty();

					if (data.reservGuideList.length > 0) {
					    data.reservGuideList.forEach(function (reservGuide) {
					        var listItem = $('<li class="list-group-item"></li>');
					        listItem.append('<b>' + reservGuide.ugName + '</b><br>');
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
					
					$('#reservModal').modal('show');
					
	            } else {
	                console.error("서버 응답 데이터가 비어있거나 유효하지 않습니다.");
	            }
	        },
	        error: function () {
	            console.error("getMyTicketInfo.do 호출 시 Ajax 요청 실패 ");
	        }
	    });
	}
 
	<!-- 예약 -->
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
	            url : "makeReservation.do", 
	            data : data,
	            success : function(response) {
	                console.log("makeReservation() 호출 성공");
	                sendReservationSMS(response, reservationData); //문자 발송 호출 
	             	// 예약 성공 시 기존 모달을 닫고 성공 모달 창 띄우기
	             	$('#reservModal').modal('hide');
	                $('#reservationSuccessModal').modal('show');
	                
	            },
	            error : function (xhr, status, error) {
	                console.error("Ajax 요청 실패");
	                console.error("상태 코드: ", xhr.status);
	                console.error("에러 메시지: ", error);
	            }
	        });

	    } else {
	   		// 동의하지 않았을 때 체크박스에 포커스를 줌
	        console.log("체크박스 동의하지 않음");
	        agreementCheckbox.focus();
	    }
	}
	
	<!-- 문자 발송  -->
	function sendReservationSMS(response, reservationData) {
	    // 여기서 문자발송 호출 후 성공 여부 확인
	    console.log(response.rsCode);

	    // 수업에 대한 정보 활용 가능
	    console.log(reservationData.lsCode);

        
	    // 성공 여부에 따라 처리
	    if (response.success) {
	        console.log("문자발송 성공");
	        // 성공 화면으로 이동 또는 다른 작업 수행
	        
	        $.ajax({
	            type : "Post",
	            url : "sendSms.do", 
	            data : {
	    			lsCode: reservationData.lsCode,
	    			rsCode: response.rsCode
	    		},
	            success : function(response) {
	                console.log("메시지 전송 성공");
	                //여기서 성공 화면으로 보내기 
	            },
	            error : function (xhr, status, error) {
	                console.error("Ajax 요청 실패");
	                console.error("상태 코드: ", xhr.status);
	                console.error("에러 메시지: ", error);
	            }
	        }); 
	        
	        
	    } else {
	        console.error("문자발송 실패");
	        alert(response.message); // 실패 메시지
	    }
	}
	
	
</script>


</body>

</html>