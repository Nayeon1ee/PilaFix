<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_header.css"/>

<body>
	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="#">${sessionScope.loginUser.csEmailId}</a></i> 
<!-- <i class="bi bi-phone d-flex align-items-center ms-4"><span>+102-1234-5678</span></i> -->
			</div>
			<ul>
<!-- 				<li class="login"><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li> -->
			<c:set var="user" value="${sessionScope.loginUser}" />
			<%
			// 로그인 상태 확인
			boolean isLoggedIn = session.getAttribute("loginUser") != null;
			String loginLogoutText = isLoggedIn ? "로그아웃" : "로그인";
			String signupMypageText = isLoggedIn ? "내정보관리" : "회원가입";
			String csRoleCode = (String) session.getAttribute("csRoleCode");
			%>
			

					<%
					if (isLoggedIn) {
					%>
					<!-- 로그아웃 처리를 위한 폼 -->
			<li style="color: white; margin-right: 25px;">
			${sessionScope.loginUser.csName} 님, 환영합니다.
			</li>
					<li><a href="logout.do">로그아웃</a></li>
					<%
					} else {
					%>
					<!-- 로그인 페이지 링크 -->
					<li><a href="memberLogin.do">로그인</a></li>
					<%
					}
					%>
					
<li style="color: white;"> | </li>					
					<%
					if (isLoggedIn) {
					%>
					<li>
						<a href="myInfoManage.do">내정보관리</a>
					</li>
					<%
					} else {
					%>
					<!-- 회원가입 페이지 링크 -->
					<li><a href="selectMeOrTr.do">회원가입</a></li>
					<%
					}
					%>										
			</ul>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-between align-items-center">

			<div class="logo">
				<h1>

					<a href="mainPage.do">PILAFIX</a>


				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>
			<%-- 로그인/로그아웃 상태 확인 --%>

			<c:set var="user" value="${sessionScope.loginUser}" />
<%-- 			<%
			// 로그인 상태 확인
			boolean isLoggedIn = session.getAttribute("loginUser") != null;
			String loginLogoutText = isLoggedIn ? "로그아웃" : "로그인";
			String csRoleCode = (String) session.getAttribute("csRoleCode");
			%> --%>
			<!--  start nav -->
			<nav id="navbar" class="navbar">
				<ul>

					<!-- <li><a class="active" href="index.html">Home</a></li> -->
					<li><a class="active" href="mainPage.do">Home</a></li>
					
					
<c:choose>
    <c:when test="${sessionScope.loginUser.csRoleCode == 'ME'}">
<li><a href="ticketPage.do">수강권구매</a></li>
<li><a href="reservPage.do">예약하기</a></li>
<li><a href="schedule.do">내스케줄관리</a></li>
<li><a href="communityPage.do">커뮤니티</a></li>
<li><a href="myNoticePage.do">공지사항</a></li>
<li class="dropdown"><a href="myPage.do"><span>마이페이지</span>
		<i class="bi bi-chevron-down"></i></a>
	<ul>

		<li class="dropdown"><a href="myInfoManage.do"><span>내정보관리</span><iclass="bi bi-chevron-right"></i></a></li>
		<li><a href="myNoticePage.do">공지사항</a></li>
		<li><a href="getPaymentHistory.do">결제내역</a></li>
		<li><a href="myConnectedCenter.do">연동센터관리</a></li>
		<li><a href="myFAQpage.do">FAQ</a></li>
		<li><a href="questionPage.do">문의사항</a></li>
		<li><a href="myTermsPage.do">약관및정책</a></li>
	</ul></li>
</c:when>
    <c:otherwise>

<!-- 강사인 경우 -->
<li><a href="trainerLessonPage.do">수업관리</a></li>
<li><a href="communityPage.do">커뮤니티</a></li>
<li><a href="member_notice.do">공지사항</a></li>
<li class="dropdown"><a href="myPage.do"><span>마이페이지</span>
		<i class="bi bi-chevron-down"></i></a>
	<ul>
		<li class="dropdown"><a href="myInfoManage.do"><span>내정보관리</span><iclass="bi bi-chevron-right"></i></a></li>
		<li><a href="myNoticePage.do">공지사항</a></li>
		<li><a href="myConnectedCenter.do">연동센터관리</a></li>
		<li><a href="myFAQpage.do">FAQ</a></li>
		<li><a href="myTermsPage.do">약관및정책</a></li>
	</ul></li>
</c:otherwise>
</c:choose>					
					

