<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	<form action="sendAuthNumber.do" method="post">
        <div class="mb-3">
            <label for="nameInput" class="form-label">이름</label>
            <input type="text" name="csName" class="form-control" id="nameInput" placeholder="이름을 입력하세요." required>
        </div>
        <div class="mb-3">
            <label for="emailInput" class="form-label">이메일</label>
            <input type="email" name="csEmailId" class="form-control" id="emailInput" placeholder="이메일을 입력하세요." required>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">인증 요청</button>
        </div>
    </form>
	    
    <form action="checkAuthNumber.do" method="post">
        <div class="mb-3">
            <label for="verificationInput" class="form-label">인증번호</label>
            <input type="text" class="form-control" name="authNumber" id="verificationInput" placeholder="인증번호 6자리를 입력하세요." required>
        </div>
        <p class="text-center" style="margin-bottom: 30px;">인증번호는 발송 후 1시간 내에만 유효합니다.</p>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary" id="findPwCheckAuthNum-btn">확인</button>
        </div>
    </form>

  	<div class="text-center" style="margin-top: 30px;">
        <button type="button" class="btn btn-primary" id="findPwNext-btn" >다음</button>
    </div>
</div>


<script>
    $(document).ready(function() {
        // 인증번호 요청 AJAX 처리
        $('form[action="sendAuthNumber.do"]').submit(function(e) {
            e.preventDefault(); // 폼 기본 제출 동작 중단
            var name = $('#nameInput').val();
            var email = $('#emailInput').val();
            $.ajax({
                url: 'sendAuthNumber.do',
                type: 'post',
                data: {
                    csName: name,
                    csEmailId: email
                },
                success: function(response) {
                    alert('인증번호가 발송되었습니다.');
                    // 페이지에 인증번호 발송 사실을 알리는 메시지 표시 가능
                },
                error: function(xhr, status, error) {
                    alert('인증번호 발송에 실패했습니다.');
                }
            });
        });

     // 인증번호 확인 AJAX 처리
        $('#findPwCheckAuthNum-btn').click(function(e) {
            e.preventDefault();
            var authNumber = $('#verificationInput').val();
            var csEmailId = $('#emailInput').val(); // csEmailId 값을 입력 필드에서 가져옴

            $.ajax({
                url: 'checkAuthNumber.do',
                type: 'post',
                data: {
                    authNumber: authNumber,
                    csEmailId : csEmailId
                },
                success: function(data) {
                    if(data.valid) {
                        alert('인증에 성공했습니다.');
                        isAuthSuccess = true; // 인증 성공 상태 변경
                    } else {
                        alert('인증번호가 올바르지 않습니다.');
                    }
                },
                error: function() {
                    alert('인증번호 확인에 실패했습니다.');
                }
            });
        });

        // '다음' 버튼 이벤트 핸들러
        $('#findPwNext-btn').click(function() {
        	 if (isAuthSuccess) {
        	        window.location.href = window.location.origin + "/pilafix/updatePassword.do"; // 인증 성공시 리다이렉트
        	    } else {
        	        alert('먼저 인증을 완료해야 합니다.');
        	    }
        	});
    });
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
</body>
</html>