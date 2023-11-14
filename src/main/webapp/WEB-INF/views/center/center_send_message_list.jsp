<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문자발송이력관리</h1>
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
							<h5 class="card-title">문자발송리스트</h5>
							<p>센터의 문자 발송 내역입니다.</p>
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
										<th scope="col">발송코드</th>
										<th scope="col">발송일시</th>
										<th scope="col">수신자명</th>
										<th scope="col">수신자번호</th>
										<th scope="col">상태</th>
										<th scope="col">비고</th>
									</tr>
								</thead>

								<tbody>
								<c:if test="${empty sendSmsHistoryList }">
									<tr>
										<td colspan="6">문자발송 이력이 존재하지 않습니다. </td>
									</tr>
								</c:if>
								<c:forEach var="list" items="${sendSmsHistoryList }">
									<tr>
										<td>${list.shSendCode }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.shSendDatetime }"/>
										<td><a href="getSendSmsHistory.do?shSendCode=${list.shSendCode }">${list.shRecipientName }</a></td>
										<td>${list.shRecipientPhone }</td>
										<c:choose>
											<c:when test="${list.shSuccessYn }">
												<td>성공</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.shSuccessDatetime }"/></td>
											</c:when>
											<c:otherwise>
												<td>실패</td>
												<td>${list.shFailReason }</td>
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
			</div>
		</section>

	</main>
	<!-- End #main -->

	
<%@ include file="center_footer_common.jsp" %>