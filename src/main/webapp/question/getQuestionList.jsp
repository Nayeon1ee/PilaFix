<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
    <h1>문의사항</h1>
    <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성일시</th>
            <th>수정일시</th>
            <th>답변여부</th>
        </tr>
        <c:if test="${questionList == null }">
			<tr>
			<td colspan="5">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
        <c:forEach var="list" items="${questionList }">
    	<tr>
	        <td>${list.qsNumber}</td>
	        <td>${list.qsTitle}</td>
	        <td>${list.qsRegdate}</td>
	        <td>${list.qsModifiedDate}</td>
	        <td><a href="getQuestion.do?qsNumber=${list.qsNumber}">${list.qsAnswerYn}</a></td>
   		</tr>
   		    <tr>
   		    <td>내용 : ${list.qsContent}</td>
   			</tr>
   			<tr>
   			<td>센터답변 :</td>
   			</tr>
		</c:forEach>
    </table>
    

    <br><br>
    
    <a href="insertQuestion.do">문의사항 작성</a>
    </div>

</body>
</html>