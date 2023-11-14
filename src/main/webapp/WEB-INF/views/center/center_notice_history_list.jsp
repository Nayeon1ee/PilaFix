<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>알림발송이력관리</h1>
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
							<h5 class="card-title">알림발송리스트</h5>
							<p>센터의 알림 발송 내역입니다. (예약/취소/공지/문의답변)</p>

							<!-- 
             	 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 
             	 -->



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
													<option>글 작성자</option>
													<option></option>
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



							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">알림코드</th>
										<th scope="col">알림전송일시</th>
										<th scope="col">회원코드</th>
										<th scope="col">이벤트유형</th>
										<th scope="col">고유식별코드</th>
										<th scope="col">읽음여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>0418</td>
										<td><a href="center_send_notice_detail">2023.04.18 오후
												01:08</a></td>
										<td>010408</td>
										<td>예약</td>
										<td>예약번호</td>
										<td>읽음</td>
									</tr>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

<%@ include file="center_footer_common.jsp" %>