<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자발송 이력관리</title>
</head>
<body>

	<div align="center">
		<h1>문자발송 상세화면</h1> 
		<hr>
		<table>
			<tr>
				<th>수신자명</th>
				<td>${sendSmsHistoryInfo.shRecipientName }</td>
			</tr>
			<tr>
				<th>수신자번호</th>
				<td>${sendSmsHistoryInfo.shRecipientPhone }</td>
			</tr>
			<tr>
				<th>발송일시</th>
				<td>${sendSmsHistoryInfo.shSendDatetime }</td>
			</tr>
			<tr>
				<th>코드</th>
				<td>${sendSmsHistoryInfo.shSendCode }</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${sendSmsHistoryInfo.shSuccessYn }</td>
			</tr>
			<tr>
				<th>비고</th>
				<td>${sendSmsHistoryInfo.shFailReason }</td>
			</tr>
			<tr>
				<th>발신센터</th>
				<td>${sendSmsHistoryInfo.shSendCenterCode }</td>
			</tr>
			<tr>
				<th>수신내용</th>
				<td>${sendSmsHistoryInfo.shRecipientContent }</td>
			</tr>
			<%-- <tr>
				<td><a href="updateFaqInfo.do?fq_number=${faqInfo.fq_number }">수정</a> | <a href="deleteFaqInfo.do?fq_number=${faqInfo.fq_number}">삭제</a></td>
			</tr> --%>
		</table>
		<!-- <a href="getComplaintsInfoList.do">글 목록</a> -->
	</div>
</body>
</html>