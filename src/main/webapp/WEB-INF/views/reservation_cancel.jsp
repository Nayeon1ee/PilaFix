<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang='en'>
<head>
<meta charset='utf-8' />
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_reservation_cancel.css"
	type="text/css">
<!-- bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<body>

	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>
			<main>
				<strong>제목</strong>
				<h1>예약 취소</h1>
				<p>설명</p>
				<hr>

				<div class="reserv_cancel_list">
					<div class="time">
						<h3>
							취소 가능한 시간까지
							<%=new java.util.Date()%>남았어요!
						</h3>
					</div>

					<!-- 센터 맞춰야 함 -->
					<div class="con1">
						<div class="card" style="width: 100%;">
							<div class="card-header">
								<b>내 예약 정보</b>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">XX필라테스 xx점 | 그룹수업</li>
								<li class="list-group-item"><h5>체어&바렐(B) : 다이어트, 체력강화</h5></li>
								<li class="list-group-item"><img alt="bar"
									src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
									예약날짜 :</li>
								<li class="list-group-item"><img alt="bar"
									src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
									예약시간 :</li>
							</ul>
						</div>
					</div>

					<div class="con2">
						<div class="card" style="width: 100%;">
							<div class="card-header">
								<b>내 수강권 정보 확인</b>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">XX필라테스 xx점 | 그룹수업</li>
								<li class="list-group-item"><img alt="bar"
									src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
									잔여횟수 :</li>
								<li class="list-group-item"><img alt="bar"
									src="${pageContext.request.contextPath}/resources/images/purple_bar.png">
									만료일 :</li>
							</ul>
						</div>
					</div>
					<div class="con3">
						<div class="card" style="width: 100%;">
							<div class="card-header">
								<b>이용정책</b>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><b>예약 취소 정책</b></li>
								<li class="list-group-item">수업 예약의 취소나 변경은 0일 3시간 0분 전 까지
									가능합니다.</li>
							</ul>
						</div>
					</div>

					<div class="con3">
						<div class="card" style="width: 100%;">
							<div class="d-grid gap-2">
								<button class="btn btn-primary" type="button"
									data-bs-toggle="modal" data-bs-target="#exampleModal">취소하기</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<br> <font class="highlight_p">10월 21일 오전 10:00</font>에
									진행하는 <br> 체어&바렐(B) : 다이어트, 체력강화 수업을 취소하시겠습니까? &nbsp;<br>
									<br>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary">예약 취소</button>
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