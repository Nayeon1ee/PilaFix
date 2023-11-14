<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="admin_header_common.jsp" %>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>공지사항관리</h1>
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
              <h5 class="card-title">공지사항 상세페이지</h5>
              <p>웹관리자가 공지사항의 상세내용을 볼 수 있습니다. 수정/취소/삭제</p>

				<!-- Multi Columns Form -->
				<form class="row g-3" id="registrationForm000">
					 <input type="hidden" class="form-control" value="${adminInfo.seq }" disabled>
				    <div class="col-md-5">
				        <label class="form-label">작성자</label>
				        <input type="text" class="form-control" value="${adminInfo.writerMemberName }" disabled>
				    </div>
				    <div class="col-md-5">
				        <label class="form-label">작성일자</label>
				        <input type="text" class="form-control" value="${adminInfo.regDate }" disabled >
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">제목</label>
				        <input type="text" class="form-control" id="titleInput000" value="${adminInfo.title }" disabled>
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">내용</label>
				        <textarea class="form-control" id="contentInput000" style="height: 300px" disabled>${adminInfo.content }</textarea>
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">조회수</label>
				        <input type="text" class="form-control" id="titleInput000" value="${adminInfo.cnt }" disabled>
				    </div>
				    <div class="col-md-12">
				        <label class="form-label">공개 여부</label>
				        <input type="text" class="form-control" id="titleInput000" value="${openYN ? '공개' : '비공개'}" disabled>
				    </div>
					<div class="text-center">
	                  <button type="button" class="btn btn-primary" onclick="location.href='updateAdminInfo.do?seq=${adminInfo.seq }'">수정</button>
	                  <button type="button" class="btn btn-danger" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
	                  <button type="button" class="btn btn-secondary" onclick="location.href='getAdminInfoList.do'">목록</button>
	                </div>
				</form><!-- End Multi Columns Form -->
            </div>
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
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
				<button type="button" class="btn btn-primary" onclick="location.href='deleteAdminInfo.do?seq=${adminInfo.seq }'">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->
<script>
function deleteCommunity(cmNumber) {
		fetch('/pilafix/deleteAdminInfo.do?seq=' + seq, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getAdminInfoList.do'; // 커뮤니티 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});

};
</script>


<%@ include file="admin_footer_common.jsp" %>