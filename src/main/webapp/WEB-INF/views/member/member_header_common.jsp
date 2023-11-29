<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#topbar ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	margin-left: -10px;
	/* Adjust this value to move the links more to the left */
}

#topbar li {
	margin-right: 10px; /* Adjust as needed for spacing between items */
}

#topbar li:last-child {
	margin-right: 0; /* Remove margin for the last item */
}

#topbar li a {
	color: #fff; /* Set the color to white or your preferred color */
	text-decoration: none;
}

.notification-panel {
	position: absolute;
	top: 100%;
	start: 0;
	transform: translate(-50%, 0);
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: none;
}

.notification-panel.show {
	display: block;
}

.notification-item {
	padding: 8px 16px;
	font-size: 14px;
	color: #333;
	border-bottom: 1px solid #ddd; /* Add a border bottom for separation */
}

.notification-item:last-child {
	border-bottom: none; /* Remove border bottom for the last item */
}
</style>
</head>
<body>
<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">pilafix@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						02-1234-5678</span></i>
			</div>
			<ul>
				<li class="login"><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</div>
	</section>

	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-between align-items-center">

			<div class="logo">
				<h1>
					<a href="index.html">PILAFIX</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>
<%-- 로그인/로그아웃 상태 확인 --%>
<%
    // 로그인 상태 확인
    boolean isLoggedIn = session.getAttribute("loginUser") != null;
    String loginLogoutText = isLoggedIn ? "로그아웃" : "로그인";
%>
			
			<!--  start nav -->
			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="active" href="index.html">Home</a></li>
					<li><a href="about.html">수강권 결제</a></li>
					<li><a href="services.html">예약하기</a></li>
					<li><a href="portfolio.html">커뮤니티</a></li>
					<li><a href="team.html">공지사항</a></li>
					<li><a href="member_mypage.do">마이페이지</a></li>


					<!--  알림 부분 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="notificationsDropdown" role="button" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							src="${pageContext.request.contextPath}/resources/images/alram.png"
							alt="Notification Image"
							style="height: 1.8em; width: 1.8em; object-fit: cover; border-radius: 50%;">
							<span class="badge rounded-pill bg-danger">7</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="notificationsDropdown">
							<!-- 알림 내용은 여기에 추가하세요 -->
							<a class="dropdown-item" href="#"> 알림 내용 1</a> <a
								class="dropdown-item" href="#"> 알림 내용 2</a> <a
								class="dropdown-item" href="#"> 알림 내용 3</a> <a
								class="dropdown-item" href="#"> 알림 내용 4</a> <a
								class="dropdown-item" href="#"> 알림 내용 5</a> <a
								class="dropdown-item" href="#"> 알림 내용 6</a> <a
								class="dropdown-item" href="#"> 알림 내용 7</a> <a
								class="dropdown-item" href="#"> 알림 내용 8</a>
						</div></li>
					<!--  알림 부분 -->
					
					<%
					if (isLoggedIn) {
					%>
					<!-- 로그아웃 처리를 위한 폼 -->
					<li>
					<form action="logout.do" method="post">
					    <button type="submit" class="nav-link" style="background: none; border: none; padding: 5px; margin: 0; color: inherit; font-size: small; text-decoration: underline;">로그아웃</button>
					</form>
					</li>
					<%
					} else {
					%>
					<!-- 로그인 페이지 링크 -->
					<li><a href="memberLogin.do">로그인</a></li>
					<%
					}
					%>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- end navbar -->

		</div>
	</header>
</body>
</html>