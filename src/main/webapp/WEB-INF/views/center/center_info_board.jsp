<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="center_header_common.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공지사항관리</h1>
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
						<h5 class="card-title">공지사항 리스트</h5>
						<p>센터가 작성하는 공지사항 리스트입니다.</p>

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

						<!-- Table with stripped rows -->
						<hr>
						<div class="terms-btn my-3">
							<span class="terms-reg-btn">
								<button type="button" class="btn btn-primary me-3"
									onclick="location.href='insertCenterInfo.do'">공지사항 등록</button>
							</span>
						</div>



						<table class="table datatable">

							<thead>
								<tr>
									<th scope="col">NO.</th>
									<th scope="col">글제목</th>
									<th scope="col">작성일자</th>
									<th scope="col">조회수</th>
									<th scope="col">공개여부</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${infoList == null }">
									<tr>
										<td colspan="5">등록된 글이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="centerInfo" items="${infoList }">
									<tr>
										<td>${centerInfo.icNumber }</td>
										<td><a
											href="getCenterInfo.do?icNumber=${centerInfo.icNumber}">${centerInfo.title }</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${centerInfo.regDate }" /></td>
										<td>${centerInfo.cnt }</td>
										<c:choose>
											<c:when test="${centerInfo.openYN}">
												<td>공개</td>
											</c:when>
											<c:otherwise>
												<td>비공개</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- End Table with stripped rows -->
					</div>
				</div>
			</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="center_footer_common.jsp"%>