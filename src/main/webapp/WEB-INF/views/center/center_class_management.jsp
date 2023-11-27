<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>수업관리</h1>
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
												</select>
											</div>
											<div class="serch-input">
												<div class="col-md-6">
													<input type="text" class="form-control" id="inputCity" placeholder="검색어를 입력해주세요">
												</div>
												<div class="search-btn">
													<button type="submit" class="btn btn-primary search">검색</button>
													<button type="reset" class="btn btn-primary search" id="resetButton">초기화</button>
												</div>
											</div>
										</div>
										<div class="search-date">
											<div class="col-md-3">
												<label for="inputState" class="form-label">기간검색</label>
												<select id="inputState2" class="form-select">
													<option selected disabled>전체</option>
													<option>등록일자</option>
													<option>최근 수정일자</option>
												</select>
											</div>
											<div class="date-filter">
												<label for="inputState" class="form-label">&nbsp;</label>
												<div class="col-sm-12">
													<input type="date" class="form-control-date" id="startDate">
													<span>~</span>
													<input type="date" class="form-control-date" id="endDate">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 검색필터 끝 -->
							<hr />
							<div class="terms-btn">
					              <span class="terms-reg-btn">
									<button type="button" class="btn btn-primary" onclick="location.href='insertCenterLesson.do'">수업 등록</button>
								</span>
							</div>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">수업 코드</th>
										<th scope="col">수업명</th>
										<th scope="col">강사</th>
										<th scope="col">수업 유형</th>
										<th scope="col">진행 인원</th>
										<th scope="col">수업 날짜</th>
										<th scope="col">수업 시간</th>
										<th scope="col">폐강 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${CenterLessonList == null }">
										<tr>
											<td colspan="5">등록된 글이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="centerLesson" items="${CenterLessonList }">
										<tr>
											<td>${centerLesson.lsCode }</td>
											<td><a href="getCenterLesson.do?seq=${centerLesson.lsCode }">${centerLesson.lsName }</a></td>
											<td>${centerLesson.csName }</td>
											<td>${centerLesson.lsType}</td>
											<td>${centerLesson.lsCurrentApplicants } / ${centerLesson.lsCapacity }</td>
											<td>${centerLesson.lsDate }</td>
											<td>${centerLesson.lsTime }:00</td>
											<c:choose>

												<c:when test="${centerLesson.lsColseYN=='f'}"><td>N</td></c:when>
												<c:otherwise><td>Y</td></c:otherwise>

											</c:choose>
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
	<!-- End #main -->
<%@ include file="center_footer_common.jsp" %>