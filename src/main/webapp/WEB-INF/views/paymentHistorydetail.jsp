<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_paymentHistorydetail.css">
<title>Insert title here</title>
</head>
<body>

	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>

			<main>
				여기에 작업

				<div id="myPage">
					<h3>
						<a href="memberPage.jsp">마이페이지</a> > 결제내역 > 결제내역상세
					</h3>
					<div id="userInfo">
						<div id="myInfoLink">내 정보 관리</div>
						<div id="userInfoText">*** 회원님</div>
						<div id="logout">로그아웃</div>
					</div>

					<div class="payment-detail">
						<div class="payment-status">결제완료</div>
						<div class="payment-details">
							<div class="payment-description">그룹수업-상봉점 [카드결제]</div>
							<div class="payment-description">6:1 그룹 레슨 36회(3개월)</div>
							<div class="payment-date">2023.10.17 오전 11:08</div>
							<div class="payment-amount">533,500원</div>
						</div>

						<hr class="line">
						<div class="order-info">
							<div class="order-title">주문정보</div>
							<div class="order-detail">
								주문번호<span class="order-value">417770</span>
							</div>
						</div>
						<hr class="line">
						<div class="payment-info">
							<div class="payment-title">결제정보</div>
							<div class="payment-option">
								결제방식<span class="payment-value">00카드 / 3개월</span>
							</div>
						</div>

					</div>
			</main>

			<area2>
			<p>area2</p>
			</area2>
		</section>

	</div>


</body>
</html>