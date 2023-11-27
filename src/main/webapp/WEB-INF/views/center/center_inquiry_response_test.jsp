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
         
    <!-- 센터가 조회해오는 회원의 문의사항 (작성자이름) -->            
	<form class="row g-3">
	    <div class="col-md-3">
	        <label class="form-label">문의 번호</label>
	        <input type="text" readonly disabled class="form-control"  value="${question.qsNumber}">
	        <input type="hidden" name="qsNumber" value="${question.qsNumber}">
	        <!-- <input type="hidden" name="qsNumber" value="<c:out value='${question.qsNumber}' />"> -->
	    </div>
	    <div class="col-md-3">
	        <label class="form-label">작성자 이름</label>
	        <input type="text" readonly disabled class="form-control"  value="${question.qstWriterName}">
	    </div>
	    <div class="col-md-3">
	        <label class="form-label">문의작성일자</label>
	        <input type="text" readonly disabled class="form-control" value="${question.qsRegdate}">
	    </div>
	    <div class="col-md-3">
	        <label class="form-label">문의수정일자</label>
	        <input type="text" readonly disabled class="form-control" value="${question.qsModifiedDate}">
	    </div>
	    <div class="col-md-12">
	        <label class="form-label">문의 제목</label>
	        <input type="text" readonly disabled class="form-control" value="${question.qsTitle}">
	    </div>
	    <div class="col-md-12">
	        <label class="form-label">문의 내용</label>
	        <textarea readonly disabled class="form-control" rows="5">${question.qsContent}</textarea>
	    </div>
	</form>



<c:choose>
    <c:when test="${question.qsAnswerYn == true && not empty questionReply}">
        <!-- 답변이 있는 경우, 답변 상세 정보 표시 -->
        <form class="row g-3">
        <div class="col-md-5">
            <label class="form-label">답변 번호</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.reNumber}>
        </div>       
        <div class="col-md-5">
            <label class="form-label">작성 일자</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.reRegdate}>
        </div>          
         <div class="col-md-3">
            <label class="form-label">작성자 권한코드</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.writerRoleCode}>
        </div>         
        <div class="col-md-3">
            <label class="form-label">작성자 회원코드</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.writerMemberCode}>
        </div>  
        <div class="col-md-3">
            <label class="form-label">원글 유형</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.reTargetPostType}>
        </div>          
        <div class="col-md-3">
            <label class="form-label">원글 번호</label>
            <input type="text" readonly disabled class="form-control" value=${questionReply.reTargetPostNumber}>
        </div>         
<div class="col-md-12">
    <label class="form-label">답변 제목</label>
    <input type="text" readonly disabled class="form-control" value="${questionReply.reTitle}">
</div>
<div class="col-md-12">
    <label class="form-label">답변 내용</label>
    <input type="text" readonly disabled class="form-control" value="${questionReply.reContent}">
</div>       
			<div class="text-center">
			<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
			</div>
		</form>
    </c:when>
    
    <c:otherwise>
        <!-- 답변이 없는 경우, 답변 등록 폼 표시 -->
        <form action="insertQuestionReply.do" method="post">
        	<!-- 회원의 문의사항번호 == reTargetPostNumber hidden으로 넘겨주기 -->
        	<input type="hidden" name="qsNumber" value="${question.qsNumber}">
            <input type="hidden" name="reTargetPostNumber" value="${question.qsNumber}">
            
            <!-- 센터 로그인하면 세션에서 가져오는 ctCode
            <input type="hidden" name="writerMemberCode" value="${center.ctCode}">
             -->
            
            <div class="col-md-12">
				<label class="form-label mt-3">글 제목</label> 
				<input type="text" class="form-control" name="reTitle" >
            </div>
            <div class="col-md-12">
				<label class="form-label">답변 내용</label>
				<textarea class="form-control" style="height: 300px;" name="reContent" ></textarea>
            </div>
            
			<div class="text d-flex justify-content-end">
				<button type="submit" class="btn btn-primary me-3">등록</button>
			</div>
        </form>
        <!-- End rely-regist Form -->
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
                      <button type="button" class="btn btn-primary" onclick="deleteQuestionReply(${questionReply.reNumber}, ${question.qsNumber})">확인</button>
                    </div>
                  </div>
                </div>
            </div>
	</main>
	<!-- End #main -->
<!-- 모달의 확인 버튼 클릭 시 삭제를 진행하는 스크립트 -->
<script>

function deleteQuestionReply(reNumber, qsNumber) {
    fetch('/pilafix/deleteQuestionReply.do?reNumber=' + reNumber + '&qsNumber=' + qsNumber, {
        method: 'GET'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('error');
        }
        window.location.href = 'getCTQuestionList.do'; //목록 페이지로 리다이렉트
    })
    .catch(error => {
        console.error(error);
    });
};
</script>	
	
	
	
<%@ include file="center_footer_common.jsp" %>