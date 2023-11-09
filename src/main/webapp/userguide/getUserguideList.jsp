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
					<td><a href="updateUserguide.do?ugCode=${list.ugCode }">수정</a> | <button id="deleteGet" onclick="deleteGet(${userguide.ugCode})">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertUserguide.do">글 등록</a>

	</div>
<script>
const deleteGet = (ugCode) => {
	if (window.confirm('이용 약관을 삭제하시겠습니까?')) {
	     fetch('/pilafix/deleteUserguide.do?ugCode=${userguide.ugCode}', {
	      method: 'GET'
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('error');
			}
			window.location.href = 'getUserguideList.do'; // 센터 목록 페이지로 리다이렉트
		})
		.catch(error => {
			console.error(error);
		});
	}else {
		return;
	}
};
</script>
</body>
</html>