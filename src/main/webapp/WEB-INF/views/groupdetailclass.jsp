<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 수업 스케줄</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_groupdetailclass.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap)common.js"></script>
</head>
<body>
	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main>
				<section class="content_description_bar">
					<div class="cover">
						<h1>그룹 수업 스케줄</h1>
					</div>
				</section>

				<section class="top_bar">
					<p>10.20 금 오늘</p>
					<p>오후 16:00 ~ 오후 16:50</p>
				</section>

				<section class="explanation">
					<!--<div class='v-line'></div> -->
					<p class="page_name">그룹수업</p>
					<p class="title_type_capacity">척추가 뽀개지는 필라테스 / 그룹레슨 / 정원 6명</p>
				</section>

				<!-- 등록된 값에 따라 바뀐다. -->
				<section class="status">
					<p>- 예약 : 6</p>
					<p>- 출석 : 6</p>
					<p>- 결석 : 0</p>
				</section>

				<!-- 등록한 회원이 있을 경우, 회원 리스트 반복문으로 인원수 만큼 표시-->
				<section class="member_list">

					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-1"
							autocomplete="off"> <label class="btn" for="btn-check-1">
							<img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">김영우
						</label>

					</div>
					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-2"
							autocomplete="off"> <label class="btn 123"
							for="btn-check-2"> <img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">이나연
						</label>
					</div>
					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-3"
							autocomplete="off"> <label class="btn" for="btn-check-3">
							<img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">김수미
						</label>
					</div>
					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-4"
							autocomplete="off"> <label class="btn" for="btn-check-4">
							<img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">민은주
						</label>
					</div>
					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-5"
							autocomplete="off"> <label class="btn" for="btn-check-5">
							<img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">주민승
						</label>
					</div>
					<div class="member-check">
						<input type="checkbox" class="btn-check" id="btn-check-6"
							autocomplete="off"> <label class="btn" for="btn-check-6">
							<img
							src="${pageContext.request.contextPath}/resources/images/sample1.png"
							alt="sorry">송하민
						</label>
					</div>
				</section>

				<!-- 등록된 회원이 없을 경우 -->
				<section class="member_none">현재 수업에 참여한 사람이 없습니다.</section>

				<section class="buttons">
					<button type="button" onclick="location.href='classlist'">목록</button>
				</section>
			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
</body>
</html>