<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_membernotice.css">

<body>



	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="mainPge.do">Home</a></li>
					<li>notice</li>
				</ol>
				<h2>공지사항</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">

<!-- 
				<div id="userInfo"
					class="d-flex align-items-center mb-2">
					<div id="myInfoLink" class="ms-4 mr-2"
						style="font-size: 18px; color: #9b56e9; font-weight: bold; text-decoration: none;">
						<i class="fas fa-cog mr-1"></i>내 정보 관리
					</div>
				</div> -->

<section class="section000 pb-5 mb-5">
    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
        <label class="btn btn-outline-primary" for="btnradio1" data-target="centerInfo">센터</label>
        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
        <label class="btn btn-outline-primary" for="btnradio2" data-target="pilafixInfo">필라픽스</label>
    </div>
</section>

				<section class="section002 py-3 my-3">
					<nav class="navbar navbar-expand-lg">
						<div class="container-fluid">
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-bs-toggle="dropdown" aria-expanded="false"
										style="font-size: 16px">검색 </a>
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="#">제목</a></li>
											<hr class="dropdown-divider">
											<li><a class="dropdown-item" href="#">글내용</a></li>
											<hr class="dropdown-divider">
											<li><a class="dropdown-item" href="#">제목+글내용</a></li>
										</ul></li>
								</ul>
								<form action="search" method="post" class="d-flex">
									<div class="input-group">
										<input type="search" name="search" class="form-control"
											placeholder="검색" aria-label="검색">
										<button type="submit" class="btn btn-outline-primary">검색</button>
									</div>
								</form>
							</div>
						</div>
					</nav>
				</section>


				
<div id="centerInfo" class="tab-content">
    <form class="row g-3">
        <ul class="list-group list-group-numbered w-100">
            <c:forEach items="${centerInfoList}" var="noticeC">
                <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="ms-2 me-auto">
                        <a href="noticeDetail.do?code=${noticeC.icNumber}">${noticeC.title}</a>
                    </div>
                    조회수: ${noticeC.cnt}
                    <div class="badge rounded-pill my-auto ms-2" style="background-color: #9b56e9;">${noticeC.regDate}</div>
                </li>
                <hr class="my-1 mb-2">
            </c:forEach>
        </ul>
    </form>
</div>

<div id="pilafixInfo" class="tab-content">
    <!-- 필라픽스 정보를 표시할 내용 -->
    <form class="row g-3">
        <ul class="list-group list-group-numbered w-100">
            <c:forEach items="${pilafixInfoList}" var="noticeW">
                <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="ms-2 me-auto">
                        <a href="noticeDetail.do?code=${noticeW.iwNumber}">${noticeW.title}</a>
                    </div>
                    조회수: ${noticeW.cnt}
                    <div class="badge rounded-pill my-auto ms-2" style="background-color: #9b56e9;">${noticeW.regDate}</div>
                </li>
                <hr class="my-1 mb-2">
            </c:forEach>
        </ul>
    </form>
</div>
							
	
</div>		



				<!-- End Our Skills Section -->
		</section>
	</main>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 페이지 로드시 센터 정보를 표시하고 필라픽스 정보는 숨깁니다.
    $("#centerInfo").show();
    $("#pilafixInfo").hide();

    // 라디오 버튼 클릭 처리
    $("#btnradio1").click(function() {
        $("#centerInfo").show();
        $("#pilafixInfo").hide();
    });

    $("#btnradio2").click(function() {
        $("#centerInfo").hide();
        $("#pilafixInfo").show();
    });
});
</script>
 <!-- <script>
$(document).ready(function() {
/*     // 초기에 "센터" 탭이 선택되도록 설정
    $("input[name='btnradio'][data-target='centerInfo']").prop("checked", true);
 */
 
    // 탭 선택 시 데이터를 업데이트하는 함수
    function updateTabData(targetId) {
        // 선택된 탭에 따라 서버 요청 URL 변경
        var targetId = $("input[name='btnradio']:checked").attr("data-target");
        var ajaxUrl = targetId === "centerInfo" ? "getMyCenterInfo.do" : "getMyPilafixInfo.do";

        // Ajax 요청
        $.ajax({
            url: ajaxUrl,
            success: function(data) {
                // 성공적으로 데이터를 받았을 때 해당 div에 내용을 업데이트
                var targetDiv = $("#" + targetId + " ul");
                targetDiv.empty(); // 기존 내용 비우기
                $.each(data, function(index, item) {
                    // 데이터를 HTML 형식으로 생성하여 추가
                    var html = '<li class="list-group-item d-flex justify-content-between align-items-start">';
                    html += '<div class="ms-2 me-auto">';
                    html += '<a href="noticeDetail.do?code=' + item.code + '">' + item.title + '</a></div>';
                    html += '조회수: ' + item.cnt;
                    html += '<div class="badge rounded-pill my-auto" style="background-color: #9b56e9;">' + item.regDate + '</div>';
                    html += '</li>';
                    targetDiv.append(html);
                });
            },
            error: function() {
                // 에러 처리 로직을 추가
                console.error("Failed to retrieve data.");
            }
        });
    }

    // 탭 선택 시 이벤트 핸들러 등록
    $("input[name='btnradio']").change(function() {
        var targetId = $(this).attr("data-target");
        updateTabData(targetId);
    });

    // 페이지 로드 시 초기 탭 데이터 로드
    var initialTabId = $("input[name='btnradio']:checked").attr("data-target");
    updateTabData(initialTabId);
});
</script> 
 -->

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
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

</body>

</html>