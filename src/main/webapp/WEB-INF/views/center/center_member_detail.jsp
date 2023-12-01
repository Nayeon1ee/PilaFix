<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="center_header_common.jsp" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
							<h5 class="card-title">회원관리 페이지</h5>
							<p>회원관리 페이지입니다.</p>


							<div class="row">
								<div class="col-xl-4">

									<div class="card card_box_shadow">
										<div
											class="card-body profile-card pt-4 d-flex flex-column align-items-center">


											<img src="${pageContext.request.contextPath }/resources/images/customer.png"  class="rounded-circle rounded-logo" alt="logo"  width="50%"><br>
											
											<h5>${member.csName }</h5>
											<!-- 생년월일에 따라 나이 분기 필요 -->
										     <c:set var="currentYear" value="<%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %>" />
											<c:set var="birthYear" value="${fn:substring(member.csBirth, 0, 4)}" />
											<c:set var="age" value="${currentYear - birthYear}" />
											<h5>${member.csBirth } (${age}세)</h5>

											<div class="social-links mt-2">
												<table class="CTS_information00">
													<tr>
														<td class="CTS_information01">회원번호</td>

														<td>${member.csMemberCode }</td>
													</tr>
													<tr>
														<td class="CTS_information01">연락처</td>
														<td>${member.csPhoneNumber1 }${member.csPhoneNumber2 }${member.csPhoneNumber3 }</td>
													</tr>
													<tr>
														<td class="CTS_information01">이메일</td>
														<td>${member.csEmailId }</td>

													</tr>
													<tr>
														<td class="CTS_information01">회원등록일</td>
														<td>${member.csRegistrationDate}</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

								</div>

								<div class="col-xl-8">

									<div class="card card_box_shadow">
										<div class="card-body pt-3">
											<!-- Bordered Tabs -->
											<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
												<li class="nav-item" role="presentation">
													<button class="nav-link active" data-bs-toggle="tab"
														data-bs-target="#profile-overview" aria-selected="true"
														role="tab">보유 수강권 현황</button>
												</li>
											</ul>

											<div class="tab-pane fade show active profile-overview"
												id="profile-overview" role="tabpanel">
												<h5 class="card-title st_session_pass_p">개인</h5>
												<div class="row">
													
													<div class="col-lg-3 col-md-4 label classname000"  style="font-weight: bold"> 
														<c:choose>
															<c:when test="${not empty member.ticketCodePersonal1 }">
																${ticketInfo['personal'].tkName}
																<!-- map에서 수강권 정보 꺼내옴 -->
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기간</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
															<c:when test="${not empty member.ticketCodePersonal1 }">
																	${member.ticketStartDatePersonal1 }~${member.ticketExpiryDatePersonal1 }
															</c:when>
															<c:otherwise>
																	-
																</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수강권내역</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
											            	<c:when test="${not empty member.ticketCodePersonal1}">
											            		사용중
											            	</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여일수</div>
													<div class="col-lg-9 col-md-8">
													<c:choose>
											            <c:when test="${not empty member.ticketCodePersonal1}">
															    <fmt:parseDate var="startDate" value="${member.ticketStartDatePersonal1}" pattern="yyyy-MM-dd" />
															    <fmt:parseDate var="endDate" value="${member.ticketExpiryDatePersonal1}" pattern="yyyy-MM-dd" />
																
																<jsp:useBean id="now" class="java.util.Date" />
																												    
															    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" />
																<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="resultEndDate" />
																<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="resultStartDate" />
																
																${resultEndDate - nowfmtTime }일 남음 / 총 ${resultEndDate - resultStartDate} 일 
																
											            	</c:when>
															<c:otherwise>
																		-
															</c:otherwise>
													</c:choose>
												</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여횟수</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
															<c:when test="${not empty member.ticketCodePersonal1 }">
																${member.ticketRemainingCountPersonal1}회 남음 / 총 ${ticketInfo['personal'].tkUsageCount}회
															</c:when>
															<c:otherwise>
																		-
															</c:otherwise>
														</c:choose>
													</div>
												</div>

												<hr class="st_session_pass_hr">


												<h5 class="card-title st_session_pass">그룹</h5>
												<div class="row">
													<div class="col-lg-3 col-md-4 label classname000" style="font-weight: bold"> 
														<c:choose>
															<c:when test="${not empty member.ticketCodeGroup1 }">
																${ticketInfo['group'].tkName} <!-- 맵에서 티켓 정보만 추출 -->
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</div>
												</div><br>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기간</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
															<c:when test="${not empty member.ticketCodeGroup1 }">
																	${member.ticketStartDateGroup1 } ~ ${member.ticketExpiryDateGroup1 }
															</c:when>
															<c:otherwise>
																	-
																</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수강권내역</div>
													<div class="col-lg-9 col-md-8">
														<c:choose>
											            	<c:when test="${not empty member.ticketCodeGroup1}">
											            		사용중
											            	</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여일수</div>
													<div class="col-lg-9 col-md-8"> 
														<c:choose>
															<c:when test="${not empty member.ticketCodeGroup1 }">
												                <%-- 시작일과 만료일을 Date 객체로 변환 
												                <fmt:parseDate var="startDate" value="${member.ticketStartDateGroup1}" pattern="yyyy-MM-dd" />
												                <fmt:parseDate var="expiryDate" value="${member.ticketExpiryDateGroup1}" pattern="yyyy-MM-dd" />
												                 --%>
												                <%-- 총 일수 계산 
												                <c:set var="totalDays" value="${fn:substring((expiryDate.time - startDate.time) / (24 * 60 * 60 * 1000), 0, fn:length((expiryDate.time - startDate.time) / (24 * 60 * 60 * 1000)) - 2)}" />
												                --%>
												                <%-- 현재 날짜를 가져오기 
												                <fmt:formatDate pattern="yyyy-MM-dd" var="currentDate" value="${now}" />
												                --%>
												                <%-- 남은 일수 계산 
												                <c:set var="remainingDays" value="${fn:substring((expiryDate.time - currentDate.time) / (24 * 60 * 60 * 1000), 0, fn:length((expiryDate.time - currentDate.time) / (24 * 60 * 60 * 1000)) - 2)}" />
												                ${remainingDays}일 남음 / 총 ${totalDays}일
												                --%>
												                
												                <fmt:parseDate var="startDate2" value="${member.ticketStartDateGroup1}" pattern="yyyy-MM-dd" />
															    <fmt:parseDate var="endDate2" value="${member.ticketExpiryDateGroup1}" pattern="yyyy-MM-dd" />
																												    
																<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="resultEndDate2" />
																<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="resultStartDate2" />
																
																${resultEndDate2 - nowfmtTime }일 남음 / 총 ${resultEndDate2 - resultStartDate2} 일 
																
											          		</c:when>
															<c:otherwise>
																		-
															</c:otherwise>
													</c:choose>
													</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여횟수</div>
													<div class="col-lg-9 col-md-8"> 
														<c:choose>
															<c:when test="${not empty member.ticketCodeGroup1 }">
																${member.ticketRemainingCountGroup1}회 남음 / 총 ${ticketInfo['group'].tkUsageCount}회
																<!-- map에서 수강권 정보 꺼내옴 -->
															</c:when>
															<c:otherwise>
																		-
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>


										</div>
										<!-- End Bordered Tabs -->

									</div>
								</div>

							</div>



							<hr>



							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">최근 문의 내역</h5>
									<p>회원이 최근에 문의한 문의 내역 리스트입니다.</p>
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">문의일시</th>
												<th scope="col">문의제목</th>
												<th scope="col">문의상태</th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${empty QList}">
												<td colspan="3"> 문의 내역이 존재하지 않습니다.</td>
											</c:if>
											<c:forEach var="qlist" items="${QList }">
												<tr>
													<td><fmt:formatDate pattern="yyyy.MM.dd(E) a h:mm" var="formattedDate2" value="${qlist.qsRegdate}" />${formattedDate2 }</td>
													<td>${qlist.qsTitle }</td>
													<td>
														<button type="submit" onclick="location.href='getQuestionReply.do?reTargetPostNumber=${qlist.qsNumber}' " class="btn btn-primary mb-3">${qlist.qsAnswerYn ? '답변대기' : '답변완료'}</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->

								</div>
							</div>


							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">최근 예약 수업 내역</h5>
									<p>회원이 최근에 예약한 수업 내역 리스트입니다.</p>
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일시</th>
												<th scope="col">수업명</th>
												<th scope="col">센터명</th>
												<th scope="col">담당강사</th>
												<th scope="col">예약일시</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty RList}">
												<td colspan="3"> 예약 내역이 존재하지 않습니다.</td>
											</c:if>
											<c:forEach var="rlist" items="${RList}">
												<tr>
													<td><fmt:formatDate pattern="yyyy.MM.dd(E) a h:mm" var="formattedDate" value="${rlist.lessonDatetime }" />${formattedDate }</td>
													<td>${rlist.lsName }</td>
													<td>${rlist.centerName }</td>
													<td>${rlist.trainerMemberName }</td>
													<td><fmt:formatDate pattern="yyyy.MM.dd(E) a h:mm" var="formattedDate" value="${rlist.rsDatetime }" />${formattedDate }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->

								</div>
							</div>


							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">최근 결제 내역</h5>
									<p>회원이 최근에 결제한 내역 리스트입니다.</p>

									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">결제일시</th>
												<th scope="col">결제금액</th>
												<th scope="col">결제유형</th>
												<th scope="col">수강권명</th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${empty PList}">
												<td colspan="4"> 결제 내역이 존재하지 않습니다.</td>
											</c:if>
											<c:forEach var="plist" items="${PList }">
												<tr>
													<td><fmt:formatDate pattern="yyyy.MM.dd(E) a h:mm" var="formattedDate" value="${plist.paDatetime}" />${formattedDate }</td>
													<td>${plist.paAmount }</td>
													<td>${plist.paMethod }</td>
													<td>${plist.ticketName }</td> 
													<td></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<!-- End Table with stripped rows -->
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
<%@ include file="center_footer_common.jsp"%>