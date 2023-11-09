<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정 페이지</h1>
<form action="updateQuestion.do" method="post">
	<input type="hidden" name="qsNumber" value="${question.qsNumber }">
	
	문의제목 <input type="text" name=qsTitle value="${question.qsTitle }">
	문의내용 <input type="text" name="qsContent" value="${question.qsContent }">
	<input type="submit" value="수정">
</form>
<a href="getQuestionList.do">글 목록</a>
</body>
</html>