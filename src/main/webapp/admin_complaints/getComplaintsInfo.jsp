<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>신고글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>신고코드</th>
				<td>${ComplaintsInfo.cpCode }</td>
			</tr>
			<tr>
				<th>대상게시물번호</th>
				<td>${ComplaintsInfo.cpTargetPostNumber }</td>
			</tr>
			<tr>
				<th>대상게시물유형</th>
				<td>${ComplaintsInfo.cpTargetPostType }</td>
			</tr>
			<tr>
				<th>대상게시물작성자회원코드</th>
				<td>${ComplaintsInfo.targetWriterMemberCode }</td>
			</tr>
			<tr>
				<th>신고자회원코드</th>
				<td>${ComplaintsInfo.blamerMemberCode }</td>
			</tr>
			<tr>
				<th>신고일시</th>
				<td>${ComplaintsInfo.cpDate }</td>
			</tr>
			<tr>
				<th>신고한IP</th>
				<td>${ComplaintsInfo.blamerIp }</td>
			</tr>
			
		</table>
		<a href="getTargetComplaintsList.do">글 목록</a>
	</div>
</body>
</html>