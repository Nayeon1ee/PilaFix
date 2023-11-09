<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${memberCommunity.memberCmNumber }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${memberCommunity.memberCmTitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${memberCommunity.memberCmContent }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${memberCommunity.memberCmRegdate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${memberCommunity.memberCmViews }</td>
			</tr>
			<tr>
				<td><a href="updateMemberCommunity.do?seq=${memberCommunity.memberCmNumber }">수정</a> | <a href="deleteMemberCommunity.do?seq=${memberCommunity.memberCmNumber}">삭제</a></td>
			</tr>
		</table>
		<a href="getMemberCommunityList.do">글 목록</a>
	</div>
</body>
</html>