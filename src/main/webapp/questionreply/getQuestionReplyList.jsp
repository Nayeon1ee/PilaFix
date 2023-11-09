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
    <h1>센터의 문의사항 관리</h1>
    <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성일시</th>
            <th>수정일시</th>
            <th>답변여부</th>
        </tr>
        <c:if test="${questionReplyList == null }">
			<tr>
			<td colspan="5">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
        <c:forEach var="list" items="${questionReplyList }">
    	<tr>
			<td>${list.qsNumber}</td>
	        <td>${list.qsTitle}</td>
	        
	        <td>${list.qsRegdate}</td>
	        <td>${list.qsModifiedDate}</td>
	        <td>
	        <a href="getQuestionReply.do?reTargetPostNumber=${list.qsNumber }">${list.qsAnswerYn}</a>
        	</td>

   		</tr>
		</c:forEach>
    </table>
    <br><br>
    

    </div>
</body>
</html>