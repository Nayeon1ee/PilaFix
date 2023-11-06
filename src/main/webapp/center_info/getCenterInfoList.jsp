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
			<c:if test="${centerInfo == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="centerInfo" items="${InfoList }">
				<tr>
					<td>${centerInfo.seq }</td>
					<td>${centerInfo.title }</td>
					<td><a href="getCenterInfo.do?seq=${centerInfo.seq }">${centerInfo.content }</a></td>
					<td>${centerInfo.regDate }</td>
					<td>${centerInfo.cnt }</td>
					<td>${centerInfo.openYN }</td>
					<td><a href="updateCenterInfo.do?seq=${centerInfo.seq }">수정</a> | <a href="deleteCenterInfo.do?seq=${centerInfo.seq }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertCenterInfo.do">글 등록</a>

	</div>

</body>
</html>