<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="member_signup/js/idCheck.js"></script>


</head>
<body>
   
   <form action="insertMember.do" method="post" onsubmit="return validateForm()">
   
   <!-- 히든으로 앞에서 넘어온 csRoleCode값 저장함 -->
     <input type="hidden" name="csRoleCode" value=<%=request.getParameter("csRoleCode") %>> 



	<p> 이메일 아이디 <input type="email" id="csEmailId" name="csEmailId"> <button type="button" id="idCheck">중복확인</button></p>
	<div><span id="result_checkId" style="font-size:12px;"></span></div>

	<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="sendEmailButton">인증요청</button>
</div>
	<div class="mail-check-box">
<input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6"><button type="button" id="" >확인</button>
</div>
	<span id="mail-check-warn"></span>
	
	<p> 비밀번호 <input type="password" name="csPassword" id="csPassword"></p>	
	<p> 비밀번호 확인<input type="password" name="passwordConfirm" id="passwordConfirm" onkeyup="passConfirm()"> <span id ="confirmMsg"></span></p>	
	
	
	<p> 이름 <input type="text" name="csName"></p>
	<p> 핸드폰 번호 <input type="text" name="csPhoneNumber1" size="3"><input type="text" name="csPhoneNumber2" size="4"><input type="text" name="csPhoneNumber3" size="4"> </p>
	
	<p> 생년월일 <input type="date" name="csBirth"></p>
	<p>성별 <input type="radio" name="csGenderMw" value="남자">남자 
		<input type="radio" name="csGenderMw" value="여자">여자</p>
	
	<p>이용약관</p>
	<c:forEach var="termsList" items="${termsList}" varStatus="num">
		<p><input type="checkbox"  name="csAgreementYn${num.count}" id="csAgreementYn${num.count}" value="true">
		<c:choose>
		<c:when test="${termsList.tmRequiredYn eq true }">
		[필수]
		</c:when>
		<c:otherwise>
		[선택]
		</c:otherwise>
		</c:choose>
		${termsList.tmName }</p>
		<textarea>${termsList.tmDetail }</textarea>
	</c:forEach>
	<p> <input type="submit" onclick="moveToLogin()" value="회원 가입"> </p>
	
	</form>
	<!--  

<script type="text/javascript">
function validateForm() {
    var csAgreementYn1 = document.getElementById("csAgreementYn1");
    var csAgreementYn2 = document.getElementById("csAgreementYn2");
    var csAgreementYn3 = document.getElementById("csAgreementYn3");

    if (!csAgreementYn1.checked || !csAgreementYn2.checked || !csAgreementYn3.checked) {
        alert("모든 필수 항목에 동의해야 합니다.");
        return false; // 폼 제출을 중단
    }
}
</script>
-->

<!-- 아이디 중복확인 alert -->
<script type="text/javascript">
$(function(){
    $("#idCheck").click(function(){
    
        let csEmailId = $("#csEmailId").val();
         
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

 <!-- 아이디 중복확인 글자로 알려줌
<script type="text/javascript">
$(function(){
    $("#idCheck").click(function(){
    
        let csEmailId = $("#csEmailId").val();
         
        $.ajax({
            type:'post', //post 형식으로 controller 에 보내기위함!!
            url:"idCheck.do", // 컨트롤러로 가는 mapping 입력
            data: {"csEmailId":csEmailId}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                if(data == "N"){ // 만약 성공할시
                    result = "사용 가능한 아이디입니다.";
                    $("#result_checkId").html(result).css("color", "green");
                    $("#csPassword").trigger("focus");
                 
             }else{ // 만약 실패할시
                 result="이미 사용중인 아이디입니다.";
                     $("#result_checkId").html(result).css("color","red");
                     $("#member_id").val("").trigger("focus");
             }
                 
         },
            error : function(error){alert(error);}
        });
        
    });
    
});

</script>
-->

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
</script>
<script>
function moveToLogin(){
	alert ("회원가입이 완료되었습니다. 로그인페이지로 이동합니다.")
}
</script>

</body>
</html>