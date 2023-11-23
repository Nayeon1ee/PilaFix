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
										<th scope="col">번호</th>
										<!-- <th scope="col">제목번호</th> -->
										<th scope="col">제목</th>
										<th scope="col">유형</th>
										<th scope="col">신고일자</th>
										<th scope="col">신고건수</th>
										<th scope="col">처리상태</th>
										<th scope="col">IP</th>
									</tr>
								</thead>
								<c:if test="${ComplaintsInfoList == null }">
									<tr>
										<td colspan="8">등록된 글이 없습니다.</td>
									</tr>
								</c:if>
								<tbody>
									<c:forEach var="ComplaintsInfo" items="${ComplaintsInfoList }">
										<tr>
											<td><%-- <a href="getComplaintsInfo.do?cpCode=${ComplaintsInfo.cpCode }">${ComplaintsInfo.cpCode }</a> --%>${ComplaintsInfo.cpCode }</td>
											<%--<td> <a href="getComplaintsInfo.do?cpTargetPostNumber=${ComplaintsInfo.cpTargetPostNumber }">${ComplaintsInfo.cpTargetPostNumber }</td> --%>
											<td><a href="getComplaintsInfo.do?cpCode=${ComplaintsInfo.cpCode }&cpTargetPostNumber=${ComplaintsInfo.cpTargetPostNumber }">${ComplaintsInfo.cmTitle }</td>
											<c:if test="${ComplaintsInfo.cpTargetPostType eq 'CM' }">
												<td>커뮤니티</td>
											</c:if>
											<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ComplaintsInfo.cpDate }"/></td>
											 <td class="tooltip" colspan="2">
									            <span>${ComplaintsInfo.cmBlameCount}</span>
									            <div class="tooltip-text" title="${ComplaintsInfo.blameReasonName}">
									                ${ComplaintsInfo.blameReasonName}
									            </div>
									        </td>
											<%-- <td><span class="tooltip-baned-reason">${ComplaintsInfo.cmBlameCount}
											 <span class="tooltip-baned-text">${ComplaintsInfo.blameReasonName}</span></td>
											</td> --%>
											<c:if test="${ComplaintsInfo.cpOpenYn eq 'true' }">
												<td>처리대기</td>
											</c:if>
											<c:if test="${ComplaintsInfo.cpOpenYn eq 'false' }">
												<td>처리완료</td>
											</c:if>
											<td>${ComplaintsInfo.blamerIp }</td>
											<%-- <td><a href="updateCpInfo.do?cp_code=${cpInfo.cp_code }">수정</a> | <a href="deleteCpInfo.do?cp_code=${cpInfo.cp_code }">삭제</a></td> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 페이징 처리 시작 -->
							<!-- 페이징 처리 끝 -->
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
	    const tooltips = document.querySelectorAll('.tooltip-text');

	    tooltips.forEach(tooltip => {
	        tooltip.addEventListener('mouseover', function(event) {
	            // 툴팁에 표시될 모든 정보 가져오기
	            const cmBlameCount = this.getAttribute('data-cm-blame-count');
	            const blameReasonName = this.getAttribute('data-blame-reason-name');
	            const csName = this.getAttribute('data-cs-name');
	            const csEmailId = this.getAttribute('data-cs-email-id');
	            // ... 다른 필요한 정보들도 추가로 가져올 수 있음

	            // 툴팁을 표시하는 코드
	            const tooltipContainer = document.createElement('div');
	            tooltipContainer.classList.add('custom-tooltip');

	            const tooltipContent = `
	            	<p>${ComplaintsInfo.blameReasonName}</p>
	            	<p>${blameReasonName}</p>
	                <p>CM Blame Count: ${cmBlameCount}</p>
	                <p>Blame Reason Name: ${blameReasonName}</p>
	                <p>CS Name: ${csName}</p>
	                <p>CS Email ID: ${csEmailId}</p>
	            `;
	            tooltipContainer.innerHTML = tooltipContent;

	            // 툴팁을 화면에 추가
	            this.appendChild(tooltipContainer);
	        });

	        tooltip.addEventListener('mouseout', function() {
	            // 마우스 아웃 이벤트 처리 (툴팁을 숨기는 등)
	            const tooltipContainer = this.querySelector('.custom-tooltip');
	            if (tooltipContainer) {
	                tooltipContainer.remove();
	            }
	        });
	    });
	});

	</script>
	<!--내가 만든 JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
</body>

</html>