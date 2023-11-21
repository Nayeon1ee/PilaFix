<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header_common.jsp" %>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>관리자 등록화면</h1>
			<nav>
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item">필요 시 작성</li> -->
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
							<p>
							<!-- <a class="password_Change" href="checkCurrentPasswordAD.do">비밀번호변경▶</a>  -->
							<a href="#" class="password_Change" onclick="showCurrentPasswordModal()">비밀번호변경▶</a>							
							</p>
							
							
							
							
		<!-- 첫 번째 모달: 현재 비밀번호 확인 -->
<div class="modal fade" id="currentPasswordModal" tabindex="-1" role="dialog" aria-labelledby="currentPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="currentPasswordModalLabel">현재 비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

			         <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="현재 비밀번호">
			         <button type="submit" class="btn btn-primary" onclick="sendCurrentPassword()">다음</button>

		    </div>
        </div>
    </div>
</div>

<!-- 두 번째 모달: 새 비밀번호 설정 -->
<div class="modal fade" id="newPasswordModal" tabindex="-1" role="dialog" aria-labelledby="newPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newPasswordModalLabel">새 비밀번호 설정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
		        
		            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="새 비밀번호">
		            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="새 비밀번호 확인">
		            <button type="submit" class="btn btn-success" onclick="updatePassword()">변경</button>

		    </div>
        </div>
    </div>
</div>



<script>
function showCurrentPasswordModal() {
    $('#currentPasswordModal').modal('show');
}

function sendCurrentPassword() {
    var currentPassword = $('#currentPassword').val();
    // AJAX 요청을 통해 현재 비밀번호 확인
    $.ajax({
        url: 'checkPasswordAD.do',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ currentPassword: currentPassword }),
        success: function(response) {
            // 비밀번호가 일치하면 다음 모달을 표시
            $('#currentPasswordModal').modal('hide');
            $('#newPasswordModal').modal('show');
        },
        error: function(xhr, status, error) {
            // 오류 메시지 표시
            alert("현재 비밀번호가 일치하지 않습니다.");
        }
    });
}

function updatePassword() {
    // 새 비밀번호를 서버에 전송하여 업데이트
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();

    if (newPassword !== confirmPassword) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

    // AJAX 요청을 통해 비밀번호 변경
    $.ajax({
        url: 'updatePasswordAD.do',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ newPassword: newPassword }),
        success: function(response) {
            // 비밀번호 변경 성공 메시지 표시
            alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
            $('#newPasswordModal').modal('hide');
            window.location.href = 'adminLogin.do'; 
        },
        error: function(xhr, status, error) {
            // 오류 메시지 표시
            alert("비밀번호 변경에 실패했습니다.");
        }
    });
}
</script>					
		
		</section>

	</main>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- End #main -->
<%@ include file="admin_footer_common.jsp" %>
	