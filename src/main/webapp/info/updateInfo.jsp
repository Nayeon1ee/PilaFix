<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<h1>수정 페이지</h1>
<form action="updateInfo.do" method="post">
	<input type="hidden" name="seq" value="${info.seq }">
	공지사항 제목 <input type="text" name="title" value="${info.title }">
	공지사항 내용 <input type="text" name="content" value="${info.content }">
	공개여부 
		<input type="radio" name="openYN" value=true>공개 
		<input type="radio" name="openYN" value=false>비공개
	<input type="submit" value="수정">
</form>
<a href="getInfoList.do">공지사항 목록</a>
</body>
</html>