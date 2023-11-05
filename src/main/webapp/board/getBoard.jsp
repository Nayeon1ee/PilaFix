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
<h1>글 상세</h1>	<hr>
		<table>
			<tr>
				<th>글번호</th>
				<td>${board.seq }</td>
			</tr>
			<tr>
					<th>제목</th>
					<td><input type="text" name="title"	value="${board.title }" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board.writer }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content">${board.content }</textarea></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${board.regDate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${board.cnt }</td>
				</tr>
			</table>

</div>
</body>
</html>