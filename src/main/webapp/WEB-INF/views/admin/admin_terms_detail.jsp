<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common_1.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용약관 상세</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">필요 시 작성</li><!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">중제목 작성</h5>
              <p>간략한 설명</p>


				<form class="row g-3">
				    <div class="col-md-4">
				        <label class="form-label">약관 번호</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmCode}">
				    </div>
				    <div class="col-md-4">
				        <label class="form-label">필수 여부</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmRequiredYn ? '필수' : '선택'}">
				    </div>
				    <div class="col-md-4">
				        <label class="form-label">공개 여부</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmOpenYn ? '공개' : '비공개'}">
				    </div>
				    <div class="col-md-6">
				        <label class="form-label">등록일자</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmRegdate}">
				    </div>
				    <div class="col-md-6">
				        <label class="form-label">최근 수정일</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmModifiedDate}">
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">약관명</label>
				        <input type="text" readonly disabled class="form-control" value="${terms.tmName}">
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">약관 상세</label>
				        <textarea class="form-control" readonly disabled style="height: 300px;">${terms.tmDetail}</textarea>
				    </div>
				    <div class="text-center">
				        <button type="button" class="btn btn-primary" onclick="location.href='updateTerms.do?tmCode=${terms.tmCode}'">수정</button>
				        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
				        <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
				    </div>
				</form><!-- End Multi Columns Form -->

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
                      <button type="button" class="btn btn-primary" onclick="deleteTerms(${terms.tmCode})">확인</button>
                    </div>
                  </div>
                </div>
              </div>
  </main><!-- End #main -->
 

<!-- 모달의 확인 버튼 클릭 시 삭제를 진행하는 스크립트 -->
<script>
function deleteTerms(tmCode) {
    fetch('/pilafix/deleteTerms.do?tmCode=' + tmCode, {
        method: 'GET'
    })
    .then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
        window.location.href = 'getTermsList.do'; // 약관 목록 페이지로 리다이렉트
    })
    .catch(error => {
		console.error(error);
	});
};
</script>

<%@ include file="admin_footer_common.jsp"%>