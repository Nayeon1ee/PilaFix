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
				<th>이메일발송코드</th>
				<th>이메일발송유형</th>
				<th>이메일발송일시</th>
				<th>수신자명</th>
				<th>수신제목</th>
				<th>수신내용</th>
				<th>수신자이메일</th>
				<th>발송성공여부</th>
				<th>발송성공시간</th>
				<th>발송실패사유</th>
			</tr>
			<c:if test="${sendEmailHistoryInfoList == null }">
				<tr>
					<td colspan="10">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="sendEmailHistoryInfo" items="${sendEmailHistoryInfoList }">
				<tr>
					<td>${sendEmailHistoryInfo.mhEmailSendCode }</td>
					<td>${sendEmailHistoryInfo.mhEmailSendType }</td>
					<td>${sendEmailHistoryInfo.mhEmailSendDatetime }</td>
					<td>${sendEmailHistoryInfo.mhRecipientName}</td>
					<td><a href="getSendEmailHistoryInfo.do?mhEmailSendCode=${sendEmailHistoryInfo.mhEmailSendCode }">${sendEmailHistoryInfo.mhRecipientTitle }</a></td>
					<td>${sendEmailHistoryInfo.mhRecipientContent }</td>
					<td>${sendEmailHistoryInfo.mhRecipientEmail }</td>
					<td>${sendEmailHistoryInfo.mhSuccessyn }</td>
					<td>${sendEmailHistoryInfo.mhSuccessDatetime }</td>
					<td>${sendEmailHistoryInfo.mhFailReason }</td>
					<%-- <td><a href="updateCpInfo.do?cp_code=${cpInfo.cp_code }">수정</a> | <a href="deleteCpInfo.do?cp_code=${cpInfo.cp_code }">삭제</a></td> --%>
				</tr>
			</c:forEach>
		</table>
		<!-- <a href="insertCpInfo.do">글 등록</a> -->
	</div>
</body>
</html>