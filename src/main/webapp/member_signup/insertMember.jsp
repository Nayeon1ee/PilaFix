<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
</head>
<body>
	
	<form action="insertMember.do" method="post">
	
	<!-- 히든으로 앞에서 넘어온 csRoleCode값 저장함 -->
	  <input type="hidden" name="csRoleCode" value=<%=request.getParameter("csRoleCode") %>> 


	<p> 이메일 아이디 <input type="text" name="csEmailId"> <button id="csEmailIdCheck" onclick="">중복확인</button></p>
	<p> 인증번호 <input type="text" name="csEmailIdCheck"> <button id="" onclick="#">확인</button></p>
	
	
	<p> 비밀번호 <input type="text" name="csPassword"></p>	
	<p> 비밀번호 확인<input type="text" name="csPasswordCheck"></p>	
	
	<p> 이름 <input type="text" name="csName"></p>
	<p> 핸드폰 번호 <input type="text" name="csPhoneNumber1" size="3"><input type="text" name="csPhoneNumber2" size="4"><input type="text" name="csPhoneNumber3" size="4"> </p>
	
	<p> 생년월일 <input type="date" name="csBirth"></p>
	<p>성별 <input type="radio" name="csGenderMw" value=men>남자 
		<input type="radio" name="csGenderMw" value=woman>여자</p>
	
	<p>이용약관있어야함</p>
	<p> <input type="submit" value="회원 가입"> </p>
	
	</form>
	
</body>
</html>