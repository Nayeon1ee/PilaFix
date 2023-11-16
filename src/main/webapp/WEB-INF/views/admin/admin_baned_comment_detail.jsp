<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>대제목 작성</h1>
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

			<!-- Multi Columns Form -->
              <form class="row g-3">
              <div class="col-md-2">
                  <label class="form-label">글번호</label>
                  <input type="text" readonly disabled class="form-control" value="1">
                </div>
                <div class="col-md-5">
                  <label class="form-label">작성자</label>
                  <input type="text" readonly disabled class="form-control" value="김xx">
                </div>
                <div class="col-md-5">
                  <label class="form-label">작성일</label>
                  <input type="text" readonly disabled class="form-control" value="2023-01-01" >
                </div>
               <div class="col-md-12">
                  <label class="form-label">글 제목</label>
                  <input type="text" readonly disabled class="form-control" value="xx점 토미 강사 추천" >
                </div>
                <div class="col-md-12">
                	<label class="form-label">글 내용</label>
                	 <textarea readonly disabled class="form-control" style="height: 300px;">xx점 토미강사 추천 굳굳</textarea>
                </div>
                <div class="baned-info">신고 정보</div>
                <div class="col-md-5">
                  <label class="form-label">신고사유</label>
                  <input type="text" readonly disabled class="form-control" value="[욕설/혐오/차별적 표현]" >
                </div>
                <div class="col-md-3">
                  <label class="form-label">신고자</label>
                  <input type="text" readonly disabled class="form-control" value="사오정" >
                </div>
                <div class="col-md-4">
                  <label class="form-label">신고자 이메일</label>
                  <input type="text" readonly disabled class="form-control" value="sa@naver.com" >
                </div>
                <div class="col-md-5">
                  <label class="form-label">신고사유</label>
                  <input type="text" readonly disabled class="form-control" value="[스팸/홍보/도배글]" >
                </div>
                <div class="col-md-3">
                  <label class="form-label">신고자</label>
                  <input type="text" readonly disabled class="form-control" value="가나다" >
                </div>
                <div class="col-md-4">
                  <label class="form-label">신고자 이메일</label>
                  <input type="text" readonly disabled class="form-control" value="ga@naver.com" >
                </div>
                <div class="text-center">
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
                      <button type="button" class="btn btn-primary">확인</button>
                    </div>
                  </div>
                </div>
              </div>


  </main><!-- End #main -->
 
<%@ include file="admin_footer_common.jsp" %>