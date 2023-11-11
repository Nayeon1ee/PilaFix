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
	<h4 style="font-size: 20px; text-align: center; margin-top: 2%;">소셜
		계정으로 빠른 로그인하기</h4>

	<a class="icon-link" href="#" style="margin-left: 13%;"><svg
			class="bi" aria-hidden="true">
			<use xlink:href="#box-seam"></use></svg>Icon link</a>
	<a class="icon-link" href="#" style="margin-left: 13%;"><svg
			class="bi" aria-hidden="true">
			<use xlink:href="#box-seam"></use></svg>Icon link2</a>
	<a class="icon-link" href="#" style="margin-left: 13%;"><svg
			class="bi" aria-hidden="true">
			<use xlink:href="#box-seam"></use></svg>Icon link3</a>
	<p>
		<a href="emailfind" class="link-dark"
			style="float: left; margin-top: 20%; text-decoration: none; margin-left: 31%; margin-right: 1%;">이메일로
			찾기</a>
	</p>
	<div class="vr" style="border-left: 2px solid;"></div>
	<p style="margin-top: 17.5%; float: left; width: 25%; margin-left: 5%;">
		<a href="register" class="link-body-emphasis"
			style="text-decoration: none;">회원가입</a>
	</p>
</body>
</html>