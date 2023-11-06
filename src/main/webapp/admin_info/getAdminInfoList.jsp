<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>구매 가능 여부</th>
			</tr>
			<c:if test="${list == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${InfoList }">
				<tr>
					<td>${list.seq }</td>
					<td>${list.title }</td>
					<td><a href="getAdminInfo.do?seq=${list.seq }">${list.content }</a></td>
					<td>${list.regDate }</td>
					<td>${list.cnt }</td>
					<td>${list.openYN }</td>
					<td><a href="updateAdminInfo.do?seq=${list.seq }">수정</a> | <a href="deleteAdminInfo.do?seq=${list.seq }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertAdminInfo.do">글 등록</a>

	</div>

</body>
</html>