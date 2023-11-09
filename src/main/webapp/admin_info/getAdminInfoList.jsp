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
			<c:if test="${InfoList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="adminInfo" items="${InfoList }">
				<tr>
					<td>${adminInfo.seq }</td>
					<td>${adminInfo.title }</td>
					<td><a href="getAdminInfo.do?seq=${adminInfo.seq }">${adminInfo.content }</a></td>
					<td>${adminInfo.regDate }</td>
					<td>${adminInfo.cnt }</td>
					<td>${adminInfo.openYN }</td>
					<td><a href="updateAdminInfo.do?seq=${adminInfo.seq }">수정</a> | <a href="deleteAdminInfo.do?seq=${adminInfo.seq }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertAdminInfo.do">글 등록</a>

	</div>

</body>
</html>