<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#topbar ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	margin-left: -10px;
	
}

#topbar li {
	margin-right: 10px; 
}

#topbar li:last-child {
	margin-right: 0; 
}

#topbar li a {
	color: #fff; 
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
	border-bottom: 1px solid #ddd; 
}

.notification-item:last-child {
	border-bottom: none; 
}
</style>

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

			<!--  start nav -->
			<nav id="navbar" class="navbar">
				<ul>

					<!-- <li><a class="active" href="index.html">Home</a></li> -->
					<li><a class="active" href="mainPage.do">Home</a></li>
					<li><a href="ticketPage.do">수강권 결제</a></li>
					<li><a href="reservPage.do">예약하기</a></li>
					<li><a href="getMemberCommunityList.do">커뮤니티</a></li>
					<li><a href="member_notice.do">공지사항</a></li>
					<!-- <li><a href="member_mypage.do">마이페이지</a></li>  -->
					<li class="dropdown"><a href="member_mypage.do"><span>마이페이지</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							
							<li class="dropdown"><a href="#"><span>내정보관리</span><i class="bi bi-chevron-right"></i></a>
						
							</li>
							<li><a href="member_notice.do">공지사항</a></li>	
							<li><a href="#">결제내역</a></li>
							<li><a href="#">연동센터관리</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="getQuestionList.do">문의사항</a></li>
							<li><a href="#">약관및정책</a></li>
						</ul></li>

				
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
					
				</ul>


			</nav>
			<!-- end navbar -->

		</div>
	</header>

	<!--  내 js  -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<!-- 부트스트랩 및 자바스크립트 링크 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

 
</body>
</html>