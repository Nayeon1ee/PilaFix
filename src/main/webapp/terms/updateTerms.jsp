<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
    <h1>게시글 수정</h1>
    
    <form action="updateTerms.do" method="post">
        <input type="hidden" name="tmCode" value="${terms.tmCode}">
        
			약관 제목 <input type="text" name="tmName" value="${terms.tmName }">
			약관 내용 <input type="text" name="tmDetail" value="${terms.tmDetail }">
			
			필수여부
			<input type="radio" name="tmRequiredYn" value=true>필수
			<input type="radio" name="tmRequiredYn" value=false>선택
			공개여부 
			<input type="radio" name="tmOpenYn" value=true>공개 
			<input type="radio" name="tmOpenYn" value=false>비공개
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="location.href='deleteTerms.do?tmCode=${terms.tmCode}'" />
	   <!-- <input type="button" value="삭제" onclick="confirmDelete()"> -->    
	        <input type="button" value="취소" onclick="goBack()">
	    </form>
    	
    	<a href="getTermsList.do">글 목록</a>
   
</body>
</html>