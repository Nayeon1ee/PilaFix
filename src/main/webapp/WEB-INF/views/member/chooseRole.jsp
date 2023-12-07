<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<h1>멤버선택화면</h1>
<!-- 모달 창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">강사/회원 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 라디오 버튼 추가 -->
                <form id="roleForm">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="instructorRadio" value="TR">
                        <label class="form-check-label" for="instructorRadio">강사</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="memberRadio" value="ME">
                        <label class="form-check-label" for="memberRadio">회원</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <!-- 확인 버튼 클릭 시 서버로 전송 -->
                <button type="button" class="btn btn-primary" onclick="submitRoleForm()">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 모달 끝 -->

<script>
    $(document).ready(function () {
        // 페이지가 로드되면 모달을 자동으로 트리거
        $('#myModal').modal('show');
    });

    // 확인 버튼 클릭 시 서버로 데이터 전송
    function submitRoleForm() {
        var selectedRole = $('input[name="role"]:checked').val();
        console.log(selectedRole);
        // 서버로 전송
        $.ajax({
            type: 'POST',
            url: 'insertNaverMember.do', // 실제 서버 엔드포인트로 변경
            contentType: 'application/json',
            data: JSON.stringify({ role: selectedRole }),
            success: function (response) {
                console.log('Role data sent to server successfully:', response);
                window.location.href = response;
            },
            error: function (error) {
                console.error('Error sending role data to server:', error);
            }
        });

        // 모달 닫기
        $('#myModal').modal('hide');
    }
</script>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>
</html>