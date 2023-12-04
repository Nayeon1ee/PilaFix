<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="admin_header_common_1.jsp" %>
  <main id="main" class="main">

    <div class="pagetitle">
			<h1>센터 등록</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">

							<!-- 센터 정보 등록 시작 -->
							<div class="reg-form ">
								<div class="area1">
									<p>센터 정보 등록</p>
								</div>
								<form class="row g-3" name="admin_info" action="insertCenter.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
									
									<div class="col-md-6">
										<label for="inputAddress5" class="form-label">센터명</label>
										<div class="input-group">
											<input type="text" class="form-control" name="ctName" placeholder="센터명을 입력하세요" required>
										</div>
									</div>


									<div class="col-md-6">
										<label for="inputState" class="form-label">센터 번호</label>
										<div class="d-flex">
											<select id="inputState" class="form-select me-2" name="ctPhoneNumber1" >
												<option value="02" selected="selected" >02</option>
												<option value="070">070</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
											</select> 
											<input type="text" class="form-control me-2" id="inputPassword5" name="ctPhoneNumber2" required> <input type="text" class="form-control" id="inputPassword5" name="ctPhoneNumber3" required>
										</div>
									</div>
									
								
									<div class="col-md-6">
										<label for="inputEmail5" class="form-label">대표자명</label> 
										<input type="text" class="form-control" id="inputEmail5" name="ownerName" placeholder="대표자명을 입력하세요" required>
									</div>
									<div class="col-md-6">
										<label for="inputPassword5" class="form-label">사업자 등록번호</label> 
											<input type="text" class="form-control" id="inputPassword5" name="businessRegistrationNumber" placeholder="10자리를 입력하세요." required>
									</div>
									<div class="col-md-6">
										<label for="ownerEmail" class="form-label">대표자 이메일</label>
										<div class="input-group">
											<input type="email" class="form-control" id="ownerEmail" name="ownerEmail" placeholder="이메일을 입력하세요" required>
											<button type="button" class="btn btn-primary" id="ctEmailCheck">중복확인</button>
										</div>
										<div id="ctEmailCheckMessage"></div>
									</div>


									<div class="col-md-6">
										<label for="inputState" class="form-label">대표자 연락처</label>
										<div class="d-flex">
											
											 <input type="text" class="form-control me-2" id="inputPassword5" name="ownerPhoneNumber1" required><input type="text" class="form-control me-2" id="inputPassword5" name="ownerPhoneNumber2" required> <input type="text" class="form-control" id="inputPassword5" name="ownerPhoneNumber3" required>
										</div>
									</div>

									<div class="col-md-3">
									    <label for="inputAddress5" class="form-label">센터주소</label>
									    <div class="input-group">
									        <input type="text" class="form-control" placeholder="우편번호" id="ctAddress1" name="ctAddress1" style="pointer-events: none;" data-readonly required>
									        <button type="button" class="btn btn-outline-primary" onclick="address()">주소 찾기</button>
									    </div>
									</div>
									<div class="col-md-3 address">
									    <label for="inputEmail5" class="form-label">도로명</label> 
									    <input type="text" class="form-control" id="ctAddress2" placeholder="도로명주소" name="ctAddress2" style="pointer-events: none;" data-readonly required>
									</div>

									<div class=" col-md-6 date-filter">
										<label for="inputState" class="form-label">계약기간</label>
										<div class="col-sm-12">
											<input type="date" class="form-control-date2" id="startDate" name="contractStartDate" required>
											<span>~</span> <input type="date" class="form-control-date2" id="endDate" name="contractEndDate" required>
										</div>
									</div>
									<div class="col-md-6">
										<label for="inputEmail5" class="form-label"></label> 
										<input type="text" class="form-control" id="inputEmail5" placeholder="상세주소를 입력하세요" name="ctAddress3" required>
									</div>
									<div class="col-md-6">
										<label for="inputEmail5" class="form-label">사업자등록증 업로드</label>
										<input type="file" class="form-control" name="multipart" required>
										<!-- 기능 구현 후 주석 해제 
										<input class="form-control" type="file" id="formFile" name="businessRegistrationFile"> -->
									</div>
									<!-- 센터 정보 등록 끝 -->
									
									<!-- 계정 등록 시작 -->
									<div class="area2">
										<p>계정 등록</p>
									</div>

									<div class="col-md-12">
										<label for="inputAddress5" class="form-label">아이디</label>
										<div class="input-group">
											<input type="text" class="form-control" id="ctId" name="ctId" placeholder="아이디를 입력하세요" required>
											<button type="button" class="btn btn-primary" id="ctIdCheck">중복확인</button>
										</div>
										<div id="ctIdCheckMessage"></div>
									</div>
									<div class="col-md-12">
										<label for="inputAddress5" class="form-label">비밀번호</label>
										<div class="input-group">
											<input type="text" class="form-control" id="ctPassword" name="ctPassword" style="pointer-events: none;" data-readonly placeholder="우측 버튼을 클릭하여 임시 비밀번호를 발급 받으세요" required>
											<button type="button" class="btn btn-primary" id="ctPasswordBt" onclick="generatePIN()">PIN 발급</button>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary" id="uploadFile">등록</button>
										<button type="button" class="btn btn-primary" onclick="location.href='getCenterList.do'">취소</button>
									</div>
								</form>
								<!-- 계정 등록 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


  </main><!-- End #main -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.809.0.min.js"></script>
