<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_membernotice.css">
<meta charset="UTF-8">
<title>공지사항</title>
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
						<a href="memberPage.jsp">마이페이지</a> > 공지사항
					</h3>
					<div id="userInfo">
						<div id="myInfoLink">내 정보 관리</div>
						<div id="userInfoText">*** 회원님</div>
					</div>
					<section class="section000">
						<div class="btn-group" role="group"
							aria-label="Basic radio toggle button group">
							<input type="radio" class="btn-check" name="btnradio"
								id="btnradio1" autocomplete="off" checked> <label
								class="btn btn-outline-primary" for="btnradio1">센터</label> <input
								type="radio" class="btn-check" name="btnradio" id="btnradio2"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="btnradio2">필라픽스</label>
						</div>
					</section>
					<section class="section002">
						<nav class="navbar navbar-expand-lg navbar-light bg-light">
							<div class="container-fluid">

								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse"
									id="navbarSupportedContent">
									<ul class="navbar-nav me-auto mb-2 mb-lg-0">

										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-bs-toggle="dropdown" aria-expanded="false">
												검색 </a>
											<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
												<li><a class="dropdown-item" href="#">제목</a></li>
												<li><hr class="dropdown-divider"></li>
												<li><a class="dropdown-item" href="#">글내용</a></li>
												<li><hr class="dropdown-divider"></li>
												<li><a class="dropdown-item" href="#">제목+글내용</a></li>
											</ul></li>
									</ul>
									<form class="d-flex">
										<input class="form-control me-2" type="search"
											placeholder="Search" aria-label="Search">
										<button class="btn btn-outline-success" type="submit">검색</button>
									</form>
								</div>
							</div>
						</nav>

					</section>

					<section class="section001">
						<ul class="list-group list-group-numbered">
							<li
								class="list-group-item d-flex justify-content-between align-items-start">
								<div class="ms-2 me-auto">
									<div class="fw-bold">제목</div>
									조회수 : 234
								</div>
								<div class="badge bg-primary rounded-pill">2023.10.17 오후
									3:45</div>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-start">
								<div class="ms-2 me-auto">
									<div class="fw-bold">제목</div>
									조회수 : 234
								</div>
								<div class="badge bg-primary rounded-pill">2023.10.17 오후
									3:45</div>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-start">
								<div class="ms-2 me-auto">
									<div class="fw-bold">제목</div>
									조회수 : 234
								</div>
								<div class="badge bg-primary rounded-pill">2023.10.17 오후
									3:45</div>
							</li>
						</ul>
					</section>
				</div>
			</main>
			<area2>
			<p>area2</p>
			</area2>
		</section>
	</div>
</body>
</html>