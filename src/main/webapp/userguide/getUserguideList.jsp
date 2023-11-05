<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>구분</th>
				<th>이용정책명</th>
				<th>작성일자</th>
				<th>관리</th>
			</tr>
			<c:if test="${userguideList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${userguideList }">
				<tr>
					<td>${list.ugCode }</td>
					<td>${list.ugType }</td>
					<td><a href="getUserguide.do?ugCode=${list.ugCode }">${list.ugName }</a></td>
					<td>${list.ugRegistrationDate }</td>
					<td><a href="updateUserguide.do?ugCode=${list.ugCode }">수정</a> | <a href="deleteUserguide.do?ugCode=${list.ugCode }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertUserguide.do">글 등록</a>

	</div>

</body>
</html>