<script type="text/javascript">
<!-- 비밀번호 PIN 발급 -->
function generatePIN() {
	  var pin = Math.floor(10000 + Math.random() * 90000);
	  document.getElementById("ctPassword").value = pin;
	  
	  if (String(newPIN).length !== 6) {
	        alert('우측 버튼을 클릭하여 암호를 발급받으세요!');
	        return;
	    }
}

<!-- 아이디 중복확인 -->
$(function(){
    $("#ctIdCheck").click(function(){
    	let idFormat = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
        let ctId = $("#ctId").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "ctIdCheck.do", 
            data: {"ctId": ctId}, 
            success: function(data){ 
                let messageDiv = $("#ctIdCheckMessage");
                if(idFormat.test(ctId)){ 
                    // 사용 가능한 아이디인 경우 메시지 표시
                    messageDiv.html("사용 가능한 아이디입니다.");
                    messageDiv.css("color", "green");
                    $("#uploadFile").prop("disabled", false);
                } else if(!idFormat.test(ctId) || idFormat.test(ctId) == 0) {
	               	 messageDiv.html("옳바르지 않은 아이디 형식입니다. 다시 입력해주세요.");
	                 messageDiv.css("color", "red");
          		} else { 
                    // 중복된 아이디인 경우 메시지 표시
                    messageDiv.html("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
                    messageDiv.css("color", "red");
                }
            },
            error: function(error){ alert(error); }
        });
    });
});

<!-- 이메일 중복확인 -->
$(function(){
    $("#ctEmailCheck").click(function(){
    	let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        let ownerEmail = $("#ownerEmail").val();  //아이디
        $.ajax({
            type: 'post', 
            url: "ctEmailCheck.do", 
            data: {"ownerEmail": ownerEmail}, 
            success: function(data){ 
                let messageDiv = $("#ctEmailCheckMessage");
                if(emailFormat.test(ownerEmail)){ 
                    // 사용 가능한 아이디인 경우 메시지 표시
                    messageDiv.html("사용 가능한 이메일입니다.");
                    messageDiv.css("color", "green"); 
                } else if(!emailFormat.test(ownerEmail) || emailFormat.test(ownerEmail) == 0) {
                	 messageDiv.html("옳바르지 않은 이메일 형식입니다. 다시 입력해주세요.");
                     messageDiv.css("color", "red");
                } else { 
                    // 중복된 아이디인 경우 메시지 표시
                    messageDiv.html("중복된 이메일입니다. 다른 이메일을 입력해주세요.");
                    messageDiv.css("color", "red");
                }
            },
            error: function(error){ alert(error); }
        });
    });
});

