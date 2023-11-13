<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<style>
    .container {
        max-width: 600px;
        margin: auto;
        padding: 20px;
    }

    .form-label {
        display: block;
        margin-top: 20px;
        margin-bottom: 10px;
        font-size: 18px;
        color: #333;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none; 
        font-size: 16px;
    }

    .btn-primary {
        width: 100%;
        padding: 15px;
        font-size: 18px;
        border-radius: 5px;
        border: none;
        background-color: #9B67FF; 
        color: white;
    }

    .btn-primary:hover {
        background-color: #8757E5; 
    }

    .info-text {
        text-align: center;
        margin-top: 10px;
        margin-bottom: 30px;
        font-size: 14px;
        color: #666;
    }
</style>


<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap_common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style_findpassword.css" rel="stylesheet">
</head>
<body>
<div class="container" style="max-width: 600px; margin-top: 50px;">
    <h2 class="text-center" style="margin-bottom: 30px;">비밀번호찾기</h2>
    <p class="text-center" >가입 당시 입력한 이메일을 통해 본인 인증 후 </p>
    <p class="text-center" style="margin-bottom: 30px;">비밀번호를 재설정하여 주시기 바랍니다.</p>

    <form>
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label>
            <input type="text" name="csName" class="form-control" id="nameInput" placeholder="이름을 입력하세요.">
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">이메일</label>
            <input type="email" name="csEmailId" class="form-control" id="emailInput" placeholder="이메일을 입력하세요.">
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary" >인증 요청</button>
        </div>
    </form>
    
    <form>
        <div class="mb-3">
            <label for="verificationInput" class="form-label">인증번호</label>
            <input type="text" class="form-control" id="verificationInput" placeholder="인증번호 6자리를 입력하세요.">
        </div>
        <p class="text-center" style="margin-bottom: 30px;">인증번호는 발송 후 1시간 내에만 유효합니다.</p>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary" >확인</button>
        </div>
    </form>

    <div class="text-center" style="margin-top: 30px;">
        <button type="button" class="btn btn-primary">다음</button>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
</body>
</html>