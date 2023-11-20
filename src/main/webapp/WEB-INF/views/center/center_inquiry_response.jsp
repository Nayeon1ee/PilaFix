<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="center_header_common.jsp" %>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>문의사항 - 답변등록</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
                    <p>문의사항 답변등록</p>
                    
					<form class="row g-3">
					    <!-- 문의 번호 -->
					    <div class="col-md-6">
					        <label class="form-label">문의 번호</label>
					        <input type="text" readonly class="form-control" value="${question.qsNumber}">
					    </div>
					
					    <!-- 작성자 이름 -->
					    <div class="col-md-6">
					        <label class="form-label">작성자 이름</label>
					        <input type="text" readonly class="form-control" value="${question.writerName}">
					    </div>
					
					    <!-- 문의 일시 -->
					    <div class="col-md-6">
					        <label class="form-label">문의 일시</label>
					        <input type="text" readonly class="form-control" value="<fmt:formatDate pattern='yyyy-MM-dd hh:mm:ss' value='${question.qsRegdate}' />">
					    </div>
					
					    <!-- 수정 일시 -->
					    <div class="col-md-6">
					        <label class="form-label">수정 일시</label>
					        <input type="text" readonly class="form-control" value="<fmt:formatDate pattern='yyyy-MM-dd hh:mm:ss' value='${question.qsModifiedDate}' />">
					    </div>
					
					    <!-- 문의 제목 -->
					    <div class="col-md-12">
					        <label class="form-label">문의 제목</label>
					        <input type="text" readonly class="form-control" value="${question.qsTitle}">
					    </div>
					
					    <!-- 문의 내용 -->
					    <div class="col-md-12">
					        <label class="form-label">문의 내용</label>
					        <textarea readonly class="form-control" rows="5">${question.qsContent}</textarea>
					    </div>
					</form>



<c:choose>
    <c:when test="${question.qsAnswerYn == true && not empty questionReply}">
        <!-- 답변이 있는 경우, 답변 상세 정보 표시 -->
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">답변 번호</label>
                <p>${questionReply.reNumber}</p>
            </div>
            <div class="col-md-6">
		        <label class="form-label">작성일시</label>
		        <p><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${questionReply.reRegdate}" /></p>
		    </div>
		    <div class="col-md-3">
		        <label class="form-label">작성자권한코드</label>
		        <p>${questionReply.writerRoleCode}</p>
		    </div>
		    <div class="col-md-3">
		        <label class="form-label">작성자회원코드</label>
		        <p>${questionReply.writerMemberCode}</p>
		    </div>

		    <div class="col-md-3">
		        <label class="form-label">원글유형</label>
		        <p>${questionReply.reTargetPostType}</p>
		    </div>
		    <div class="col-md-3">
		        <label class="form-label">원글번호</label>
		        <p>${questionReply.reTargetPostNumber}</p>
		    </div>
            <div class="col-md-12">
                <label class="form-label">답변 제목</label>
                <p>${questionReply.reTitle}</p>
            </div>
            <div class="col-md-12">
                <label class="form-label">답변 내용</label>
                <p>${questionReply.reContent}</p>
            </div>
		
			<div class="text-center">
			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
			</div>
        </div>
    </c:when>
    
    <c:otherwise>
        <!-- 답변이 없는 경우, 답변 등록 폼 표시 -->
        <form action="insertQuestionReply.do" method="post">
            <input type="hidden" name="reTargetPostNumber" value="${question.qsNumber}">
            <!-- 센터 코드 등록 -->
            <div class="col-md-12">
                <label for="reTitle" class="form-label">답변 제목</label>
                <input type="text" id="reTitle" name="reTitle" class="form-control">
            </div>
            <div class="col-md-12">
                <label for="reContent" class="form-label">답변 내용</label>
                <textarea id="reContent" name="reContent" class="form-control" rows="5"></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">답변 등록</button>
            </div>
        </form><!-- End rely-regist Form -->
	</c:otherwise>
</c:choose>

						</div>
					</div>

				</div>
			</div>
		</section>


			<!-- 삭제 버튼 모달 -->
			<div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">정말 삭제하시겠습니까?</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      확인 버튼을 누르시면 다시 복구시킬 수 없습니다.
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-primary" onclick="deleteQuestionReply(${questionReply.reNumber})">확인</button>
                    </div>
                  </div>
                </div>
            </div>
	</main>
	<!-- End #main -->
<!-- 모달의 확인 버튼 클릭 시 삭제를 진행하는 스크립트 -->
<script>
function deleteQuestionReply(reNumber) {
    fetch('/pilafix/deleteQuestionReply.do?reNumber=' + reNumber, {
        method: 'GET'
    })
    .then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
        window.location.href = 'getQuestionReplyList.do'; //목록 페이지로 리다이렉트
    })
    .catch(error => {
		console.error(error);
	});
};
</script>	
	
	
	
<%@ include file="center_footer_common.jsp" %>