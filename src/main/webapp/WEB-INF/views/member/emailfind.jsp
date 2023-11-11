<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일찾기</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">
<body>
	<div class="mb-3 row" style="margin-left: 30%; margin-top: 10%;">
		<label for="staticEmail" class="col-sm-2 col-form-label"
			style="margin-left: 1%; border-left: 2px solid; border-color: #9B67FF;">이메일로
			찾기</label>
	</div>
	<div class="mb-3 row" style="margin-left: 30%;">
		<label for="staticEmail" class="col-sm-2 col-form-label"
			style="margin-left: 1%; width: 270%;">가입 당시 입력한 이메일 주소를 통해 본인
			인증 후 비밀번호를 재설정하여 주시기 바랍니다.</label>
	</div>
	<form class="row g-3"
		style="margin-left: 30%; margin-top: 1%; margin-right: 36%; border-bottom: 1px solid;">
		<div class="col-auto">
			<label for="staticEmail2" class="visually-hidden">이름</label> <input
				type="text" readonly class="form-control-plaintext"
				id="staticEmail2" value="이름">
		</div>
		<div class="col-auto" style="width: 21%;">
			<label for="inputPassword2" class="visually-hidden">Password</label>
			<input type="password" class="form-control" id="inputPassword2"
				placeholder="이름 입력" style="width: 230%; margin-bottom: 20%;">
		</div>

	</form>
	<form class="row g-3"
		style="margin-left: 30%; margin-top: 2%; border-bottom: 1px solid; margin-right: 36%;">
		<div class="col-auto">
			<label for="staticEmail2" class="visually-hidden">Email</label> <input
				type="text" readonly class="form-control-plaintext"
				id="staticEmail2" value="이메일">
		</div>
		<div class="col-auto" style="width: 21%;">
			<label for="inputPassword2" class="visually-hidden">Password</label>
			<input type="password" class="form-control" id="inputPassword2"
				placeholder="이메일입력" style="width: 230%;">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3"
				style="margin-left: 114px;">인증요청</button>
		</div>
	</form>
	<form class="row g-3"
		style="margin-left: 30%; margin-top: 1%; border-bottom: 1px solid; margin-right: 36%;">
		<div class="col-auto">
			<label for="staticEmail2" class="visually-hidden">Email</label> <input
				type="text" readonly class="form-control-plaintext"
				id="staticEmail2" value="인증번호">
		</div>
		<div class="col-auto" style="width: 21%;">
			<label for="inputPassword2" class="visually-hidden">Password</label>
			<input type="password" class="form-control" id="inputPassword2"
				placeholder="인증번호 숫자 6자리 입력" style="width: 230%;">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3"
				style="width: 90px; margin-left: 113px;">확인</button>
		</div>
	</form>
	<div class="mb-3 row" style="margin-left: 30%; margin-top: 1%;">
		<label for="staticEmail" class="col-sm-2 col-form-label"
			style="margin-left: 12%; width: 270%;">인증번호는 발송 후 1시간 내에만
			유효합니다. </label>
	</div>
	<div class="col-auto"
		style="margin-left: 47%; margin-top: 2%; width: 21%">
		<button type="submit" class="btn btn-primary mb-3"
			style="width: 90px;">다음</button>
	</div>
</body>
</html>