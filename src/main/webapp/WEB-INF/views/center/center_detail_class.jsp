<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>수업 상세 페이지</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- 소제목 필요 시 작성 -->
					<li class="breadcrumb-item"></li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<!-- Multi Columns Form -->
							<form class="row g-3">
								<div class="col-md-12 col-top">
									<label class="form-label">No</label>
									<input type="text" readonly class="form-control" value="${centerLesson.lsCode }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수업명</label>
									<input type="text" readonly class="form-control" value="${centerLesson.lsName }">
								</div>
								<div class="col-md-12">
									<label class="form-label">강사명</label>
									<input type="text" readonly class="form-control" value="${centerLesson.csName }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 유형</label>
									<input type="text" readonly class="form-control" value="${centerLesson.lsType }">
								</div>
								<div class="col-md-12">
									<label class="form-label">정원</label>
									<input type="text" readonly class="form-control" value="${centerLesson.lsCurrentApplication }/${centerLesson.lsCapacity }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수업 시간</label>
									<input type="text" readonly class="form-control" value="2023. 10. 19 11:00">
									
								</div>
								<div class="col-md-12 col-last">
									<label class="form-label">예약 가능 여부</label>
									<div class="col-last-last">
										<div class="col-last-last">
											<div class="radio-box">
												<div class="form-check">
													<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value=true>
													<label class="form-check-label" for="flexRadioDefault1">Y</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value=false>
														<label class="form-check-label" for="flexRadioDefault1">N</label>
												</div>
												<div class="p-check">
													<p>(Y를 선택하면 회원이 바로 구매가 가능합니다.)</p>
													<p>(N을 선택하면 수강권을 생성만 합니다.)</p>
												</div>
											</div>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											  수정
											</button>

											<!-- Modal -->
											<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">수업 등록 가능 여부를 바꾸시겠습니까?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
															<button type="button" class="btn btn-primary" onclick="location.href='updateCenterLesson.do?seq=${centerLesson.lsCode }'">수정</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="button_con">
			<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
				aria-labelledby="exampleModalToggleLabel" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">수강권을 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" onclick="location.href='deleteCenterLesson.do?lsCode=${centerLesson.lsCode }">삭제</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">삭제되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-toggle="modal" onclick="location.href='deleteCenterLesson.do?lsCode=${centerLesson.lsCode }'">삭제</button>
						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-primary delete-button" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" >삭제</button>
			<button type="button" class="btn btn-primary" aria-label="Close" onclick="location.href='getCenterLessonList.do'">목록</button>
		</div>
	</main>
	<!-- End #main -->

<%@ include file="center_footer_common.jsp" %>