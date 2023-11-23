<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 	
<%@ include file="center_header_common.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의 사항</h1>
		</div>
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
			<div class="search_con">
				<div class="search">
					<div>
						<p>검색 조건:</p>
						<select>
							<option selected>전체</option>
							<option>이름</option>
							<option>수업명</option>
						</select> <input type="text" class="input_box" name="find_box" /> <input
							type="submit" value="search" class="btn btn-primary" /> <input
							type="reset" value="초기화" class="btn btn-primary">
					</div>
				</div>

				<div class="datesearch">
					<div class="search">
						<div>
							<p>수업 유형:</p>
							<select>
								<option selected>전체</option>
								<option>그룹</option>
								<option>개인</option>
							</select>
						</div>
					</div>
					<div class="search">
						<form action="url" method="post">
							<p>기간 검색:</p>
							<label for="date"></label><input class="date_select" type="date"
								id="start_date" /> ~ <label for="date"></label><input
								class="date_select" type="date" id="end_date" />
						</form>
					</div>
				</div>
			</div>
		</section> -->
		<!-- 검색끝 -->
		<div class="row mb-3">
			<label for="inputDate" class="col-sm-2 col-form-label">전체
				1,152건</label>
		</div>
		<!-- End Page Title -->

		<section class="section" style="margin-top: 10%;">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">

							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의제목</th>
										<th scope="col">작성자</th>
										<th scope="col">문의일시</th>
										<th scope="col">문의상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td><a href="#">Brandon Jacob</a></td>
										<td>Designer</td>
										<td>2016-05-25</td>
										<td><button type="submit"
												onclick="location.href='center_questionR' "
												class="btn btn-primary mb-3"
												style="font-size: 10px; background: red; border-color: red;">답변대기</button></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td><a href="#">Bridie Kessler</a></td>
										<td>Developer</td>
										<td>2014-12-05</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td><a href="#">Ashleigh Langosh</a></td>
										<td>Finance</td>
										<td>2011-08-12</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td><a href="#">Angus Grady</a></td>
										<td>HR</td>
										<td>2012-06-11</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td><a href="#">Raheem Lehner</a></td>
										<td>Dynamic Division Officer</td>
										<td>2011-04-19</td>
										<td><button type="submit" class="btn btn-primary mb-3"
												style="font-size: 10px; background: dimgray; border-color: dimgray;">답변완료</button></td>
									</tr>
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

	<%@ include file="center_footer_common.jsp" %>
	