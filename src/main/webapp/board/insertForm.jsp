<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
</head>
<body>

<form action="insert.do" method="post">
	제목 <input type="text" name="title">
	작성자 <input type="text" name="writer">
	내용 <input type="text" name="content">
	<input type="submit" value="가입">
</form>

</body>
</html>