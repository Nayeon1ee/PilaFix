<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<li><a href="ticket_.do">수강권 결제</a></li>
					<li><a href="reserv_.do">예약하기</a></li>
					<li><a href="getMemberCommunityList.do">커뮤니티</a></li>
					<li><a href="member_notice.do">공지사항</a></li>
					<!-- <li><a href="member_mypage.do">마이페이지</a></li>  -->
					<li class="dropdown"><a href="member_mypage.do"><span>마이페이지</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							
							<li class="dropdown"><a href="#"><span>내정보관리</span><i class="bi bi-chevron-right"></i></a>
							<!-- <ul>
									<li><a href="#">Deep Drop Down 1</a></li>
									<li><a href="#">Deep Drop Down 2</a></li>
									<li><a href="#">Deep Drop Down 3</a></li>
									<li><a href="#">Deep Drop Down 4</a></li>
									<li><a href="#">Deep Drop Down 5</a></li>
								</ul>  -->	
							</li>
							<li><a href="#">공지사항</a></li>	
							<li><a href="#">결제내역</a></li>
							<li><a href="#">연동센터관리</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="getQuestionList.do">문의사항</a></li>
							<li><a href="#">약관및정책</a></li>
						</ul></li>

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
					
					<!--  알림 부분-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="notificationsDropdown" role="button" data-bs-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
								<img src="${pageContext.request.contextPath}/resources/images/alarm.png" alt="Notification Image" style="height: 2em; width: 2em; object-fit: cover; border-radius: 50%;">
								<!-- 알림 있을 때 아래 영역에 카운트 추가 -->
								<div id="NotificationBadge"></div>
						</a>
						
						<div class="dropdown-menu" aria-labelledby="notificationsDropdown">
							<!-- 알림 내용은 아래 영역에 추가됨 -->
							<div id="NotificationsList"></div>
						</div>
					</li> 
					
					<!--  알림 부분 -->
					
					
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- end navbar -->

		</div>
		<div id="csMemberCode" data-cs-member-code="<%= (int)session.getAttribute("csMemberCode") %>"></div> <!-- notice.js에서 세션정보 가져오기 위함  -->
	</header>
</body>
</html>