<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>수강권 관리</h1>
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
							<!-- 검색필터 시작 -->
				<div class="search-filter">
							<div class="search-filter-inner">

								<div class="serch-filter-content">
									<div class="search-top">
										<div class="col-md-3">
											<label for="inputState" class="form-label">검색</label> <select
												id="inputState" class="form-select">
												<option selected disabled>전체</option>
												<option>약관명</option>
												<option>필수 여부</option>
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
												<input type="date" class="form-control-date me-1"
													id="startDate">
												<div class="icon mt-1">
													<i class="ri-arrow-right-line"></i>
												</div>
												<input type="date" class="form-control-date ms-1"
													id="endDate">
													
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
							<!-- 검색필터 끝 -->

							<hr />

							<div class="button_con d-flex justify-content-end me-3">
								<button type="button" onclick="location.href='insertCenterTicket.do'" class="btn btn-primary">수강권 등록</button>
							</div>


							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">수강권 코드</th>
										<th scope="col">수강권명</th>
										<th scope="col">수강권 유형</th>
										<th scope="col">수업 정원</th>
										<th scope="col">사용 기간</th>
										<th scope="col">횟수</th>
										<th scope="col">가격</th>
										<th scope="col">구매 가능 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${CenterTicketList == null }">
										<tr>
											<td colspan="5">등록된 글이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="centerTicket" items="${CenterTicketList }">
										<tr>
											<td>${centerTicket.tkCode }</td>
											<td><a href="getCenterTicket.do?seq=${centerTicket.tkCode }">${centerTicket.tkName }</a></td>
											<td>${centerTicket.tkLessonType }</td>
											<td>${centerTicket.tkCapacity}명</td>
											<td>${centerTicket.tkUsageNumMonth }개월</td>
											<td>${centerTicket.tkUsageCount }회</td>
											<td>${centerTicket.tkPrice }원</td>
											<td>${centerTicket.purchaseAvailableYN ? '구매 가능' : '구매 불가능'}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
<%@ include file="center_footer_common.jsp" %>