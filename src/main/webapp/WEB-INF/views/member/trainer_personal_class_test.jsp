<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
</head>
<!-- 내 css -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_trainer_personal.css" />
<body>


	<!-- ======= Header ======= -->
<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>personal class schedule</li>
				</ol>
				<h2>개인 수업 스케줄</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">




				<!-- Top Bar Section -->

				<section class="top_bar py-4">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<p class="mb-0 h5">
									<!-- 날짜와 시간 표시 -->
									<strong class="text-primary"
										style="display: inline-block; margin-right: 10px;">${lesson.lsDate}</strong>
									<span class="text-muted" style="display: inline-block;">${fn:substring(lesson.lsTime, 11, 16)}</span>
								</p>
							</div>
						</div>
					</div>
				</section>

				<!-- Explanation Section -->

			<!-- 수업 상세 정보 -->
				<section class="explanation text-center py-5">
				    <div class="container">
				    
				    <!-- 수업시간 --> 
					<span  style="display: inline-block;">
                    ${lessonDetail.lsDate} 
                    </span>
                    <c:set var="hour" value="${fn:substring(lessonDetail.lsTime, 11, 13)}" /> <!-- 시간 추출 -->
                    <c:choose>
                        <c:when test="${hour lt 12}"> <!-- 오전 확인 -->
                            오전
                        </c:when>
                        <c:otherwise>
                            오후
                        </c:otherwise>
                    </c:choose>
                    <span  style="display: inline-block;">
                        ${fn:substring(lessonDetail.lsTime, 11, 16)}
                    </span>
                    <br>
                    <p class="h3 mb-0">
				    <strong class="text-primary" >
                        ${lessonDetail.lsName}
                    </strong></p>
                    <br>			
		<div class="output-text" style="text-align:left; white-space: pre-line; ">
		    ${lessonDetail.lsContent}
		</div>
	</div>
	</section>


				<!-- Status Section -->
				<section class="status pb-3 mt-4">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-md-4">
								<div class="image text-center">

									
								</div>
							</div>
							<div class="col-md-4">

								<div class="private_status text-center">
									<c:choose>
										<c:when test="${not empty lessonDetail.reservedMembers}">
											<c:forEach var="member"
												items="${lessonDetail.reservedMembers}" varStatus="status">

												<div class="member-check">
													<input type="checkbox" class="btn-check"
														id="btn-check-${status.index}" name="selectedMemberCodes"
														value="${member.csMemberCode}" autocomplete="off">
													<label class="btn" for="btn-check-${status.index}">
														<img src="${pageContext.request.contextPath}/resources/images/user.png" alt="user">
														<p class="h6 mb-0">${member.csName}</p>

													</label>
												</div>


<!-- 출석처리 완료한 경우 -->
<div class="text-center">
    <c:choose>
        <c:when test="${attendance.atCheckYn}">
            <span id="presentCount">${attendedCount}</span>
            <span><b>출석처리완료</b></span>
        </c:when>
        <c:otherwise>

        </c:otherwise>
    </c:choose>
</div>



											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="col-md-12 text-center">
												<p>현재 예약한 회원이 없습니다.</p>
											</div>
										</c:otherwise>
									</c:choose>
								</div>

							</div>

						</div>
					</div>
				</section>




				<!-- Previous Class Section 
<section class="board_list pb-3 mt-4">
    <div class="container">
        <h3 class="mb-3">이전 수업</h3>
        <table class="table datatable">
            <thead>
                <tr>
                    <th scope="col">NO.</th>
                    <th scope="col">수업명</th>
                    <th scope="col">수업기간</th>
                    <th scope="col">수업유형</th>
                    <th scope="col">강사명</th>
                    <th scope="col">지점명</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">2</th>
                    <td><a href="#" class="admin-alink-color">척뿌 필라테스</a></td>
                    <td>2023.11.21 ~ 2024.02.21</td>
                    <td>그룹</td>
                    <td>홍길동</td>
                    <td>xx점 xx테스</td>
                </tr>
                <tr>
                    <th scope="row">1</th>
                    <td><a href="#" class="admin-alink-color">척뿌 필라테스</a></td>
                    <td>2023.11.21 ~ 2024.02.21</td>
                    <td>개인</td>
                    <td>강사명</td>
                    <td>xx점 xx테스</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>-->

				<!-- Buttons Section -->

				<div class="container p-0">
					<div class="d-flex justify-content-between">
						<button type="button" class="btn btn-primary ms-3"
							onclick="location.href='trainerLessonPage.do'">목록</button>


						<div class="d-flex justify-content-end">
<input type="hidden" id="atCode" name="atCode" value="${attendance.atCode}">
<button type="button" id="attendanceSubmitButton" class="btn btn-primary me-3">출석처리</button>						
						
<%-- <!-- 출석 처리 버튼 -->
<form action="updateAttendG.do" method="post" class="me-2">
	<input type="hidden" name="lessonCode"
		value="${lessonDetail.lsCode}">
	<c:forEach var="member" items="${reservedMembers}">
		<input type="checkbox" name="selectedMemberCodes"
			value="${member.memberCode}">
	</c:forEach>
	<button type="submit" class="btn btn-primary">출석처리</button>
</form> --%>


						</div>
					</div>
				</div>





				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>
	
<!-- 출석 성공 모달 -->
<div class="modal fade" id="attendanceSuccessModal2" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">출석 처리 완료</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                출석 처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script>
$(document).ready(function () {
    var atCode = $("#atCode").val();


    $("#attendanceSubmitButton").click(function(e) {
        e.preventDefault();
        var selectedMemberCodes = $("input[name='selectedMemberCodes']:checked").map(function() {
            return $(this).val();
        }).get();
        
        // 출석 처리 요청
        $.ajax({
            url: 'updateAttendanceP.do?atCode=' + encodeURIComponent(atCode),
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(selectedMemberCodes),
            success: function (response) {


                // 성공모달
                $('#attendanceSuccessModal2').modal('show');



                // 출석 처리 후 페이지 새로고침
                $('#attendanceSuccessModal2').on('hidden.bs.modal', function (e) {
                    location.reload();
                });
            },
            error: function (xhr, status, error) {
                var errorMessage = "출석 처리 중 오류가 발생했습니다: " + error;
                alert(errorMessage);
                console.error("Error occurred: ", status, error);
            }
        });
    });
});
</script>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
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
	<script src="assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>

</html>