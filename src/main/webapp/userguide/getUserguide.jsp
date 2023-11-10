<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<td>${userguide.ugCode }</td>
			</tr>
			<tr>
				<th>구분</th>
				<td>${userguide.ugType }</td>
			</tr>
			<tr>
				<th>이용정책명</th>
				<td>${userguide.ugName }</td>
			</tr>
			<tr>
				<th>이용정책 내용</th>
				<td>${userguide.ugContent }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${userguide.ugRegistrationDate }</td>
			</tr>
			<tr>
				<th>최근수정일자</th>
				<td>${userguide.ugRegistrationDate }</td>
			</tr>
			<tr>
				<td><a href="updateUserguide.do?ugCode=${userguide.ugCode }">수정</a> | <button id="deleteGet" onclick="deleteGet(${userguide.ugCode})">삭제</button></td>
			</tr>
		</table>
		<a href="getUserguideList.do">글 목록</a>
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