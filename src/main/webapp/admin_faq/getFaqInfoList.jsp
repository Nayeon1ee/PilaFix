<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>NO</th>
				<th>구분</th>
				<th>제목</th>
				<!-- <th>내용</th> -->
				<th>등록일</th>
				<!-- <th>구매 가능 여부</th> -->
			</tr>
			<c:if test="${FaqInfoList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="faqInfo" items="${FaqInfoList }">
				<tr>
					<td>${faqInfo.fqNumber }</td>
					<c:if test="${faqInfo.fqType == 'COMMON'}">
						<td>공통</td>
					</c:if>
					<c:if test="${faqInfo.fqType == 'ME'}">
						<td>회원</td>
					</c:if>
					<c:if test="${faqInfo.fqType == 'TR'}">
						<td>강사</td>
					</c:if>
					<td><a href="getFaqInfo.do?fqNumber=${faqInfo.fqNumber }">${faqInfo.fqTitle }</a></td>
					<%-- <td>${faqInfo.fq_content }</td> --%>
					<td>${faqInfo.fqRegDate}</td>
					<%-- <td>${faqInfo.fq_open_yn }</td> --%>
					<%-- <td><a href="updateFaqInfo.do?fq_number=${faqInfo.fq_number }">수정</a> | <a href="deleteFaqInfo.do?fq_number=${faqInfo.fq_number }">삭제</a></td> --%>
				</tr>
			</c:forEach>
		</table>
		<a href="insertFaqInfo.do">글 등록</a>
	</div>
</body>
</html>