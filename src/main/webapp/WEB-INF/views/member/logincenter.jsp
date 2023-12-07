<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인임다</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">
<body style="margin-top: 10%; margin-left: 30%; margin-right: 30%;">
	<div class="form-floating mb-3">
		<input type="email" class="form-control" id="floatingInput"
			placeholder="name@example.com"> <label for="floatingInput">Email
			address</label>
	</div>
	<div class="form-floating">
		<input type="password" class="form-control" id="floatingPassword"
			placeholder="Password"> <label for="floatingPassword">Password</label>
	</div>
	<input class="btn btn-primary" type="button" value="로그인"
		style="width: 100%; margin-top: 3%;">
	<p style="text-align: center; margin-top: 3%;">
		<a href="emailfind" class="link-dark" style="text-decoration: none;">비밀번호찾기</a>
	</p>
	<p style="text-align: center; margin-top: 30%;">
		<a href="#" class="link-dark" style="margin-top: 40%;">센터등록하기</a>
	</p>
		<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>
</html>