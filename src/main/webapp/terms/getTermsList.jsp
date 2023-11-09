<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <title>이용약관 게시판</title>
</head>
<body>
    
    <div align="center">
    <h1>이용약관 게시판</h1>
    <table>
        <tr>
            <th>약관코드</th>
            <th>약관명</th>
            <th>약관등록일자</th>
            <th>최근수정일자</th>
            <th>필수여부</th>
        </tr>
        <c:if test="${termsList == null }">
			<tr>
			<td colspan="5">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
        <c:forEach var="list" items="${termsList }">
    	<tr>
	        <td><a href="updateTerms.do?tmCode=${list.tmCode}">${list.tmCode}</a></td>
	        <td>${list.tmName}</td>
	        <td>${list.tmRegdate}</td>
	        <td>${list.tmModifiedDate}</td>
	        <td>${list.tmRequiredYn}</td>
   		</tr>
		</c:forEach>
    </table>
    <br><br>
    
    <a href="insertTerms.do">이용약관 작성</a>
    </div>
</body>
</html>