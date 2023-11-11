<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_registration.css" />
</head>
<body style="margin-left: 30%; margin-right: 30%;">
	<div class="mb-3 row" style="margin-top: 10%;">
		<label for="staticEmail" class="col-sm-2 col-form-label"
			style="margin-left: 1%; border-left: 2px solid; border-color: #9B67FF;">회원가입</label>
	</div>
	<form class="row g-3">
		<div class="col-auto" style="width: 100px;">
			<label for="staticEmail2" class="visually-hidden">이메일 아이디</label> <input
				type="text" readonly class="form-control-plaintext"
				id="staticEmail2" value="이메일 아이디"
				style="width: 130%; padding: revert-layer;">
		</div>
		<div class="col-auto" style="width: 21%;">
			<label for="inputPassword2" class="visually-hidden">Password</label>
			<input type="password" class="form-control" id="inputPassword2"
				placeholder="이메일 입력"
				style="width: 330%; margin-left: 20%; border: 0px;">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3"
				style="width: 90px; margin-left: 290px; font-size: 14px;">중복
				확인</button>
		</div>
		<div class="col-12"
			style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
			<label for="inputAddress" class="form-label"
				style="float: left; width: 20%;">비밀번호</label> <input type="text"
				class="form-control" id="inputAddress"
				placeholder="영문, 숫자 포함 8글자 이상 입력"
				style="float: left; width: 80%; border: 0px; padding-top: 0px;">
		</div>
		<div class="col-12"
			style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
			<label for="inputAddress" class="form-label"
				style="float: left; width: 20%;">비밀번호 확인</label> <input type="text"
				class "form-control" id="inputAddress"
				placeholder="영문, 숫자 포함 8글자 이상 입력"
				style="float: left; width: 80%; border: 0px; padding-top: 0px;">
		</div>
		<div class="col-12"
			style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
			<label for="inputAddress" class="form-label"
				style="float: left; width: 20%;">이름</label> <input type="text"
				class="form-control" id="inputAddress" placeholder="이름 입력"
				style="float: left; width: 80%; border: 0px; padding-top: 0px;">
		</div>
		<div class="col-12"
			style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
			<label for="inputAddress" class="form-label"
				style="float: left; width: 20%;">휴대전화 번호</label> <input type="text"
				class="form-control" id="inputAddress" placeholder="휴대전화 번호 입력"
				style="float: left; width: 80%; border: 0px; padding-top: 0px;">
		</div>
		<div>
			<div class="col-12"
				style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
				<label for="inputAddress" class="form-label"
					style="float: left; width: 20%;">출생년도</label> <input type="text"
					class="form-control" id="inputAddress" placeholder="4자리 입력"
					style="float: left; width: 30%; border: 0px; padding-top: 0px;">
			</div>
			<div class="col-md-4" style="float: left; margin-left: 15%;">
				<label for="inputState" class="form-label">성별</label> <input
					class="form-check-input" type="radio" name="flexRadioDefault"
					id="flexRadioDefault1"> <label class="form-check-label"
					for="flexRadioDefault1">남자</label> <input class="form-check-input"
					type="radio" name="flexRadioDefault" id="flexRadioDefault2"
					checked="checked"> <label class="form-check-labe2"
					for="flexRadioDefault2">여자</label>
			</div>
		</div>

		<div class="form-check">
			<input class="form-check-input" type="checkbox" value=""
				id="flexCheckDefault"> <label class="form-check-label"
				for="flexCheckDefault">전체 동의합니다.</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value=""
				id="flexCheckChecked" checked> <label
				class="form-check-label" for="flexCheckChecked">[필수] 만 14세
				이상입니다.</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value=""
				id="flexCheckDefault"> <label class="form-check-label"
				for="flexCheckDefault">[필수] 서비스 이용약관 동의</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value=""
				id="flexCheckChecked" checked> <label
				class="form-check-label" for="flexCheckChecked">[필수] 개인정보 수집
				및 이용동의</label>
		</div>
		<div class="vr"></div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary"
				style="width: 100%; margin-top: 3%;">회원가입</button>
		</div>
	</form>
</body>
</html>
