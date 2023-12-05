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
	href="${pageContext.request.contextPath}/resources/css/style_classlist.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/style_bootstrap_common_0.css">


<body>



	<!-- ======= Header ======= -->
	<%@ include file="member_header_common_tr.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width: 1000px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>trainer class list</li>
				</ol>
				<h2>강사 수업 관리</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" style="max-width: 1000px">




<!-- 검색창 -->
<div class="container" style="max-width: 900px; margin-right: 0px;">
	<div class="search-filter mx-auto">
		<div class="search-filter-inner">
			<div class="serch-filter-content">
				<div class="row py-2 my-4">
					<div class="col-md-3 me-1">
						<label for="inputState" class="form-label">검색</label> <select
							id="inputState" class="form-select" style="width: 100%;">
							<option selected disabled>전체</option>
							<option>그룹수업</option>
							<option>개인수업</option>
						</select>
					</div>
					<div class="col-md-6 pt-2 mt-4">
						<div class="input-group">
							<input type="text" class="form-control me-2" id="inputCity"
								placeholder="검색어를 입력해주세요">
							<div class="input-group-append">
								<button type="submit" class="btn btn-primary search">검색</button>
								<button type="reset" class="btn btn-primary search"
									id="resetButton">초기화</button>
							</div>
						</div>
					</div>
				</div>



				<div class="row mb-3">
					<div class="col-md-3 me-2">
						<label for="inputState2" class="form-label">처리상태</label> <select
							id="inputState2" class="form-select">
							<option selected disabled>수업상태</option>
							<option>수업중</option>
							<option>수업종료</option>
							<option>폐강</option>
						</select>
					</div>
					<div class="col-md-5">
						<div class="input-group mb-3">
							<label for="inputState" class="form-label mb-2">기간검색</label>
							<div class="row">
								<div class="col-sm-6 px-0">
									<div class="input-group">
										<input type="date" class="form-control rounded-start"
											id="startDate">

									</div>
								</div>
								<div class="col-sm-6 pe-2 pr-2">
									<div class="input-group">
										<input type="date" class="form-control rounded-end"
											id="endDate">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 검색창 END -->



<!-- 리스트 시작-->
<div class="container" style="max-width: 1000px">
    <div class="py-4 text-center">
        <h2>회원의 출석처리를 진행해주세요</h2>
    </div>
</div>
<table class="table datatable">
    <caption style="caption-side: top; font-weight: bold;">진행중인 수업</caption>    
    <thead>
        <tr>
            <th scope="col">수업코드</th>
            <th scope="col">그룹/개인</th>
            <th scope="col">수업명</th>
            <th scope="col">수업일자</th>
            <th scope="col">수업시간</th>
            <th scope="col">진행인원</th>
<!--             <th scope="col">상태</th> -->
            <th scope="col">센터명</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${ongoingLessons == null or ongoingLessons.size() == 0}">
            <tr>
                <td colspan="8">현재 진행중인 수업이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="lesson" items="${ongoingLessons}">
            <tr>
                <td>${lesson.lsCode}</td>
                <td>${lesson.lsType}</td>
                <td><a href="getTrainerLesson.do?lsCode=${lesson.lsCode}">${lesson.lsName}</a></td>
                <td>${lesson.lsDate}</td>
                <td>${fn:substring(lesson.lsTime, 11, 16)}</td>
                <td>${lesson.reservedCount}/${lesson.lsCapacity}</td>
<%-- 				<td data-lesson-start-time="${lesson.lsStartTime}" data-close-yn="${lesson.lsCloseYN}"></td> --%>
                <td>${lesson.lsCenterName}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>



<table class="table datatable">
    <caption style="caption-side: top; font-weight: bold;">완료된 수업</caption>   
    <thead>
        <tr>
            <th scope="col">수업코드</th>
            <th scope="col">그룹/개인</th>
            <th scope="col">수업명</th>
            <th scope="col">수업일자</th>
            <th scope="col">수업시간</th>
            <th scope="col">진행인원</th>
