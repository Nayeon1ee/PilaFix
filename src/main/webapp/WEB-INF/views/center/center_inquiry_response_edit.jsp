<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의사항 - 답변등록</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">

							<form class="row g-3">
								<div class="col-md-2">
									<label class="form-label">글번호</label> <input type="text"
										readonly disabled class="form-control" value="1">
								</div>
								<div class="col-md-5">
									<label class="form-label">작성자</label> <input type="text"
										readonly disabled class="form-control" value="김xx">
								</div>
								<div class="col-md-5">
									<label class="form-label">작성일</label> <input type="text"
										readonly disabled class="form-control" value="2023-01-01">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 제목</label> <input type="text"
										readonly class="form-control" value="xx점 토미 강사 추천">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 내용</label>
									<textarea readonly class="form-control" style="height: 300px;">xx점 토미강사 추천 굳굳</textarea>
								</div>
								<div class="text-center">
									<button class="btn btn-secondary">취소</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp" %>