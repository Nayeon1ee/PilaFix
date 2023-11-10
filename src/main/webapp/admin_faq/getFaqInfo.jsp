<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${faqInfo.fq_number }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${faqInfo.fq_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${faqInfo.fq_content }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${faqInfo.fq_regDate }</td>
			</tr>
			<tr>
				<th>구매 가능 여부</th>
				<td>${faqInfo.fq_open_yn }</td>
			</tr>
			<tr>
				<td><a href="updateFaqInfo.do?fq_number=${faqInfo.fq_number }">수정</a> | <a href="deleteFaqInfo.do?fq_number=${faqInfo.fq_number}">삭제</a></td>
			</tr>
		</table>
		<a href="getFaqInfoList.do">글 목록</a>
	</div>
</body>
</html>