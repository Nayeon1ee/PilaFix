<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h1>비밀번호 변경 </h1>
	<hr>
	<form action="pwTest.do" method="post">
		<input type="hidden" name="id" value="${id }">
		현재 비밀번호 <input type="password" name="currentPw">
		새로운 비밀번호 <input type="password" name="newPw">
		<input type="submit" value="전송">
	</form>
</div>
	<script src="${pageContext.request.contextPath }/resources/js/notice.js"></script>
</body>
</html>