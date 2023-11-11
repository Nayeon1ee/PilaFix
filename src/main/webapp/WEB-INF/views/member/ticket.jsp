<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css, js연결 -->
<link
	href="${pageContext.request.contextPath}/resources/css/templateC.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ticket.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
</head>
<body>
	<div class="container000">
		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>
			<main>
				<!-- 왼쪽 영역 비율7 -->
				<div class='ticket'>
					<div class="slect-wrap">
						<img
							src="${pageContext.request.contextPath}/resources/images/select-arr.png"
							alt="arr Image"> <select>
							<option>룩스 필라테스삼송점</option>
							<option>이브 필라테스 종로점</option>
						</select>
					</div>
					<hr>
					<div>
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">개인</a></li>
							<li class="nav-item"><a class="nav-link" href="#">그룹</a></li>
							</li>
						</ul>
					</div>
					<section class="ticket-list">
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>

						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>
						<div class="list-group-ticket" id="list-item">
							<a href="#" class="list-group-item list-group-item-action active"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<h5 class="mb-1">6:1 그룹 레슨 24회 (3개월)</h5>
								</div>
								<p class="mb-1">척추가 맞춰지는 필라테스</p>
								<div>
									<table>
										<td>
										<tr>2023.10.10~2024.01.01
										</tr>
										<tr>
											<span
												style="font-weight: bold; text-align: right; display: block;">
												650,000원 </span>
										</tr>
										</td>
									</table>
								</div>
							</a>
						</div>

					</section>
				</div>
				<!-- 오른쪽 영역 비율3 -->
				<div class='content1'>
					<!-- 기본으로 보여줄 이미지 -->
					<div class="content1-img" id="content1-disappear">
						<div>
							<img
								src="${pageContext.request.contextPath}/resources/images/hand.png"
								alt="hand Image">
							<p>관심가는 수강권을 클릭해보세요!</p>
						</div>
					</div>

					<!-- 클릭시 보여줄 이미지 -->

					<div class="card-content1-replace" id="content1-replace">
						<div class="card text-center">
							<div class="card-header-title">척추가 부서지는 필라테스</div>
							<div class="card-body-detail">
								<ul>
									<li><img
										src="${pageContext.request.contextPath}/resources/images/purple_bar.png"
										alt="bar Image">&nbsp;수업 유형 : 6:1 그룹레슨</li>
									<li><img
										src="${pageContext.request.contextPath}/resources/images/purple_bar.png"
										alt="bar Image">&nbsp;수업 횟수 : 24회</li>
									<li><img
										src="${pageContext.request.contextPath}/resources/images/purple_bar.png"
										alt="bar Image">&nbsp;사용 기간 : 2023.10.10~2024.01.01</li>
									<li><img
										src="${pageContext.request.contextPath}/resources/images/purple_bar.png"
										alt="bar Image">&nbsp;금액 : 533,000원</li>
								</ul>
							</div>
							<div class="card-footer text-muted">이용정책</div>
							<div class="card-body">
								<div class="card-body-title">환불 정책</div>
								<div class="card-body-content">
									무단 결석이나 기간내에 예약을 취소하지 못한 경우 <span style="color: red;">사용
										횟수만큼 잔여 횟수가 자동 차감</span> 됩니다.
									안녕안녕안ㄴ녕앙ㄴㄴ녕아안녕안녕안ㄴ녕앙ㄴㄴ녕아ㅣ느ㅏㄴ이ㅏ안녕안녕안ㄴ녕앙ㄴㄴ녕아ㅣ느ㅏㄴ이ㅏ안녕안녕안ㄴ녕앙ㄴㄴ녕아ㅣ느ㅏㄴ이ㅏ안녕안녕안ㄴ녕앙ㄴㄴ녕아ㅣ느ㅏㄴ이ㅏㅣ느ㅏㄴ이ㅏ루누라ㅜ눙ㄹ
									rrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdknfnjsnfrkskdskdknfnjsnf
								</div>
							</div>
							<div class="policy-area">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="flexCheckDefault"> <label class="form-check-label"
										for="flexCheckDefault" style="margin: 10px;"> 이용 정책을
										모두 확인 하였습니다. 이에 동의합니다.</label>
								</div>
							</div>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								class="btn btn-primary">결제하기</button>

						</div>
					</div>
				</div>

				<!-- 모달 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">구매가 완료
									되었습니다!</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">마이페이지에서 내 수강권을 확인하실 수 있습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button onclick="location.href='#(마이페이지 링크 추가)'" type="button"
									class="btn btn-primary">마이페이지로 가기</button>
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
	<!-- 클릭하면 우측 화면 디폴트에서 상세화면으로 바뀌게 하는 js -->
	<script>
		// JavaScript를 사용하여 요소 클릭 시 내용 교체
		const listGroupItem = document.getElementById('list-item');
		const content1Replace = document.getElementById('content1-replace');
		const content1img = document.getElementById('content1-disappear');

		listGroupItem.addEventListener('click', function() {
			content1img.style.display = 'none'; // content1-img클래스 숨김
			content1Replace.style.display = 'block'; // card-content1-replace클래스부분이 보임
		});
	</script>


</body>
</html>