<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>웹 관리자 커뮤니티 화면</title>
</head>
<body>
	<div>
		<h1>웹 관리자 커뮤니티 글 목록</h1>
		<hr>
		<table border="1">
			<tr>
				<td>NO.</td>
				<td>글 제목</td>
				<td>글 내용</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:forEach var="list" items="${communityList}">
				<tr>
					<td>${list.cmNumber}</td>
					<td>${list.cmTitle}</td>
					<td><a href="getCommunity.do?cmNumber=${list.cmNumber}">${list.cmContent}</a></td>
					<td>${list.cmWriterMemberCode}</td>
					<td>${list.cmRegdate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>