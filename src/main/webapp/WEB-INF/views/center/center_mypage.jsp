<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="center_header_common.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_center_bt_common.css">
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>센터정보관리</h1>
			<nav>
				<ol class="breadcrumb">
<!-- 					<li class="breadcrumb-item">필요 시 작성</li> -->
					<!-- 기존에는 현재 위치 표시였음 Depth1>Depth2>Depth3 표시 -->
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${centerInfo.ctName}</h5>
<label for="inputAddress5" class="form-label">현재 페이지에서 센터의 상세 정보를 확인하고 비밀번호를 변경할 수 있습니다.</label>
<br>
							<p style="magin-top: 1%;"></p>
							<!--  
							<div class="row mb-300" style="width: 122%; margin-top: 1%;">
								<div class="col-sm-10">
									<input type="text" class="form-control" value="센터등록" disabled>
								</div>
							</div>
							-->

							<form name="admin_info">


								<div class="col-120">
								<label for="inputAddress5" class="form-label">센터아이디</label>
									<input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctId }" 
										 style="width: 93%;" disabled>
									<div class="row mb-3"></div>
								</div>
<%-- 								<div class="col-120">
								<label for="inputAddress5" class="form-label">대표자 이메일</label>
									<input type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerEmail }" 
										 style="width: 93%;" disabled>
									<div class="row mb-3"></div>
								</div> --%>


								<div class="col-40">
									<label for="inputAddress5" class="form-label">대표자 이름</label> 
									<input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerName }" 
										placeholder="1234 Main St" disabled>
								</div>
								<div class="col-40" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">사업자 등록번호</label>
									<input type="text" class="form-control" id="inputAddress2" value="${centerInfo.businessRegistrationNumber }"
										placeholder="Apartment, studio, or floor" disabled>
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label my-2">대표자 이메일</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ownerEmail }"
										placeholder="이메일을 입력하세요" disabled>
									<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
								</div>
								<div class="col-40">
									<label for="inputAddress5" class="form-label my-2">대표자 번호</label>
									<div class="col-400 mt-1" style="display: flex;" >
										<select class="project_title me-2" name="type" id="project_title" disabled="disabled">
											<option selected >${centerInfo.ownerPhoneNumber1 }</option>
											<option value="010">010</option>
											<option value="011">011</option>
										</select> <input type="text" class="form-control me-2" id="inputAddres5s" value="${centerInfo.ownerPhoneNumber2 }"
											disabled> <input type="text" class="form-control" value="${centerInfo.ownerPhoneNumber3 }"
											id="inputAddres5s" disabled>
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>
								<div class="col-30" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">센터명</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctName }"
										placeholder="센터명" disabled>
								</div>
								<div class="col-40" >
									<label for="inputAddress5" class="form-label mt-2">센터 번호</label>
									<div class="col-400 mt-1" style="display: flex;" >
										<select disabled >
											<option selected >${centerInfo.ctPhoneNumber1 }</option>
											<option>010</option>
											<option>011</option>
										</select> <input type="text" class="form-control ms-2 me-2" id="inputAddres5s" value="${centerInfo.ctPhoneNumber2 }"
											disabled> <input type="text" class="form-control" value="${centerInfo.ctPhoneNumber3 }"
											id="inputAddres5s" disabled>
										<!-- <div class="col-sm-10">
										<button type="submit" class="btn btn-primary">중복확인</button>
									</div> -->
									</div>
								</div>

								<div class="col-6">
									<label for="inputAddress5" class="form-label mt-2">센터주소</label>
								</div>
								<div class="col-120">
									<input type="text" class="form-control" id="inputAddres5s"
										placeholder="우편번호" style="width: 42%;" disabled value="${centerInfo.ctAddress1 }">

									<div class="row mb-3"></div>
								</div>
								<div class="col-12">
									<label for="inputAddress5" class="form-label">상세주소 1</label> <input
										type="text" class="form-control" id="inputAddres5s" value="${centerInfo.ctAddress2 }"
										placeholder="1234 Main St" disabled>
								</div>
								<div class="col-12" style="margin-top: 1%;">
									<label for="inputAddress2" class="form-label">상세주소 2</label> <input
										type="text" class="form-control" id="inputAddress2" value="${centerInfo.ctAddress3 }"
										placeholder="Apartment, studio, or floor" disabled>
								</div>


							</form>
							<!-- End General Form Elements -->
<br>
<!-- 							<h5 class="card-title">비밀번호 변경</h5> -->


<section class="section">
    <p>
        <!-- 비밀번호 변경을 링크로 변경 -->
        <a href="#" class="password_Change" onclick="showCurrentPasswordModal()">비밀번호변경▶</a>
    </p>

    <!-- 첫 번째 모달: 현재 비밀번호 확인 -->
		<div class="modal fade" id="currentPasswordModal" tabindex="-1">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		           		<h5 class="modal-title" id="currentPasswordModalLabel">현재 비밀번호 확인</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body"> 
						<input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="현재 비밀번호">
					</div>
		            <div class="modal-footer">
		            	<button type="submit" class="btn btn-primary" onclick="sendCurrentPassword()">다음</button>
		            </div>
		        </div>
		    </div>
		</div>

		<!-- 두 번째 모달: 새 비밀번호 설정 -->
		<div class="modal fade" id="newPasswordModal" tabindex="-1">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header">
						<h5 class="modal-title" id="newPasswordModalLabel">새 비밀번호 설정</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body"> 
		            	<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="새 비밀번호"> 
		            	<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="새 비밀번호 확인">
					</div>
		            <div class="modal-footer">
		            	<button type="submit" class="btn btn-success" onclick="updatePassword()">변경</button>

		            </div>
		        </div>
		    </div>
		</div>

    <script>
        function showCurrentPasswordModal() {
            $('#currentPasswordModal').modal('show');
        }

        function showNewPasswordModal() {
            $('#newPasswordModal').modal('show');
        }

        function sendCurrentPassword() {
            var currentPassword = $('#currentPassword').val();
            // AJAX 요청을 통해 현재 비밀번호 확인
            $.ajax({
                url: 'checkPasswordCT.do',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ currentPassword: currentPassword }),
                success: function(response) {
                    // 비밀번호가 일치하면 다음 모달을 표시
                    $('#currentPasswordModal').modal('hide');
                    showNewPasswordModal(); // 두 번째 모달 표시 함수 호출
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
                url: 'updatePasswordCT.do',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ newPassword: newPassword }),
                success: function(response) {
                    // 비밀번호 변경 성공 메시지 표시
                    alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
                    $('#newPasswordModal').modal('hide');
                    window.location.href = 'centerLogin.do'; 
                },
                error: function(xhr, status, error) {
                    // 오류 메시지 표시
                    alert("비밀번호 변경에 실패했습니다.");
                }
            });
        }
    </script>
</section>							
							


						</div>







					</div>
				</div>
		</section>

	</main>
	<script type="text/javascript">
	var select_project_title=project_title.options[project_title.selectedIndex].value;
	</script>
	<!-- End #main -->

<%@ include file="center_footer_common.jsp" %>
	