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
    
        /* 툴팁 스타일 설정 */
        #tooltip {
            position: absolute;
            display: none;
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
								<c:if test="${targetComplaintsList == null }">
									<tr>
										<td colspan="6"> 신고 접수된 글이 없습니다.</td>
									</tr>
								</c:if>
								<tbody>
									<c:forEach var="list" items="${targetComplaintsList }">
										<tr>
											<td>${list.cmNumber }</td>
											<td>${list.cmTitle }</td>
											<td>커뮤니티</td>
																						
										        <!-- cmNumber 파라미터를 전달하여 showTooltip 함수 호출 -->
										        <td>
											        <span id="targetElement" onmouseover="showTooltip('${list.cmNumber }')"  onmouseout="hideTooltip()">
											        	${list.cmBlameCount}
											        	<div id="tooltip" data-container="body" style="display: none;"></div>
											        </span>
										        </td>
										        <!-- 툴팁을 표시할 엘리먼트 -->
        
        
											<c:if test="${list.cmOpenYn}">
												<td style="color:red">처리 대기</td>
											</c:if>
											<c:if test="${!list.cmOpenYn}">
												<td >처리 완료</td>
											</c:if>
											<td><a href="getComplaintsDetail.do?cmNumber=${list.cmNumber}">원글보기</a></td>
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
    
    function showTooltip(cmNumber) {
        // blameReasonList.do를 호출하여 데이터를 가져옴
        $.ajax({
            url: "blameReasonList.do?cmNumber=" + cmNumber,
            type: "GET",
            success: function (data) {
            	// 가져온 데이터를 툴팁으로 표시
                var tooltipContent = "<ul>";
                for (var i = 0; i < data.reasons.length; i++) {
                    tooltipContent += "<li>" + data.reasons[i].blameReasonName + "</li>";
                }
                tooltipContent += "</ul>";

                // 툴팁을 표시할 엘리먼트에 동적으로 HTML 추가
                $("#tooltip").html(tooltipContent);

                // 툴팁을 보여줄 위치 설정 및 표시
                 // 마우스 위치에 툴팁을 표시
                var mouseX = event.clientX;
                var mouseY = event.clientY;

                $("#tooltip").css({
                    top: mouseY + 10, // 위에서 10px 내리기
                    left: mouseX + 10 // 왼쪽에서 10px 이동
                }).show();
                
                
            },
            error: function () {
                console.error("신고사유 가져오기 실패");
            }
        });
    }

    function hideTooltip() {
        // 툴팁 숨김
        $("#tooltip").html("");
    }
    
	</script>
	<!--내가 만든 JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/js/admin_common_1.js"></script>
</body>

</html>