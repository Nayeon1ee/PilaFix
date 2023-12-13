<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_header_common.jsp" %>
 
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>커뮤니티 상세</h1>
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
                  <label class="form-label">글 번호</label>
                  <input type="text" readonly disabled class="form-control" value="${community.cmNumber }">
                </div>
                <div class="col-md-4">
                  <label class="form-label">작성자</label>
                  <input type="text" readonly disabled class="form-control" value="<%=request.getParameter("csName") %>">
                </div>
                <div class="col-md-4">
                  <label class="form-label">작성일</label>
                  <input type="text" readonly disabled class="form-control" value="${community.cmRegdate}" >
                </div>
                <div class="col-md-2">
                  <label class="form-label">공개여부</label>
                  <input type="text" readonly disabled class="form-control" value="${community.cmOpenYn}" >
                </div>
               <div class="col-md-12">
                  <label class="form-label">글 제목</label>
                  <input type="text" readonly disabled class="form-control" value="${community.cmTitle}" >
                </div>
                <div class="col-md-12">
                	<label class="form-label">글 내용</label>
                	 <textarea readonly disabled class="form-control" style="height: 300px;">${community.cmContent}</textarea>
                </div>
                <div class="text-center">
               	  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#openModal" >공개</button>
               	  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal" >비공개</button>
                  <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                </div>
              </form><!-- End Multi Columns Form -->

            </div>
          </div>

        </div>
      </div>
    </section>
	<!-- 비공개 버튼 모달 -->
	<div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">정말 비공개로 처리 하시겠습니까?</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      비공개 버튼을 누르시면 회원 커뮤니티에 해당글이 표시되지 않습니다.
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-primary" onclick="deleteCommunity(${community.cmNumber})">비공개</button>
                    </div>
                  </div>
                </div>
              </div>
	<!-- 공개 버튼 모달 -->
	<div class="modal fade" id="openModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">해당 게시글을 공개로 처리 하시겠습니까?</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      공개 버튼을 누르시면 회원 커뮤니티에 해당글이 표시됩니다.
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-primary" onclick="updateArticleOpen(${community.cmNumber})">공개</button>
                    </div>
                  </div>
                </div>
              </div>

  </main><!-- End #main -->
 <!-- 커뮤니티 상세페이지에서 커뮤니티 게시판 전체 목록으로 나가기-->
<script>
function goBack() {
  window.history.back();
}
</script>
<!-- 모달의 확인 누르면 삭제 진행-->
<script>
function deleteCommunity(cmNumber) {
		fetch('/pilafix/deleteCommunity.do?cmNumber=' + cmNumber, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getCommunityList.do'; // 커뮤니티 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});
	
};
function updateArticleOpen(cmNumber) {
	fetch('/pilafix/updateArticleOpen.do?cmNumber=' + cmNumber, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getCommunityList.do'; // 커뮤니티 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});

};
</script>
<%@ include file="admin_footer_common.jsp"%>