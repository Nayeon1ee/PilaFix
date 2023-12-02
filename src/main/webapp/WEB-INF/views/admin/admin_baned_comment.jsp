<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_common_1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_admin_baned_comment.css">
<!-- =======================================================
  * Template Name: PilaAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://PilaFixmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: PilaFixmade.com
  * License: https://PilaFixmade.com/license/
  ======================================================== -->
<style>
        .tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: 20px;
  left: 105%;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
</head>
<body>

	<%@ include file="admin_header_common.jsp" %>
	<!-- ============================================================================================ -->
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>신고글 관리</h1>
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
							<h5 class="card-title">신고글 목록</h5>
							<!-- <p>간략한 설명</p> -->
							<!-- 검색필터 시작 -->
							<div class="search-filter">
								<div class="search-filter-inner">
									<div class="serch-filter-content">
										<div class="search-top">
											<div class="col-md-3">
												<label for="inputState" class="form-label">검색</label> <select
													id="inputState" class="form-select">
													<option selected disabled>전체</option>
													<option>글 제목</option>
													<option>작성자</option>
												</select>
											</div>
											<div class="serch-input">
												<div class="col-md-6">
													<input type="text" class="form-control" id="inputCity"
														placeholder="검색어를 입력해주세요">
												</div>
												<div class="search-btn">
													<button type="submit" class="btn btn-primary search">검색</button>
													<button type="reset" class="btn btn-primary search"
														id="resetButton">초기화</button>
												</div>
											</div>
										</div>

										<div class="search-date">
											<div class="col-md-3">
												<label for="inputState" class="form-label">처리상태</label> <select
													id="inputState2" class="form-select">
													<option selected disabled>전체</option>
													<option>처리완료</option>
													<option>처리대기</option>
												</select>
											</div>
											<div class="date-filter">
												<label for="inputState" class="form-label">기간검색</label>
												<div class="col-sm-12">
													<input type="date" class="form-control-date" id="startDate">
													<span>~</span> <input type="date" class="form-control-date"
														id="endDate">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 검색필터 끝 -->
							
							<!-- 게시판 시작 -->
							<h5 class="card-title"></h5>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">신고대상 글번호</th>
										<th scope="col">신고대상 글제목</th>
										<th scope="col">신고대상 글유형</th>
										<th scope="col">신고건수</th>
										<th scope="col">처리상태</th>
										<th scope="col">비고</th>
										
									</tr>
								</thead>
								<c:if test="${ComplaintsInfoList == null }">
									<tr>
										<td colspan="6"> 신고 접수된 글이 없습니다.</td>
									</tr>
								</c:if>
								<tbody>
									<c:forEach var="ComplaintsInfo" items="${ComplaintsInfoList }">
										<tr>
											<td>${ComplaintsInfo.cmNumber }</td>
											<td>${ComplaintsInfo.cmTitle }</td>
											<td>커뮤니티</td>
											<!-- 여기 목록으로 다시 받아야 함  -->
											<!-- 
											<td class="tooltip" colspan="2">
											    <span>${ComplaintsInfo.cmBlameCount}</span>
											    <div class="tooltip-text" title="${ComplaintsInfo.blameReasonName}">
											        ${ComplaintsInfo.blameReasonName} 
											    </div>
											</td>
											 -->
											
											<c:if test="${ComplaintsInfo.cmOpenYn}">
												<td>처리 대기</td>
											</c:if>
											<c:if test="${!ComplaintsInfo.cmOpenYn}">
												<td>처리 완료</td>
											</c:if>
											<td><a href="getComplaintsInfo.do?cmCode=${ComplaintsInfo.cmCode }">원글보기</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="admin_footer_common.jsp" %>
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
    const tooltips = document.querySelectorAll('.tooltip');

    tooltips.forEach(tooltip => {
        tooltip.addEventListener('mouseover', function(event) {
            const cmBlameCount = this.querySelector('span').textContent; // cmBlameCount 가져오기

            // Ajax 요청
            fetch(`/getBlameReasons?cmCode=${cmCode}`)
                .then(response => response.json())
                .then(data => {
                    // JSON 데이터를 툴팁에 표시
                    const tooltipText = this.querySelector('.tooltip-text');
                    tooltipText.textContent = JSON.stringify(data, null, 2);

                    tooltipText.style.visibility = 'visible';
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });

        tooltip.addEventListener('mouseout', function() {
            const tooltipText = this.querySelector('.tooltip-text');
            tooltipText.style.visibility = 'hidden'; // 툴팁 숨기기
        });
    });
});
	</script>
	<!--내가 만든 JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
</body>

</html>