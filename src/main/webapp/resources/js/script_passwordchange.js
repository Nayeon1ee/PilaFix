function checkCurrentPasswordMatch() {
    var currentPasswordInput = document.getElementById('current-password');
    var passwordMatchMessage = document.getElementById('current-password-match-message');

    var currentPassword = currentPasswordInput.value;

    if (currentPassword === 'password1') { // 이 부분은 나중에 실제 비밀번호와 비교해야 합니다.
        passwordMatchMessage.textContent = "비밀번호가 일치합니다";
        passwordMatchMessage.style.color = "purple";
    } else {
        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다";
        passwordMatchMessage.style.color = "red";
    }
}

function checkNewPasswordMatch() {
    var newPasswordInput = document.getElementById('new-password');
    var confirmPasswordInput = document.getElementById('confirm-password');
    var passwordMatchMessage = document.getElementById('confirm-password-match-message');

    var newPassword = newPasswordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    if (newPassword === confirmPassword) {
        passwordMatchMessage.textContent = "비밀번호가 일치합니다";
        passwordMatchMessage.style.color = "purple";
    } else {
        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다";
        passwordMatchMessage.style.color = "red";
    }
}



function changePassword() {
    // 여기에 비밀번호 변경 로직을 작성하십시오.
    // 새 비밀번호와 확인 비밀번호가 일치하고, 현재 비밀번호가 올바르다면 비밀번호를 변경합니다.
    
    var currentPasswordInput = document.getElementById('current-password');
    var newPasswordInput = document.getElementById('new-password');
    var confirmPasswordInput = document.getElementById('confirm-password');
    
    var currentPassword = currentPasswordInput.value;
    var newPassword = newPasswordInput.value;
    var confirmPassword = confirmPasswordInput.value;
    
    // 현재 비밀번호 확인 (이 부분은 나중에 DB 연동)
    if (currentPassword !== 'password1') {
        alert('현재 비밀번호가 일치하지 않습니다.');
        return;
    }
    
    // 새 비밀번호와 확인 비밀번호가 일치하는지 확인
    if (newPassword !== confirmPassword) {
        alert('새 비밀번호와 확인 비밀번호가 일치하지 않습니다.');
        return;
    }
    
    // 여기에 실제 비밀번호 변경 로직을 작성
    alert('성공적으로 비밀번호를 변경하였습니다.');
}
