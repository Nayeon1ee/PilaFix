<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 등록</title>
</head>
<body>
	<h1>이용약관 등록</h1>

<form action="insertTerms.do" method="post">

	약관 제목 <input type="text" name="tmName">
	약관 내용 <input type="text" name="tmDetail">
	
	필수여부
	<input type="radio" name="tmRequiredYn" value=true>필수
	<input type="radio" name="tmRequiredYn" value=false>선택
	공개여부 
	<input type="radio" name="tmOpenYn" value=true>공개 
	<input type="radio" name="tmOpenYn" value=false>비공개
	<input type="submit" value="등록">
</form>
	
	<a href="getTermsList.do">글 목록</a>
</body>
</html>
