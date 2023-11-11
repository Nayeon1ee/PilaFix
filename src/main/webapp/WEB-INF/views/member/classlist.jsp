<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 리스트</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_classlist.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />
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

				<section class="content_description_bar">
					<div class="cover">
						<!-- <div class='v-line'></div>  -->
						<h1>수업 확인</h1>
						<h2>${TBL_CST.CS_NAME}님의수업리스트입니다.</h2>
					</div>
				</section>
				<hr />


				<section class="search_menu">

					<!-- 라디오 버튼 -->
					<div class="wrapper-1">
						<input type="radio" class="btn-check" name="options" id="option1"
							autocomplete="off" checked> <label
							class="btn btn-secondary" for="option1">그룹수업</label> <input
							type="radio" class="btn-check" name="options" id="option2"
							autocomplete="off"> <label class="btn btn-secondary"
							for="option2">개인수업</label>
					</div>

					<div class="search">
						<div>
							<p>검색 조건:</p>
							<select>
								<option selected>전체</option>
								<option>이름</option>
								<option>수업명</option>
							</select> <input type="text" class="input_box" name="find_box" /> <input
								type="submit" value="search" class="search_btn" />
						</div>
					</div>

					<div class="datesearch">
						<div>
							<form action="url" method="post">
								<p>기간 검색:</p>
								<label for="date"></label><input type="date" id="start_date" />
								~ <label for="date"></label><input type="date" id="end_date" />
							</form>
							<div class="search"></div>
						</div>
					</div>
				</section>
				<hr />
				<section class="board_list">
					<div class="top">
						<div class="LS_CODE">번호</div>
						<div class="LS_NAME">수업내용명</div>
						<div class="LS_DATE_TIME">수업기간</div>
						<div class="LS_CURRENT_APPLICANTS_CAPACITY">진행인원</div>
						<div class="LS_CLOSURE_YN">상태</div>
						<div class="CENTER_CODE">지점명</div>
					</div>

					<div>
						<div class="LS_CODE">1</div>
						<div class="CS_NAME">
							<a href="groupdetailclass">척뿌 필라테스</a>
						</div>
						<div class="LS_DATE_TIME">2023.10.25 11:00</div>
						<div class="LS_CURRENT_APPLICANTS_CAPACITY">1/6</div>
						<div class="LS_STATUS">폐강</div>
						<div class="CENTER_CODE">중량점</div>
					</div>

					<div>
						<div class="LS_CODE">2</div>
						<div class="CS_NAME">
							<a href="privatedetailclass">척뿌 필라테스</a>
						</div>
						<div class="LS_DATE_TIME">2023.10.25 11:00</div>
						<div class="LS_CURRENT_APPLICANTS_CAPACITY">1/1</div>
						<div class="LS_STATUS">폐강</div>
						<div class="CENTER_CODE">중량점</div>
					</div>

					<div class="board_page">
						<a href="#" class="bt prev"> 이전 </a> <a href="#" class="num on">1</a>
						<a href="#" class="num">2</a> <a href="#" class="num">3</a> <a
							href="#" class="num">4</a> <a href="#" class="num">5</a> <a
							href="#" class="bt next"> 다음 </a>
					</div>
				</section>

			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>
</body>
</html>