<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h5 class="card-title">공지사항 상세 페이지</h5>
						<p>센터가 공지사항을 조회할 수 있는 페이지입니다.</p>
						<!-- Multi Columns Form -->
						<form class="row g-3" id="registrationForm000">
							<div class="col-md-12">
								<label class="form-label">제목</label> <input type="text"
									class="form-control" id="titleInput000"
									value="${centerInfo.title }" disabled>
							</div>
							<div class="col-md-12">
								<label class="form-label">내용</label>
								<textarea class="form-control" id="contentInput000"
									style="height: 300px" disabled>${centerInfo.content }</textarea>
							</div>
							<div class="col-md-12">
								<label class="form-label">조회수</label> <input type="text"
									class="form-control" id="titleInput000"
									value="${centerInfo.cnt }" disabled>
							</div>
							<div class="col-md-5">
								<label class="form-label">작성일자</label> <input type="text"
									readonly disabled class="form-control"
									value="<fmt:formatDate pattern='yyyy-MM-dd' value='${centerInfo.regDate }'/>">
							</div>
							<div class="col-md-12">
								<label class="form-label">공개 여부</label> <input type="text"
									class="form-control" id="titleInput000"
									value="${centerInfo.openYN ? '공개' : '비공개'}" disabled>
							</div>

							<div class="text-center">

								<div class="btn-toolbar justify-content-end d-flex"
									role="toolbar">
									<div class="me-auto ms-3">
										<button type="button" class="btn btn-secondary"
											onclick="location.href='getCenterInfoList.do'">목록</button>
									</div>

									<div class="btn-group me-2">
										<button type="button" class="btn btn-primary"
											onclick="location.href='updateCenterInfo.do?icNumber=${centerInfo.icNumber}'">수정</button>
									</div>
									<div class="btn-group me-3">
										<button type="button" class="btn btn-danger"
											class="btn btn-danger" data-bs-toggle="modal"
											data-bs-target="#basicModal">삭제</button>
									</div>
								</div>
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
<div class="modal fade" id="basicModal" tabindex="-1">
	<div class="modal-dialog  modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">삭제 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary"
					onclick="location.href='deleteCenterInfo.do?icNumber=${centerInfo.icNumber}'">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->
<script>
function deleteCommunity(icNumber) {
		fetch('/pilafix/deleteCenterInfo.do?icNumber=' + icNumber, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getCenterInfoList.do'; // 커뮤니티 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});
};
</script>
<%@ include file="center_footer_common.jsp"%>