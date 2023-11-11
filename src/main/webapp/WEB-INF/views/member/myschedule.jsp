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
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_calendar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_myschedule.css">
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

				<div class='cal'>
					<div id='calendar'></div>
				</div>
				<div class='content'>

					<div class="card" style="width: 100%; border-radius: 0;">
						<div class="card-header" style="height: 100px;">
							<font style="font-weight: bold;">당월 출석 현황</font><br> <br>
							<ul id="nav5" class="nav justify-content-around bg-light">
								<li class="nav-item"><a class="nav-link active"
									style="color: #0070c0; text-weight: bold; text-decoration: none;">예약</a></li>
								<li class="nav-item"><a class="nav-link"
									style="color: #14761d; text-weight: bold; text-decoration: none;">출석</a></li>
								<li class="nav-item"><a class="nav-link"
									style="color: #ff6600; text-weight: bold; text-decoration: none;">결석</a></li>
							</ul>
						</div>
					</div>

					<div class="card-header-con">

						<div class="form-check">
							<input type="radio" class="btn-check" name="options" id="option1"
								autocomplete="off" checked> <label
								class="btn btn-outline-primary1" for="option1">전체</label> <input
								type="radio" class="btn-check" name="options" id="option2"
								autocomplete="off"> <label
								class="btn btn-outline-primary2" for="option2">예약</label> <input
								type="radio" class="btn-check" name="options" id="option3"
								autocomplete="off"> <label
								class="btn btn-outline-primary3" for="option3">출석</label> <input
								type="radio" class="btn-check" name="options" id="option4"
								autocomplete="off"> <label
								class="btn btn-outline-primary4" for="option4">결석</label>
						</div>

					</div>

					<div class="card" style="border-radius: 0;">
						<div class="card-header">10.23 월요일</div>
						<div class="card-body">
							<div class="card-body-in">
								<div class="card-img">
									<img alt="bar"
										src="${pageContext.request.contextPath }/resources/images/gray_bar.png">
								</div>
								<!-- 출석이면 초록, 예약이면 파랑, 결석이면 주황  -->
								<small class="text-muted">예약 &nbsp; 오전 12:00 ~ 12:50 </small>
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1" style="color: black;">체어&바렐(A): 체형교정</h5>
									<button type="button" class="btn btn-outline-primary">예약
										취소</button>
								</div>
								<small class="text-muted">홍길동 강사</small><br> <small
									class="text-muted">이브 필라테스 xx점</small>
							</div>
						</div>
					</div>

					<div class="card" style="border-radius: 0;">
						<div class="card-header">10.23 월요일</div>
						<div class="card-body">
							<div class="card-body-in">
								<!-- 출석이면 초록, 예약이면 파랑, 결석이면 주황  -->
								<small class="text-muted">출석 &nbsp; 오전 12:00 ~ 12:50 </small>
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1" style="color: black;">체어&바렐(A): 체형교정</h5>
								</div>
								<small class="text-muted">홍길동 강사</small><br> <small
									class="text-muted">이브 필라테스 xx점</small>
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