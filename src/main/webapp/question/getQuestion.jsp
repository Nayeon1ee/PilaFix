<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${question.qsNumber }</td>
			</tr>
			<tr>
				<th>문의제목</th>
				<td>${question.qsTitle }</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>${question.qsContent }</td>
			</tr>
			<tr>
				<th>작성자회원코드</th>
				<td>${question.qsWriterMemberCode }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${question.qsRegdate }</td>
			</tr>
			<tr>
				<th>최근수정일자</th>
				<td>${question.qsModifiedDate }</td>
			</tr>
			<tr>
				<th>답변여부</th>
				<td>${question.qsAnswerYn }</td>
			</tr>
			
			
			<tr>
				<td><a href="updateQuestion.do?qsNumber=${question.qsNumber }">수정</a> | <a href="deleteQuestion.do?qsNumber=${question.qsNumber }">삭제</a></td>
			</tr>
		</table>
		<a href="getQuestionList.do">글 목록</a>
	</div>
</body>
</html>