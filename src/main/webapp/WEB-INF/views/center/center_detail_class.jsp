<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>수업 상세 페이지</h1>
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
						<!-- Multi Columns Form -->
						<form class="row g-3" action="updateCenterLesson.do" method="post">
							<div class="col-md-12 col-top">
								<label class="form-label">No</label>
								<input type="text" readonly class="form-control" name="lsCode" value="${centerLesson.lsCode }">
							</div>
							<div class="col-md-12">
								<label class="form-label">수업명</label>
								<input type="text" readonly class="form-control" value="${centerLesson.lsName }">
							</div>
							<div class="col-md-12">
								<label class="form-label">강사명</label>
								<input type="text" readonly class="form-control" value="${centerLesson.csName }">
							</div>
							<div class="col-md-12">
								<label class="form-label">수업 유형</label>
								<input type="text" readonly class="form-control" value="${centerLesson.lsType }">
							</div>
							<div class="col-md-12">
								<label class="form-label">정원</label>
								<input type="text" readonly class="form-control" value="${centerLesson.lsCurrentApplicants }/${centerLesson.lsCapacity }">
							</div>
							<div class="col-md-12">
								<label class="form-label">수업 설명</label>
								<textarea class="form-control" readonly style="height: 300px;" disabled>${centerTicket.tkDescription }</textarea>
							</div>
							<div class="col-md-12">
								<label class="form-label">수업 시간</label>
								<input type="text" readonly class="form-control" value="${centerLesson.lsDate}  ${centerLesson.lsTime}시">	
							</div>	
								<div class="col-sm-10">
									<label class="form-label">예약 가능 여부</label>
									<c:choose>
									    <c:when test="${centerLesson.lsColseYN}">
									        <fieldset class="row mb-3">
									            <div class="col-sm-10">
									                <div class="form-check form-check-inline">
									                    <input class="form-check-input" type="radio" name="lsColseYN" id="gridRadios1" value="true" checked>
									                    <label class="form-check-label" for="gridRadios1">공개</label>
									                </div>
									                <div class="form-check form-check-inline">
									                    <input class="form-check-input" type="radio" name="lsColseYN" id="gridRadios2" value="false">
									                    <label class="form-check-label" for="gridRadios2">비공개</label>
									                </div>
									            </div>
									        </fieldset>
									    </c:when>
									    <c:otherwise>
									        <fieldset class="row mb-3">
									            <div class="col-sm-10">
									                <div class="form-check form-check-inline">
									                    <input class="form-check-input" type="radio" name="lsColseYN" id="gridRadios1" value="true">
									                    <label class="form-check-label" for="gridRadios1">공개</label>
									                </div>
									                <div class="form-check form-check-inline">
									                    <input class="form-check-input" type="radio" name="lsColseYN" id="gridRadios2" value="false" checked>
									                    <label class="form-check-label" for="gridRadios2">비공개</label>
									                </div>
									            </div>
									        </fieldset>
									    </c:otherwise>
									</c:choose>

									<div class="p-check">
										<p>(Y를 선택하면 회원이 바로 구매가 가능합니다.)</p>
										<p>(N을 선택하면 수강권을 생성만 합니다.)</p>
									</div>
									<button type="submit" class="btn btn-primary">수정</button>
									<div class="text-center">
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
			                 			<button type="button" class="btn btn-secondary" onclick="location.href='getCenterLessonList.do'">목록</button>
									</div>
								</div>
							</form>
						</div><!-- End Multi Columns Form -->
					</div>
				</div>
			</div>
	</section>
</main>
	<!-- End #main -->
 <div class="modal fade" id="basicModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">삭제 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="location.href='deleteCenterLesson.do?lsCode=${centerLesson.lsCode }'">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->
<script>
function deleteCommunity(cmNumber) {
	fetch('/pilafix/deleteCenterLesson.do?lsCode=' + lsCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCenterLessonList.do'; // 커뮤니티 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};
</script>
<%@ include file="center_footer_common.jsp" %>