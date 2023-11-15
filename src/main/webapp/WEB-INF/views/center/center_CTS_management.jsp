<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원관리</h1>
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
							<h5 class="card-title">회원 연동 요청</h5>
							<p>회원의 연동 요청 리스트입니다.</p>

							<!-- 
             	 이 영역에 가져온 컴포넌트 넣기 
             	 PilaAdmin의 demo 보면서 마우스 우클릭하여 소스 보기 해서 가져올 컴포넌트 위치 잘 설정하여 넣기  
             	 -->

							<div class="table-summary">
								<p>
									전체 연동 <span id="totalRequests">0</span>건 | 새 연동요청 <span
										id="newRequests">0</span>건
								</p>
							</div>

							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">이름</th>
										<th scope="col">이메일</th>
										<th scope="col">전화번호</th>
										<th scope="col">가입일</th>
										<th scope="col">상태</th>
										<th scope="col">요청관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row"><a href="center_CTS_info">003</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.06.08</td>
										<td class="stateOfrequest">요청대기</td>
										<td>
											<div class="d-grid gap-2 d-md-block">
												<button type="button" class="btn btn-primary btn-sm"
													onclick="acceptRequest(this)">수락</button>
												<button type="button" class="btn btn-primary btn-sm"
													onclick="rejectRequest(this)">거절</button>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row"><a href="center_CTS_info">002</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.06.08</td>
										<td class="stateOfrequest">요청대기</td>
										<td>
											<div class="d-grid gap-2 d-md-block">
												<button type="button" class="btn btn-primary btn-sm"
													onclick="acceptRequest(this)">수락</button>
												<button type="button" class="btn btn-primary btn-sm"
													onclick="rejectRequest(this)">거절</button>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row"><a href="center_CTS_info">001</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.06.08</td>
										<td class="stateOfrequest">요청대기</td>
										<td>
											<div class="d-grid gap-2 d-md-block">
												<button type="button" class="btn btn-primary btn-sm"
													onclick="acceptRequest(this)">수락</button>
												<button type="button" class="btn btn-primary btn-sm"
													onclick="rejectRequest(this)">거절</button>
											</div>
										</td>
									</tr>


								</tbody>
							</table>

						</div>
					</div>




					<div class="card">
						<div class="card-body">
							<h5 class="card-title">전체 회원 목록</h5>
							<p>연동완료된 전체 회원 리스트입니다.</p>

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
										<th scope="col">회원번호</th>
										<th scope="col">이름</th>
										<th scope="col">성별</th>
										<th scope="col">나이</th>
										<th scope="col">이메일</th>
										<th scope="col">전화번호</th>
										<th scope="col">가입일자</th>
										<th scope="col">수강권현황</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row"><a href="center_CTS_info">010418</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
									</tr>

									<tr>
										<th scope="row"><a href="center_CTS_info">010418</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
									</tr>


									<tr>
										<th scope="row"><a href="center_CTS_info">010408</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
									</tr>


									<tr>
										<th scope="row"><a href="center_CTS_info">010408</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
									</tr>


									<tr>
										<th scope="row"><a href="center_CTS_info">010808</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
									</tr>


									<tr>
										<th scope="row"><a href="center_CTS_info">010808</a></th>
										<td><a href="center_CTS_info">홍길동</a></td>
										<td>남자</td>
										<td>30</td>
										<td><a href="center_CTS_info">hong@naver.com</a></td>
										<td>010-1111-2222</td>
										<td>2023.04.08</td>
										<td class="subscription-status00">개인 0 / 그룹 0</td>
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
