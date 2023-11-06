<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
</head>
<body>

<form action="insertCenter.do" method="post">
	<p> 센터명 <input type="text" name="ctName"> </p>
	<p> 센터번호 
	<select class="tel" name="ctPhoneNumber1">
		<option value="02" selected="selected">02</option>
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
	<input type="text" name="ctPhoneNumber2" size="4"><input type="text" name="ctPhoneNumber3" size="4"> </p> 
	
	
	<p> 주소 넣어야 함</p>
	
	
	<p> 대표자명 <input type="text" name="ownerName"></p>
	
	<p> 사업자등록번호 <input type="text" name="businessRegistrationNumber" size="10"></p>
	
	<p> 대표자 핸드폰 번호 <input type="text" name="ownerPhoneNumber1" size="3"><input type="text" name="ownerPhoneNumber2" size="4"><input type="text" name="ownerPhoneNumber3" size="4"> </p>
	
	<p> 대표자 이메일 <input type="email" name="ownerEmail"> </p>
	<button onclick="#">중복확인</button>
	
	<p> 계약일자 <input type="date" name="contractStartDate"> </p>

	<p> 계약만료일자 <input type="date" name="contractEndDate"></p>
	
	<hr>
	
	<p> 센터 계정 아이디 <input type="text" name="ctId"> <button id="idck" onclick="#">중복확인</button></p>
	
	
	<p> 센터 계정 비밀번호 <input type="text" name="ctPassword"></p>	
	<button onclick="#">PIN 발급</button>
	
	<p> <input type="submit" value="등록"> </p>
</form>

<a href="getCenterList.do">센터 목록</a>

</body>
</html>