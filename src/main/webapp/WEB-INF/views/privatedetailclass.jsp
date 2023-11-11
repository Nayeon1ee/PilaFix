<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 수업 스케줄</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_privatedetailclass.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" />


<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>
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
						<h1>개인 수업 스케줄</h1>
					</div>
				</section>

				<section class="top_bar">
					<p>10.20 금 오늘</p>
					<p>오후 16:00 ~ 오후 16:50</p>
				</section>

				<section class="explanation">
					<!--<div class='v-line'></div> -->
					<p class="page_name">개인수업</p>
					<p class="title_type_capacity">척추가 뽀개지는 필라테스 / 예약</p>
				</section>

				<!-- 등록된 값에 따라 바뀐다. -->
				<section class="status">
					<div class="image">
						<img src="${pageContext.request.contextPath}/resources/images/sample1.png" alt="sorry">
					</div>
					<div class="private_status">
						<p>회원 이름 : 송하민</p>
						<P>전화번호 : 010-2670-9255</P>
					</div>
					<div class="bt_con">
						<div class="button2">
							<!-- 예약 취소 -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">예약
								취소</button>

							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">예약을 취소하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary">취소</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 예약 취소 -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">출석
								처리</button>

							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">OOO님을 출석처리 하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary">출석</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<hr />


				<p>이전 수업</p>
				<section class="board_list">
					<div class="top">
						<div class="LS_CODE">번호</div>
						<div class="LS_NAME">수업명</div>
						<div class="LS_DATE_TIME">수업기간</div>
						<div class="LS_TYPE_YN">수업유형</div>
						<div class="CS_MEMBER_CODE">강사명</div>
						<div class="CENTER_CODE">지점명</div>
					</div>


					<div>
						<div class="LS_CODE">1</div>
						<div class="CS_NAME">
							<a href="groupdetailclass">척뿌 필라테스</a>
						</div>
						<div class="LS_DATE_TIME">2023.10.25 11:00</div>
						<div class="LS_TYPE_YN">그룹</div>
						<div class="CS_MEMBER_CODE">강사명</div>
						<div class="CENTER_CODE">중량점</div>
					</div>

					<div>
						<div class="LS_CODE">2</div>
						<div class="CS_NAME">
							<a href="privatedetailclass">척뿌 필라테스</a>
						</div>
						<div class="LS_DATE_TIME">2023.10.25 11:00</div>
						<div class="LS_TYPE_YN">개인</div>
						<div class="CS_MEMBER_CODE">강사명</div>
						<div class="CENTER_CODE">중량점</div>
					</div>

					<div class="board_page">
						<a href="#" class="bt prev"> 이전 </a> <a href="#" class="num on">1</a>
						<a href="#" class="num">2</a> <a href="#" class="num">3</a> <a
							href="#" class="num">4</a> <a href="#" class="num">5</a> <a
							href="#" class="bt next"> 다음 </a>
					</div>
				</section>
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