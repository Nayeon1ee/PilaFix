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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.15.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
</head>
<!-- 내 css -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common_0.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_trainer_group.css" />


<!-- ======= Header ======= -->
<%@ include file="member_header_common_tr.jsp"%>
<!-- End Header -->

<main id="main">

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container" style="max-width: 1000px">

			<ol>
				<li><a href="main.do">Home</a></li>
				<li>Group Class Schedule</li>
			</ol>
			<h2>그룹 수업 스케줄</h2>
		</div>
	</section>
	<!-- End Breadcrumbs -->



	<!-- ======= Services Section ======= -->
	<section id="services" class="services">
		<div class="container" style="max-width: 1000px">
			<!-- 수업 상세 정보 -->
			<section class="explanation text-center py-5">
				<div class="container">

					<!-- 수업시간 -->
					<span style="display: inline-block;"> ${lessonDetail.lsDate}
					</span>
					<c:set var="hour"
						value="${fn:substring(lessonDetail.lsTime, 11, 13)}" />
					<!-- 시간 추출 -->
					<c:choose>
						<c:when test="${hour lt 12}">
							<!-- 오전 확인 -->
                            오전
                        </c:when>
						<c:otherwise>
                            오후
                        </c:otherwise>
					</c:choose>
					<span style="display: inline-block;">
						${fn:substring(lessonDetail.lsTime, 11, 16)} </span> <br>
					<p class="h3 mb-0">
						<strong class="text-primary"> ${lessonDetail.lsName} </strong>
					</p>
					<br>
					<%-- 				<div class="col-md-12">
                	<label class="form-label" style="text-align: center;">수업 설명</label>
                	 <textarea readonly class="form-control" style="height: 300px;" disabled>${lessonDetail.lsContent} 
					</textarea>
				</div> --%>

					<div class="output-text"
						style="text-align: center; white-space: pre-line;">
						${lessonDetail.lsContent}</div>
				</div>
			</section>


			<!-- 출석 통계 -->
			<div class="status py-5">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4 text-center">예약:
							${lessonDetail.reservedCount}</div>
						<div class="col-md-4 text-center">출석: ${attendedCount}</div>
						<div class="col-md-4 text-center">결석: ${absentCount}</div>
					</div>
				</div>
			</div>

			<!-- 수업 예약한 회원 목록 -->
			<section class="member_list py-1 my-2">
				<div class="container">
					<div class="row justify-content-center">
						<c:choose>
							<c:when test="${not empty lessonDetail.reservedMembers}">
								<c:forEach var="member" items="${lessonDetail.reservedMembers}"
									varStatus="status">
									<div class="col-md-2">
										<div class="member-check text-center">
											<input type="checkbox" class="btn-check"
												id="btn-check-${status.index}" name="selectedMemberCodes"
												value="${member.csMemberCode}" autocomplete="off"> <label
												class="btn" for="btn-check-${status.index}"> <img
												src="${pageContext.request.contextPath}/resources/images/user.png"
												alt="profile image" style="width: 70px; height: 70px;">
												<p>${member.csName}</p>
											</label>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="col-md-12">
									<p class="text-center">현재 예약한 회원이 없습니다.</p>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
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
		<div class="output-text" style="text-align:center; white-space: pre-line; ">
		    ${lessonDetail.lsContent}
		</div>
	</div>
	</section>


<!-- 출석 통계 -->
<div class="status py-5">
	<div class="container">
		<div class="row justify-content-center">
            <div class="col-md-4 text-center">예약: ${lessonDetail.reservedCount}</div>
			<div class="col-md-4 text-center">출석: <span id="presentCount">${attendedCount}</span></div>
			<div class="col-md-4 text-center">결석: <span id="absentCount">${absentCount}</span></div>
		</div>
	</div>
</div>

<!-- 수업 예약한 회원 목록 -->
<section class="member_list py-1 my-2">
	<div class="container">
		<div class="row justify-content-center">
			<c:choose>