<!--             <th scope="col">상태</th> -->
            <th scope="col">센터명</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${completedLessons == null or completedLessons.size() == 0}">
            <tr>
                <td colspan="8">완료된 수업이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="lesson" items="${completedLessons}">
            <tr>
                <td>${lesson.lsCode}</td>
                <td>${lesson.lsType}</td>
                <td><a href="getTrainerLesson.do?lsCode=${lesson.lsCode}">${lesson.lsName}</a></td>
                <td>${lesson.lsDate}</td>
                <td>${fn:substring(lesson.lsTime, 11, 16)}</td>
                <td>${lesson.reservedCount}/${lesson.lsCapacity}</td>
<%-- 				<td data-lesson-start-time="${lesson.lsStartTime}" data-close-yn="${lesson.lsCloseYN}"></td> --%>    
                <td>${lesson.lsCenterName}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<table class="table datatable">
<caption style="caption-side: top; font-weight: bold;">폐강된 수업</caption>
    <thead>
        <tr>
            <th scope="col">수업코드</th>
            <th scope="col">그룹/개인</th>
            <th scope="col">수업명</th>
            <th scope="col">수업일자</th>
            <th scope="col">수업시간</th>
            <th scope="col">진행인원</th>
<!--             <th scope="col">상태</th> -->
            <th scope="col">센터명</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${closedLessons == null or closedLessons.size() == 0}">
            <tr>
                <td colspan="8">폐강된 수업이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="lesson" items="${closedLessons}">
            <tr>
                <td>${lesson.lsCode}</td>
                <td>${lesson.lsType}</td>
                <td><a href="getTrainerLesson.do?lsCode=${lesson.lsCode}">${lesson.lsName}</a></td>
                <td>${lesson.lsDate}</td>
                <td>${fn:substring(lesson.lsTime, 11, 16)}</td>
                <td>${lesson.reservedCount}/${lesson.lsCapacity}</td>
<%-- 				<td data-lesson-start-time="${lesson.lsStartTime}" data-close-yn="${lesson.lsCloseYN}"></td> --%>
                <td>${lesson.lsCenterName}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>







<!-- 
<table class="table datatable">
	<thead>
		<tr>
			<th scope="col">수업코드</th>
			<th scope="col">그룹/개인</th>
			<th scope="col">수업명</th>
			<th scope="col">수업일자</th>
			<th scope="col">수업시간</th>
			<th scope="col">진행인원</th>
			<th scope="col">상태</th>
			<th scope="col">센터명</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${lessonList == null }">
			<tr>
				<td colspan="5">현재 진행중인 수업이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="lesson" items="${lessonList }">
			<tr>
				<td>${lesson.lsCode}</td>
				<td>${lesson.lsType}</td>
				<td><a href="getTrainerLesson.do?lsCode=${lesson.lsCode}">${lesson.lsName}</a></td>
				<td>${lesson.lsDate}</td>
				<td>${fn:substring(lesson.lsTime, 11, 16)}</td>
				<td>${lesson.reservedCount}/${lesson.lsCapacity}</td>
				<td data-lesson-start-time="${lesson.lsStartTime}"
					data-close-yn="${lesson.lsCloseYN}"></td>
				<td>${lesson.lsCenterName}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
-->


				<!--  리스트 끝 -->

				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>
	
	
	
	<!-- End #main -->
	
	
	<!-- 
	
	<script>
    var rows = document.querySelectorAll(".table.datatable tbody tr");

    rows.forEach(function(row) {
        var closeYN = row.querySelector("td[data-close-yn]").getAttribute("data-close-yn");
        var startTimeString = row.querySelector("td[data-lesson-start-time]").getAttribute("data-lesson-start-time");
        var startTime = new Date(startTimeString);

        var statusCell = row.querySelector("td[data-lesson-start-time]");
        var statusSpan = document.createElement("span");

        if (closeYN === "Y") {
            statusSpan.textContent = "폐강";
            statusSpan.style.color = "red";
        } else if (startTime > new Date()) {
            statusSpan.textContent = "진행 중";
            statusSpan.style.color = "green";
        } else {
            statusSpan.textContent = "수업종료";
            statusSpan.style.color = "orange";
        }

        statusCell.appendChild(statusSpan);
    });
