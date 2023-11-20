<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        </form>
    </c:otherwise>
</c:choose>
						<!-- End Multi Columns Form -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp" %>