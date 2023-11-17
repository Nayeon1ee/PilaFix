<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>강사관리</h1>
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
							<h5 class="card-title">강사 상세 정보</h5>
							<p>강사의 상세정보 페이지입니다.</p>

							<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->


							<div class="row">
								<div class="col-xl-4">

									<div class="card card_box_shadow">
										<div
											class="card-body profile-card pt-4 d-flex flex-column align-items-center">

											<img src="#" alt="logo" class="rounded-circle rounded-logo">

											<h5>홍길동</h5>
											<h5>1992.01.08 (만 00세)</h5>
											<div class="social-links mt-2">
												<table class="CTS_information00">
													<tr>
														<td class="CTS_information01">회원번호</td>
														<td>010408</td>
													</tr>
													<tr>
														<td class="CTS_information01">연락처</td>
														<td>010-1234-5678</td>
													</tr>
													<tr>
														<td class="CTS_information01">이메일</td>
														<td>choi@naver.com</td>
													</tr>
													<tr>
														<td class="CTS_information01">회원등록일</td>
														<td>2023.01.08</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

								</div>

								<div class="col-xl-8">

									<div class="card card_box_shadow">
										<div class="card-body pt-3">
											<!-- Bordered Tabs -->
											<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">

												<li class="nav-item" role="presentation">
													<button class="nav-link active" data-bs-toggle="tab"
														data-bs-target="#profile-overview" aria-selected="true"
														role="tab">수업 진행 현황</button>
												</li>

											</ul>

											<div class="tab-pane fade show active profile-overview"
												id="profile-overview" role="tabpanel">
												<h5 class="card-title st_session_pass_p">전월 개인 수업 현황</h5>
												<div class="row">
													<div class="col-lg-3 col-md-4 label">기준일자</div>
													<div class="col-lg-9 col-md-8">2023.10.01~2023.10.31</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수업건수</div>
													<div class="col-lg-9 col-md-8">8건</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">비고</div>
													<div class="col-lg-9 col-md-8">폐강 1건</div>
												</div>



												<hr class="st_session_pass_hr">


												<h5 class="card-title st_session_pass">전월 그룹 수업 현황</h5>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기준일자</div>
													<div class="col-lg-9 col-md-8">2023.10.01~2023.10.31</div>
												</div>
												<div class="row">
													<div class="col-lg-3 col-md-4 label">수업건수</div>
													<div class="col-lg-9 col-md-8">8건</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">비고</div>
													<div class="col-lg-9 col-md-8">-</div>
												</div>


											</div>




										</div>
										<!-- End Bordered Tabs -->

									</div>
								</div>

							</div>



							<hr>


							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">개인 수업</h5>
									<p>강사가 진행하고있는 개인수업 내역입니다.</p>

									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일자</th>
												<th scope="col">수업시작시간</th>
												<th scope="col">수업종료시간</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 07:00</td>
												<td>오후 08:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 06:00</td>
												<td>오후 07:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 05:00</td>
												<td>오후 06:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 04:00</td>
												<td>오후 05:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 03:00</td>
												<td>오후 04:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->
									<!-- 페이징 처리 시작 -->
									<div class="admin-screen-paging">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">이전</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#">다음</a></li>
										</ul>
									</div>
									<!-- 페이징 처리 끝 -->



								</div>
							</div>



							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">그룹 수업</h5>
									<p>강사가 진행하고있는 그룹수업 내역입니다.</p>

									<!--검색창
			
			 -->
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일자</th>
												<th scope="col">수업시작시간</th>
												<th scope="col">수업종료시간</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 07:00</td>
												<td>오후 08:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 06:00</td>
												<td>오후 07:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 05:00</td>
												<td>오후 06:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 04:00</td>
												<td>오후 05:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.18(금)</td>
												<td>오후 03:00</td>
												<td>오후 04:00</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->


									<!-- 페이징 처리 시작 -->
									<div class="admin-screen-paging">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">이전</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#">다음</a></li>
										</ul>
									</div>
									<!-- 페이징 처리 끝 -->
								</div>
							</div>



							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">전체 수업 내역</h5>
									<p>강사가 현재까지 센터에서 진행한 전체 수업의 내역입니다.</p>
									<p>
										전체 <span id="totalRequests">0</span>건
									</p>
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업시작일자</th>
												<th scope="col">수업종료일자</th>
												<th scope="col">수업명</th>
												<th scope="col">상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>

											<tr>
												<td>2023.04.08(금)</td>
												<td>2023.04.18(금)</td>
												<td class="truncate-text">수업명수업명수업명수업명수업명</td>
												<td>진행중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp"%>