<%-- <% if ("ME".equals((String)session.getAttribute("csRoleCode")))  { %>
<li><a href="ticketPage.do">수강권 결제</a></li>
<li><a href="reservPage.do">예약하기</a></li>
<li><a href="communityPage.do">커뮤니티</a></li>
<li><a href="member_notice.do">공지사항</a></li>
<!-- <li><a href="member_mypage.do">마이페이지</a></li>  -->
<li class="dropdown"><a href="myPage.do"><span>마이페이지</span>
		<i class="bi bi-chevron-down"></i></a>
	<ul>

		<li class="dropdown"><a href="myInfoManage.do"><span>내정보관리</span><iclass="bi bi-chevron-right"></i></a></li>
		<li><a href="myNoticePage.do">공지사항</a></li>
		<li><a href="getPaymentHistory.do">결제내역</a></li>
		<li><a href="myConnectedCenter.do">연동센터관리</a></li>
		<li><a href="myFAQpage.do">FAQ</a></li>
		<li><a href="questionPage.do">문의사항</a></li>
		<li><a href="myTermsPage.do">약관및정책</a></li>
	</ul></li>

<% } else { %>
<!-- 강사인 경우 -->
<li><a href="trainerLessonPage.do">수업관리</a></li>
<li><a href="communityPage.do">커뮤니티</a></li>
<li><a href="member_notice.do">공지사항</a></li>
<li class="dropdown"><a href="myPage.do"><span>마이페이지</span>
		<i class="bi bi-chevron-down"></i></a>
	<ul>
		<li class="dropdown"><a href="myInfoManage.do"><span>내정보관리</span><iclass="bi bi-chevron-right"></i></a></li>
		<li><a href="myNoticePage.do">공지사항</a></li>
		<li><a href="myConnectedCenter.do">연동센터관리</a></li>
		<li><a href="myFAQpage.do">FAQ</a></li>
		<li><a href="myTermsPage.do">약관및정책</a></li>
	</ul></li>
<% } %> --%>



<!-- 					<li><a href="ticketPage.do">수강권 결제</a></li>
					<li><a href="reservPage.do">예약하기</a></li>
					<li><a href="communityPage.do">커뮤니티</a></li>
					<li><a href="member_notice.do">공지사항</a></li>
					<li><a href="member_mypage.do">마이페이지</a></li> 
					<li class="dropdown"><a href="myPage.do"><span>마이페이지</span>
							<i class="bi bi-chevron-down"></i></a>
						<ul>

							<li class="dropdown"><a href="myInfoManage.do"><span>내정보관리</span><iclass="bi bi-chevron-right"></i></a></li>
							<li><a href="myNoticePage.do">공지사항</a></li>
							<li><a href="getPaymentHistory.do">결제내역</a></li>
							<li><a href="myConnectedCenter.do">연동센터관리</a></li>
							<li><a href="myFAQpage.do">FAQ</a></li>
							<li><a href="questionPage.do">문의사항</a></li>
							<li><a href="myTermsPage.do">약관및정책</a></li>
						</ul></li> -->

<%-- 					<%
					if (isLoggedIn) {
					%>
					<!-- 로그아웃 처리를 위한 폼 -->
					<li>
						<form action="logout.do" method="post">
							<button type="submit" class="nav-link"
								style="background: none; border: none; padding: 5px; margin: 0; color: inherit; font-size: small; text-decoration: underline;">로그아웃</button>
						</form>
					</li>
					<%
					} else {
					%>
					<!-- 로그인 페이지 링크 -->
					<li><a href="memberLogin.do">로그인</a></li>
					<%
					}
					%> --%>

					<!--  알림 부분-->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="notificationsDropdown" role="button" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							src="${pageContext.request.contextPath}/resources/images/alarm.png"
							alt="Notification Image"
							style="height: 2em; width: 2em; object-fit: cover; border-radius: 30%;">
							<!-- 알림 있을 때 아래 영역에 카운트 추가 -->
							<div id="NotificationBadge"></div>
					</a>

						<div class="dropdown-menu" aria-labelledby="notificationsDropdown">
							<!-- 알림 내용은 아래 영역에 추가됨 -->
							<div id="NotificationsList"></div>
						</div></li>

					<!--  알림 부분 -->

				</ul>

			</nav>
			<!-- end navbar -->

			<!-- notice.js에서 세션정보 가져오기 위함  -->
			<div id="csMemberCode"
				data-cs-member-code="<%=session.getAttribute("csMemberCode") != null ? (int) session.getAttribute("csMemberCode") : 0%>"></div>

		</div>
	</header>

	<!--  내 js  -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<!-- 부트스트랩 및 자바스크립트 링크 추가 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>