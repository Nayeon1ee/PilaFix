//아이디비밀번호 입력
function validateLoginForm() {
    var email = document.getElementById('csEmailId').value;
    var password = document.getElementById('csPassword').value;
    if (!email || !password) {
        alert('아이디와 비밀번호를 모두 입력해주세요.');
        return false;
    }
    return true;
}

//로그인실패
function loginFailed() {
    alert('아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.');
}