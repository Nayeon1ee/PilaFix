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
	<input type="hidden" name="fqNumber" value="${list.fqNumber}">
	
	FAQ 제목 <input type="text" name="fqTitle" value="${list.fqTitle}">
	FAQ 내용 <input type="text" name="fqContent" value="${list.fqContent}">
	<!-- 공개여부 
		<input type="radio" name="fq_open_yn" value=true>공개 
		<input type="radio" name="fq_open_yn" value=false>비공개 -->
	<input type="submit" value="수정">
</form>
<a href="getFaqInfoList.do">FAQ 목록</a>
</body>
</html>