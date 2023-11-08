<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="member_signup/js/idCheck.js"></script>
<!--  <script type="text/javascript" src="member_signup/js/test.js"></script> -->

</head>
<body>
	
	<form action="insertMember.do" method="post" onsubmit="return validateForm()">
	
	<!-- 히든으로 앞에서 넘어온 csRoleCode값 저장함 -->
	  <input type="hidden" name="csRoleCode" value=<%=request.getParameter("csRoleCode") %>> 


	<p> 이메일 아이디 <input type="email" id="csEmailId" name="csEmailId"> <button id="idCheck" >중복확인</button></p>
	<div><span id="result_checkId" style="font-size:12px;"></span></div>
	<p> 인증번호 <input type="text" name="csEmailIdCheck"> <button id="" onclick="#">확인</button></p>
	
	
	<p> 비밀번호 <input type="password" name="csPassword" id="csPassword"></p>	
	<p> 비밀번호 확인<input type="password" name="passwordConfirm" id="passwordConfirm" onkeyup="passConfirm()"> <span id ="confirmMsg"></span></p>	
	
	
	<p> 이름 <input type="text" name="csName"></p>
	<p> 핸드폰 번호 <input type="text" name="csPhoneNumber1" size="3"><input type="text" name="csPhoneNumber2" size="4"><input type="text" name="csPhoneNumber3" size="4"> </p>
	
	<p> 생년월일 <input type="date" name="csBirth"></p>
	<p>성별 <input type="radio" name="csGenderMw" value="남">남자 
		<input type="radio" name="csGenderMw" value="여">여자</p>
	
	<p>이용약관</p>
	<p><input type="checkbox"  name="csAgreementYn1" id="csAgreementYn1" value="true">[필수] 만 14세 이상입니다. </p>
	<p><input type="checkbox"  name="csAgreementYn2" id="csAgreementYn2" value="true">[필수] 서비스 이용약관 동의 </p>
	<p><input type="checkbox"  name="csAgreementYn3" id="csAgreementYn3" value="true">[필수] 개인정보 수집 및 이용동의 </P>
	
	<p> <input type="submit" value="회원 가입"> </p>
	
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
<script type="text/javascript">
$(document).ready(function(){
	$("#idCheck").on("click",function(){
		//alert(" 버튼 클릭했습니다")
	let csEmailId = $("#csEmailId").val();
	$.ajax({
	type: "post", //전송방식
	url : "<%=request.getContextPath()%>/idCheck.do", //컨트롤러 사용시 내가 보낼 데이터 주소
	data : {"csEmailId" : csEmailId}, 
	dataType: "json",
	success : function(data){
		//alert("성공");
	if (data.value == 0){
	alert("사용할 수 있는 아이디");
	}else{
	alert("사용 할 수 없음");
	}
	},
	error : function(){
	alert("실패");
	}
	});
	});
	});
</script>
</body>
</html>