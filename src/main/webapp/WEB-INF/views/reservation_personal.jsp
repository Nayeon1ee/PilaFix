<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link rel='stylesheet'
	href="${pageContext.request.contextPath}/resources/temparycss/main.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/temparyjs/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/locales/ko.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			contentHeight : '500', //캘린더 크기 설정
			contentWidth : '400',
			locale : 'ko',
			editable : true, //수정 여부
			headerToolbar : {
				left : 'prev',
				center : 'title',
				right : 'next'
			},
			selectable : true,
			events : [ {
				title : '체어&바렐(B)', //캘린더 표시 일정 이름
				start : '2023-10-25' // 표시 일정 시작일
			//end : '2023-10-26' //표시 일정 마지막일
			}, {
				title : '콤비리포머(C)', //캘린더 표시 일정 이름
				start : '2023-10-10' // 표시 일정 시작일
			} ],
			eventClick : function(info) {
				window.location.href(info.event.url);
			}
		});
		calendar.render();
	});
</script>
</head>
<!-- bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_reservation_details.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_calendar.css"
	type="text/css">
<body>

	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>
			<main>
				<strong>strong제목</strong>
				<h1>h1 제목</h1>
				<p>설명</p>
				<hr>
				<div class='cal'>

					<div id='calendar'></div>

				</div>

				<!-- 10/29 부트스트랩 사용하면 달력이랑 충돌남 해결 필요  -->

				<div class='content'>

					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">개인 수업</a></li>
						<li class="nav-item"><a class="nav-link"
							href="reservation_group">그룹 수업</a></li>
					</ul>

					<div class="list-group">
						<div class="list-group-title">
							<p>홍길동 강사</p>
							<p>
							<h5 class="mb-1">콤비리포머(A): 재활, 스트레칭</h5>
							</p>
						</div>

						<div class="content-filter">
							<div class="form-check form-switch">
								<!-- 새로고침 이미지 필요 -->
								<button class="refresh" onClick="window.location.reload()">새로고침</button>
							</div>
						</div>

						<div class="list-group-time1">
							<p>
								<b>오전</b>
							</p>
							<div class="form-check">
								<input type="radio" class="btn-check" name="options"
									id="option1" autocomplete="off" disabled="disabled"> <label
									class="btn btn-outline-primary" for="option1">09:00</label> <input
									type="radio" class="btn-check" name="options" id="option2"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="option2">10:00</label> <input
									type="radio" class="btn-check" name="options" id="option3"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="option3">11:00</label>
							</div>
						</div>

						<div class="list-group-time2">

							<p>
								<b>오후</b>
							</p>
							<div class="form-check">
								<input type="radio" class="btn-check" name="options"
									id="option4" autocomplete="off" disabled> <label
									class="btn btn-outline-primary" for="option4">12:00</label> <input
									type="radio" class="btn-check" name="options" id="option5"
									autocomplete="off" checked> <label
									class="btn btn-outline-primary" for="option5">01:00</label> <input
									type="radio" class="btn-check" name="options" id="option6"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="option6">02:00</label> <input
									type="radio" class="btn-check" name="options" id="option7"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="option7">03:00</label>
							</div>

						</div>
					</div>
					<div class="d-grid gap-2">
						<button class="btn btn-primary" type="button"
							style="border-radius: 0;" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop">예약하기</button>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
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

									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>수업 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item">XX필라테스 xx점 | 개인수업</li>
											<li class="list-group-item"><h5 style="">체어&바렐(B) :
													다이어트, 체력강화</h5></li>
											<li class="list-group-item"><img alt="bar"
												src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
												강사명 :</li>
											<li class="list-group-item"><img alt="bar"
												src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
												예약날짜 :</li>
											<li class="list-group-item"><img alt="bar"
												src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
												예약시간 :</li>
										</ul>
									</div>

									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>내 수강권 정보 확인</b>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item">XX필라테스 xx점 | 개인수업</li>
											<li class="list-group-item"><img alt="bar"
												src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
												잔여횟수 :</li>
											<li class="list-group-item"><img alt="bar"
												src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
												만료일 :</li>
										</ul>
									</div>

									<div class="card" style="width: 100%;">
										<div class="card-header">
											<b>이용정책</b>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item"><b>예약 취소 정책</b></li>
											<li class="list-group-item">수업 예약의 취소나 변경은 <font
												class="highlight_r">0일 3시간 0분 전까지</font> 가능합니다.
											</li>
											<li class="list-group-item"><b>결석 처리 정책</b></li>
											<li class="list-group-item">무단 결석이나 취소 가능 기간 내 예약을 취소하지
												못한 경우 <font class="highlight_r">사용 횟수만큼 잔여 횟수가 자동 차감</font>됩니다.
											</li>
										</ul>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> 이용
											정책을 전부 확인하였습니다. 이에 동의합니다. </label>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>


			</main>
			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>

</body>
</html>