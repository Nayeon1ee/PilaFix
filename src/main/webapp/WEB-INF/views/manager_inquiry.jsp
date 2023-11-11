<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style_manager_inquiry.css">
<script
	src="${pageContext.request.contextPath}/resources/js/quiry_inquiry.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap_Nayeon.css">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<title>문의사항</title>
</head>
<body>
	<div class="container000">

		<section class="content000">
			<area1>
			<p>area1</p>
			</area1>
			<main>
				<div id="myPage">
					<h3>
						<a href="memberPage.jsp">마이페이지</a> > 문의사항
					</h3>
					<div id="userInfo">
						<div id="myInfoLink">내 정보 수정</div>
						<div id="userInfoText">*** 회원님</div>
						<div id="logout">로그아웃</div>
					</div>

					<div class="inquiry">
						<div class="inquiry-header">
							<button class="inquiry-button">센터문의하기</button>
							<hr>
						</div>

						<div class="inquiry-history">
							<h2>나의 문의 내역</h2>
							<hr>

							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">제목</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>검토중</p>
												</div>

											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
									</div>

								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">제목</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>검토중</p>
												</div>

											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#inquiryCollapse"
											aria-expanded="true" aria-controls="inquiryCollapse">
											<div class="inquiry-item">
												<div class="inquiry-details">
													<div class="inquiry-title">제목</div>
													<div class="inquiry-date">2023.10.17 오후 4:34</div>
												</div>
												<div class="inquiry-location">
													<p>검토중</p>
												</div>
											</div>
										</button>
									</h2>
									<div id="inquiryCollapse"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<strong>문의내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
										<hr>
										<div class="accordion-body">
											<strong>답변내역</strong> <br> It is shown by default, until
											the collapse plugin adds the appropriate classes that we use
											to style each element. These classes control the overall
											appearance, as well as the showing and hiding via CSS
											transitions. You can modify any of this with custom CSS or
											overriding our default variables. It's also worth noting that
											just about any HTML can go within the, though the transition
											does limit overflow.
										</div>
									</div>
								</div>
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