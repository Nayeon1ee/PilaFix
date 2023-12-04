<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services - PILAFIX Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/member/assets/css/style.css"
	rel="stylesheet">

<!-- 내가 추가한 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<!-- 내 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style_registration.css" />


<body>


	<!-- ======= Header ======= -->
	<%@ include file="member_header_common.jsp"%>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" style="max-width:700px">

				<ol>
					<li><a href="main.do">Home</a></li>
					<li>register</li>
				</ol>
				<h2>회원가입</h2>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container mx-auto" style="max-width: 700px;">
				<div class="mb-3 row" style="margin-top: 10%;">
					<label for="staticEmail" class="col-sm-2 col-form-label"
						style="margin-left: 1%; border-left: 2px solid; border-color: #9B67FF;">회원가입</label>
				</div>
				<form class="row g-3" action="insertMember.do" method="post" onsubmit="return validateForm()">
				
				 <!-- 히든으로 앞에서 넘어온 csRoleCode값 저장함 -->
     			<input type="hidden" id="csRoleCode" name="csRoleCode" value="${csRoleCode}">
				
					<div class="col-auto" style="width: 100px;">

						<input type="email" readonly class="form-control-plaintext"
							id="staticEmail2" value="이메일 아이디"
							style="width: 130%; padding: revert-layer;">
					</div>

					<div class="col-auto" style="width: 21%;">
						<label for="inputPassword2" class="visually-hidden">Password</label>
						<input type="email" class="form-control" id="csEmailId" name="csEmailId" placeholder="이메일 입력"
							style="width: 220%; margin-left: 28%; border: 0px;">
					</div>
					<div class="col-auto">
						<button type="button" id="idCheck" class="btn btn-primary mb-3"
							style="width: 90px; margin-left: 230px; font-size: 14px;">중복 확인</button>
					</div>

					<div class="col-auto">
						<button type="button" id="sendEmailButton" class="btn btn-primary mb-3"
							style="width: 90px; font-size: 14px;">인증 요청</button>
					</div>
					<!--  영역 -->
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">인증요청</label>
						<input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6"
							style="float: left; width: 80%; border: 0px; padding-top: 0px; pointer-events: none;" data-readonly required>
							
					</div>
					<span id="mail-check-warn"></span>
					<!-- 영역 -->
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">비밀번호</label>
						<input type="password" class="form-control" name="csPassword" id="csPassword" placeholder="영문, 숫자 포함 8글자 이상 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<div class="col-12" style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">비밀번호 확인</label>
						<input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" onkeyup="passConfirm()" placeholder="영문, 숫자 포함 8글자 이상 입력"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<span id ="confirmMsg"></span>
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label" 
							style="float: left; width: 20%;">이름</label>
						<input type="text" class="form-control" name="csName" placeholder="이름을 입력해주세요"
							style="float: left; width: 80%; border: 0px; padding-top: 0px;">
					</div>
					<div class="col-12"
						style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
						<label for="inputAddress" class="form-label"
							style="float: left; width: 20%;">휴대전화 번호</label>
						<input type="text" class="form-control" name="csPhoneNumber1" placeholder="3자리"
							style="float: left; width: 25%; border: 0px; padding-top: 0px;">
						<input type="text" class="form-control" name="csPhoneNumber2" placeholder="4자리"
							style="float: left; width: 25%; border: 0px; padding-top: 0px;">
						<input type="text" class="form-control" name="csPhoneNumber3" placeholder="4자리"
							style="float: left; width: 25%; border: 0px; padding-top: 0px;">
					</div>
					
						<div class="col-12" style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
							<label for="inputAddress" class="form-label"
								style="float: left; width: 20%;">생년월일</label>
							<input type="date" class="form-control" name="csBirth"
								style="float: left; width: 30%; border: 0px; padding-top: 0px;">
						</div>

						<div class="col-12"
							style="border-top: 1px solid; margin-top: 0px; padding-top: 20px;">
							<label for="inputAddress" class="form-label" style="float: left; width: 21%;">성별</label>
							<input class="form-check-input" type="radio" name="csGenderMw" value="남자">
							<label class="form-check-label" for="flexRadioDefault1">남자</label>
							
							<input class="form-check-input" type="radio" name="csGenderMw" value="여자" >
							<label class="form-check-labe2" for="flexRadioDefault2">여자</label>
						</div>
					
					<div class="form-check">
					    <input class="form-check-input overall-agreement" type="checkbox" value="" id="flexCheckDefault">
					    <label class="form-check-label" for="flexCheckDefault">전체 동의합니다.</label>
					</div>
					<c:forEach var="termsList" items="${termsList}" varStatus="num">
					    <div class="form-check">
					        <input class="form-check-input individual-agreement" type="checkbox" name="csAgreementYn${num.count}" id="csAgreementYn${num.count}" value="true">
					        <label class="form-check-label" for="csAgreementYn${num.count}">
					            <c:choose>
					                <c:when test="${termsList.tmRequiredYn eq true}">
					                    [필수]
					                </c:when>
					                <c:otherwise>
					                    [선택]
					                </c:otherwise>
					            </c:choose>
					            ${termsList.tmName}
					        </label>
					        <textarea class="form-control" rows="4">${termsList.tmDetail}</textarea>
					    </div>
					</c:forEach>
					<div class="col-12">
					    <button type="submit" class="btn btn-primary" value="회원 가입" style="width: 100%; margin-top: 3%;">회원가입</button>
					</div>
				</form>
				<!-- End Our Skills Section -->
			</div>
		</section>
	</main>

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="member_footer_common.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- 내 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap_common.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath}/resources/member/assets/js/main.js"></script>

