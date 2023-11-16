<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>신고글 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">필요 시 작성</li>
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">중제목 작성</h5>
							<p>간략한 설명</p>

							<!-- 검색필터 시작 -->
							<div class="search-filter">
								<div class="search-filter-inner">

									<div class="serch-filter-content">
										<div class="search-top">
											<div class="col-md-3">
												<label for="inputState" class="form-label">검색</label> <select
													id="inputState" class="form-select">
													<option selected disabled>전체</option>
													<option>글 제목</option>
													<option>작성자</option>
												</select>
											</div>
											<div class="serch-input">
												<div class="col-md-6">
													<input type="text" class="form-control" id="inputCity"
														placeholder="검색어를 입력해주세요">
												</div>
												<div class="search-btn">
													<button type="submit" class="btn btn-primary search">검색</button>
													<button type="reset" class="btn btn-primary search"
														id="resetButton">초기화</button>
												</div>
											</div>
										</div>

										<div class="search-date">
											<div class="col-md-3">
												<label for="inputState" class="form-label">처리상태</label> <select
													id="inputState2" class="form-select">
													<option selected disabled>전체</option>
													<option>처리완료</option>
													<option>처리대기</option>
												</select>
											</div>
											<div class="date-filter">
												<label for="inputState" class="form-label">기간검색</label>
												<div class="col-sm-12">
													<input type="date" class="form-control-date" id="startDate">
													<span>~</span> <input type="date" class="form-control-date"
														id="endDate">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 검색필터 끝 -->
							<!-- 게시판 시작 -->
							<h5 class="card-title"></h5>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">글제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">신고건수</th>
										<th scope="col">처리상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">5</th>
										<td><a href="#">xx점 후기</a></td>
										<td>홍길동</td>
										<td>2016-05-25</td>
										<td><span class="tooltip-baned-reason">3건 <span
												class="tooltip-baned-text"><p>신고사유</p>- 성희롱적 발언<br>-
													스팸/홍보/도배글<br>- 개인정보 노출 게시물 </span></span></td>
										<td>처리대기</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td><a href="#" class="admin-alink-color">코인 어쩌구</a></td>
										<td>김00</td>
										<td>2013-03-23</td>
										<td><span class="tooltip-baned-reason">2건 <span
												class="tooltip-baned-text"><p>신고사유</p>- 성희롱적 발언<br>-
													개인정보 노출 게시물 </span></span></td>
										<td>처리완료</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td><a href="#" class="admin-alink-color">너모 힘들다</a></td>
										<td>신00</td>
										<td>2011-06-12</td>
										<td><span class="tooltip-baned-reason">1건 <span
												class="tooltip-baned-text"><p>신고사유</p>- 성희롱적 발언<br>
											</span></span></td>
										<td>처리완료</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
										<td>신00</td>
										<td>2011-08-12</td>
										<td><span class="tooltip-baned-reason">3건 <span
												class="tooltip-baned-text"><p>신고사유</p>- 성희롱적 발언<br>-
													스팸/홍보/도배글<br>- 개인정보 노출 게시물 </span></span></td>
										<td>처리완료</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td><a href="#" class="admin-alink-color">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></td>
										<td>신00</td>
										<td>2011-08-12</td>
										<td><span class="tooltip-baned-reason">1건 <span
												class="tooltip-baned-text"><p>신고사유</p>- 스팸/홍보/도배글 </span></span></td>
										<td>처리완료</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

<%@ include file="admin_footer_common.jsp"%>