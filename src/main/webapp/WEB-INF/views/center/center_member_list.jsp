<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="center_header_common.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
<main id="main" class="main">

	<div class="pagetitle">
		<h1>회원관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">필요 시 작성</li>
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
						<h5 class="card-title">회원 연동 요청</h5>
						<div class="table-summary">
							<p>
								<!-- request의 행 개수 가져옴 -->
								전체 연동 <b style="color: #c23222"> ${fn:length(request)} </b> 건
							</p>
						</div>

						<table class="table datatable">
							<thead>
								<tr>
									<th scope="col">NO.</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">요청일시</th>
									<th scope="col">요청관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty request }">
									<td colspan="6" align="center">연동 요청이 존재하지 않습니다.</td>
								</c:if>

								<c:forEach var="list" items="${request}" varStatus="loop">
									<tr>
										<td>${loop.index +1 }</td>
										<!-- 연동요청 번호 대신 순번 -->
										<td>${list.memberName }</td>
										<td>${list.memberPhone }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${list.crReqDate}" /></td>

										<td>
											<div class="d-grid gap-2 d-md-block">
												<button type="button" class="btn btn-primary btn-sm"
													data-bs-toggle="modal"
													data-bs-target="#acceptModal-${loop.index}">수락</button>
												<button type="button" class="btn btn-danger btn-sm"
													data-bs-toggle="modal"
													data-bs-target="#rejectModal-${loop.index}">거절</button>
											</div>
										</td>
									</tr>

									<!-- 연동 요청 수락 모달 - 회원 이름 출력 위해 for문 안에  -->
									<div class="modal fade" id="acceptModal-${loop.index}"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">회원 요청 수락</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<b>${list.memberName }</b> 회원의 요청을 수락하시겠습니까?
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">취소</button>
													<button type="button" class="btn btn-primary"
														onclick="acceptRequest('${list.crCode}', ${list.memberCode}, ${list.centerCode }, ${loop.index})">수락</button>
												</div>
											</div>
										</div>
									</div>

									<!-- 연동 요청 거절 모달 - 회원 이름 출력 위해 for문 안에  -->
									<div class="modal fade" id="rejectModal-${loop.index}"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">요청 거절</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<b>${list.memberName }</b> 회원의 요청을 거절하시겠습니까? <br>
													<br> 거절 시, 되돌릴 수 없으며 연동을 원하신다면<br>
													<b>회원의 재요청</b>이 필요합니다.
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">취소</button>
													<button type="button" class="btn btn-danger"
														onclick="rejectRequest('${list.crCode}', ${loop.index})">거절</button>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>




				<div class="card">
					<div class="card-body">
						<h5 class="card-title">전체 회원 목록</h5>
						<p>연동완료된 전체 회원 리스트입니다.</p>

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
												<option>글 작성자</option>
												<option></option>
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

										<div class="date-filter">
											<label for="inputState" class="form-label">기간검색</label>
											<div class="col-sm-12">
												<input type="date" class="form-control-date me-1"
													id="startDate">
												<div class="icon mt-1">
													<i class="ri-arrow-right-line"></i>
												</div>
												<input type="date" class="form-control-date ms-1"
													id="endDate">
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- 검색필터 끝 -->

						<!-- 엑셀다운 -->
						<div class="table-summary my-2 d-flex justify-content-end me-3">
							<button
								onclick="window.open('<c:url value='/centerMemberExcelDown.do' />')"
								type="button" class="btn btn-success btn-sm btn-default"
								id="excelDown">엑셀다운</button>
						</div>

						<!-- Table with stripped rows -->
						<table class="table datatable">

							<thead>
								<tr>
									<th scope="col">회원번호</th>
									<th scope="col">이름</th>
									<th scope="col">성별</th>
									<th scope="col">나이</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">가입일자</th>
									<th scope="col">수강권현황</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${memberList == null }">
									<tr>
										<td colspan="8">등록된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="member" items="${memberList }">
									<tr>
										<td>${member.csMemberCode }</td>
										<td><a
											href="getMemberManage.do?csMemberCode=${member.csMemberCode }">${member.csName }</a></td>
										<td>${member.csGenderMw }</td>
										<!-- 생년월일에 따라 나이 분기 필요 -->
										<c:set var="currentYear"
											value="<%=java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)%>" />
										<c:set var="birthYear"
											value="${fn:substring(member.csBirth, 0, 4)}" />
										<c:set var="age" value="${currentYear - birthYear}" />
										<td>${age}세</td>


										<td>${member.csEmailId }</td>
										<td>${member.csPhoneNumber1 }${member.csPhoneNumber2 }${member.csPhoneNumber3}</td>

										<td>${member.csRegistrationDate }</td>

										<!-- 수강권 보유 여부에 따라 개수 세팅 (그룹1 | 개인1) -->
										<c:set var="personalTicket" value="0" />
										<c:set var="groupTicket" value="0" />

										<c:if
											test="${not empty member.ticketCodePersonal1 and member.ticketExpiryYnPersonal1 eq 'false'}">
											<c:set var="personalTicket" value="1" />
										</c:if>

										<c:if
											test="${not empty member.ticketCodeGroup1 and member.ticketExpiryYnGroup1 eq 'false'}">
											<c:set var="groupTicket" value="1" />
										</c:if>

										<td>개인${personalTicket} | 그룹${groupTicket}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- End Table with stripped rows -->

					</div>
				</div>


			</div>
		</div>
	</section>

</main>
<!-- End #main -->

<script>
function acceptRequest(crCode, memberCode, centerCode) {
	console.log(crCode);
	console.log(memberCode);
	console.log(centerCode);
	
	fetch('/pilafix/acceptRequest.do?crCode='+crCode+'&memberCode='+memberCode+'&centerCode='+centerCode, {
		method: 'GET',
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getMemberManageList.do'; // 에러 시 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};

function rejectRequest(crCode) {
	console.log(crCode);
	
	fetch('/pilafix/rejectRequest.do?crCode='+crCode, {
		method: 'GET',
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getMemberManageList.do'; // 에러 시 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};

//excelDown click
$("#excelDown").click( function(e){
	var $form=$("form[name='search']");
	$(this).attr("href","<c:url value='/centerMemberExcelDown.do' />"+"?"+$form.serialize() );
});
</script>

<%@ include file="center_footer_common.jsp"%>
