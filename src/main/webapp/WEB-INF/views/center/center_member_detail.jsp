<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<h5 class="card-title">웹관리자의 회원관리 페이지</h5>
							<p>웹관리자의 회원관리 페이지입니다.</p>


							<div class="row">
								<div class="col-xl-4">

									<div class="card card_box_shadow">
										<div
											class="card-body profile-card pt-4 d-flex flex-column align-items-center">

											<img src="#" alt="logo" class="rounded-circle rounded-logo">

											<h5>${member.csName}</h5>
											<c:set var="currentYear" value="<%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %>" />
												<c:set var="birthYear" value="${fn:split(member.csBirth,'-')[0]}" />
												<c:set var="birthMonth" value="${fn:split(member.csBirth,'-')[1]}" />
												<c:set var="birthDay" value="${fn:split(member.csBirth,'-')[2]}" />
												<c:set var="age" value="${currentYear - birthYear}" />
											<h5>${birthYear}년&nbsp;${birthMonth}월&nbsp;${birthDay}일&nbsp; (만 ${age}세)</h5>
											<div class="social-links mt-2">
												<table class="CTS_information00">
													<tr>
														<td class="CTS_information01">회원번호</td>
														<td>${member.csMemberCode}</td>
													</tr>
													<tr>
														<td class="CTS_information01">연락처</td>
														<td>${member.csPhoneNumber1}-${member.csPhoneNumber2}-${member.csPhoneNumber3}</td>
													</tr>
													<tr>
														<td class="CTS_information01">이메일</td>
														<td>${member.csEmailId}</td>
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
													<div class="col-lg-3 col-md-4 label classname000">[지점이름]
														수업이름</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기간</div>
													<div class="col-lg-9 col-md-8">2023.10.17~2023.12.08</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수강권내역</div>
													<div class="col-lg-9 col-md-8">사용중</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여일수</div>
													<div class="col-lg-9 col-md-8">126일 남음 / 총 150 일</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여횟수</div>
													<div class="col-lg-9 col-md-8">34회 남음 / 총 60 회</div>
												</div>

												<hr class="st_session_pass_hr">


												<h5 class="card-title st_session_pass">그룹</h5>
												<div class="row">
													<div class="col-lg-3 col-md-4 label classname000">[지점이름]
														수업이름</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">기간</div>
													<div class="col-lg-9 col-md-8">2023.10.17~2023.12.08</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">수강권내역</div>
													<div class="col-lg-9 col-md-8">사용중</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여일수</div>
													<div class="col-lg-9 col-md-8">126일 남음 / 총 150 일</div>
												</div>

												<div class="row">
													<div class="col-lg-3 col-md-4 label">잔여횟수</div>
													<div class="col-lg-9 col-md-8">34회 남음 / 총 60 회</div>
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

									<!--검색창 주석
		      <div class="searchfilter-size">
				<select class="form-select right-align" aria-label="Default select example" id="filterSelect">
				  <option selected>전체</option>
				  <option value="1">이름</option>
				  <option value="2">전화번호</option>
				</select>
				<form class="d-flex right-align">
				        <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
				        <button class="btn btn-outline-success" type="submit">search</button>
				</form>
			  </div>
			 -->
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">문의일시</th>
												<th scope="col">문의종류</th>
												<th scope="col">문의제목</th>
												<th scope="col">문의상태</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금) 오후 8:00</td>
												<td>예약문의</td>
												<td class="truncate-text">예약에 대해서 질문 제목 길어지면 줄이고싶은데
													왜안먹지</td>
												<td>검토중</td>
											</tr>

											<tr>
												<td>2023.04.08(금) 오후 8:00</td>
												<td>예약문의</td>
												<td class="truncate-text">예약에 대해서 질문</td>
												<td>검토중</td>
											</tr>

											<tr>
												<td>2023.01.08(금) 오후 8:00</td>
												<td>예약문의</td>
												<td class="truncate-text">예약에 대해서 질문</td>
												<td>검토중</td>
											</tr>
										</tbody>
									</table>
									<!-- End Table with stripped rows -->

								</div>
							</div>


							<div class="card card_box_shadow">
								<div class="card-body">
									<h5 class="card-title">최근 예약 수업 내역</h5>
									<p>회원이 최근에 예약한 수업 내역 리스트입니다.</p>
									<!--검색창 주석
		      <div class="searchfilter-size">
				<select class="form-select right-align" aria-label="Default select example" id="filterSelect">
				  <option selected>전체</option>
				  <option value="1">이름</option>
				  <option value="2">전화번호</option>
				</select>
				<form class="d-flex right-align">
				        <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
				        <button class="btn btn-outline-success" type="submit">search</button>
				</form>
			  </div>
			 -->
									<!-- Table with stripped rows -->
									<table class="table datatable">
										<thead>
											<tr>
												<th scope="col">수업일시</th>
												<th scope="col">예약일시</th>
												<th scope="col">수업명</th>
												<th scope="col">담당강사</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금) 오후 8:00</td>
												<td>2023.04.08(금) 오후 8:00</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

											<tr>
												<td>2023.04.08(금) 오후 8:00</td>
												<td>2023.01.08(금) 오후 8:00</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

											<tr>
												<td>2023.01.08(금) 오후 8:00</td>
												<td>2023.01.01(금) 오후 8:00</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

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
												<th scope="col">수업명</th>
												<th scope="col">담당강사</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2023.04.18(금) 오후 8:00</td>
												<td>500,000</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

											<tr>
												<td>2023.04.18(금) 오후 8:00</td>
												<td>500,000</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

											<tr>
												<td>2023.04.18(금) 오후 8:00</td>
												<td>500,000</td>
												<td>어쩌고 쩌쩌고 수업</td>
												<td>홍길동</td>
											</tr>

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