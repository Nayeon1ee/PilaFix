<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${adminInfo.seq }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${adminInfo.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${adminInfo.content }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${adminInfo.regDate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${adminInfo.cnt }</td>
			</tr>
			<tr>
				<th>구매 가능 여부</th>
				<td>${adminInfo.openYN }</td>
			</tr>
			<tr>
				<td><a href="updateAdminInfo.do?seq=${adminInfo.seq }">수정</a> | <a href="deleteAdminInfo.do?seq=${adminInfo.seq}">삭제</a></td>
			</tr>
		</table>
		<a href="getAdminInfoList.do">글 목록</a>
	</div>
</body>
</html>