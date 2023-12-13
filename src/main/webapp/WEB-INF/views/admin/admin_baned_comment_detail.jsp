<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<body>
	<%@ include file="admin_header_common.jsp"%>
	<!-- ============================================================================================ -->

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>신고글 정보</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item">필요 시 작성</li> -->
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">신고글 상세정보</h5>
							<!-- <p>간략한 설명</p> -->
							<!-- Multi Columns Form -->
							<form class="row g-3" >
								<div class="col-md-2">
									<label class="form-label">글번호</label> 
									<input type="text" readonly disabled class="form-control" value="${originBoard.cmNumber }">
								</div>
								<div class="col-md-5">
									<label class="form-label">작성자</label> 
									<input type="text" readonly disabled class="form-control" value="${originBoard.cmWriterMemberCode }" >
								</div>
								<div class="col-md-5">
									<label class="form-label">작성일</label> 
									<input type="text" readonly disabled class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${originBoard.cmRegdate }"/>'>
								</div>
								<div class="col-md-12">
									<label class="form-label">글 제목</label> <input type="text"
										readonly disabled class="form-control" value="${originBoard.cmTitle }" >
								</div>
								<div class="col-md-12">
									<label class="form-label">글 내용</label>
									<textarea readonly disabled class="form-control"
										style="height: 300px;" name="cmContent">${originBoard.cmContent }</textarea>
								</div>
								
						<!-- <h5 class="card-title"></h5> -->
						<!-- Table with stripped rows -->
						<div class="baned-info">신고 정보</div>
						<table class="table datatable">
							<thead>
								<tr>
									<th scope="col">신고사유</th>
									<th scope="col">신고자</th>
									<th scope="col">신고자이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${complaintList }">
									<tr>
										<td>${list.blameReasonName }</td>
										<td>${list.blamerMemberName }</td>
										<td>${list.blamerMemberEmail }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
								<div class="text-center">
								    <div class="text-center">
								        <div class="btn-toolbar justify-content-end d-flex" role="toolbar">
								            <div class="btn-group me-2">
								                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModa20">신고글처리</button>
								                <button type="button" class="btn btn-secondary" onclick="location.href='getTargetComplaintsList.do'">취소</button>
								            </div>
								        </div>
								    </div>
								</div>
							</form>
							<!-- End Multi Columns Form -->
						</div>
					</div>
				</div>
			</div>
		</section>
				<!-- 상태변경 모달 -->
				<div class="modal fade" id="basicModa20" tabindex="-1">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title"> 신고글 처리 </h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">버튼 클릭 시 회원에게 비공개 처리됩니다. <br>처리하시겠습니까?</div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				                <button type="button" class="btn btn-primary" onclick="updateComplaintsStatus(${originBoard.cmNumber})">확인</button>
				            </div>
				        </div>
				    </div>
				</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp"%>
	<script type="text/javascript">
	/* // 신고글변경 클릭 시 모달 작동  */
	function updateComplaintsStatus(cmNumber){
		fetch('/pilafix/updateComplaintsStatus.do?cmNumber=' + cmNumber, {
			method: 'GET'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
				window.location.href = 'getTargetComplaintsList.do'; // 목록 페이지로 리다이렉트
			})
			.catch(error => {
				console.error(error);
			});
	};

</script>
</body>
</html>