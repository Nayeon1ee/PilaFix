<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 폼</title>
</head>
<body>
<h1>수정 페이지</h1>
<form action="updateUserguide.do" method="post">
	<input type="hidden" name="ugCode" value="${userguide.ugCode }">
	유형 
	<c:if test="${userguide.ugType eq '예약' }">
		 <input type="radio" name="ugType" value="예약" checked >예약
		 <input type="radio" name="ugType" value="수강권" disabled="disabled">수강권	
	</c:if>
	<c:if test="${userguide.ugType eq '수강권' }">
		 <input type="radio" name="ugType" value="예약" disabled="disabled" >예약
		 <input type="radio" name="ugType" value="수강권" checked >수강권	
	</c:if>
	이용정책 제목 <input type="text" name="ugName" value="${userguide.ugName }">
	이용정책 내용 <input type="text" name="ugContent" value="${userguide.ugContent }">
	공개여부 
		<input type="radio" name="ugOpenYN" value=true>공개 
		<input type="radio" name="ugOpenYN" value=false>비공개
	<input type="submit" value="수정">
</form>
<a href="getUserguideList.do">글 목록</a>
</body>
</html>