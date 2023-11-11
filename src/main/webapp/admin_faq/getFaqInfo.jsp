<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 세부 내용</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1> 
		<hr>
		<table>
			<tr>
				<th>No</th>
				<td>${faqInfo.fqNumber }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${faqInfo.fqTitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${faqInfo.fqContent }</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${faqInfo.fqRegDate }</td>
			</tr>
			<tr>
				<th>상태</th>
				<c:if test="${faqInfo.fqType == COMMON}">
					<td>공통</td>
				</c:if>
				<c:if test="${faqInfo.fqType == ME}">
					<td>회원</td>
				</c:if>
				<c:if test="${faqInfo.fqType == TR}">
					<td>강사</td>
				</c:if>
			</tr>
			<tr>
				<td><a href="updateFaqInfo.do?fqNumber=${faqInfo.fqNumber }">수정</a> | <a href="deleteFaqInfo.do?fqNumber=${faqInfo.fqNumber}">삭제</a></td>
			</tr>
		</table>
		<a href="getFaqInfoList.do">글 목록</a>
	</div>
</body>
</html>