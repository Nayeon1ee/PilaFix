<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시물 등록</title>
</head>
<body>

<form action="insertMemberCommunity.do" method="post">
	커뮤니티 제목 <input type="text" name="memberCmTitle">
	커뮤니티 내용 <input type="text" name="memberCmContent">
	<input type="submit" value="등록">
</form>

<a href="getMemberCommunityList.do">글 목록</a>

</body>
</html>