<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>수강권 상세 페이지</h1>
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
							<form class="row g-3" action="updateCenterTicket.do" method="post">
								<div class="col-md-12 col-top">
									<label class="form-label">No</label>
									<input type="text" readonly class="form-control" name="tkCode" value="${centerTicket.tkCode }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권명</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkName }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 유형</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkLessonType }">
								</div>
								<div class="col-md-12">
									<label class="form-label">정원</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkCapacity }명">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 사용 가능 기간</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkUsageNumMonth }개월">
								</div>
								<div class="col-md-12">
									<label class="form-label">횟수</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkUsageCount }회">
								</div>
								<div class="col-md-12">
									<label class="form-label">가격</label>
									<input type="text" readonly class="form-control" value="${centerTicket.tkPrice }">
								</div>
								<div class="col-md-12">
									<label class="form-label">수강권 설명</label>
									<textarea class="form-control" readonly style="height: 300px;" value="${centerTicket.tkDescription }">${centerTicket.tkDescription }</textarea>
								</div>
								<div class="col-sm-10">
									<label class="form-label">구매 가능 여부</label>
									<c:choose>
								    <c:when test="${centerTicket.purchaseAvailableYN}">
								        <fieldset class="row mb-3">
								            <div class="col-sm-10">
								                <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value="true" checked>
								                    <label class="form-check-label" for="flexRadioDefault2">구매 가능     <span style="color:#989898"> (선택 시, 수강권이 즉시 회원에게 보여집니다.) </span> </label>
								                </div>
								                <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value="false">
								                    <label class="form-check-label" for="flexRadioDefault2"> 구매 불가   <span style="color:#989898"> (선택 시, 수강권은 생성되지만, 회원에게는 보여지지 않습니다.) </span> </label>

								                </div>
								            </div>
								        </fieldset>
								    </c:when>
								    <c:otherwise>
								        <fieldset class="row mb-3">
								            <div class="col-sm-10">
								                <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value="true">
								                    <label class="form-check-label" for="flexRadioDefault2">구매 가능 <span style="color:#989898"> (선택 시, 수강권이 즉시 회원에게 보여집니다.) </span>  </label>
													<p> </p>
								                </div>
								                <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="radio" name="purchaseAvailableYN" id="flexRadioDefault2" value="false" checked>
								                    <label class="form-check-label" for="flexRadioDefault2">구매 불가 <span style="color:#989898"> (선택 시, 수강권은 생성되지만, 회원에게는 보여지지 않습니다.) </span>  </label>
								                </div>
								            </div>
								        </fieldset>
								    </c:otherwise>
								</c:choose>

									
									<button type="submit" class="btn btn-primary">수정</button>
									</div>
									<div class="text-center">
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
			                 			<button type="button" class="btn btn-secondary" onclick="location.href='getCenterTicketList.do'">목록</button>
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
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">삭제 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="location.href='deleteCenterTicket.do?tkCode=${centerTicket.tkCode }'">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->
<script>
function deleteCommunity(cmNumber) {
	fetch('/pilafix/deleteCenterTicket.do?tkCode=' + tkCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCenterTicketList.do'; // 커뮤니티 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};
</script>
<%@ include file="center_footer_common.jsp" %>