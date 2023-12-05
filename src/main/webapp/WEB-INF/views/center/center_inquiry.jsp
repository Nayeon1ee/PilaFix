<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 	
<%@ include file="center_header_common.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의사항관리</h1>
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
					<h5 class="card-title">문의사항 리스트</h5>
					<p>센터의 문의사항 관리 페이지입니다.</p>

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
					<hr>
					
<!-- Table with stripped rows -->
<table class="table datatable">

	
    <thead>
        <tr>
            <th scope="col">문의번호</th>
            <th scope="col">문의제목</th>
            <th scope="col">작성자</th>
            <th scope="col">문의작성일자</th>
            <th scope="col">문의수정일자</th>
            <th scope="col">문의상태</th>
        </tr>
    </thead>
    
    <tbody>
        <c:forEach items="${questionList}" var="question" varStatus="status">
            <tr>
                <td>${question.qsNumber}</td> 
                <td>${question.qsTitle}</td> 
                <td>${question.qstWriterName}</td> 
                <td>${question.qsRegdate}</td>
                <td>${question.qsModifiedDate}</td> 
                <td>
				<c:choose>
				    <c:when test="${question.qsAnswerYn}">
				        <!-- 답변완료 상태인 경우 -->
				        <button type="button" class="btn btn-primary mb-3" style="font-size: 10px; background: dimgray; border-color: dimgray;"
				                onclick="window.location.href='insertQuestionReply.do?qsNumber=${question.qsNumber}'">
				        답변완료
				        </button>
				    </c:when>
				    <c:otherwise>
				        <!-- 답변대기 상태인 경우 -->
				        <button type="button" class="btn btn-primary mb-3" style="font-size: 10px; background: red; border-color: red;"
				                onclick="window.location.href='insertQuestionReply.do?qsNumber=${question.qsNumber}'">
				        답변대기
				        </button>
				    </c:otherwise>
				</c:choose>
                </td>
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
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_2.js"></script>
	
	
<%@ include file="center_footer_common.jsp" %>