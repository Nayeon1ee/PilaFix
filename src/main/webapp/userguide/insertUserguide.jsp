<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
</head>
<body>

<form action="insertUserguide.do" method="post">
	유형 
	<input type="radio" name="ugType" value="예약">예약
	 <input type="radio" name="ugType" value="수강권">수강권
	이용정책 제목 <input type="text" name="ugName">
	이용정책 내용 <input type="text" name="ugContent">
	공개여부 
	<input type="radio" name="ugOpenYN" value=true>공개 
	<input type="radio" name="ugOpenYN" value=false>비공개
	<input type="submit" value="가입">
</form>

<a href="getUserguideList.do">글 목록</a>

</body>
</html>