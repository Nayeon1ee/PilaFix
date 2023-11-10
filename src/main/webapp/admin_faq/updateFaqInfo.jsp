<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
</head>
<body>
<h1>수정 페이지</h1>
<form action="updateFaqInfo.do" method="post">
	<input type="hidden" name="fq_number" value="${list.fq_number}">
	
	FAQ 제목 <input type="text" name="fq_title" value="${list.fq_title}">
	FAQ 내용 <input type="text" name="fq_content" value="${list.fq_content}">
	공개여부 
		<input type="radio" name="fq_open_yn" value=true>공개 
		<input type="radio" name="fq_open_yn" value=false>비공개
	<input type="submit" value="수정">
</form>
<a href="getFaqInfoList.do">FAQ 목록</a>
</body>
</html>