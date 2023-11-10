<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 목록</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>No</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>신고건수</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>
			<c:if test="${ComplaintsInfoList == null }">
				<tr>
					<td colspan="7">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="ComplaintsInfo" items="${ComplaintsInfoList }">
				<tr>
					<td>${ComplaintsInfo.cpCode }</td>
					<td><a href="getComplaintsInfo.do?cpTargetPostNumber=${ComplaintsInfo.cpTargetPostNumber }">${ComplaintsInfo.cpTargetPostNumber }</a></td>
					<td>${ComplaintsInfo.cpTargetPostType }</td>
					<td>${ComplaintsInfo.targetWriterMemberCode}</td>
					<td>${ComplaintsInfo.blamerMemberCode }</td>
					<td>${ComplaintsInfo.cpDate }</td>
					<td>${ComplaintsInfo.blamerIp }</td>
					<%-- <td><a href="updateCpInfo.do?cp_code=${cpInfo.cp_code }">수정</a> | <a href="deleteCpInfo.do?cp_code=${cpInfo.cp_code }">삭제</a></td> --%>
				</tr>
			</c:forEach>
		</table>
		<!-- <a href="insertCpInfo.do">글 등록</a> -->
	</div>
</body>
</html>