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
				<th>약관코드</th>
				<td>${terms.TM_CODE }</td>
			</tr>
			<tr>
				<th>약관명</th>
				<td>${terms.TM_NAME }</td>
			</tr>
			<tr>
				<th>약관내용</th>
				<td>${terms.tmDetail }</td>
			</tr>
			<tr>
				<th>약관등록일자</th>
				<td>${terms.tmRegdate }</td>
			</tr>
			<tr>
				<th>최근수정일자</th>
				<td>${terms.tmModifiedDate }</td>
			</tr>
			<tr>
				<th>필수여부</th>
				<td>${terms.tmRequiredYn }</td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td>${terms.tmOpenYn }</td>
			</tr>
			<tr>
				<td><a href="updateTerms.do?tmCode=${terms.tmCode }">수정</a> | <a href="deleteTerms.do?tmCode=${terms.tmCode }">삭제</a></td>
			</tr>
		</table>
		<a href="getTermsList.do">글 목록</a>
	</div>
</body>
</html>