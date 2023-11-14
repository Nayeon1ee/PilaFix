<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 목록</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:if test="${CommunityList	 == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="memberCommunity" items="${CommunityList }">
				<tr>
					<td>${memberCommunity.memberCmNumber }</td>
					<td><a href="getMemberCommunity.do?seq=${memberCommunity.memberCmNumber }">${memberCommunity.memberCmTitle }</a></td>
					<td>${memberCommunity.memberCmRegdate }</td>
					<td>${memberCommunity.memberCmViews }</td>
					<td><a href="updateMemberCommunity.do?seq=${memberCommunity.memberCmNumber }">수정</a> | <a href="deleteMemberCommunity.do?seq=${memberCommunity.memberCmNumber }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="insertMemberCommunity.do">글 등록</a>

	</div>

</body>
</html>