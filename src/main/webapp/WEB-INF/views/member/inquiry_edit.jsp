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
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div>
                    <form action="updateQuestion.do" method="post">
                        <div class="inquiry-form">
                            <h2>문의사항 수정</h2>
                            <hr>

                            <!-- 여기서 qsNumber는 수정하려는 문의사항의 고유 번호 -->
                            <input type="hidden" name="qsNumber" value="${question.qsNumber}">
                            
				<!-- 로그인한 회원코드의 연동된 센터가 있으면 선택하게 -->
<select name="selectedCenter">
    <c:forEach var="center" items="${connectedCenters}">
        <!-- 현재 선택된 센터와 비교 -->
        <c:choose>
            <c:when test="${center.ctCode == question.selectedCenterCode}">
                <!-- 현재 선택된 센터 -->
                <option value="${center.ctCode}" selected>센터코드: ${center.ctCode} | 센터이름: ${center.ctName}</option>
            </c:when>
            <c:otherwise>
                <!-- 다른 옵션들 -->
                <option value="${center.ctCode}">센터코드: ${center.ctCode} | 센터이름: ${center.ctName}</option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>
                            </div>
                            <div class="input-section">
                                <p>문의하실 제목을 입력해주세요</p>                              
                                <input type="text" name="qsTitle" value="${question.qsTitle}">
                            </div>
                            <div class="input-section">
                                <p>문의하실 내용을 입력해주세요</p>
                                <textarea class="form-control" name="qsContent" rows="6">${question.qsContent}</textarea>
                            </div>
						    <div style="display: flex; justify-content: flex-end;">
						        <button type="submit" class="submit-button me-2">수정하기</button>
						    </div>
                       
                   <!-- End Our Skills Section -->
			</div>
		</section>
	</main>

</body>
</html>