<%-- 			<c:when test="${not empty lessonDetail.reservedMembers}"> --%>
			<c:when test="${not empty attendance}">
<c:if test="${attendance.member1Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-1" name="selectedMemberCodes" value="${attendance.atMember1Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-1">
            <p>${attendance.member1Name}</p>
        </label>
    </div>
</div>
</c:if>
<c:if test="${attendance.member2Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-2" name="selectedMemberCodes" value="${attendance.atMember2Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-2"> 
            <p>${attendance.member2Name}</p>
        </label>
    </div>
</div>    
</c:if>
<c:if test="${attendance.member3Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-3" name="selectedMemberCodes" value="${attendance.atMember3Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-3"> 
            <p>${attendance.member3Name}</p>
        </label>
    </div>
</div>    
</c:if>
<c:if test="${attendance.member4Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-4" name="selectedMemberCodes" value="${attendance.atMember4Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-4">
            <p>${attendance.member4Name}</p>
        </label>
    </div>
</div>    
</c:if>
<c:if test="${attendance.member5Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-5" name="selectedMemberCodes" value="${attendance.atMember5Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-5"> 
            <p>${attendance.member5Name}</p>
        </label>
    </div>
</div>    
</c:if>
<c:if test="${attendance.member6Name != null}">
<div class="col-md-2">
    <div class="member-check text-center">
        <input type="checkbox" class="btn-check" id="btn-check-6" name="selectedMemberCodes" value="${attendance.atMember6Code}" autocomplete="off"> 
        <label class="btn" for="btn-check-6">
            <p>${attendance.member6Name}</p>
        </label>
    </div>
</div>    
</c:if>

</c:when>
			<c:otherwise>
				<div class="col-md-12">
					<p class="text-center">현재 예약한 회원이 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</section>

			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<!-- 목록 버튼 -->
					<button type="button" class="btn btn-primary ms-3"
						onclick="location.href='getTrainerLessonList.do'">목록</button>
					<!-- 출석 처리 버튼 -->
					<form action="updateAttendG.do" method="post" class="me-2">
						<input type="hidden" name="lessonCode"
							value="${lessonDetail.lsCode}">
						<c:forEach var="member" items="${reservedMembers}">
							<input type="checkbox" name="selectedMemberCodes"
								value="${member.csMemberCode}">
						</c:forEach>
						<button type="submit" class="btn btn-primary me-3">출석처리</button>
					</form>

					<button type="button" class="btn btn-primary ms-3" onclick="location.href='getTrainerLessonList.do'">목록</button>

<input type="hidden" id="atCode" name="atCode" value="${attendance.atCode}">
<button type="button" id="attendanceSubmitButton" class="btn btn-primary me-3">출석처리</button>
				</div>
			</div>


			<!-- End Our Skills Section -->
		</div>
	</section>
</main>

<script>
    // 출석 및 결석 회원 수 조회 함수
    function getAttendanceCounts(atCode) {
        $.ajax({
            url: 'getAttendanceCounts.do',
            type: 'GET',
            data: {atCode: atCode},
            success: function(counts) {
                $("#presentCount").text(counts.attendedCount);
                $("#absentCount").text(counts.absentCount);
            },
            error: function(xhr, status, error) {
                console.error("Error occurred: ", status, error);
            }
        });
    }

    $(document).ready(function() {
        var atCode = $("#atCode").val();

        // 페이지 로드 시 출석 및 결석 회원 수 조회
        getAttendanceCounts(atCode);

        $("#attendanceSubmitButton").click(function(e) {
            e.preventDefault();
            var selectedMemberCodes = $("input[name='selectedMemberCodes']:checked").map(function() {
                return $(this).val();
            }).get();

            // 출석 처리 요청
            $.ajax({
                url: 'updateAttendanceG.do?atCode=' + encodeURIComponent(atCode),
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(selectedMemberCodes),
                success: function(response) {
                    // 출석 처리 후에도 출석 및 결석 회원 수 조회
                    getAttendanceCounts(atCode);
                },
                error: function(xhr, status, error) {
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
<!-- <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
</body>

</html>