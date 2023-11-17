<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="center_header_common.jsp" %>


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
									전체 연동 <span id="totalRequests">0</span>건 | 새 연동요청 <span	id="newRequests">0</span>건
								</p>
							</div>

							<table class="table datatable">
								<thead>
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">이름</th>
										<th scope="col">전화번호</th>
										<th scope="col">가입일</th>
										<th scope="col">상태</th>
										<th scope="col">요청관리</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty request }">
										<td colspan="6">연동 요청이 존재하지 않습니다.</td> 
									</c:if>
									
									<c:forEach var="request" items="${request}" >
										<tr>
											<td>${request.crCode }</td>
											<td>${request.memberName }</td>
											<td>${request.memberPhone }</td>
											<td>${request.crReqDate }</td>
											
											<td class="stateOfrequest">요청대기</td>
											<td>
												<div class="d-grid gap-2 d-md-block">
													<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal" >삭제</button>
													<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal" >삭제</button>
												</div>
											</td>
										</tr>
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
										      <td><a href="getMember.do?csMemberCode=${member.csMemberCode }&csRoleCode=${member.csRoleCode}">${member.csName }</a></td>
										      <td>${member.csGenderMw }</td>
										      <!-- 생년월일에 따라 나이 분기 필요 -->
										      <c:set var="currentYear" value="<%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %>" />
												<c:set var="birthYear" value="${fn:substring(member.csBirth, 0, 4)}" />
												<c:set var="age" value="${currentYear - birthYear}" />
												<td>${age}세</td>
												
											
										      <td>${member.csEmailId }</td>
										      <td>${member.csPhoneNumber1 }${member.csPhoneNumber2 }${member.csPhoneNumber3}</td>
										      
										      <td>${member.csRegistrationDate }</td>
										      
										      <!-- 수강권 보유 여부에 따라 개수 세팅 (그룹1 | 개인1) -->
										      <c:set var="personalTicket" value="0" />
											  <c:set var="groupTicket" value="0" />
												
											  <c:if test="${not empty member.ticketCodePersonal1 and member.ticketExpiryYnPersonal1 eq 'false'}">
												    <c:set var="personalTicket" value="1" />
											  </c:if>
												
											  <c:if test="${not empty member.ticketCodeGroup1 and member.ticketExpiryYnGroup1 eq 'false'}">
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
	
	

<!-- 연동 요청 수락 버튼 모달 -->
<div class="modal fade" id="basicModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"> 수락하시겠습니까 문구 작성하세용  </h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">  수락하시겠습니까 문구 작성하세용  </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="acceptRequest(${request.crCode},${request.memberCode}, ${request.centerCode })">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달의 확인 누르면 삭제 진행-->


<script>
function acceptRequest(crCode, csMemberCode, centerCode) {
	fetch('/pilafix/acceptRequest.do?crCode=' + cmNumber+'&csMemberCode='+csMemberCode+'&centerCode='+centerCode, {
		method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getMemberManageList.do'; // 커뮤니티 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
};
</script>

<%@ include file="center_footer_common.jsp" %>
