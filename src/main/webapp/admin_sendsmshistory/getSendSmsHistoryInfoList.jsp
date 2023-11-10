<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자발송 목록</title>
</head>
<body>

	<div align="center">
		<h1>글 목록</h1>
		<hr>
		<table>
			<tr>
				<th>문자발송코드</th>
				<th>발신센터</th>
				<th>발송일시</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			<c:if test="${sendSmsHistoryInfoList == null }">
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="sendSmsHistoryInfo" items="${sendSmsHistoryInfoList }">
				<tr>
					<td>${sendSmsHistoryInfo.shSendCode }</td>
					<td><a href="getSendSmsHistoryInfo.do?shSendCode=${sendSmsHistoryInfo.shSendCode }">${sendSmsHistoryInfo.shSendCenterCode }</a></td>
					<td>${sendSmsHistoryInfo.shSendDatetime }</td>
					<td>${sendSmsHistoryInfo.shSuccessYn}</td>
					<td>${sendSmsHistoryInfo.shFailReason}</td>
					<%-- <td><a href="updateCpInfo.do?cp_code=${cpInfo.cp_code }">수정</a> | <a href="deleteCpInfo.do?cp_code=${cpInfo.cp_code }">삭제</a></td> --%>
				</tr>
			</c:forEach>
		</table>
		<!-- <a href="insertCpInfo.do">글 등록</a> -->
	</div>
</body>
</html>