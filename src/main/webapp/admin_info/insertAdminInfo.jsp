<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
</head>
<body>

<form action="insertAdminInfo.do" method="post">
	공지사항 제목 <input type="text" name="title">
	공지사항 내용 <input type="text" name="content">
	공개여부 
	<input type="radio" name="openYN" value=true>공개 
	<input type="radio" name="openYN" value=false>비공개
	<input type="submit" value="가입">
</form>

<a href="getInfoAdminList.do">글 목록</a>

</body>
</html>