<!-- 아이디 중복확인 alert -->
<script type="text/javascript">
$(function(){
    $("#idCheck").click(function(){
    
        let csEmailId = $("#csEmailId").val();
        
     	// 이메일 형식을 확인하기 위한 정규식
        let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
     	
    	// 입력된 값이 이메일 형식과 일치하는지 확인합니다.
        if (!emailFormat.test(csEmailId)) {
            alert("올바른 이메일 형식으로 입력해주세요.");
            return; // 형식이 맞지 않으면 중복 확인 요청을 보내지 않음
        }
         
        $.ajax({
            type:'post', //post 형식으로 controller 에 보내기위함!!
            url:"idCheck.do", // 컨트롤러로 가는 mapping 입력
            data: {"csEmailId":csEmailId}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                if(data == "N"){ // 만약 성공할시
                    alert("사용 가능한 아이디 입니다.");
                 
             }else{ // 만약 실패할시
            	 alert("중복된 아이디 입니다. 아이디를 다시 입력해주세요")
             }
                 
         },
            error : function(error){alert(error);}
        });
        
    });
    
});

</script>

<!-- 이메일 인증요청 버튼 클릭시 /mailCheck.do에 맵핑된 컨트롤러 실행 -->
<script>
	var authNumber; //인증번호

	$(document).ready(function() {
		$("#sendEmailButton").on("click", function() {
			//alert(" 버튼 클릭했습니다")
			const csEmailId = $('#csEmailId').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + csEmailId); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

			$.ajax({
				type : "GET",
				url : "mailCheck.do?csEmailId=" + csEmailId,
				success : function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false);
					alert('인증번호가 전송되었습니다.')
					
					// 컨트롤러에서 생성한 난수 data에 담겨옴 그래서 변수에 넣어줌
					authNumber = data;
					console.log("받은 데이터 변수에 저장 : " + authNumber);
					
					// 60초 지나면 인증번호 초기화 시킴
					setTimeout(function() {
						authNumber = null;
						console.log("authNumber가 초기화되었습니다.");
					}, 60000); // 60초(1분) 설정
				}
			});
		});
	});
	
	//인증번호 비교
	$('.mail-check-input').blur(function() {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');

		if (inputCode === authNumber) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
			$('#mail-Check-Btn').attr('disabled', true);
			$('#csEmailId').attr('readonly', true);

		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color', 'red');
		}
	}); //인증번호 비교

/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
function passConfirm() {
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 csPassword 변수 넣기 */
		var csPassword = document.getElementById('csPassword');					//비밀번호 
		var passwordConfirm = document.getElementById('passwordConfirm');	//비밀번호 확인 값
		var confirmMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(csPassword.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* insertMember.jsp의 confirmMsg라는 아이디를 가진 영역에 들어감,innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}

// 입력하지 않은 값이 있다면 해당 태그로 focus
function validateForm() {
    var csEmailId = document.getElementById('csEmailId').value;
    var csPassword = document.getElementById('csPassword').value;
    var passwordConfirm = document.getElementById('passwordConfirm').value;
    var csName = document.getElementsByName('csName')[0].value;
    var csPhoneNumber1 = document.getElementsByName('csPhoneNumber1')[0].value;
    var csPhoneNumber2 = document.getElementsByName('csPhoneNumber2')[0].value;
    var csPhoneNumber3 = document.getElementsByName('csPhoneNumber3')[0].value;
    var csBirth = document.getElementsByName('csBirth')[0].value;
    var csGenderOptions = document.getElementsByName('csGenderMw');
    var genderSelected = false;
    var overallAgreement = document.getElementById('flexCheckDefault');
    var agreementCheckboxes = document.querySelectorAll('[id^="csAgreementYn"]');
    
    for (var i = 0; i < csGenderOptions.length; i++) {
        if (csGenderOptions[i].checked) {
            genderSelected = true;
            break;
        }
    }
    
	// 전체 동의 체크박스가 체크되었는지 확인
    if (!overallAgreement.checked) {
        overallAgreement.focus();
        return false;
    }
    
	// 각 동의 항목 체크박스들의 체크 상태 확인
    var atLeastOneUnchecked = false;
    for (var i = 0; i < agreementCheckboxes.length; i++) {
        if (!agreementCheckboxes[i].checked) {
            atLeastOneUnchecked = true;
            break;
        }
    }

    if (csEmailId === '') {
        document.getElementById('csEmailId').focus();
        return false;
    }
    
    if (csPassword === '') {
        document.getElementById('csPassword').focus();
        return false;
    }
    
    if (passwordConfirm === '') {
        document.getElementById('passwordConfirm').focus();
        return false;
    }

    if (csName === '') {
        document.getElementsByName('csName')[0].focus();
        return false;
    }

    if (csPhoneNumber1 === '' || csPhoneNumber2 === '' || csPhoneNumber3 === '') {
        document.getElementsByName('csPhoneNumber1')[0].focus();
        return false;
    }

    if (csBirth === '') {
        document.getElementsByName('csBirth')[0].focus();
        return false;
    }
    
    if (!genderSelected) {
        csGenderOptions[0].focus();
        return false;
    }
    
    if (atLeastOneUnchecked) {
        agreementCheckboxes[0].focus();
        return false;
    }
    
    return true;
}

// 모두 동의 체크시 모든 체크박스 체크
document.addEventListener('DOMContentLoaded', function() {
    var overallAgreement = document.querySelector('.overall-agreement');
    var individualAgreements = document.querySelectorAll('.individual-agreement');

    overallAgreement.addEventListener('change', function() {
        individualAgreements.forEach(function(checkbox) {
            checkbox.checked = overallAgreement.checked;
        });
    });
});

</script>


</body>

</html>