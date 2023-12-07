<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Blog - Eterna Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">


<!--  내 css -->
<link
	href="${pageContext.request.contextPath}/resources/css/style_member_community_detail.css"
	rel="stylesheet">


</head>

<body>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<ol>
					<li><a href="index.html">Home</a></li>
					<li>Community</li>
				</ol>
				<h2>커뮤니티</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog pt-2">
			<div class="container mx-auto" style="max-width: 1000px;">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">게시글</h5>
						<p>개인 정보가 포함되지 않도록 유의하시고, 아래와 같은 규정에 따라 삭제될 수 있습니다.</p>


						<!-- Multi Columns Form -->
						<form class="row g-3">
							<div class="col-md-2">
                                <label class="form-label">글 번호</label>
                                <input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCmNumber }">
							</div>
							<div class="col-md-5">
                                <label class="form-label">작성자</label>
                                <input type="text"readonly disabled class="form-control" value="${memberCommunity.memberCsName }">
							</div>
							<div class="col-md-5">
                                <label class="form-label">작성일</label>
                                <input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCmRegdate }">
							</div>
							<div class="col-md-12">
                                <label class="form-label">글 제목</label>
                                <input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCmTitle }">
							</div>
							<div class="col-md-12">
								<label class="form-label">글 내용</label>
								<div class="position-relative">
                                    <textarea readonly disabled class="form-control" style="height: 300px;">${memberCommunity.memberCmContent }</textarea>
									<!-- 게시글 신고 버튼 -->
									<c:if test="${sessionScope.loginUser != null}">
                                        <div class="text-end position-absolute" style="bottom: 8px; right: 8px;">
                                            <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#reportModal">
                                                <i class="bi bi-exclamation-octagon"></i> 게시글 신고
                                            </button>
                                        </div>    
                                    </c:if>
								</div>
							</div>
                            <div class="col-md-12">
                                <label class="form-label">조회수</label>
                                <input type="text" readonly disabled class="form-control" value="${memberCommunity.memberCmViews }">
                            </div>
							<div class="text-center">
							
                                <div class="btn-toolbar justify-content-between d-flex" role="toolbar">
                                <div class="btn-group ms-3">
									<button type="button" class="btn btn-secondary" onclick="location.href='communityPage.do'">목록</button>
									</div>
									<div class="col-md-9"></div>
									<c:if test="${sessionScope.loginUser['csMemberCode'] eq memberCommunity.memberCmWriterMemberCode}">
									 <div class="btn-group me-2">
                                       <button type="button" class="btn btn-primary" onclick="location.href='updateMemberCommunity.do?memberCmNumber=${memberCommunity.memberCmNumber }'">수정</button>
                                   </div>
                                   <div class="btn-group me-3">
                                       <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal" onclick="deleteMemberCommunity.do?memberCmNumber=${memberCommunity.memberCmNumber}">삭제</button>
                                   </div>
                                   </c:if>
								</div>
								
                                 
                                   
                                
							</div>



						</form>

						<!--  삭제 버튼 모달 -->
						<div class="modal fade" id="basicModal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">확인 버튼을 누르시면 다시 복구시킬 수 없습니다.</div>
									<div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary" onclick="location.href='deleteMemberCommunity.do?memberCmNumber=${memberCommunity.memberCmNumber}'">확인</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 삭제 버튼 모달 끝 -->
						<!-- End Multi Columns Form -->
						<!-- 게시글 신고 모달 -->
						<div class="modal fade" id="reportModal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">게시글 신고</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
                                        <form action="insertBlamer.do" method="post">
											<div class="mb-3">
												<label for="reportReason" class="form-label">신고 내용</label>
                                                <input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
                                                <input type="hidden" name="memberCmWriterMemberCode" value="${memberCommunity.memberCmWriterMemberCode}">
                                                <input type="hidden" name="memberBlamerMemberCode" value="${user}">
                                                <input type="hidden" name="memberBlamerIp" value="${memberCommunity.cmWriterIp}">
                                                <div class="radio-box">
                                                    <c:forEach items="${blameList}" var="blameList">
                                                        <input type="radio" name="memberBlameReasonCode" value="${blameList.memberBlameReasonCode}">${blameList.memberBlameReasonName}<br>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                                <input type="submit" class="btn btn-primary" value="신고">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 게시글 신고 모달 끝 -->

						<!-- 댓글 -->
						<c:if test="${sessionScope.loginUser != null}">
							<div class="card mt-4">
								<div class="card-body">
									<c:forEach var="CommunityReply" items="${memberCommunityReply }">
						                <span style="font-weight: bold; padding-right: 10px;">${CommunityReply.memberCsName }</span>
						                <span style="font-size: 12px;">${CommunityReply.memberReRegdate }</span>
						                <div style="padding-left: 20px; margin: 10px 0;">${CommunityReply.memberReContent }</div>
						                <div style="width: auto; display: inline-block; margin-left: 95%;">
							                <a style="color: gray;" href="deleteMemberCommunityReply.do?memberReNumber=${CommunityReply.memberReNumber}&memberCmNumber=${memberCommunity.memberCmNumber}">삭제</a>
						                </div>
							            <hr/>
									</c:forEach>
									<form action="insertMemberCommunityReply.do" method="post">
										<input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
										<p>댓글</p>
										<textarea class="form-control" style="height: 80px; margin-top: 10px;" name="memberReContent"></textarea>
										<input type="submit" style="margin-top: 10px; margin-left: 90%;" class="btn btn-primary" value="답변등록">
									</form>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
		<!-- End Blog Section -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>

	<!-- 내 js -->
	<script src="${pageContext.request.contextPath}/resources//js/reply.js"></script>


	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>	
</body>

</html>