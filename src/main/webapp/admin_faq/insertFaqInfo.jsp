<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 폼</title>
</head>
<body>

<form action="insertFaqInfo.do" method="post">
	FAQ 제목 <input type="text" name="fq_title">
	FAQ 내용 <input type="text" name="fq_content">
	<!--공개여부 
	<input type="radio" name="fq_open_yn" value=true>공개 
	<input type="radio" name="fq_open_yn" value=false>비공개 -->
	<input type="submit" value="가입">
</form>

<a href="getFaqInfoList.do">글 목록</a>

</body>
</html>