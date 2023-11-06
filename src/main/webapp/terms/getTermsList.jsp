<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <title>이용약관 게시판</title>
</head>
<body>
    <h1>이용약관 게시판</h1>
    
    <table border="1">
        <tr>
            <th>약관코드</th>
            <th>약관명</th>
            <th>약관등록일자</th>
            <th>최근수정일자</th>
            <th>필수여부</th>
            <th>공개여부</th>
        </tr>
        <c:forEach items="${termList}" var="term">
    	<tr>
	        <td>${term.tmCode}</td>
	        <td>${term.tmName}</td>
	        <td>${term.tmRegdate}</td>
	        <td>${term.tmModifiedDate}</td>
	        <td>${term.tmRequiredYn}</td>
	        <td>${term.tmOpenYn}</td>
   		</tr>
		</c:forEach>

    </table>
    <br><br>
    <a href="boardRegister.jsp">이용약관 작성</a>
</body>
</html>