<!-- 주소 -->
function address() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('ctAddress1').value = data.zonecode;
            document.getElementById("ctAddress2").value = roadAddr;
        }
    }).open();
    
    if (data && data.zonecode && data.zonecode.length === 6) {
        alert('주소를 입력하세요');
        return;
    }
}

//입력하지 않은 값이 있다면 해당 태그로 focus
function validateForm() {
    var ctName = document.getElementById('ctName').value.trim();
    var ctPhoneNumber1 = document.getElementById('ctPhoneNumber1');
    var ctPhoneNumber2 = document.getElementById('ctPhoneNumber2').value.trim();
    var ctPhoneNumber3 = document.getElementById('ctPhoneNumber3').value.trim();
    var ownerName = document.getElementById('ownerName').value.trim();
    var businessRegistrationNumber = document.getElementsByName('businessRegistrationNumber')[0].value.trim();
    var ownerEmail = document.getElementsByName('ownerEmail')[0].value.trim();
    var ownerPhoneNumber1 = document.getElementsByName('ownerPhoneNumber1')[0].value.trim();
    var ownerPhoneNumber2 = document.getElementsByName('ownerPhoneNumber2')[0].value.trim();
    var ownerPhoneNumber3 = document.getElementsByName('ownerPhoneNumber3')[0].value.trim();
    var ctAddress1 = document.getElementsByName('ctAddress1');
    var ctAddress2 = document.getElementById('ctAddress2').value.trim();
    var ctAddress3 = document.getElementById('ctAddress3').value.trim();
    var startDate = document.getElementById('startDate').value;
    var endDate = document.getElementById('endDate').value;
    var multipart = document.getElementsByName('multipart');
    var ctId = document.getElementById('ctId').value.trim();
    var ctPassword = document.getElementsById('ctPassword');

    if (ctName === '') {
        document.getElementById('ctName').focus();
        return false;
    }

    if (ctPhoneNumber1 === '' || ctPhoneNumber2 === '' || ctPhoneNumber3 === '') {
        document.getElementById('ctPhoneNumber1').focus();
        return false;
    }

    if (ownerName === '') {
        document.getElementById('ownerName').focus();
        return false;
    }

    if (businessRegistrationNumber === '') {
        document.getElementsByName('businessRegistrationNumber')[0].focus();
        return false;
    }

    if (ownerEmail === '') {
        document.getElementsByName('ownerEmail')[0].focus();
        return false;
    }

    if (ownerPhoneNumber1 === '' || ownerPhoneNumber2 === '' || ownerPhoneNumber3 === '') {
        document.getElementsByName('ownerPhoneNumber1');
        return false;
    }

    if (ctAddress1 === ' ') {
        document.getElementsByName('ctAddress1')[0].focus();
        alter('주소를 입력하세요!');
        return false;
    }

    if (ctAddress2 === ' ') {
        document.getElementById('ctAddress2').focus();
        alter('주소를 입력하세요!');
        return false;
    }

    if (ctAddress3 === '') {
        document.getElementById('ctAddress3').focus();
        return false;
    }
    
    if (startDate === '') {
        document.getElementById('startDate').focus();
        return false;
    }
    
    if (endDate === '') {
        document.getElementById('endDate').focus();
        return false;
    }

    if (multipart === '') {
        document.getElementsByName('multipart')[0].focus();
        return false;
    }

    if (ctId === '') {
        document.getElementById('ctId').focus();
        return false;
    }
    
    if (validateForm.idDuplication.value!="ctEmailCheck") {
    	alter('중복 확인을 체크하세요');
    	return false;
    }

    return true; 
}

</script>


<%@ include file="admin_footer_common.jsp" %>