</script>
	
	
	 -->
	
<!-- <script>
  // 현재 시간을 가져오는 함수
  function getCurrentTime() {
    var now = new Date();
    return now.getTime();
  }

  // 상태를 업데이트하고 테이블을 분리하는 함수
  function updateAndSplitTable() {
    var currentTime = getCurrentTime();
    var rows = document.querySelectorAll(".table.datatable tbody tr");
    
    // 기존 테이블과 3개의 새로운 테이블을 생성
    var existingTable = document.querySelector(".table.datatable");
    var openTable = createEmptyTable("수업중");
    var completedTable = createEmptyTable("수업완료");
    var closedTable = createEmptyTable("폐강");
    
    rows.forEach(function (row) {
      var closeYN = row.querySelector("td[data-close-yn]").getAttribute("data-close-yn");
      var startTimeString = row.querySelector("td[data-lesson-start-time]").getAttribute("data-lesson-start-time");
      var startTime = new Date(startTimeString).getTime() + 50 * 60 * 1000;

      var status;
      if (closeYN === "Y") {
        status = "폐강";
      } else if (currentTime >= startTime) {
        status = "수업완료";
      } else {
        status = "수업중";
      }
      var statusCell = row.querySelector("td[data-lesson-start-time]");
      statusCell.textContent = status; // 상태 값을 셀에 표시
      
      // lsCode 값을 추출하는 부분
      var lessonNameCell = row.querySelector("td:nth-child(3) a");
      var lsCode = lessonNameCell ? lessonNameCell.getAttribute("href").split("=")[1] : null;

      var newRow = row.cloneNode(true);

      // 새 행의 링크를 업데이트
      var newLessonNameCell = newRow.querySelector("td:nth-child(3) a");
      if (newLessonNameCell && lsCode) {
        newLessonNameCell.setAttribute("href", "getTrainerLesson.do?lsCode=" + lsCode);
      }


      if (status === "폐강") {
        closedTable.querySelector("tbody").appendChild(newRow);
      } else if (status === "수업완료") {
        completedTable.querySelector("tbody").appendChild(newRow);
      } else {
        openTable.querySelector("tbody").appendChild(newRow);
      }
    });
    
    // 기존 테이블을 유지하고, 새로운 테이블을 추가
    existingTable.parentNode.appendChild(openTable);
    existingTable.parentNode.appendChild(completedTable);
    existingTable.parentNode.appendChild(closedTable);
    
    // 기존 테이블 삭제
    existingTable.parentNode.removeChild(existingTable);
  }

  // 빈 테이블 생성 함수
  function createEmptyTable(status) {
    var table = document.createElement("table");
    table.className = "table datatable";
    table.innerHTML = `
      <thead>
        <tr>
          <th scope="col">수업코드</th>
          <th scope="col">그룹/개인</th>
          <th scope="col">수업명</th>
          <th scope="col">수업일자</th>
          <th scope="col">수업시간</th>
          <th scope="col">진행인원</th>
          <th scope="col">상태</th>
          <th scope="col">센터명</th>
        </tr>
      </thead>
      <tbody></tbody>
    `;

    var statusRow = document.createElement("tr");
    statusRow.innerHTML = `<td colspan="8">${status}</td>`;
    table.querySelector("tbody").appendChild(statusRow);

    return table;
  }

  // 페이지 로딩 시 호출
  window.onload = updateAndSplitTable;
</script> -->

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

</body>

</html>