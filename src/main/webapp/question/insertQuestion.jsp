<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="insertQuestion.do" method="post">
	<%--<input type="hidden" name="qsWriterMemberCode" value="<%=session.getAttribute("로그인세션명가져오기") %>"> --%>  
	문의제목 <input type="text" name="qsTitle">
	문의내용 <input type="text" name="qsContent">

	<input type="submit" value="등록">
</form>

<a href="getQuestionList.do">글 목록</a>

</body>
</html>