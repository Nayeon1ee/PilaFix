<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

</head>
<!-- 내 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_manager_inquiry.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_common_0.css">


<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">contact@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						5589 55488 55</span></i>
			</div>
			<div class="social-links d-none d-md-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>inquiry</li>
				</ol>
				<h2>문의사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">



				<div id="userInfo" class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>

					<div class="inquiry">
						<div class="inquiry-header mb-3">
							<button class="inquiry-button my-2" style="font-size: 18px;" onclick="location.href='insertQuestion.do'">센터문의하기</button>
						</div>

						<div class="inquiry-history">
							<h2>나의 문의 내역</h2>
							<hr>

							<div class="accordion mt-4" id="accordionExample">
							<c:forEach items="${questionList}" var="question" varStatus="status">
						        <div class="accordion-item">
						            <h2 class="accordion-header" id="heading${status.index}">
						                <button class="accordion-button" type="button"
						                        data-bs-toggle="collapse" data-bs-target="#collapse${status.index}"
						                        aria-expanded="true" aria-controls="collapse${status.index}">
						                    <div class="inquiry-item">
						                        <div class="inquiry-details">
						                            <div class="inquiry-title">문의제목: ${question.qsTitle}</div>
						                            <small>작성일자: ${question.qsRegdate}</small>  
						                            <small>수정일자: ${question.qsModifiedDate}</small>
						                            <!-- <div class="inquiry-regdate">${question.qsRegdate}</div>
						                            <div class="inquiry-modidate">${question.qsModifiedDate}</div> -->
						                        </div>
						                        <div class="inquiry-location">
						                            <p>${question.qsAnswerYn ? '답변완료' : '답변대기'}</p>
						                        </div>
						                    </div>
						                </button>
						            </h2>
						            <div id="collapse${status.index}"
						                 class="accordion-collapse collapse"
						                 aria-labelledby="heading${status.index}"
						                 data-bs-parent="#accordionExample">
						                <div class="accordion-body">
						                    <strong>문의내역</strong> <br> ${question.qsContent}

										    <div class="text-center">
										   		<!-- 삭제 -->
												<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#basicModal">삭제</button>
							                    <!-- 답변이 없는 경우에만 수정 버튼 표시 -->
								                <c:if test="${!question.qsAnswerYn}">
								                <button type="button" class="btn btn-primary" onclick="location.href='updateQuestion.do?qsNumber=${question.qsNumber }'">수정</button>
								                <!-- <a href="updateQuestion.do?qsNumber=${question.qsNumber}" class="btn btn-primary">수정</a> -->    
								                </c:if>
											</div>
											
											<!-- 답변 섹션 -->
										    <div id="replySection${status.index}">
										        <!-- Ajax로 답변내용이 여기 추가 -->
										    </div>
											
						                </div>
						            </div>
						        </div>
							</c:forEach>

						</div>
					</div>
					<!-- End Our Skills Section -->
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
           <button type="button" class="btn btn-primary" onclick="deleteQuestion(${question.qsNumber})">확인</button>
         </div>
       </div>
     </div>
   </div>
</main><!-- End #main -->
 

<!-- 모달의 확인 버튼 클릭 시 삭제를 진행하는 스크립트 -->
<script>
function deleteQuestion(qsNumber) {
    fetch('/pilafix/deleteQuestion.do?qsNumber=' + qsNumber, {
        method: 'GET'
    })
    .then(response => {
				if (!response.ok) {
					throw new Error('error');
				}
        window.location.href = 'deleteQuestion.do'; // 약관 목록 페이지로 리다이렉트
    })
    .catch(error => {
		console.error(error);
	});
};
</script>	
	


	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->

	<script
		src="${pageContext.request.contextPath}/resources/js/quiry_inquiry.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
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

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>