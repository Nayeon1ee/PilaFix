<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ include file="center_header_common.jsp" %>
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>이용정책 상세</h1>
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


             	 <!-- Multi Columns Form -->
              <form class="row g-3">
              <div class="col-md-2">
                  <label class="form-label">정책 번호</label>
                  <input type="text" readonly disabled class="form-control" value=${userguide.ugCode }>
                </div>
                <div class="col-md-2">
                  <label class="form-label">구분</label>
                  <input type="text" readonly disabled class="form-control" value=${userguide.ugType }>
                </div>
                <div class="col-md-4">
                  <label class="form-label">이용정책 제목</label>
                  <input type="text" readonly disabled class="form-control" value=${userguide.ugName }>
                </div>
                <div class="col-md-12">
                	<label class="form-label">이용정책 내용</label>
                	 <textarea class="form-control" readonly disabled  style="height: 300px;">${userguide.ugContent }</textarea>
                </div>
               <div class="col-md-12">
                  <label class="form-label">작성일자</label>
                  <input type="text" readonly disabled class="form-control" value=${userguide.ugRegistrationDate } >
                </div>

                <div class="text-center">
                  <button type="button" class="btn btn-primary" onclick="location.href='updateUserguide.do?ugCode=${userguide.ugCode }'">수정</button>
                  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
                  <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
              </form><!-- End Multi Columns Form -->

            </div>
          </div>

        </div>
      </div>
    </section>
</main><!-- End #main -->
 <!-- 삭제 버튼 모달 -->
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
				<button type="button" class="btn btn-primary" onclick="deleteUserguide(${userguide.ugCode})">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->
  <script>
	function deleteUserguide(ugCode){
			fetch('/pilafix/deleteUserguide.do?ugCode=' + ugCode, {
				method: 'GET'
			})
				.then(response => {
					if (!response.ok) {
						throw new Error('error');
					}
					window.location.href = 'getUserguideList.do'; // 에러나면 목록 페이지로 리다이렉트
				})
				.catch(error => {
					console.error(error);
				});
		
	};
	</script>
<%@ include file="center_footer_common.jsp" %>