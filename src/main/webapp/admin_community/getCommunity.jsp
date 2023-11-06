<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 커뮤니티 상세화면</title>
</head>
<body>
	<div align="center">
		<h1>글 목록 상세</h1>
		<hr>
		<table>
			<tr>
				<td>NO.</td>
				<td>${community.cmNumber }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${community.cmWriterMemberCode}</td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>${community.cmRegdate}</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>${community.cmTitle}</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>${community.cmContent}</td>
			</tr>
			<tr>
				<td><a
					href="deleteCommunity.do?cmNumber=${community.cmNumber }">삭제</a></td>
			</tr>
		</table>
	</div>

</body>
</html>