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
							<h5 class="card-title">알림발송 상세내역</h5>
							<p>센터의 알림 발송 상세내역입니다.</p>
							
							<!-- Multi Columns Form -->
							<form class="row g-3">
								<div class="col-md-3">
									<label class="form-label">알림코드</label> 
									<input type="text" readonly disabled class="form-control" value="${noticeHistory.ncId }">
								</div>
								<div class="col-md-4">
									<label class="form-label">회원코드</label> 
									<input type="text" readonly disabled class="form-control" value="${noticeHistory.memberCode }">
								</div>
								<div class="col-md-5">
									<label class="form-label">발송일시</label> 
									<input type="text" disabled readonly class="form-control" value="${noticeHistory.ncSentDatetime }">
								</div>
								<div class="col-md-3">
									<label class="form-label">이벤트유형</label> 
									<input type="text" disabled readonly class="form-control" value="${noticeHistory.eventType }">
								</div>
								<div class="col-md-4">
									<label class="form-label">식별코드</label> 
									<input type="text" disabled readonly class="form-control" value="${noticeHistory.uniqueIdentifierCode }" >
								</div>
								<div class="col-md-5">
									<label class="form-label">읽음 여부</label> 
									<c:choose>
										<c:when test="${noticeHistory.ncReadYn }">
											<input type="text" disabled readonly class="form-control" value="읽음" >
										</c:when>
										<c:otherwise>
											<input type="text" disabled readonly class="form-control" value="읽지 않음" >
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-11">
									<label class="form-label">발송 내용</label>
									<input type="text" disabled readonly class="form-control" value="${noticeHistory.ncNoticeContent }" >
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-primary" onclick="location.href='getNoticeHistoryList.do'">목록</button>
								</div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp" %>