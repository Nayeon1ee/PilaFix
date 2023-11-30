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
	href="${pageContext.request.contextPath}/resources/css/style_inquiryform.css">


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
					<li>inquiryForm</li>
				</ol>
				<h2>문의사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">


				<div id="userInfo" class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>
				
		<!-- <form action="insertQuestion.do" method="POST"> -->		 

				<!-- 로그인한 회원코드의 연동된 센터가 있으면 선택하게 -->
<select id="selectedCenter">
    
    <c:choose>
        <c:when test="${empty connectedCenters}">
            <option>연동센터 없음</option>
        </c:when>
        <c:otherwise>
            <option selected disabled hidden>센터를 선택해주세요</option>
            <c:forEach var="center" items="${connectedCenters}">
                <option value="${center.ctCode}">센터코드: ${center.ctCode} | 센터이름: ${center.ctName}</option>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</select>			    
   
					<div class="input-section">
					    <p>문의하실 제목을 입력해주세요</p>
					    <input type="text" name="qsTitle">
					</div>
					<div class="input-section">
					    <p>문의하실 내용을 입력해주세요</p>
					    <textarea class="form-control" name="qsContent" rows="6"></textarea>
					</div>
<div style="display: flex; justify-content: flex-end;">
    <button type="button" class="submit-button me-2" onclick="getQuestionInfo()">문의하기</button>
</div>
				    
			<!-- </form>  -->	


				<!-- End Our Skills Section -->
			</div>
		</section>
<script>
function getQuestionInfo() {
    var ctCode = document.getElementById("selectedCenter").value;
    console.log()
    console.log(ctCode); // 선택된 센터 코드 출력
    var qsTitle = document.querySelector("input[name='qsTitle']").value;
    var qsContent = document.querySelector("textarea[name='qsContent']").value;

    // Ajax 요청
    $.ajax({
        type: "POST",
        url: "insertQuestion.do",
        data: {
            ctCode: ctCode,
            qsTitle: qsTitle,
            qsContent: qsContent
        },
        success: function(response) {
            // 성공 시 로직
            console.log("성공: ", response);
            window.location.href = "getQuestionList.do"; // 문의 목록 페이지로 이동
        },
        error: function(error) {
            // 실패 시 로직
            console.log("실패: ", error);
        }
    });
}
</script>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->

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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>

</html>