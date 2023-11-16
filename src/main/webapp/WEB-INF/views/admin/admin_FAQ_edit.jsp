<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="admin_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>FAQ 수정</h1>
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
							<h5 class="card-title">FAQ 수정화면</h5>
							<!-- <p>간략한 설명</p> -->

							<!-- Multi Columns Form -->
							<form class="row g-3" action="updateFaqInfo.do" method="post">
								<input type="hidden" name="fqNumber" value="${faqInfo.fqNumber}">
								<%-- <div class="col-md-2">
									<label class="form-label">글번호</label> <input type="text" readonly disabled class="form-control" value="${faqInfo.fqNumber }">
								</div> --%>
								<div class="col-md-12">
									<label class="form-label">공통</label>
									<c:choose>
									<c:when test="${faqInfo.fqType}">
										<input type="text" readonly class="form-control" value="공통" disabled>
									</c:when>
									<c:when test="${faqInfo.fqType}">
										<input type="text" readonly class="form-control" value="회원" disabled>
									</c:when>
									<c:otherwise>
										<input type="text" readonly class="form-control" value="강사" disabled>
									</c:otherwise>
									</c:choose>
								</div>
								<%-- <div class="col-md-4">
									<label class="form-label">작성일</label> <input type="text" readonly disabled class="form-control" value="${faqInfo.fqRegDate }">
								</div> --%>
								<%-- <div class="col-md-4">
									<label class="form-label">최근 수정일</label> <input type="text" readonly disabled class="form-control" value="${faqInfo.fqType }">
								</div> --%>
								<div class="col-md-12">
									<label class="form-label">글 제목</label> 
									<input type="text" class="form-control" value="${faqInfo.fqTitle }" name="fqTitle">
								</div>
								<div class="col-md-12">
									<label class="form-label">글 내용</label>
									<textarea class="form-control" style="height: 300px;" name="fqContent">${faqInfo.fqContent}</textarea>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary" onclick="location.href='updateFaqInfo.do">수정</button>
									<button type="reset" class="btn btn-secondary" onclick="location.href='getFaqInfoList.do'" >취소</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->

						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- 삭제 모달 -->
		<div class="modal fade" id="basicModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">확인 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp" %>
</body>
</html>