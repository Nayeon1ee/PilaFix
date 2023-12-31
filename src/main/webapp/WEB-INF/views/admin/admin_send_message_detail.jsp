<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 	
<%@ include file="admin_header_common.jsp" %>

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
							<h5 class="card-title">문자발송 상세내역</h5>
							<p>문자 발송 상세내역입니다.</p>

							<!-- Multi Columns Form -->
							<form class="row g-3">
								<div class="col-md-3">
									<label class="form-label">수신자명</label> 
									<input type="text" readonly disabled class="form-control" value=${sendSmsHistory.shRecipientName } >
								</div>
								<div class="col-md-4">
									<label class="form-label">수신자번호</label> 
									<input type="text" readonly disabled class="form-control" value=${sendSmsHistory.shRecipientPhone } >
								</div>
								<div class="col-md-5">
									<label class="form-label">발송일시</label> 
									<input type="text" readonly disabled class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${sendSmsHistory.shSendDatetime }"/>'>
								</div>
								<div class="col-md-3">
									<label class="form-label">발송코드</label> 
									<input type="text" readonly disabled class="form-control" value=${sendSmsHistory.shSendCode } >
								</div>
								<div class="col-md-4">
									<label class="form-label">상태</label> 
									<c:choose>
										<c:when test="${sendSmsHistory.shSuccessYn }">
											<input type="text" readonly disabled class="form-control" value="성공">
										</c:when>
										<c:otherwise>
											<input type="text" readonly disabled class="form-control" value="실패">
										</c:otherwise>
									</c:choose>								
								</div>
								<div class="col-md-5">
									<label class="form-label">비고</label> 
									<c:choose>
										<c:when test="${sendSmsHistory.shSuccessYn }">
											<input type="text" readonly disabled class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${sendSmsHistory.shSuccessDatetime }"/>'>
										</c:when>
										<c:otherwise>
											<input type="text" readonly disabled class="form-control" value=${sendSmsHistory.shFailReason }>
										</c:otherwise>
									</c:choose>	
								</div>
								<div class="col-md-5">
									<label class="form-label">발송센터</label> 
									<input type="text" readonly disabled class="form-control" value="${sendSmsHistory.shSendCenterName }" >
								</div>
								<div class="col-md-12">
									<label class="form-label">발송 내용</label>
									<textarea readonly class="form-control" style="height: 300px;" disabled>${sendSmsHistory.shRecipientContent }</textarea>
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-secondary ms-3" onclick="location.href='getSendSmsHistoryListForAd.do'">목록</button>
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

<%@ include file="admin_footer_common.jsp" %>
