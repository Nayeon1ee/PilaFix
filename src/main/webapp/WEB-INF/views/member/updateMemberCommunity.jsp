<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시물 수정</title>
</head>
<body>
<h1>수정 페이지</h1>
<form action="updateMemberCommunity.do" method="post">
	<input type="hidden" name="memberCmNumber" value="${memberCommunity.memberCmNumber}">
	
	공지사항 제목 <input type="text" name="memberCmTitle" value="${memberCommunity.memberCmTitle}">
	공지사항 내용 <input type="text" name="memberCmContent" value="${memberCommunity.memberCmContent}">
	<input type="submit" value="수정">
</form>
<a href="getMemberCommunityList.do">공지사항 목록</a>
</body>
</html>