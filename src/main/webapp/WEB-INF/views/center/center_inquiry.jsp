<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의 사항</h1>
		</div>

		<section class="section" >
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
			              <h5 class="card-title">중제목 작성</h5>
			              <p>간략한 설명</p>				
		
		
		<!-- 검색시작 -->
		<div class="search-filter">
			<div class="search-filter-inner">

				<div class="serch-filter-content">
					<div class="search-top">
						<div class="col-md-3">
							<label for="inputState" class="form-label">검색</label> <select
								id="inputState" class="form-select">
								<option selected disabled>전체</option>
								<option>글 번호</option>
								<option>문의제목</option>
								<option>작성자</option>
								<option>문의일시</option>
								<option>문의상태</option>
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
		<!-- <section class="search_menu search-filter">

		<!-- 검색끝 -->

		<!-- End Page Title -->

							<div class="row mb-3">
							<label class="col-sm-2 col-form-label">전체 ${totalQuestionCount}건</label>
							</div>
							

							<!-- Table with stripped rows -->

							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의제목</th>
										<th scope="col">작성자</th>
										<th scope="col">문의일시</th>
										<th scope="col">수정일시</th>
										<th scope="col">문의상태</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty questionList }">
									<tr>
										<td colspan="7">문의사항이 존재하지 않습니다. </td>
									</tr>
								</c:if>
								<c:forEach var="list" items="${questionList }">
									<tr>
										<td>${list.qsNumber }</td>
										<td>${list.qsTitle }</td>
										<td>${list.writerName }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.qsRegdate }"/>
										<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.qsModifiedDate }"/>
										<td><button type="submit"
												onclick="location.href='' "
												class="btn btn-primary mb-3">${list.qsAnswerYn ? '답변대기' : '답변완료'}</button></td>
									</tr>
								</c:forEach>
			                </tbody>
							</table>
							

							<!-- End Table with stripped rows -->
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
						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_2.js"></script>

<%@ include file="center_footer_common.jsp" %>